# Api::V1::Reservations

#### {tense#STRING}
    'past', 'upcoming'

#### {stage#STRING}
    "lead", "prospect", "opportunity", "win", "loss"

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
      "bottles": integer,
      "comp": string,
      "actual_comp": float,
      "contact_id": integer,
      "contact_info": {
        "name": string,
        "state": string,
        "title": string,
        "organization": string,
        "avatar": string,
        "facebook": string,
        "twitter": string,
        "email": string,
        "phone": string,
        "tag_names": string
      },
      "count_females": integer,
      "count_males": integer,
      "created_at": timestamp,
      "event_id": integer,
      "event_info": {
        "name": string,
        "date": timestamp
      },
      "host_id": integer,
      "id": integer,
      "last_stage": {stage#STRING},
      "minimum": float,
      "note": text,
      "notes": [{note#HASH}, ...],
      "number": integer,
      "originator_id": integer,
      "party_size": integer,
      "qualification": string,
      "referable_id": integer,
      "referable_type": {referable_type#STRING},
      "reservation_section_id": integer,
      "requested_tables": [{reservation_table#HASH}, ...],
      "assigned_tables": [{reservation_table#HASH}, ...],
      "stage": {stage#STRING},
      "template_minimum": float,
      "updated_at": timestamp,
      "waitress_id": integer,
      "date": timestamp,
      "task_ids": array of integers,
      "status": string,
      "status_name": string,
      "last_status": string,
      "actual_spent": float,
      "pre_paid": float,
      "requested_table_ids": array of integers,
      "assigned_table_ids": array of integers
    }

#### Validations
    always required:
      event_id, contact_id, status
    required if status is not 'lead', 'prospect' or any loss status:
      reservation_section_id, count_males or count_females

### List
    url: /api/v1/reservations(/{tense#STRING})(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      event_id: integer // optional
      section_id: integer // optional
      contact_ids: [1,2,3] or <integer> // optional
      contact_id: integer // optional
    out: [{reservation#HASH},...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_ids[]=352 -d event_id=9 https://beyondvip.com/api/v1/reservations/past.json

### Get
    url: /api/v1/reservations/:id(.:format)
    format: json
    method: GET
    in:
      auth_token: string
    out: {reservation#HASH}

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/reservations/259.json

### Create
    url: /api/v1/reservations(.:format)
    format: json
    method: POST
    in:
      auth_token: string
      contact_ids: array of integers or "access_token":"213dasm444<saas4..",

      reservation: {
        "event_id": integer,
        "originator_id": integer,
        "host_id": integer,
        "waitress_id": integer,
        "referable_id": integer,
        "referable_type": {referable_type#STRING},
        "reservation_section_id": integer,
        "minimum": float,
        "count_males": integer,
        "count_females": integer,
        "status": string,
        "note": text,
        "qualification": string,
        "comp": string,
        "actual_comp": float,
        "number": integer
        "requested_table_ids": array of integers,
        "assigned_table_ids": array of integers,
        "notes": array of strings
      }
    out: {reservation#HASH}

    example:
    $ curl -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_ids[]=352 -d reservation[event_id]=9 -d reservation[status]=lead https://beyondvip.com/api/v1/reservations.json

### Update
    url: /api/v1/reservations/:id(.:format)
    format: json
    method: PUT
    in:
      auth_token: string
      reservation: {
        "contact_id": integer,
        "event_id": integer,
        "originator_id": integer,
        "host_id": integer,
        "waitress_id": integer,
        "referable_id": integer,
        "referable_type": {referable_type#STRING},
        "reservation_section_id": integer,
        "minimum": float,
        "count_males": integer,
        "count_females": integer,
        "status": string,
        "note": text,
        "qualification": string,
        "comp": string,
        "actual_comp": float,
        "number": integer
        "requested_table_ids": array of integers,
        "assigned_table_ids": array of integers,
        "notes": array of strings
      }
    out: {reservation#HASH}

    example:
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d reservation[status]=prospect https://beyondvip.com/api/v1/reservations/259.json

#### [**Get Staff**](/api/users.md)
#### [**Edit Notes**](/api/notes.md)

### Examples

#### Notes adding
    $ curl -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_ids[]=352 -d reservation[event_id]=9 -d reservation[status]=lead -d reservation[notes][]="New Note" https://beyondvip.com/api/v1/reservations.json
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d reservation[notes][]="New Note" https://beyondvip.com/api/v1/reservations/259.json

#### Originator changing
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d reservation[originator_id]=2 https://beyondvip.com/api/v1/reservations/259.json

#### Table requesting
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d reservation[requested_table_ids][]=1 https://beyondvip.com/api/v1/reservations/259.json
