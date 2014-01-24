# Api::V1::Tasks

#### [{note#HASH}](/api/notes.md#notehash)

#### {state#STRING}
    'incomplete', 'complete'

#### [{reservation_stage#STRING}](/api/reservations.md#stagestring)

#### [{log_method#HASH}](/api/log_methods.md#log_methodhash)

#### [{log_method_kind#STRING}](/api/log_methods.md#log_method_kindstring)

#### {task#HASH}
    {
      id: integer,
      date: timestamp,
      contact_id: integer,
      category: string, // dictionary key 'task_categories'
      notes: [{note#HASH}, ...],
      state: {state#STRING},
      completed_at: timestamp,
      user_id: integer,
      owner_id: integer,
      kind: string, // dictionary key 'task_kinds'
      venue_id: integer,
      reservation_id: integer,
      reservation_stage: {reservation_stage#STRING},
      log_methods: [{log_method#HASH}, ...],
      created_at: timestamp,
      event_id: integer,
      complete_method: {log_method_kind#STRING},
      result: text,
      contact_name: string
    }

### List
    url: /api/v1/tasks(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    contact_id: integer //optional (all tasks returned if not set)
    page: integer       //optional number of page
    per_page: integer   //optional (default 10)
    kind: string // dictionary key 'task_kinds'

  Response

    [{task#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/tasks.json

### Get
    url: /api/v1/tasks/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {task#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/tasks/1.json

### Create
    url: /api/v1/tasks(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    contact_ids: array of integers
    task: {
      category: string
      date: string // format: 'YYYY-MM-DD'
    }

  Response

    [{task#HASH}, ...]

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_ids[]=352 -d task[category]="Follow Up" -d task[date]="2014-01-31" https://beyondvip.com/api/v1/tasks.json

### Update
    url: /api/v1/tasks/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    task: {
      category: string
      date: string // format: 'YYYY-MM-DD'
    }

  Response

    {task#HASH}

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d task[date]="2014-01-25" https://beyondvip.com/api/v1/tasks/2.json

### Delete
    url: /api/v1/tasks/:id(.:format)
    format: json
    method: DELETE

  Request

    auth_token: string

  Response

    { message: "The task was successfully deleted" }

  Example

    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/tasks/2.json
