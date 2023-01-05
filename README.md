# Learning OpenResty Modules

To install:
```
luarocks init
./luarocks build 
```

Install openresty:
  - https://openresty.org/en/download.html
  - If you are on linux, make sure that the openresty service
    is not running by default (`sudo systemctl stop openresty`, `sudo systemctl disable openresty`)


## Tests

Run `./lua_modules/bin/busted .`

## Adding a dependency

There might be an easier way to do this:
```
./luarocks install <package>

# add to dependencies
vi ./openresty_microservices-dev-1.rockspec 


# generate lockfile
./luarocks make --pin
```
