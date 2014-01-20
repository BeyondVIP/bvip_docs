# Api::V1::Tokens

## Server-to-server authentication
Firstly get 'auth_token' using sign in request and user's email and password. Then make requests to api using this 'auth_token'.

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/artists.json

### Sign in
    url: /api/v1/tokens(.:format)
    format: json
    method: POST

  Request

    email: string
    password: string
    device_token: string // unique identifier of device, e.g. iOS UDID
    mobile_os: string // "android" OR "ios"

  Response

    { token: string }

  Example

    $ curl -X POST -d email=admin@beyondvip.com -d password=password -d device_token=324628746283682634 -d mobile_os=ios https://beyondvip.com/api/v1/tokens.json

### Destroy token
    url: /api/v1/tokens/:user_id(.:format)
    format: json
    method: DELETE

  Request

    auth_token: string
    apn_token: string

  Response

    { message: "User signed out." }


  Example

    $ curl -X DELETE -d auth_token=4RhR6aDOzHyyqHC8BAbYfA https://beyondvip.com/api/v1/tokens/1.json

### Send reset password instructions
    url: /api/v1/tokens/reset(.:format)
    format: json
    method: POST

  Request

    email: string

  Response

    { message: "Please check the email associated with this account for instructions on how to reset you password" }


  Example

    $ curl -X POST -d email=admin@beyondvip.com https://beyondvip.com/api/v1/tokens/reset.json

### Send phone verification
    url: /api/v1/settings/send_phone_verification(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    phone: string // format: "(123)456-7890"

  Response

    { message: "Verification code sent." }


  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d phone="(123)456-7890" https://beyondvip.com/api/v1/settings/send_phone_verification.json

### Verify phone
    url: /api/v1/settings/verify_phone(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    token: string // sent to mobile phone after making phone verification request

  Response

    { message: "Your number was successfully confirmed." }


  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d token=1988 https://beyondvip.com/api/v1/settings/verify_phone.json
