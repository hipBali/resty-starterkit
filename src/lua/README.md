## lua helper functions

***token utilities***

Usage:
```
local jwt_util = require "jwt_utils"
```

Functions:
- encode ( table [,string] )
```
-- encodes the given lua table into a string
local encoded_data = jwt_util.encode( data, secret_key )
```
- decode ( string [,string] )
```
-- decodes the given string to lua table
local decoded_data = jwt_util.decode( encoded_data, secret_key )
```

- checkToken ( [string [,string]] )
```
-- decodes the authorization token from current http request to lua table
-- tokenTypes are: 
--     jwt_util._SPRING_AUTH_KEY = 'Authorization'
--     jwt_util._NODE_AUTH_KEY = 'x-access-token' -- DEFAULT --
--
local user_token = jwt_util.checkToken( tokenType, secret_key )
```

***password utilities***

Usage:
```
local pw_util = require "pw_utils"
```

Functions:
- hashPassword ( string ) 
```
-- returns hashed password
local pw_hash = pw_util.hashPassword( password )
```
- checkPassword ( string, string ) 
```
-- checks password hash
local is_pw_ok = pw_util.checkPassword( hash, password )
```

