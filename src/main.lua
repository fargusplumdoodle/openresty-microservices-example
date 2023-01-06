local json = require "cjson"
local auth = require "auth"
local _M = {}


function _M.run()
    local headers = ngx.req.get_headers()
    local auth_header = headers['Authorization']

    ngx.log(ngx.INFO, "HEADERS:", json.encode(headers))

    if auth.check_auth(auth_header) then
        ngx.status = ngx.HTTP_OK
        ngx.say("Auth Success")
    else
        ngx.status = ngx.HTTP_BAD_REQUEST
        ngx.say("Access Denied")

    end
end


return _M
