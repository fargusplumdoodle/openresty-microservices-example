local auth = require "auth"

describe("Auth", function()
    it("Should pass when the password is guest", function()
        local result = auth.check_auth("guest")
        assert.is_true(result)
    end)

    it("Should fail when the password is not guest", function()
        local result = auth.check_auth("not guest")
        assert.is_false(result)
    end)
end)