# Api::V1::Dictionaries

#### {dictionary#HASH}
    {
      id: integer,
      key: string,
      value: array of values
    }

### List
    url: /api/v1/dictionaries(.:format)
    format: json
    method: GET

  Response

    [{dictionary#HASH}, ...]

  Example

    $ curl -X GET https://beyondvip.com/api/v1/dictionaries.json

### Get
    url: /api/v1/dictionaries/:key(.:format)
    format: json
    method: GET

  Response

    {dictionary#HASH}

  Example:

    $ curl -X GET https://beyondvip.com/api/v1/dictionaries/ethnicities.json
