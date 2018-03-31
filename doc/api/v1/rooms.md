## POST /api/v1/rooms
MyText

### Example

#### Request
```
POST /api/v1/rooms HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 77:fMzRToJJrszyqKmgNWMg
Content-Length: 44
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

room[name]=MyString&room[description]=MyText
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 163
Content-Type: application/json; charset=utf-8
ETag: W/"6ef0ccc243692213e13258a0207e4b22"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 37cd5ffa-62b9-4afe-8696-37cc17460a6a
X-Runtime: 0.019841
X-XSS-Protection: 1; mode=block

{
  "result": "success",
  "room": {
    "id": 61,
    "name": "MyString",
    "description": "MyText",
    "key": "Vwdpl9My",
    "now_playing_video": null,
    "last_played_video": null,
    "online_users": [

    ]
  }
}
```

## GET /api/v1/rooms/:id
Returns a room.

### Example

#### Request
```
GET /api/v1/rooms/65 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 81:xrA8vau4T5hpBPwWpfV4
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 144
Content-Type: application/json; charset=utf-8
ETag: W/"1772d6536518a0a975df907ab18ff024"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 1aa885ca-120d-4bea-ac83-a2cfe7bd77a2
X-Runtime: 0.018341
X-XSS-Protection: 1; mode=block

{
  "room": {
    "id": 65,
    "name": "MyString",
    "description": "MyText",
    "key": "BK0QTdNh",
    "now_playing_video": null,
    "last_played_video": null,
    "online_users": [

    ]
  }
}
```

## GET /api/v1/rooms
Returns a room.

### Example

#### Request
```
GET /api/v1/rooms?room_key=onIeJRHM HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 86:HB4wU2x7hGLET-TCLGV1
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 144
Content-Type: application/json; charset=utf-8
ETag: W/"0d4b84a0b4936f89a5033bf7f80f353d"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: f3065c08-d703-4130-890d-9dbf001c2390
X-Runtime: 0.012398
X-XSS-Protection: 1; mode=block

{
  "room": {
    "id": 70,
    "name": "MyString",
    "description": "MyText",
    "key": "onIeJRHM",
    "now_playing_video": null,
    "last_played_video": null,
    "online_users": [

    ]
  }
}
```
