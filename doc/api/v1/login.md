## POST /api/v1/login
Returns a user.

### Example

#### Request
```
POST /api/v1/login HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 42
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

email=user%40example.com&password=password
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 205
Content-Type: application/json; charset=utf-8
ETag: W/"f4d99b92788c428f92b577841c4de7df"
Set-Cookie: _you_tube_sync_server_session=N3d4azRWNEROR002TnlYTXZCQlgzai9vWEpja3FuTVNlZ3lZQU9uaTNUWjNMWXo5NStJT0x6ZmplTFk4M3ZWTmZkZEtFK25NaDlDRHkxTm11L0dyUk1jWHF2S3RZb1hrR0l1Q1k2eFNHdnJzVnNiTmI2aENiSzh6a2lqN3BNdjZqK3lyUkJHU2pJaDdrS3dGWlppWlhERFlFTStiN3MzMVRWYWdFbnd5aDd3PS0tYkh1bWlsbDRZN25LaWlmTkl5M1VJZz09--c7d2c76bc8e9ff7c5254c3f33c72a30adf164e6e; path=/; HttpOnly
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: e46f930a-ea9a-48f9-bbbf-d7f5abbb87f3
X-Runtime: 0.027217
X-XSS-Protection: 1; mode=block

{
  "result": "success",
  "user": {
    "id": 154,
    "email": "user@example.com",
    "name": "MyString",
    "access_token": "154:LqRrMQvEydk7aojoLSvt",
    "created_at": "2017-10-30T14:36:29.000Z",
    "updated_at": "2017-10-30T14:36:29.000Z"
  }
}
```
