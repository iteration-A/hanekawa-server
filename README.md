# Hanekawa' Server

# Routes
| Route | Action |
| ----- | ------ |
| GET /chat_rooms | Gets all available Rooms|
| POST /chat_rooms | Creates a new Room \*1 |
| GET /chat_rooms/:topic | Gets a specific Room |
| POST /sign-up | Creates a User \*2 |
| POST /login | Gets a JWT for a given user \*3 |
| WS /cable | Connects to Action Cable |

# Channels
* ChatRoom

# Examples

*1 POST /chat_rooms:
```json
{
    "chat_room": {
        "topic": "ghost town"
    }
}
```

*2 POST /sign-up
```json
{
    "user": {
        "username": "powy",
        "password": "super_secret",
        "password_confirmation": "super_secret"
    }
}
```

*3 POST /login
```json
{
  "username": "powy",
  "password": "super_secret"
}
```

<img width="2531" target="_blank" alt="hanekawa" src="https://raw.githubusercontent.com/iteration-A/hanekawa-server/master/hanekawa.png">
