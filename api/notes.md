# Api::V1::Notes

Note entity represents short description or comment for [reservation](/api/reservations.md), [guestlist](/api/guestlists.md), [task](/api/tasks.md) or [contact](/api/contacts.md)

#### {note#HASH}
    {
      id: integer,
      text: string,
      task_id: integer,
      user_id: integer,
      created_at: timestamp,
      guestlist_id: integer,
      reservation_id: integer,
      contact_id: integer,
      event_name: string,
      can_be_edited: boolean,
      can_be_deleted: boolean,
      updated_at: timestamp
    }

### List
    url: /api/v1/notes(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    contact_id: integer      // optional, filter
    guestlist_id: integer    // optional, filter
    reservation_id: integer  // optional, filter
    task_id: integer         // optional, filter
    page: integer            // optional number of page
    per_page: integer        // optional (default 10)

  You can use only one filter on request(contact_id || guestlist_id || reservation_id || task_id)

  Response

    [{note#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/notes.json

### Get
    url: /api/v1/notes/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {note#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/notes/1.json

### Create note
    url: /api/v1/notes(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    note: {
      text: text
      contact_id: integer,
      guestlist_id: integer,   // OR
      reservation_id: integer, // OR
      task_id: integer,        // OR
    }

  Response

    {note#HASH}

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d note[text]=Text -d note[reservation_id]=259 https://app.beyondvip.com/api/v1/notes.json

### Update note
    url: /api/v1/notes/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    note: {
      text: text
      contact_id: integer,     // OR
      guestlist_id: integer,   // OR
      reservation_id: integer, // OR
      task_id: integer,        // OR
      user_id: integer
    }

  Response

    {note#HASH}

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d note[text]="New Text" https://app.beyondvip.com/api/v1/notes/2.json

### Delete note
    url: /api/v1/notes/:id(.:format)
    format: json
    method: DELETE

  Request

    auth_token: string

  Example

    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/notes/2.json
