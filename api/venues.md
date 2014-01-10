# Api::V1::Venues

#### {venue_type#STRING}
    'Nightclub', 'Supperclub', 'Lounge', 'Dayclub', 'Pool Party', 'Cocktail Bar', 'Dance Club', 'Music Venue', 'Bar'

#### {venue#HASH}
    {
      address: string,
      avatar: {
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
      },
      company_id: integer,
      created_at: timestamp,
      description: string,
      email: string,
      facebook: string,
      id: integer,
      instagram: string,
      latitude: float,
      location: string,
      logo: {
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
      },
      longitude: float,
      name: string,
      phone: string,
      timezone: integer,
      twitter: string,
      updated_at: timestamp,
      venue_type: {venue_type#STRING},
      website: string
    }

### List available venues
    url: /api/v1/venues/list(.:format)
    format: json
    method: GET
    in:
      auth_token: string
    out: [{venue#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/venues/list.json

### Set venue filter for staff
    url: /api/v1/venues/set_filters(.:format)
    format: json
    method: POST
    in:
      auth_token: string
      venue_ids: string // "0" for all venues
    out: [{venue#HASH}, ...]

    example:
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d venue_ids="1,2" https://beyondvip.com/api/v1/venues/set_filters.json
