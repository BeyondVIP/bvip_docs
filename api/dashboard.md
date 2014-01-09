# Api::V1::Dashboard

#### [{goal#HASH}](/api/goals.md#goalhash)

#### [{leaderboard_user#HASH}](/api/leaderboard.md#leaderboard_userhash)

### Get goals and leaderboards
    url: "/api/v1/dashboard/get(.:format)"
    format: json
    method: GET
    in:
      auth_token: string
      year: integer
      month: integer
    out: {
      goals: [
        {goal#HASH#sales},
        {goal#HASH#new_contacts},
        {goal#HASH#logged_tasks},
        {goal#HASH#guestlist}
      ],
      sales_leaderboard: [{leaderboard_user#HASH}, ...],
      contacts_leaderboard: [{leaderboard_user#HASH}, ...],
      tasks_leaderboard: [{leaderboard_user#HASH}, ...],
      guestlists_leaderboard: [{leaderboard_user#HASH}, ...]
    }
