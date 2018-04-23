## POST /api/v1/user_report
Returns a success message.

### Example

#### Request
```
POST /api/v1/user_report HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 90:omtHggXv4tb1UKGEYzb2
Content-Length: 15
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

message=message
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 156
Content-Type: application/json; charset=utf-8
ETag: W/"e827f5e910bc797a8eb6aa263aa9495e"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 1e15e1b1-5b25-427f-9915-f4c85f210d4b
X-Runtime: 0.016119
X-XSS-Protection: 1; mode=block

{
  "result": "success",
  "user_report": {
    "id": 1,
    "user_id": 90,
    "message": "message",
    "created_at": "2018-03-31T07:35:06.000Z",
    "updated_at": "2018-03-31T07:35:06.000Z"
  }
}
```
