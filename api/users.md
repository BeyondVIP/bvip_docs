# Api::V1::Users

#### {venue#HASH}
    {
      "id": integer,
      "name": string,
      "home": integer, // 0 or 1
      "selected": boolean
    }

#### {user#HASH}
    {
      "id": integer,
      "first_name": string,
      "last_name": string,
      "gender": string,
      "title": string,
      "all_venues": [{venue#HASH}, ...],
      "permissions_struct": {permission#STRUCT},
      "department_name": string,
      "user_image": {
        "photo": {
          "url": string,
          "thumb_100": {
            "url": string
          },
          "mobile_thumb": {
            "url": string
          },
          "thumb_200": {
            "url": string
          }
        }
      }
    }

### Index
    url: "/api/v1/staff(.:format)"
    format: json
    method: GET
    in:
      auth_token: string
      ids: array of integers //optional
    out: [{user#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/staff.json
