# Api::V1::Leaderboard

#### {leaderboard_user#HASH}
    {
      id: integer,
      name: string, // user name
      current_amount: float // amount dependent on request type
    }

### Sales leaderboard
    url: /api/v1/leaderboard/sales(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    year: integer
    month: integer

  Response

    [{leaderboard_user#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 https://beyondvip.com/api/v1/leaderboard/sales.json

### Contacts leaderboard
    url: /api/v1/leaderboard/contacts(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    year: integer
    month: integer

  Response

    [{leaderboard_user#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 https://beyondvip.com/api/v1/leaderboard/contacts.json

### Tasks leaderboard
    url: /api/v1/leaderboard/tasks(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    year: integer
    month: integer

  Response

    [{leaderboard_user#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 https://beyondvip.com/api/v1/leaderboard/tasks.json

### Guestlists leaderboard
    url: /api/v1/leaderboard/guestlists(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    year: integer
    month: integer

  Response

    [{leaderboard_user#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 https://beyondvip.com/api/v1/leaderboard/guestlists.json
