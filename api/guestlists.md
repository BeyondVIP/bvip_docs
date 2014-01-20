# Api::V1::Guestlists

#### {tense#STRING}
    'past', 'upcoming'

#### {stage#STRING}
    'win', 'loss', 'denied'

#### {state#STRING}
    'active', 'cancelled'

#### [{note#HASH}](/api/notes.md#notehash)

#### {guestlist#HASH}
    {
      actual_count_females: integer,
      actual_count_males: integer,
      approved: boolean,
      company_id: integer,
      contact_id: integer,
      contact_info: {
        name: string,
        state: string,
        title: string,
        organization: string,
        avatar: string,
        facebook: string,
        twitter: string,
        email: string,
        phone: string,
        tag_names: string
      },
      count_females: integer,
      count_males: integer,
      created_at: timestamp,
      event_id: integer,
      event_info: {
        name: string,
        date: timestamp
      },
      guestlist_template_id: integer,
      id: integer,
      last_stage: {stage#STRING},
      last_status: string,
      stage: {stage#STRING},
      state: {state#STRING},
      status: string,
      tally: boolean,
      type_for_females_id: integer,
      type_for_males_id: integer,
      updated_at: timestamp,
      user_id: integer,
      event_date: timestamp,
      event_name: string,
      contact_name: string,
      type_for_males_name: string,
      type_for_females_name: string,
      note: text,
      notes: [{note#HASH}, ...],
      qualification: string,
      status_name: string,
      venue_id: integer
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

### List
    url: /api/v1/guestlists(/{tense#STRING})(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    event_id: integer // optional
    contact_ids: array of integers or integer // optional
    contact_id: integer // optional

  Response

    [{guestlist#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/guestlists/past.json

### Get
    url: /api/v1/guestlists/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {guestlist#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/guestlists/1.json

### Create
    url: /api/v1/guestlists(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    contact_ids: array of integers
    guestlist: {
      event_id: integer,
      state: string, // optional
      count_males: integer,
      count_females: integer,
      note: text,
      type_for_females_id: integer,
      type_for_males_id: integer,
      qualification: string
    }

  Response

    [{guestlist#HASH}, ...]

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_ids[]=352 -d guestlist[event_id]=19 -d guestlist[count_males]=1 -d guestlist[count_females]=1 -d guestlist[type_for_males_id]=1 -d guestlist[type_for_females_id]=2 https://beyondvip.com/api/v1/guestlists.json

### Update
    url: /api/v1/guestlists/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    guestlist: {
      status: string,
      count_males: integer,
      count_females: integer,
      note: text,
      type_for_females_id: integer,
      type_for_males_id: integer,
      qualification: string,
      actual_count_males: integer,   // if these are present guestlist will be closed out
      actual_count_females: integer  // could be present only for past events
    }

  Response

    {guestlist#HASH}

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d guestlist[count_males]=2 https://beyondvip.com/api/v1/guestlists/2.json

### Delete
    url: /api/v1/guestlists/:id
    format: json
    method: DELETE

  Request

    auth_token: string

  Response

    { message: "The guestlist was successfully deleted" }

  Example

    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/guestlists/2.json

### Available statuses
    url: /api/v1/guestlists/available_statuses(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {
      "not_confirmed": "Not Confirmed",
      "confirmed": "Confirmed",
      ...
    }

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/guestlists/available_statuses.json

### List of guestlist types
    url: api/v1/guestlist_types(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    date_start: string // optional, format: "YYYY-MM-DD"
    date_end: string // optional, format: "YYYY-MM-DD"

  Response

    [{guestlist_type#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/guestlists/guestlist_types.json
