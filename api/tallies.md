# Api::V1::Tallies

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
    url: /api/v1/tallies(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    event_id: integer

  Response

    [{tally#HASH}, ...]

### Change
#### increase or decrease tallies count

    url: /api/v1/tallies/change(.:format)
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

    url: /api/v1/tallies(.:format)
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

    url: /api/v1/tallies/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    tally: {
      actual_count: integer //only 0 or positive values
    }

  Response

    {tally#HASH}
