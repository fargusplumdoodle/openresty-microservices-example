# Learning OpenResty Modules

To install:
```
luarocks init
./luarocks build 
```

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
