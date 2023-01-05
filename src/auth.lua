local _M = {}
local CORRECT_PASSWORD = "guest"

function _M.check_auth(auth_code)
    return auth_code == CORRECT_PASSWORD
end

return _M
