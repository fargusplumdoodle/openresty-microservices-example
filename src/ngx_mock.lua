local _M = {}

_M.get_ngx_mock = function() return {
    say = function() end,
    log = function() end,
    req = {
        get_headers = function() return {} end,
    },
    HTTP_OK = 200,
    HTTP_BAD_REQUEST = 400,
} end

_G.ngx = _M.get_ngx_mock()

return _M
