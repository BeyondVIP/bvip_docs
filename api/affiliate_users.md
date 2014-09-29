# Api::V1::AffiliateUsers

#### {affiliate_user#HASH}
    {
      id: integer,
      email: string,
      first_name: string,
      last_name: string,
      mobile_phone: string,
      facebook_page: string,
      twitter_page: string,
      instagram: string,
      organization: string,
      personal_website: string,
      host_id: string, // any [user](api/users.md)
      personalized_url: string,
      user_image: {
        photo: {
          url: string,
          thumb_100: {
            url: string
          },
          mobile_thumb: {
            url: string
          },
          thumb_200: {
            url: string
          }
        }
      }
      logo: {
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


### Index
    url: /api/v1/affiliate_users(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    ids: array of integers //optional

  Response

    [{affiliate_user#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/affiliate_users.json
