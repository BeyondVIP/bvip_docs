# Api::V1::LogMethods

#### {kind#STRING}
    call, text, email, social, meet

#### {log_method#HASH}
    {
      id: integer,
      contact_id: integer,
      created_at: timestamp,
      updated_at: timestamp,
      date: timestamp,
      kind: {kind#STRING},
      location: string,
      location_lat: float,
      location_lng: float,
      note: string,
      result: string,
      task_id: integer,
      user_id: integer
    }

### List
    url: /api/v1/logs(.:format)
    format: json
    method: GET
    in:
      auth_token: string
      contact_ids: array of integers or integer // optional
      kinds: array of {kind#STRING}s or {kind#STRING}
      page: integer
      per_page: integer
    out: [{log_method#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/logs.json

### Create
    url: /api/v1/logs(.:format)
    format: json
    method: POST
    in:
      auth_token: string
      contact_id: integer
      task_id: integer
      log: {
        kind: {kind#STRING},
        result: string,
        note: string,
        location: string,
        location_lat: float,
        location_lng: float,
        date: timestamp // format: 'YYYY-MM-DDTHH:MM:SS-0000'
      }
    out: {log_method#HASH}

    example:
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact_id=352 -d task_id=1 -d log[kind]=call -d log[date]="2014-01-01T20:00:00-0800" https://beyondvip.com/api/v1/logs.json

### Update
    url: /api/v1/logs/:id(.:format)
    format: json
    method: PUT
    in:
      auth_token: string
      log: {
        kind: {kind#STRING},
        result: string,
        note: string,
        location: string,
        location_lat: float,
        location_lng: float,
        date: timestamp // format: 'YYYY-MM-DDTHH:MM:SS-0000'
      }
    out: {log_method#HASH}

    example:
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d log[date]="2014-01-02T20:00:00-0800" https://beyondvip.com/api/v1/logs/1.json
