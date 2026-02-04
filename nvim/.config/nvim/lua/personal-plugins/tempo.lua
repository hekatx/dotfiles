local apikey = "7gryl6WeYr4wWAxOzOTiUtNb6b30bP-us"

local handle = io.popen("echo 'hello'");
local result = handle:read("*a");
print(result)
handle:close()
