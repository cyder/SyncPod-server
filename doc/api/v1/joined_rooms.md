## GET /api/v1/joined_rooms
Returns a room.

### Example

#### Request
```
GET /api/v1/joined_rooms HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 67:adzp-cJbg5sy1PwmJzE1
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 154
Content-Type: application/json; charset=utf-8
ETag: W/"f829b0d233646e01ab4a6313b8a45355"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: ebf22402-c245-46fc-a992-ab3d9bec2740
X-Runtime: 0.052723
X-XSS-Protection: 1; mode=block

{
  "joined_rooms": [
    {
      "id": 59,
      "name": "MyString",
      "description": "MyText",
      "key": "5ZHSgH9y",
      "now_playing_video": null,
      "last_played_video": null,
      "online_users": [

      ]
    }
  ]
}
```
