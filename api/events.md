# Api::V1::Events
Event entity represents that some event takes place at specified
 [venue](/api/venues.md) and time. You can create
 [reservations](/api/reservations.md) and [guestlists](/api/guestlists.md) for
 contacts in specific event. Event has reservation rooms, which have reservation
 sections, which have reservation tables.

**sections** field shows sections of event, they can be used when
 creating [reservations](/api/reservations.md)

**tables** field shows tables of event, they can be used when creating
 [reservations](/api/reservations.md)

**guestlist_types** field shows what guestlist types can be specified for males
 and females on [guestlist](/api/guestlists.md) creation.

Section colors can be orange: '#ff8800', red: '#dc143c', purple: '#6600ff',
 blue: '#42aaff', green: '#0bda51', yellow: '#ffff00'

#### {state#STRING}
    'active', 'inactive'

#### {artist#HASH}
    {
      id: integer,
      status: string,
      name: string,
      avatar_url: string
    }

#### {general_admission_entrance_type#HASH}
    {
      id: integer,
      male_price: float,
      female_price: float,
      title: string
    }

#### {section#HASH}
    {
      id: integer,
      name: string,
      available_places: integer,
      total_places: integer,
      color: string,
      reservation_room_id: integer,
      reservation_room_name: string,
      minimum: float, // minimum that contact should spend having seat at this section
      description: string
    }

#### {table#HASH}
    {
      capacity: integer,
      id: integer,
      name: string,
      reservation_section_id: integer,
      shape: string,  // "circle" or "square"
      size: string,  // "small", "medium", "large"
      coordinates: {
        x: float,
        y: float
      }
    }

#### {guestlist_type#HASH}
    {
      id: integer,
      name: string,
      price_per_person: float,
      person_count: integer,
      gender_type: string,
      default: boolean,
      guestlist_template_id: integer
    }

#### {reservation_room#HASH}
      {
        id: integer,
        name: string,
        background_url: string
      }

#### {event#HASH}
    {
      id: integer,
      venue_id: integer, // venue where event takes place
      name: string,
      date: timestamp, // start date and time
      location: string, // venue location
      dress_code: string,
      age: string,
      description: string,
      poster_url: string,
      poster_small_url: string,
      poster_medium_url: string,
      poster_list_thumb_url: string,
      poster_preview_thumb_url: string,
      poster_mobile_thumb_url: string,
      reservation_settings_template_id: integer,
      end_time: timestamp, // end date and time
      state: {state#STRING},
      tickets_url: string,
      started: boolean, // indicates if event is started
      artists: [{artist#HASH}, ...]
      sections: [{section#HASH}, ...],
      tables: [{table#HASH}, ...],
      guestlist_types: [{guestlist_type#HASH}, ...]
      reservation_rooms: [{reservation_room#HASH}]
    }

#### {lite-event#HASH}
    {
      id: integer,
      venue_id: integer,
      name: string,
      date: datetime,
      end_time: datetime,
      location: string,
      poster_url: string,
      poster_small_url: string,
      poster_medium_url: string,
      poster_list_thumb_url: string,
      poster_preview_thumb_url: string,
      poster_mobile_thumb_url: string
    }

### List
    url: /api/v1/events(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    date_start: string // optional, format: "YYYY-MM-DD"
    date_end: string // optional, format: "YYYY-MM-DD"
    event_ids: array of integers // optional
    venue_id: integer // optional
    state: {state#STRING} // optional
    lite: 'true' //optional

  Response

    [{event#HASH}, ...]

  Response for lite: true

    [{lite-event#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d date_start="2014-01-01" https://app.beyondvip.com/api/v1/events.json

### Show
    url: /api/v1/events/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {event#HASH}

  Example

    $ curl -X GET -d auth_token=eoAGyfGfTthhmBDzi6uSYQ  https://app.beyondvip.com/api/v1/events/1220.json

### Event. List of rooms
    url: /api/v1/events/:id/rooms(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{reservation_room#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/events/19/rooms.json

### Event. List of sections
    url: /api/v1/events/:id/sections(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{section#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/events/19/sections.json

### All sections
    url: /api/v1/events/sections(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    section_ids: array of integers // optional

  Response

    [
      {
        id: integer,
        name: string,
        color: string
      },
      ...
    ]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/events/sections.json

### Event. List of tables
    url: /api/v1/events/:id/tables(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{table#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/events/19/tables.json

### Event. All tables
    url: /api/v1/events/tables(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    section_ids: array of integers // optional
    table_ids: array of integers // optional

  Response

    [
      {
        id: integer,
        name: string
        reservation_section_id: integer
      },
      ...
    ]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/events/tables.json

### All guestlist types
    url: api/v1/events/:id/types
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{guestlist_type#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/events/19/types.json

### Log sharing
    url: api/v1/events/:id/share_log
    format: json
    method: POST

  Request

    auth_token: string,
    social_network_name: string //optional

  Response

    { message: string }

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/events/19/share_log.json

### Update guestlist sales
    url: /api/v1/events/:id/update_guestlist_sales(.:format)
    format: json
    method: PUT

  Request

    auth_token: string,
    guestlist_sales: boolean

  Response

    {event#HASH}