# Api::V1::Venues
Venue represents place where [events](/api/events.md) are held. Venue filters
 can be created to view venue-specific information only. [Staff](/api/users.md)
 can have home venue and also can own [contacts](/api/contacts.md) at particular
 venue.

#### {venue_type#STRING}
    'Nightclub', 'Supperclub', 'Lounge', 'Dayclub', 'Pool Party', 'Cocktail Bar', 'Dance Club', 'Music Venue', 'Bar'

#### {venue#HASH}
    {
      id: integer,
      name: string,
      email: string,
      location: string,
      longitude: float,
      latitude: float,
      phone: string,
      website: string,
      facebook: string,
      twitter: string,
      instagram: string,
      venue_type: {venue_type#STRING},
      timezone: integer,
      description: string,
      logo_thumb_200_url: string
    }

### List available venues
    url: /api/v1/venues/list(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{venue#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/venues/list.json

### Set venue filter for staff
    url: /api/v1/venues/set_filters(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    venue_ids: string // "0" for all venues

  Response

    [{venue#HASH}, ...]

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d venue_ids="1,2" https://beyondvip.com/api/v1/venues/set_filters.json
