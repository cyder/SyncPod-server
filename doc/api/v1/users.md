## POST /api/v1/users
Returns a user.

### Example

#### Request
```
POST /api/v1/users HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 54
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

user[email]=user%40example.com&user[password]=password
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 240
Content-Type: application/json; charset=utf-8
ETag: W/"a64287e7262e58145df8303a2c289719"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 1b025cbf-3e0b-4cc6-9bfa-0e950e3e47da
X-Runtime: 0.014546
X-XSS-Protection: 1; mode=block

{
  "result": "success",
  "user": {
    "id": 94,
    "email": "user@example.com",
    "name": "",
    "access_token": "94:U-yJzvseLMqVibMK-y_Z",
    "created_at": "2018-03-31T07:35:06.000Z",
    "updated_at": "2018-03-31T07:35:06.000Z",
    "self_introduction": null,
    "icon": {
      "url": null
    }
  }
}
```
