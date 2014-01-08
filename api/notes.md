# Api::V1::Notes

#### {note#HASH}
    {
      "id": integer,
      "text": string,
      "task_id": integer,
      "user_id": integer,
      "created_at": timestamp,
      "guestlist_id": integer,
      "reservation_id": integer,
      "contact_id": integer,
      "event_name": string,
      "can_be_edited": boolean,
      "can_be_deleted": boolean
    }

### List
    url: /api/v1/notes(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      contact_id: integer      // OR
      guestlist_id: integer    // OR
      reservation_id: integer  // OR
      task_id: integer         // OR
      page: integer       //optional number of page
      per_page: integer   //optional (default 10)
    out: [{note#HASH}, {note#HASH}, .....]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/notes.json

### Get
    url: /api/v1/notes/:id(.:format)
    format: json
    method: GET
    in:
      auth_token: string
    out: {note#HASH}

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/notes/1.json

### Create note
    url: /api/v1/notes(.:format)
    format: json
    method: POST
    in:
      auth_token: string
      note: {
        text: text
        contact_id: integer,     // OR
        guestlist_id: integer,   // OR
        reservation_id: integer, // OR
        task_id: integer,        // OR
      }
    out: {note#HASH}

    example:
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d note[text]=Text -d note[reservation_id]=259 https://beyondvip.com/api/v1/notes.json

### Update note
    url: /api/v1/notes/:id(.:format)
    format: json
    method: PUT
    in:
      auth_token: string
      note: {
        text: text
        contact_id: integer,     // OR
        guestlist_id: integer,   // OR
        reservation_id: integer, // OR
        task_id: integer,        // OR
        user_id: integer
      }
    out: {note#HASH}

    example:
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d note[text]="New Text" https://beyondvip.com/api/v1/notes/2.json

### Delete note
    url: /api/v1/notes/:id(.:format)
    format: json
    method: DELETE
    in:
      auth_token: "o1ey7RZg13xzyPHPJnAH"

    example:
    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/notes/2.json
