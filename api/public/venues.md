# Api::Public::Venues
Venue represents place where [events](/api/public/events.md) are held.

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
      description: text,
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
      phone: string, // format: "(123)456-7890"
      timezone: integer,
      twitter: string,
      updated_at: timestamp,
      venue_type: string,
      website: string
    }

### List available venues
    url: /api/public/venues(.:format)
    format: json
    method: GET

  Response

    [{venue#HASH}, ...]

  Example

    $ curl -X GET https://beyondvip.com/api/public/venues.json

### Get venue
    url: /api/public/venues/:id(.:format)
    format: json
    method: GET

  Response

    {venue#HASH}

  Example

    $ curl -X GET https://beyondvip.com/api/public/venues/1.json
