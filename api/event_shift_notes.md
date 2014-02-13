# Api::V1::EventShiftNotes

Event Shift Note entity represents short description or comment for [event](/api/events.md)

#### {event_shift_note#HASH}
    {
      id: integer,
      user_id: integer,
      event_id: integer,
      description: text,
      created_at: timestamp
    }

### List
    url: /api/v1/event_shift_notes(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    event_id: integer

  Response

    [{event_shift_note#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d event_id=123 https://beyondvip.com/api/v1/event_shift_notes.json

### Get
    url: /api/v1/event_shift_notes/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {event_shift_note#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/event_shift_notes/1.json

### Create event shift note
    url: /api/v1/event_shift_notes(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    event_shift_note: {
      event_id: integer,
      description: text
    }

  Response

    {event_shift_note#HASH}

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d event_shift_note[description]=Text -d event_shift_note[event_id]=123 https://beyondvip.com/api/v1/event_shift_notes.json

### Update event shift note
    url: /api/v1/event_shift_notes/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    event_shift_note: {
      description: text
    }

  Response

    {event_shift_note#HASH}

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d event_shift_note[description]=Text https://beyondvip.com/api/v1/event_shift_notes/2.json

### Delete note
    url: /api/v1/event_shift_notes/:id(.:format)
    format: json
    method: DELETE

  Request

    auth_token: string

  Example

    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/event_shift_notes/2.json
