# resty-starterkit
Openresty Rest Api starter kit

**Requirements**
- OpenResty®
- lua-resty-jwt (for examples)
- lua-resty-nettle (for examples)

**Creating a new Rest API endpoint**

Create a new request handler and save it as api/mytest.lua

``` lua
requestHandler = {
  get = function(r)
    return "hello world"
  end
}
```

Register the new request handler in conf/resty.json

``` json
{  
  "api/mytest": "api/mytest.lua"
}
```

Test your endpoint with CURL

```
$ curl -X GET http://localhost:8888/api/mytest
"hello world"
```

**Accessing request parameters and body data**

The http request will served by requestHandler methods. This simple example shows how can you catch variuos http requests.
```
requestHandler = {}

function requestHandler.get(r)
  return "hello world"
end

function requestHandler.delete(r)
  return "delete world"
end

function requestHandler.post(r)
  return "post world"
end

function requestHandler.put(r)
  return "put world"
end

```

The function parameter is a lua table which contains the request parameters
```
  local params = r.param
  local body = r.data
```

Here is a simple request tester...
```
requestHandler = {}

function requestHandler.get(r)
  return { request_params = r.param }
end

function requestHandler.post(r)
  return { request_body = r.data }
end

```

Run the following CURL request ...
```
$ curl -X GET 'http://localhost:8888/api/mytest?name=hello&role=world'
{"request_params":{"name":"hello","role":"world"}}

$ curl -X GET 'http://localhost:8888/api/mytest/123'
{"request_params":{"id":123}}

$ curl -X POST -H "Content-Type: application/json" -d '{"username":"admin", "password":"12345"}' http://localhost:8888/api/mytest
{"request_body":"{\"username\":\"admin\", \"password\":\"12345\"}"}
```

**Examples**

For more examples please open the 'examples' folder

