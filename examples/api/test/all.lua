--
-- /api/test/all
--
-- resty-starterkit example - all
-- 
-- (c) 2023, github.com/hipBali
--

requestHandler = {

	get = function(r)
	
		return { user="Its Meow", email="my.mail@mail.my", id=123, roles={"admin", "user", "looser"}, param = r.param }
	
	end,
	
	post = function(r)
	
		if body then
			return { result = "Message accepted!", message = type(r.data) }
		else
			return { result = "Request failed", body=tostring(r.data) }
		end
	end, 

}
