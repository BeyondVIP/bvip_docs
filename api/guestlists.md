# Api::V1::Guestlists
Guestlist entity represents that [contact](/api/contacts.md) may come to
 specific [event](/api/events.md).

Please note - you couldn't create 2 guestlists for the same contact and the
 same event.

**user_id** represents originator – usually [user](/api/users.md) that
 creates guestlist.

**notes** – [notes](/api/notes.md) for guestlist.

**contact_info** – read-only information about contact for which reservation is
 made.

**event_info** – read-only information about event.

**type_for_females_id** and **type_for_males_id** show which guestlist types are
 chosen for guestlist.

**person_count** at guestlist_type limits guestlist male and female counts.

#### {tense#STRING}
    'past', 'upcoming'

#### {stage#STRING}
    'win', 'loss', 'denied'

#### {status#STRING}
    'not_confirmed', 'confirmed', 'canceled', 'disqualified',
    'group_disqualify', 'all_arrived', 'partially_arrived', 'no_show', 'no_id',
    'fake_id', 'dress_code', 'over_intox'

#### {state#STRING}
    'active', 'cancelled'

#### {gender_type#STRING}
    'male', 'female'

#### [{note#HASH}](/api/notes.md#notehash)

#### {guestlist#HASH}
    {
      actual_count_females: integer,
      actual_count_males: integer,
      approved: boolean,
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
        date: timestamp,
        end_time: timestamp
      },
      id: integer,
      last_stage: {stage#STRING},
      last_status: {status#STRING},
      stage: {stage#STRING},
      state: {state#STRING},
      status: {status#STRING},
      tally: boolean,
      type_for_females_id: integer,
      type_for_males_id: integer,
      updated_at: timestamp,
      user_id: integer,
      event_date: timestamp,
      event_name: string,
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

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/guestlists/past.json

### Get
    url: /api/v1/guestlists/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {guestlist#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/guestlists/1.json

### Create
    url: /api/v1/guestlists(.:format)
    format: json
    method: POST

  Description

  If 'contact_ids' parameter is set then guestlists are created for every
   contact whose id is placed. Alternatively 'contact' parameter can be set. In
   that case 'contact_owners' can be changed if they are present in 'contact'.

  Request

    auth_token: string
    contact_ids: array of integers // not needed if 'contact' parameter is set
    contact: { // this can be set instead of 'contact_ids' parameter
      name: string,
      email: string,
      phone: string,
      contact_owners: [ // change contact owners at particular venue
        {
          venue_id: integer,
          user_id: integer
        },
        ...
      ],
      tag_ids: array of integers
    }
    guestlist: {
      event_id: integer,
      state: string, // optional
      count_males: integer,
      count_females: integer,
      notes: array of strings,
      type_for_females_id: integer,
      type_for_males_id: integer,
      qualification: string,
      status: {status#STRING},
      user_id: integer
    }

  Response

    [{guestlist#HASH}, ...]

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_ids[]=352 -d guestlist[event_id]=19 -d guestlist[count_males]=1 -d guestlist[count_females]=1 -d guestlist[type_for_males_id]=1 -d guestlist[type_for_females_id]=2 https://app.beyondvip.com/api/v1/guestlists.json

### Update
    url: /api/v1/guestlists/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    guestlist: {
      status: {status#STRING},
      count_males: integer,
      count_females: integer,
      notes: array of strings,
      type_for_females_id: integer,
      type_for_males_id: integer,
      qualification: string,
      actual_count_males: integer,   // if these are present guestlist will be closed out
      actual_count_females: integer,  // could be present only for past events
      status: {status#STRING},
      user_id: integer
    }

  Response

    {guestlist#HASH}

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d guestlist[count_males]=2 https://app.beyondvip.com/api/v1/guestlists/2.json

### Delete
    url: /api/v1/guestlists/:id
    format: json
    method: DELETE

  Request

    auth_token: string

  Response

    { message: "The guestlist was successfully deleted" }

  Example

    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/guestlists/2.json

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

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/guestlists/available_statuses.json

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

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/guestlists/guestlist_types.json
