# Api::V1::Goals

#### {method#STRING}
    'monthly', 'weekly'

#### {goal_type#STRING}
    "sales", "new_contacts", "logged_tasks", "guestlist", "partner_outreach", "social_media", "email_blasts", "event_sales"

#### {event_goal#HASH}
    {
      event_id: integer,
      goal#HASH#event_sales
    }

#### {goal#HASH}
    {
      method: {method#STRING},
      goal_type: {goal_type#STRING},
      current_amount: float,
      goal_amount: float,
      percents_towards_goal: float,
      event_sales: [{event_goal#HASH}, ...] // only monthly sales goals have this
    }

### All goals (monthly)
    url: /api/v1/goals/all(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    year: integer
    month: integer
    method: {method#STRING}

  Response

    [
      {goal#HASH#sales},
      {goal#HASH#new_contacts},
      {goal#HASH#logged_tasks},
      {goal#HASH#guestlist},
      {goal#HASH#partner_outreach},
      {goal#HASH#social_media},
      {goal#HASH#email_blasts}
    ]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 -d method=monthly https://app.beyondvip.com/api/v1/goals/all.json

### Sales goals
    url: /api/v1/goals/sales(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    year: integer
    month: integer
    method: "monthly"

  Response

    {goal#HASH#sales}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 -d method=monthly https://app.beyondvip.com/api/v1/goals/sales.json

### Task goals
    url: /api/v1/goals/tasks(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    year: integer
    month: integer
    day: integer // not needed for "monthly"
    goal_type: string // "new_contacts", "logged_tasks", "guestlist", "partner_outreach", "social_media", "email_blasts"
    method: string

  Response

    {goal#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 -d goal_type=new_contacts -d method=monthly https://app.beyondvip.com/api/v1/goals/tasks.json

### Get goals by goal type
    url: /api/v1/goals/get(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    year: integer
    month: integer
    day: integer // not needed for "monthly"
    goal_type: string // "sales", "new_contacts", "logged_tasks", "guestlist", "partner_outreach", "social_media", "email_blasts"
    method: string

  Response

    {goal#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d year=2013 -d month=12 -d goal_type=sales -d method=monthly https://app.beyondvip.com/api/v1/goals/get.json

### Get goals by event
    url: /api/v1/goals/events(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    event_id: integer

  Response

    { goal_amount: float }

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d event_id=19 https://app.beyondvip.com/api/v1/goals/events.json
