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
Content-Length: 248
Content-Type: application/json; charset=utf-8
ETag: W/"d48cfb71f85a5aa0185117158b4d4813"
Set-Cookie: _you_tube_sync_server_session=blJHaWYvZFQzV2l5TXd6a0hKcmYvVm0xYWJLYkJkVHJaWFJtd3RUWm14NGhudDZad2h0TkFUeFB0NlJVa25oMkJ3QUh3Q1ZLTDlZMzZlM3RYek1LY2M0Tnp5L3E2NDhPb0dDWEpKenlFQnRaaFBaT1o2MitkTktTNEZjT2JFTHRVdW92U0Z6TFBRQVhxd0FuN0JEQy9BPT0tLUtJcjRkTmZ4RDM1SDVyV3FXTXdxeVE9PQ%3D%3D--68e6118be82a357338225f90bc790983bcd6a8cb; path=/; HttpOnly
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 578a2fd5-7409-41a1-9c6c-b01e80839c7d
X-Runtime: 0.028071
X-XSS-Protection: 1; mode=block

{
  "result": "success",
  "user": {
    "id": 69,
    "icon": {
      "url": null
    },
    "email": "user@example.com",
    "name": "MyString",
    "access_token": "69:q1aXhT-onz4sWejxcV1s",
    "created_at": "2018-03-31T07:35:05.000Z",
    "updated_at": "2018-03-31T07:35:05.000Z",
    "self_introduction": null
  }
}
```
