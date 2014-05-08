# Api::V1::ThermalReceipts
Thermal Receipt represents what fields of reservations should be printed. They
 are set for each [venue](/api/venues.md). Ordering and names are stored in
 [dictionaries](/api/dictionaries.md) (key: **thermal_receipt_fields**).

**fields** show which fields are active and will be printed

#### {thermal_receipt_field#HASH}
    {
      order: integer,
      key: string,
      name: string
    }

#### {thermal_receipt#HASH}
    {
      id: integer,
      venue_id: integer,
      fields: array of string keys,
      additional_texts: array of texts
    }

### List
    url: /api/v1/thermal_receipts(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    [{thermal_receipt#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/thermal_receipts.json

### Get
    url: /api/v1/thermal_receipts/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {thermal_receipt#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/thermal_receipts/1.json

### Get by venue
    url: /api/v1/venues/:venue_id/thermal_receipt(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {thermal_receipt#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/venues/1/thermal_receipt.json

### Create
    url: /api/v1/thermal_receipts(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    thermal_receipt: {
      venue_id: integer,
      fields: array of string keys,
      additional_texts: array of texts
    }

  Response

    {thermal_receipt#HASH}

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d thermal_receipt[venue_id]=1 -d thermal_receipt[fields][]=venue_name https://app.beyondvip.com/api/v1/thermal_receipts.json

### Update
    url: /api/v1/thermal_receipts/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    thermal_receipt: {
      venue_id: integer,
      fields: array of string keys,
      additional_texts: array of texts
    }

  Response

    {thermal_receipt#HASH}

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d thermal_receipt[fields][]=venue_logo https://app.beyondvip.com/api/v1/thermal_receipts/1.json
