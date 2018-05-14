## POST /api/v1/rooms
MyText

### Example

#### Request
```
POST /api/v1/rooms HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 1988:tkoSwLuxnez2D1TEud1D
Content-Length: 62
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

room[name]=MyString&room[description]=MyText&room[public]=true
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 243
Content-Type: application/json; charset=utf-8
ETag: W/"0ed6b8bf911a79ac45eb411350eccf91"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: dda4f75e-3d29-43ab-ae30-12c3806b9062
X-Runtime: 0.016145
X-XSS-Protection: 1; mode=block

{
  "result": "success",
  "room": {
    "id": 1112,
    "name": "MyString",
    "description": "MyText",
    "key": "dAg2r_u9",
    "public": true,
    "now_playing_video": null,
    "last_played_video": null,
    "online_users": [

    ],
    "create_user": {
      "id": 1988,
      "name": "MyString",
      "icon": {
        "url": null
      }
    }
  }
}
```

## GET /api/v1/rooms/:id
Returns a room.

### Example

#### Request
```
GET /api/v1/rooms/1114 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 1992:-Uyq8qSybXNP1vpG7Dxi
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 225
Content-Type: application/json; charset=utf-8
ETag: W/"ad033b426fe401cd9eccbd7d22953fc4"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 698c63e6-e0e4-4e97-bdc0-bdd16ddec172
X-Runtime: 0.014239
X-XSS-Protection: 1; mode=block

{
  "room": {
    "id": 1114,
    "name": "MyString",
    "description": "MyText",
    "key": "Da4D0oPj",
    "public": false,
    "now_playing_video": null,
    "last_played_video": null,
    "online_users": [

    ],
    "create_user": {
      "id": 1992,
      "name": "MyString",
      "icon": {
        "url": null
      }
    }
  }
}
```

## GET /api/v1/rooms
Returns a room.

### Example

#### Request
```
GET /api/v1/rooms?room_key=lBMdoiq4 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Authorization: 1997:21tuuCsfNaZAb5Z-st32
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 225
Content-Type: application/json; charset=utf-8
ETag: W/"341f50437e4e8bfd982fdb307504c409"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: f01a36a3-6daf-4371-ba9e-8ce2e02f3bb3
X-Runtime: 0.012463
X-XSS-Protection: 1; mode=block

{
  "room": {
    "id": 1119,
    "name": "MyString",
    "description": "MyText",
    "key": "lBMdoiq4",
    "public": false,
    "now_playing_video": null,
    "last_played_video": null,
    "online_users": [

    ],
    "create_user": {
      "id": 1997,
      "name": "MyString",
      "icon": {
        "url": null
      }
    }
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
Authorization: 1998:nc6a9zwpSS8_auKfZwgz
Content-Length: 0
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 279
Content-Type: application/json; charset=utf-8
ETag: W/"cdf03c8ac5c02a5e01ee337074332615"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 9caac2df-d8eb-4162-b23d-4fb725e3576d
X-Runtime: 0.015732
X-XSS-Protection: 1; mode=block

{
  "rooms": [
    {
      "id": 1120,
      "name": "public room",
      "description": "MyText",
      "key": "bxsUcUj1",
      "public": true,
      "now_playing_video": null,
      "last_played_video": null,
      "online_users": [
        {
          "id": 1998,
          "name": "MyString",
          "icon": {
            "url": null
          }
        }
      ],
      "create_user": {
        "id": 1998,
        "name": "MyString",
        "icon": {
          "url": null
        }
      }
    }
  ]
}
```
