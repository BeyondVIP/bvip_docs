# Api::V1::Profile

#### [{user#HASH}](/api/users.md#userhash)

### Get
    url: /api/v1/profile(.:format)
    format: json
    method: GET
    in:
      auth_token: string
    out: {user#HASH}

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/profile.json

### Update avatar
    url: /api/v1/profile
    format: json
    method: PUT
    in:
      auth_token: string
      avatar: <file>
    out: {user#HASH}

    example:
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d avatar=<file> https://beyondvip.com/api/v1/profile.json

### Get sign up flag
    url: /api/v1/profile/signup_flag
    format: json
    method: GET
    in:
      auth_token: string
    out: {
      status: boolean
    }

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/profile/signup_flag.json

### Set sign up flag
    url: /api/v1/profile/signup_flag
    format: json
    method: POST
    in:
      auth_token: string
    out: {
      message: "Success"
    }

    example:
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/profile/signup_flag.json
