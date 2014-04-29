# Api::V1::StaticTexts

#### {type#STRING}
    'terms', 'privacy'

### Get static text by type
    url: /static_text(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    type: {type#STRING}

  Response

    html page

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d type=terms https://app.beyondvip.com/api/v1/static_text
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/static_text/terms

### Get only text by type
    url: /api/v1/static_texts(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    type: {type#STRING}

  Response

    text

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d type=terms https://app.beyondvip.com/api/v1/static_texts.json
