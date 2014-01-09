# Api::V1::Tokens

### Sign in
    url: "/api/v1/tokens(.:format)"
    format: json
    method: POST
    in:
      email: string
      password: string
      device_token: string
      mobile_os: string // "android" OR "ios"
    out: {
      token: string,
      promoter: boolean
    }

    example:
    $ curl -X POST -d email=admin@beyondvip.com -d password=password -d device_token=324628746283682634 -d mobile_os=ios https://beyondvip.com/api/v1/tokens.json

### Destroy token
    url: "/api/v1/tokens/:user_id(.:format)"
    format: json
    method: DELETE
    in:
      auth_token: string
      apn_token: string
    out: {
      message: "User signed out."
    }

    example:
    $ curl -X DELETE -d auth_token=4RhR6aDOzHyyqHC8BAbYfA https://beyondvip.com/api/v1/tokens/1.json

### Send reset password instructions
    url: "/api/v1/tokens/reset(.:format)"
    format: json
    method: POST
    in:
      email: string
    out: {
      message: "Please check the email associated with this account for instructions on how to reset you password"
    }

    example:
    $ curl -X POST -d email=admin@beyondvip.com https://beyondvip.com/api/v1/tokens/reset.json

### Send phone verification
    url: "/api/v1/settings/send_phone_verification(.:format)"
    format: json
    method: POST
    in:
      auth_token: string
      phone: string
    out: {
      message: "Verification code sent."
    }

    example:
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d phone="(123)456-7890" https://beyondvip.com/api/v1/settings/send_phone_verification.json

### Verify phone
    url: "/api/v1/settings/verify_phone(.:format)"
    format: json
    method: POST
    in:
      auth_token: string
      token: string
    out: {
      message: "Your number was successfully confirmed."
    }

    example:
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d token=1988 https://beyondvip.com/api/v1/settings/verify_phone.json
