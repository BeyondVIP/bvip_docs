# Api::V1::Filters

#### {filter#HASH}
    {
      is_included: string,
      key: string,
      value: array of strings
    }

#### {filter_pattern#HASH}
    {
      id: integer,
      name: string,
      filters: array,
      serialized_filters: [{filter#HASH}, ...]
    }

### List of filter patterns
    url: /api/v1/filters(.:format)
    format: json
    method: GET
    in:
      auth_token: string
    out: [{filter_pattern#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/filters.json

### Create filter pattern
    url: /api/v1/filters(.:format)
    format: json
    method: POST
    in:
      auth_token: string,
      filter_pattern: {
        name: string
        filters: [{filter#HASH}, ...]
      }
    out: {filter_pattern#HASH}

    example:
    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d filter_pattern[name]=Name -d filter_pattern[filters][][is_included]=is -d filter_pattern[filters][][key]=provider -d filter_pattern[filters][][value][]=Google https://beyondvip.com/api/v1/filters.json

### Update filter pattern
    url: /api/v1/filters/:id(.:format)
    format: json
    method: PUT
    in:
      auth_token: string,
      filter_pattern: {filter_pattern#HASH}
    out: {filter_pattern#HASH}

    example:
    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d filter_pattern[name]="New Name" https://beyondvip.com/api/v1/filters/2.json

### Delete filter pattern
    url: /api/v1/filters/:id(.:format)
    format: json
    method: DELETE
    in:
      auth_token: string
    out: {
      message: "The filter pattern was successfully deleted"
    }

    example:
    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/filters/2.json
