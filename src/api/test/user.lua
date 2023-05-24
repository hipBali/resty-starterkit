--
-- /api/test/users
--
-- resty-starterkit example - user
-- 
-- (c) 2023, github.com/hipBali
--

local json = require "cjson"
local jwt_utils = require "lua.common.tokenutils"

requestHandler = {}

requestHandler.get = function(r)
	local user_token = jwt_utils.checkToken()
	if user_token then
		return {userToken = user_token} 
	else
		ngx.status = ngx.HTTP_NOT_FOUND
		ngx.say(json.encode{error=err})
		ngx.exit(ngx.HTTP_OK)
	end	
end 
