# Api::V1::AppSettings

### Create App Settings
    url: api/v1/app_settings(.:format)
    format: json
    method: POST

  Request

      auth_token: string
      app_name: string
      data: string // must be json format

  Response

    { message: string }

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d app_name=app123 -d data='{"status":"active", "another_setting":123}' https://app.beyondvip.com/api/v1/app_settings.json

### Get App Settings
    url: api/v1/app_settings(.:format)
    format: json
    method: GET

  Request

      auth_token: string
      app_name: string

  Response

    { data: your_data_json or '' }

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d app_name=app123 https://app.beyondvip.com/api/v1/app_settings.json
