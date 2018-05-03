## POST /api/v1/rooms
MyText

### Example

#### Request
```
POST /api/v1/rooms HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 1155:EFvzUuRSgYY57Tq2nYJz
Content-Length: 62
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

room[name]=MyString&room[description]=MyText&room[public]=true
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 178
Content-Type: application/json; charset=utf-8
ETag: W/"248f32e38994b3778e951b496afe4635"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: a1749f39-abe8-40bb-8a61-dafd22a00a50
X-Runtime: 0.026875
X-XSS-Protection: 1; mode=block

{
  "result": "success",
  "room": {
    "id": 795,
    "name": "MyString",
    "description": "MyText",
    "key": "7aWizdM9",
    "public": true,
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
GET /api/v1/rooms/797 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 1157:-67Qh3LHM6aVA82WPxER
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 160
Content-Type: application/json; charset=utf-8
ETag: W/"2c979c6a5c83c5ff61a673cfcce47de7"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 0d98b08e-1ccc-4a74-aa80-ae4612b2c9be
X-Runtime: 0.018998
X-XSS-Protection: 1; mode=block

{
  "room": {
    "id": 797,
    "name": "MyString",
    "description": "MyText",
    "key": "nKuo-k8o",
    "public": false,
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
GET /api/v1/rooms?room_key=fAVWTdOE HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 1162:x-NCy_P34HcHGGygpCQd
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 160
Content-Type: application/json; charset=utf-8
ETag: W/"30614513fefe39e40b10bde83ec0f025"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: b3fc184f-e564-4698-842b-3863d04c78a5
X-Runtime: 0.023422
X-XSS-Protection: 1; mode=block

{
  "room": {
    "id": 802,
    "name": "MyString",
    "description": "MyText",
    "key": "fAVWTdOE",
    "public": false,
    "now_playing_video": null,
    "last_played_video": null,
    "online_users": [

    ]
  }
}
```

## GET /api/v1/rooms/popular
Returns a rooms.

### Example

#### Request
```
GET /api/v1/rooms/popular HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 4995:ytw9UZvnBeF-ECjQfndz
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 215
Content-Type: application/json; charset=utf-8
ETag: W/"1a62a2ac44a8341b418c4517844b5220"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 00d2c354-a9a6-4d80-b962-1c1826bf1700
X-Runtime: 0.015650
X-XSS-Protection: 1; mode=block

{
  "rooms": [
    {
      "id": 3445,
      "name": "public room",
      "description": "MyText",
      "key": "ICrZslae",
      "public": true,
      "now_playing_video": null,
      "last_played_video": null,
      "online_users": [
        {
          "id": 4995,
          "name": "MyString",
          "icon": {
            "url": null
          }
        }
      ]
    }
  ]
}
```
