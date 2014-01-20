# Api::V1::Notifications

#### {notification#HASH}
    {
      company_id: integer,
      created_at: timestamp,
      id: integer,
      message: text,
      read: boolean,
      sender_id: integer,
      sender_type: string,
      title: string,
      user_id: integer
    }

### Get all notifications
    url: /api/v1/notifications/all(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{notification#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/notifications/all.json

### Get current user's all notifications
    url: /api/v1/notifications/list(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{notification#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/notifications/list.json

### Get current user's unread notifications
    url: /api/v1/notifications/unread(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{notification#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/notifications/unread.json

### Get current user's unread notifications count
    url: /api/v1/notifications/unread_count(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    { count: integer }

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/notifications/unread_count.json

### Mark notifications as "read"
    url: /api/v1/notifications(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    ids: array of integers // optional

  Response

    { message: "The Notification was successfully marked as read" }

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d ids[]=933 https://beyondvip.com/api/v1/notifications.json
