# Api::V1::Dictionaries

#### {dictionary#HASH}
    {
      created_at: timestamp,
      id: integer,
      key: string,
      updated_at: timestamp,
      value: array of values
    }

### List
    url: "/api/v1/dictionaries(.:format)"
    format: json
    method: GET
    out: [{dictionary#HASH}, ...]

    example:
    $ curl -X GET https://beyondvip.com/api/v1/dictionaries.json

### Get
    url: "/api/v1/dictionaries/:key(.:format)"
    format: json
    method: GET
    out: {dictionary#HASH}

    example:
    $ curl -X GET https://beyondvip.com/api/v1/dictionaries/ethnicities.json
