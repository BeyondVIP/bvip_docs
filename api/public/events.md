# Api::V1::Events
Event entity represents that some event takes place at specified
 [venue](/api/public/venues.md) and time. You can create
 [reservations](/api/public/reservations.md) and
 [guestlists](/api/public/guestlists.md) in specific event. Event has
 reservation sections, which have reservation tables.

**sections** field shows sections of event, they can be used when
 creating [reservations](/api/public/reservations.md)

**tables** field shows tables of event, they can be used when creating
 [reservations](/api/public/reservations.md)

**guestlist_types** field shows what guestlist types can be specified for males
 and females on [guestlist](/api/public/guestlists.md) creation.

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
      facebook_token_required: boolean,
      global_fee: float,
      venue_fee: float,
      artists: [{artist#HASH}, ...]
      general_admission_template: {
        id: integer,
        name: string,
        general_admission_entrance_types: [{general_admission_entrance_type#HASH}, ...],
        venue_id: integer,
        removable: boolean
      },
      sections: [{section#HASH}, ...],
      tables: [{table#HASH}, ...],
      guestlist_types: [{guestlist_type#HASH}, ...]
      venue_name: string,
      reservation_sales: boolean,
      guestlist_sales: boolean,
      prepaid_tables: boolean
    }

### List Events
    url: /api/public/events(.:format)
    format: json
    method: GET

  Request

    date_start: string // optional, format: "YYYY-MM-DD"
    date_end: string // optional, format: "YYYY-MM-DD"
    event_ids: array of integers // optional
    venue_id: integer // optional
    not_passed: boolean // optional

  Response

    [{event#HASH}, ...]

  Example

    $ curl -X GET -d company_token=rsP2uhgqTdmdXAcKqKw9 -d date_start="2014-01-01" https://app.beyondvip.com/api/public/events.json
