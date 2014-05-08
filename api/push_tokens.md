# Api::V1::PushTokens

#### {push_token#HASH}
    {
      token: string
      device_id: string
    }

### Create push token
    url: api/v1/push_tokens(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    push_token: {push_token#HASH}

  Response

    {push_token#HASH}

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d push_token[token]=1234 -d push_token[device_id]=1234 https://app.beyondvip.com/api/v1/push_tokens.json
