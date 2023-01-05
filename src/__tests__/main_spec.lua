local ngx_mock = require 'ngx_mock'
local main = require "main"


describe("auth headers", function()

    before_each(function() 
        ngx = ngx_mock.get_ngx_mock()
    end)


    it("should deny invalid credentials", function()
        ngx.req.get_headers = function() return { ["Authorization"] = "fart" } end
        ngx.req.a = 'asfd'
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

