# Api::V1::Profile

#### [{user#HASH}](/api/users.md#userhash)

### Get
    url: /api/v1/profile(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {user#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/profile.json

### Update avatar
    url: /api/v1/profile
    format: json
    method: PUT

  Request

    auth_token: string
    avatar: <file>

  Response

    {user#HASH}

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d avatar=<file> https://app.beyondvip.com/api/v1/profile.json

### Get sign up flag
    url: /api/v1/profile/signup_flag
    format: json
    method: GET

  Request

    auth_token: string

  Response

    { status: boolean }

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/profile/signup_flag.json

### Set sign up flag
    url: /api/v1/profile/signup_flag
    format: json
    method: POST

  Request

    auth_token: string

  Response

    { message: "Success" }

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/profile/signup_flag.json
