

-- define ngx object
ngx = {
    say = function(s) end,
    log = function(type, s) end,
    req = {
        get_headers = function() return {} end,
    },
    HTTP_OK = 200,
    HTTP_BAD_REQUEST = 400,
}

-- mock ngx object using busted function
-- store in global var
-- _G.ngx = mock(ngx, false)

local main = require "main"


describe("auth headers", function()
    it("should deny invalid credentials", function()
        ngx.req.get_headers = function() return { ["Authorization"] = "fart" } end
        _G.ngx = mock(ngx, false)


        main.run()

        assert(ngx.status, ngx.HTTP_BAD_REQUEST)
        assert.stub(ngx.say).was_called_with('Access Denied')
    end)

    it("should allow valid credentials", function()
        ngx.req.get_headers = function() return { ["Authorization"] = "guest" } end
        _G.ngx = mock(ngx, false)


        main.run()

        assert(ngx.status, ngx.HTTP_OK)
        assert.stub(ngx.say).was_called_with('Auth Success')
    end)
end)

