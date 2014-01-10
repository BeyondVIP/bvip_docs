* [**Auth**](/api/tokens.md)
* [**Dictionaries**](/api/dictionaries.md)
* [**Profile**](/api/profile.md)
* [**Staff**](/api/users.md)
* [**Contacts**](/api/contacts.md)
* [**Goals**](/api/goals.md)
* [**Leaderboard**](/api/leaderboard.md)
* [**Dashboard**](/api/dashboard.md)
* [**Notifications**](/api/notifications.md)
* [**Tasks**](/api/tasks.md)
* [**Notes**](/api/notes.md)
* [**Log Methods**](/api/log_methods.md)
* [**Events**](/api/events.md)
* [**Artists**](/api/artists.md)
* [**Reservations**](/api/reservations.md)
* [**Tags**](/api/tags.md)
* [**Venues**](/api/venues.md)
* [**Guestlists**](/api/guestlists.md)
* [**Tallies**](/api/tallies.md)
* [**Static Texts**](/api/static_texts.md)
* [**Filters**](/api/filters.md)
* [**Last Changes**](/api/last_changes.md)
* [**Push Tokens**](/api/push_tokens.md)
* [**APN Tokens**](/api/apn_tokens.md)

---
# Promoter app

## Reserve table
    url: api/v1/promoters/reserve_table
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      reservation_table_id: 2
    }
    out: {
      message: "Table has been successfully reserved"
    }

## Unreserve table
    url: api/v1/promoters/unreserve_table
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      reservation_table_id: 2
    }
    out: {
      message: "Table has been successfully unreserved"
    }

# Possible responses

## User deactivated
    out: {
      status_code: 423,
      message: User has been deactivated
    }

