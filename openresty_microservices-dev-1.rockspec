package = "openresty_microservices"
version = "dev-1"
source = {
   url = "*** please add URL for source tarball, zip or repository here ***"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}

dependencies = {
   "busted >= 2.0.rc12",
   "lua-cjson == 2.1.0.10-1"
}
build = {
   type = "builtin",
   modules = {
      main = "src/main.lua"
   }
}
