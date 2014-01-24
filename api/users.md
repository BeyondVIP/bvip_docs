# Api::V1::Users

#### {venue#HASH}
    {
      id: integer,
      name: string,
      home: integer, // represents home venue of user. 1 if venue is home, 0 if not
      selected: boolean // false if venue is not selected when settings filters
    }

#### {user#HASH}
    {
      id: integer,
      first_name: string,
      last_name: string,
      gender: string,
      title: string,
      all_venues: [{venue#HASH}, ...],
      department_name: string,
      user_image: {
        photo: {
          url: string,
          thumb_100: {
            "url": string
          },
          mobile_thumb: {
            url: string
          },
          thumb_200: {
            url: string
          }
        }
      }
    }

### Index
    url: /api/v1/staff(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    ids: array of integers //optional

  Response

    [{user#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/staff.json
