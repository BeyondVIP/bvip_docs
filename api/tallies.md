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
    in:
      auth_token: string
      event_id: integer
    out: [{tally#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d event_id=19 https://beyondvip.com/api/v1/tallies.json

### Update
    url: /api/v1/tallies/:id(.:format)
    format: json
    method: PUT
    in:
      auth_token: string
      tally: {
        actual_count_males: integer,
        actual_count_females: integer
    }
    out: {tally#HASH}

    example:
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d tally[actual_count_males]=1 https://beyondvip.com/api/v1/tallies/1.json
