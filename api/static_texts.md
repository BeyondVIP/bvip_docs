# Api::V1::StaticTexts

#### {type#STRING}
    'terms', 'privacy'

### Get static text by type
    url: /static_text(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      type: {type#STRING}
    }
    out: html page

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d type=terms https://beyondvip.com/api/v1/static_text
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/static_text/terms

### Get only text by type
    url: /api/v1/static_texts(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      type: {type#STRING}
    }
    out: text

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d type=terms https://beyondvip.com/api/v1/static_texts.json
