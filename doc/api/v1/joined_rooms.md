## GET /api/v1/joined_rooms
Returns a room.

### Example

#### Request
```
GET /api/v1/joined_rooms HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 1142:SRTjKz9ZgPPDv_MizB9P
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 170
Content-Type: application/json; charset=utf-8
ETag: W/"6dbeecbf543d40b55c70f1036e60d00c"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: d97109ad-e4b7-47be-944c-94c084229d4e
X-Runtime: 0.054484
X-XSS-Protection: 1; mode=block

{
  "joined_rooms": [
    {
      "id": 790,
      "name": "MyString",
      "description": "MyText",
      "key": "rvS5ovc8",
      "public": false,
      "now_playing_video": null,
      "last_played_video": null,
      "online_users": [

      ]
    }
  ]
}
```
