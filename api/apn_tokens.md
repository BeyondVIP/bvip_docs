# Api::V1::ApnTokens

### Create APN token
    url: api/v1/apn_tokens(.:format)
    format: json
    method: POST

  Request

      auth_token: string
      apn_token: string

  Response

    { token: string }

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d apn_token=1234 https://app.beyondvip.com/api/v1/apn_tokens.json

### Ping APN token (for testing)
    url: api/v1/apn_tokens/ping(.:format)
    format: json
    method: POST

  Request

      auth_token: string
      apn_token: string

  Response

    { message: "Success" }

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d apn_token=1234 https://app.beyondvip.com/api/v1/apn_tokens/ping.json
