# Api::V1::Leaderboard

#### {leaderboard_user#HASH}
    {
      id: integer,
      name: string,
      current_amount: float
    }

### Sales leaderboard
    url: "/api/v1/leaderboard/sales(.:format)"
    format: json
    method: GET
    in:
      auth_token: string
      year: integer
      month: integer
    out: [{leaderboard_user#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 https://beyondvip.com/api/v1/leaderboard/sales.json

### Contacts leaderboard
    url: "/api/v1/leaderboard/contacts(.:format)"
    format: json
    method: GET
    in:
      auth_token: string
      year: integer
      month: integer
    out: [{leaderboard_user#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 https://beyondvip.com/api/v1/leaderboard/contacts.json

### Tasks leaderboard
    url: "/api/v1/leaderboard/tasks(.:format)"
    format: json
    method: GET
    in:
      auth_token: string
      year: integer
      month: integer
    out: [{leaderboard_user#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 https://beyondvip.com/api/v1/leaderboard/tasks.json

### Guestlists leaderboard
    url: "/api/v1/leaderboard/guestlists(.:format)"
    format: json
    method: GET
    in:
      auth_token: string
      year: integer
      month: integer
    out: [{leaderboard_user#HASH}, ...]

    example:
    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 https://beyondvip.com/api/v1/leaderboard/guestlists.json
