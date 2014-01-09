# Api::V1::Events

#### {artist#HASH}
    {
      "id": integer,
      "status": string,
      "name": string,
      "avatar_url": string
    }

#### {general_admission_entrance_type#HASH}
    {
      "id": integer,
      "male_price": float,
      "female_price": float,
      "title": string
    }

#### {section#HASH}
    {
      "id": integer,
      "name": string,
      "available_places": integer,
      "total_places": integer,
      "color": string,
      "reservation_room_id": integer,
      "minimum": float,
      "description": string
    }

#### {table#HASH}
    {
      "capacity": integer,
      "id": integer,
      "name": string,
      "reservation_section_id": integer,
      "shape": string,  // "circle" or "square"
      "size": string,  // "small", "medium", "large"
      "coordinates": {
        "x": float,
        "y": float
      }
    }

#### {guestlist_type#HASH}
    {
      "id": integer,
      "name": string,
      "price_per_person": float,
      "person_count": integer,
      "gender_type": "male",
      "default": boolean,
      "guestlist_template_id": integer
    }

#### {room#HASH}
    {
      id: integer,
      name: string,
      background_url: string
    }

#### {event_details#HASH}
    {
      "id": integer,
      "venue_id": integer,
      "name": string,
      "date": timestamp,
      "location": string,
      "dress_code": string,
      "age": string,
      "description": string,
      "poster_url": string,
      "poster_small_url": string,
      "poster_medium_url": string,
      "poster_list_thumb_url": string,
      "poster_preview_thumb_url": string,
      "poster_mobile_thumb_url": string,
      "reservation_settings_template_id": integer,
      "end_time": timestamp,
      "state": string,
      "tickets_url": string,
      "started": boolean,
      "facebook_token_required": boolean,
      "expected_guestlists_count": integer,
      "total_reservations_count": integer,
      "total_reservation_minimums": integer,
      "global_fee": float,
      "venue_fee": float,
      "artists": [{artist#HASH}, ...],
      "general_admission_template": {
        "id": integer,
        "name": string,
        "general_admission_entrance_types": [{general_admission_entrance_type#HASH}, ...],
        "venue_id": integer,
        "removable": boolean
      },
      "sections": [{section#HASH}, ...],
      "tables": [{table#HASH}, ...],
      "guestlist_types": [{guestlist_type#HASH}, ...]

### List
    url: /api/v1/events(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      date_start: string // optional, format: "YYYY-MM-DD"
      date_end: string // optional, format: "YYYY-MM-DD"
      event_ids: array of integers // optional
      venue_id: integer // optional
    out: [{event_details#HASH},{event_details#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d date_start="2014-01-01" https://beyondvip.com/api/v1/events.json

### List of events (lite)
    url: /api/v1/events/lite(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      date_start: string // optional, format: "YYYY-MM-DD"
      date_end: string // optional, format: "YYYY-MM-DD"
      event_ids: array of integers // optional
    out: [
      {
        id: integer,
        venue_id: integer,
        name: string,
        date: datetime,
        location: string,
        dress_code: string,
        age: string,
        description: text,
        poster_url: string,
        poster_mobile_thumb_url: string,
        section_ids: array of integers,
        table_ids: array of integers,
        artists: [{artist#HASH}, ...],
        guestlist_type_ids: array of integers
      }, ...
    ]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d date_start="2014-01-01" https://beyondvip.com/api/v1/events/lite.json

### Event details
    url: /api/v1/events/:id(.:format)
    format: json
    method: GET
    in:
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    out: {
      age: string,
      closeout_notes: string,
      company_id: integer,
      created_at: timestamp,
      date: timestamp,
      description: text,
      dress_code: string,
      end_time: timestamp,
      event_type: string,
      facebook_link: string,
      facebook_token_required: boolean,
      finished: boolean,
      general_admission_template_id: integer,
      global_fee: float,
      guestlist_sales: boolean,
      guestlist_template_id: integer,
      id: integer,
      master_id: integer,
      menu_template_id: integer,
      music_type: string,
      name: string,
      personalized_link: string,
      poster: {
        url: string,
        small: {
          url: string
        },
        list_thumb: {
          url: string
        },
        preview_thumb: {
          url: string
        },
        mobile_thumb: {
          url: string
        },
        medium: {
          url: string
        }
      },
      promo_status: string,
      reservation_minimum_template_id: integer,
      reservation_sales: boolean,
      reservation_settings_template_id: integer,
      show_on_public: boolean,
      start_time: timestamp,
      state: string,
      tickets_url: string,
      updated_at: timestamp,
      venue_fee: float,
      venue_id: integer,
      artists: [
        {
          avatar: {
            url: string,
            thumb_100:{
              url: string
            }
          },
          description: string,
          id: integer,
          name: string,
          status: string,  // (Dictionary key artist_status)
        }
      ],
      general_admission_template: {
        name: string,
        general_admission_entrance_types: [
          {
            title: string,
            male_price: float,
            female_price: float
          }, ...
        ]
      }
    }

### Event. List of rooms
    url: /api/v1/events/:id/rooms(.:format)
    format: json
    method: GET
    in:
      auth_token: string
    out: [{room#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/events/19/rooms.json

### All rooms
    url: /api/v1/events/rooms(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      room_ids: array of integers //optional
    out: [{room#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/events/rooms.json

### Event. List of sections
    url: /api/v1/events/:id/sections(.:format)
    format: json
    method: GET
    in:
      auth_token: string
    out: [{section#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/events/19/sections.json

### All sections
    url: /api/v1/events/sections(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      section_ids: array of integers //optional
    }
    out: [
      {
        id: integer,
        name: string,
        color: string
      }, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/events/sections.json

### Event. List of tables
    url: /api/v1/events/:id/tables(.:format)
    format: json
    method: GET
    in:
      auth_token: string
    out: [{table#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/events/19/tables.json

### Event. All tables
    url: /api/v1/events/tables(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      section_ids: array of integers // optional
      table_ids: array of integers // optional
    out: [
      {
        id: integer,
        name: string
        reservation_section_id: integer
      }, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/events/tables.json

### All guestlist types
    url: api/v1/events/:id/types
    format: json
    method: GET
    in:
      auth_token: string
      gender_type: string // 'males' or 'females'. All records if not set.
    out [
      {
        company_id: integer,
        created_at: timestamp,
        default: boolean,
        gender_type: string,
        guestlist_template_id: integer,
        id: integer,
        name: string,
        person_count: integer,
        price_per_person: float,
        updated_at: timestamp
      }, ...
    ]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/events/19/types.json

### Log sharing
    url: api/v1/events/:id/share_log
    format: json
    method: POST
    in:
      auth_token: string
    out: { message: string }

    example:
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/events/19/share_log.json
