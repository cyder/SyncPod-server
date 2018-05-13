## POST /api/v1/users/upload_icon
Returns a user.

### Example

#### Request
```
POST /api/v1/users/upload_icon HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 87:UyH2nBGrDiyRzsYXa6mx
Content-Length: 20914
Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1
Host: www.example.com

multipart/form-data
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 330
Content-Type: application/json; charset=utf-8
ETag: W/"a9a4ecc36dedfc7733a9f8162603985a"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: d4aa3222-de46-4686-b722-51a244b21098
X-Runtime: 0.153974
X-XSS-Protection: 1; mode=block

{
  "result": "success",
  "user": {
    "access_token": "87:UyH2nBGrDiyRzsYXa6mx",
    "id": 87,
    "icon": {
      "url": "/Users/shintanitoshio/Works/YouTubeSyncServer/spec/tmp/uploads/user/icon/87/icon.jpg"
    },
    "email": "user@example.com",
    "name": "MyString",
    "created_at": "2018-03-31T07:35:06.000Z",
    "updated_at": "2018-03-31T07:35:06.000Z",
    "self_introduction": null
  }
}
```
