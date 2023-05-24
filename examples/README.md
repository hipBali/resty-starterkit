
**resty-starterkit example client**
-----------------------------------

Install example client code from [bezkoder/angular-13-login-registration-example](https://github.com/bezkoder/angular-13-login-registration-example.git)

**Configure Angular app**

Create ***proxy.conf.json***

``
{
  "/api": {
    "target": "http://localhost:8888",
    "secure": false
  }
}
``

Modify start script in ***package.json*** to

``"start": "ng serve --proxy-config proxy.conf.json", ``

Modify API_URL in ***user.service.ts*** to

``const API_URL = '/api/test/'; ``

and in ***auth.service.ts*** to

``const AUTH_API = '/api/auth/';``


Finally start the angular client, listening on port 4200

``
$ npm start
``

Copy example/api folder content to your (nginx) api folder and start the service
```
$ sh start.sh
```


