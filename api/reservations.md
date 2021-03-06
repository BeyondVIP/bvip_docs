# Api::V1::Reservations
Reservation entity represents that [contact](/api/contacts.md) may come to
 specific [event](/api/events.md).

Please note - you couldn't create 2 reservations for the same contact and the
 same event.

**host_id** represents host – any [user](/api/users.md) from department "VIP
 Host".

**originator_id** represents originator – usually [user](/api/users.md) that
 creates reservation.

**referable_id** and **referable_type** represents referral – can be any
 [user](/api/users.md) from any department or any [contact](/api/contacts.md).
 In case of user *referable_type* is 'User', contact – 'Contact.

**waitress_id** represents server – can be any [user](/api/users.md) from
 department "Server".

**reservation_section_id** – [section](/api/events.md#event-list-of-sections)
 where reserved [table](/api/events.md#event-list-of-tables) is located.

**requested_tables** and **requested_table_ids** –
 [tables](/api/events.md#event-list-of-tables) which are requested for
 reservation. Can be not present at all

**assigned_tables** and **assigned_table_ids** –
 [tables](/api/events.md#event-list-of-tables) which are assigned for
 reservation. Can be not present at all

**task_ids** – [tasks](/api/tasks.md) that are bound to reservation.

**notes** – [notes](/api/notes.md) for reservation.

**contact_info** – read-only information about contact for which reservation is
 made.

**event_info** – read-only information about event.

**contact_degree** is a contact status. Values are combinations of 'vip',
 'upsell' and 'comp'

#### {tense#STRING}
    'past', 'upcoming'

#### {stage#STRING}
    "lead", "prospect", "opportunity", "win", "loss"

#### {status#STRING}
    'confirmed', 'late', 'all_arrived', 'partially_arrived', 'all_seated',
    'partially_seated', 'check_dropped', 'paid', 'completed', 'unconfirmed',
    'waitlist', 'waitlist_all_arrived', 'waitlist_partially_arrived',
    'prospect', 'lead', 'not_interested', 'no_availability', 'different_venue',
    'no_response', 'disqualified', 'disqualified_group', 'price', 'canceled',
    'no_show', 'could_not_pay'

#### {referable_type#STRING}
    'Contact', 'User'

#### {reservation_table#HASH}
    {
      id: integer,
      name: string,
      reservation_section_id: integer
    }

#### [{note#HASH}](/api/notes.md/notehash)

#### {reservation#HASH}
    {
      comp: string, // comp description
      actual_comp: float, // actual comp value
      contact_id: integer,
      contact_info: {
        name: string,
        state: string,
        title: string,
        organization: string,
        avatar: string,
        avatar_mobile_thumb_url: string,
        facebook: string,
        twitter: string,
        email: string,
        phone: string,
        tag_names: string
      },
      count_females: integer,
      count_males: integer,
      actual_count_females: integer,
      actual_count_males: integer,
      created_at: timestamp,
      event_id: integer,
      event_info: {
        name: string,
        date: timestamp,
        end_time: timestamp
      },
      host_id: integer,
      id: integer,
      minimum: float, // minimum that contact can spend during the event
      notes: [{note#HASH}, ...],
      originator_id: integer,
      party_size: integer, // count_males + count_females
      qualification: string, // contact qualification status at venue where event takes place
      referable_id: integer,
      referable_type: {referable_type#STRING},
      reservation_section_id: integer,
      requested_tables: [{reservation_table#HASH}, ...],
      assigned_tables: [{reservation_table#HASH}, ...],
      stage: {stage#STRING},
      updated_at: timestamp,
      waitress_id: integer,
      date: timestamp, // event date
      task_ids: array of integers,
      status: {status#STRING},
      status_name: string, // readable status name
      actual_spent: float, // is set during closeout
      pre_paid: float, // prepaid order (using staff's personal page)
      requested_table_ids: array of integers,
      assigned_table_ids: array of integers,
      contact_degree: array of strings,
      bottles: integer // bottles count,
      closeout: boolean // reservations closeout status
    }

#### Validations
    always required:
      event_id, contact_id, status
    required if status is not 'lead', 'prospect' or any loss status:
      reservation_section_id

### List
    url: /api/v1/reservations(/{tense#STRING})(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    event_id: integer // optional
    section_id: integer // optional
    contact_ids: array of integers or integer // optional
    contact_id: integer // optional
    updated_since: string // format: "YYYY-MM-DD"
    page: integer

  Response

    [{reservation#HASH},...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_ids[]=352 -d event_id=9 https://app.beyondvip.com/api/v1/reservations/past.json

  Pull reservations example

    $ curl -X GET -d auth_token=5_-DRB-0jTkY1urfR1u2LA -d updated_since=2014-08-20 -d page=1  https://app.beyondvip.com/api/v1/reservations.json

### Get
    url: /api/v1/reservations/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {reservation#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/reservations/259.json

### Create
    url: /api/v1/reservations(.:format)
    format: json
    method: POST

  Description

  If 'contact_ids' parameter is set then reservations are created for every
   contact whose id is placed. Alternatively 'contact' parameter can be set. In
   that case 'contact_owners' can be changed if they are present in 'contact'.


  Request

    auth_token: string
    contact_ids: array of integers // not needed if 'contact' parameter is set
    contact: { // this can be set instead of 'contact_ids' parameter
      name: string,
      email: string, // optional, if originator is promoter
      phone: string, // optional, if originator is promoter
      originator_id, // optional, id of creator, if creator is not current user
      contact_owners: [ // change contact owners at particular venue
        {
          venue_id: integer,
          user_id: integer
        },
        ...
      ],
      tag_ids: array of integers
    }
    reservation: {
      event_id: integer,
      originator_id: integer,
      host_id: integer,
      waitress_id: integer,
      referable_id: integer,
      referable_type: {referable_type#STRING},
      reservation_section_id: integer,
      minimum: float,
      count_males: integer,
      count_females: integer,
      actual_count_males: integer,
      actual_count_females: integer,
      status: {status#STRING},
      qualification: string,
      comp: string,
      actual_comp: float,
      number: integer
      requested_table_ids: array of integers,
      assigned_table_ids: array of integers,
      notes: array of strings,
      check_number: string,
      actual_spent: float,
      contact_degree: array of strings,
      bottles: integer
    }

  Response

    [{reservation#HASH}, ...]

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_ids[]=352 -d reservation[event_id]=9 -d reservation[status]=lead https://app.beyondvip.com/api/v1/reservations.json

### Update
    url: /api/v1/reservations/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    reservation: {
      contact_id: integer,
      event_id: integer,
      originator_id: integer,
      host_id: integer,
      waitress_id: integer,
      referable_id: integer,
      referable_type: {referable_type#STRING},
      reservation_section_id: integer,
      minimum: float,
      count_males: integer,
      count_females: integer,
      actual_count_males: integer,
      actual_count_females: integer,
      status: {status#STRING},
      qualification: string,
      comp: string,
      actual_comp: float,
      number: integer
      requested_table_ids: array of integers,
      assigned_table_ids: array of integers,
      notes: array of strings,
      check_number: string,
      actual_spent: float,
      closeout: boolean,
      bottles: integer,
      contact_degree: array of strings
    }

  Response

    {reservation#HASH}

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d reservation[status]=prospect https://app.beyondvip.com/api/v1/reservations/259.json

### Remove
    url: /api/v1/reservations/:id(.:format)
    format: json
    method: DELETE

  Response

    { message: "The reservation was successfully removed" }

  Example

    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/reservations/259.json

#### [**Get Staff**](/api/users.md)
#### [**Edit Notes**](/api/notes.md)

### Examples

#### Notes adding
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_ids[]=352 -d reservation[event_id]=9 -d reservation[status]=lead -d reservation[notes][]="New Note" https://app.beyondvip.com/api/v1/reservations.json
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d reservation[notes][]="New Note" https://app.beyondvip.com/api/v1/reservations/259.json

#### Originator changing
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d reservation[originator_id]=2 https://app.beyondvip.com/api/v1/reservations/259.json

#### Table requesting
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d reservation[requested_table_ids][]=1 https://app.beyondvip.com/api/v1/reservations/259.json
