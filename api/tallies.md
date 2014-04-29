# Api::V1::Tallies

#### {tally#HASH}
    {
      id: integer,
      event_id: integer,
      user_id: integer,
      actual_count_males: integer,
      actual_count_females: integer,
      type_for_males_id: integer,
      type_for_females_id: integer
    }

### List
    url: /api/v1/tallies(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    event_id: integer

  Response

    [{tally#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d event_id=19 https://app.beyondvip.com/api/v1/tallies.json

### Update
    url: /api/v1/tallies/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    tally: {
      actual_count_males: integer,
      actual_count_females: integer
    }

  Response

    {tally#HASH}

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d tally[actual_count_males]=1 https://app.beyondvip.com/api/v1/tallies/1.json
