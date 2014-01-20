# Api::V1::Tags

#### {tag#HASH}
    {
      company_id: integer,
      id: integer,
      name: string
    }

#### {tag_category#HASH}
    {
      ancestry: string,
      company_id: integer,
      id: integer,
      name: string,
      tags: [{tag#HASH}, ...]
    }

### List
    url: /api/v1/settings/tags(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{tag_category#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/settings/tags.json
