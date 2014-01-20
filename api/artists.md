# Api::V1::Artists

#### {artist#HASH}
    {
      id: integer,
      name: string,
      avatar_url: string,
      description: text
    }

### List
    url: api/v1/artists(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    date_start: string // optional, format: "YYYY-MM-DD"
    date_end: string // optional, format: "YYYY-MM-DD"

  Response

    [{artist#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/artists.json
