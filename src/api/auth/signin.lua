
--
-- /api/auth/signup
--

local json = require "cjson"
local jwt_utils = require "lua.common.tokenutils"
local pw_utils = require "lua.common.pwutils"

-- test data -----------------------------------------
local userData = {
	id = 1,
	roles = {"admin"},
	email = "admin@local.host",
	username = "Administrator"
}
local pload = { 
	id = userData.id,
	username = userData.username,
	email = userData.email,
	roles = userData.roles,
	request_time = nil,
	valid_until = nil
}
local accToken = jwt_utils.encode(pload) -- with default secret key
------------------------------------------------------		

requestHandler = {}

requestHandler.post = function(r)
	-- check the login credentials in body
	local username, password
	local body = json.decode(r.data)
	username = body.username
	password = body.password
	-- local userData, accToken = authenticateUser(username, password)
	return { type = "Bearer", username = userData.username, email = userData.email, roles = userData.roles, accessToken = accToken } 
end 