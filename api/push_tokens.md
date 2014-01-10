# Api::V1::PushTokens

## {push_token#HASH}
    {
      token: string
      device_id: string
    }

## Create push token
    url: api/v1/push_tokens(.:format)
    format: json
    method: POST
    in:
      auth_token: string
      push_token: {push_token#HASH}
    out: {push_token#HASH}

    example:
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d push_token[token]=1234 -d push_token[device_id]=1234 https://beyondvip.com/api/v1/push_tokens.json
