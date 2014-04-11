# Api::V1::Users
User is the person who works at [venues](/api/venues.md). User can own
 [contacts](/api/contacts.md) at particular venue. User can be originator, host,
 referral, server of [reservation](/api/reservations.md) and originator of
 [guestlist](/api/guestlists.md).

**all_venues** field shows at what venues user works.

**department_name** field show at which department user works. If it is "VIP
  Host" user is host, if "Server" user is server.

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
    promoters: 'true' //optional

  Response

    [{user#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/staff.json
