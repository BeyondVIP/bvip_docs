# Api::V1::Tags

It is a tree of categories. All categories can contain tags.

**ancestry** - ID of parent category

#### {tag#HASH}
    {
      id: integer,
      name: string
    }

#### {tag_category#HASH}
    {
      ancestry: string,
      id: integer,
      name: string,
      tags: [{tag#HASH}, ...] // OR empty array, if category doesn't have tags
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

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/settings/tags.json
