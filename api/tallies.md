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

### Create
    url: /api/v1/tallies(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    tally: {
      event_id: integer,
      user_id: integer,
      type_for_males_id: integer,
      type_for_females_id: integer,
      actual_count_males: integer,
      actual_count_females: integer
    }

  Response

    {tally#HASH}

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d tally[event_id]=1 -d tally[user_id]=1 -d tally[type_for_males_id]=1 -d tally[type_for_females_id]=1 -d tally[actual_count_males]=1 -d tally[actual_count_females]=1 https://app.beyondvip.com/api/v1/tallies.json

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


# Api::V2::Tallies

#### {tally#HASH}
    {
      id: integer,
      type: string, //MaleTally or FemaleTally only
      event_id: integer,
      user_id: integer,
      actual_count: integer,
      guestlist_type_id: integer
    }

### List
    url: /api/v2/tallies(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    event_id: integer

  Response

    [{tally#HASH}, ...]

### Change
#### increase or decrease tallies count

    url: /api/v2/tallies/change(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    tally: {
      event_id: integer,
      user_id: integer,
      type: string, //MaleTally or FemaleTally only
      guestlist_type_id: integer
    }
    actual_count_difference: integer //positive, negative or 0 values

  Response

    {tally#HASH}

### Create

    url: /api/v2/tallies(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    tally: {
      event_id: integer,
      user_id: integer,
      type: string, //MaleTally or FemaleTally only
      guestlist_type_id: integer,
      actual_count: integer //only 0 or positive values
    }

  Response

    {tally#HASH}

### Update

    url: /api/v2/tallies/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    tally: {
      actual_count: integer //only 0 or positive values
    }

  Response

    {tally#HASH}
