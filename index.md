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

---
# Last Changes

## {class_name#STRING}
    "Contact", "Tag", "TagCategory", "Task", "LogMethod", "Notification", "Note", "Reservation", "StaticText", "UserVenue", "ContactQualification"

## {contact_last_changes#HASH}
    {
      id: 1
      first_name: "Chuck"
      last_name: "Norris"
      name: "Chuck Norris" // only for web
      nurtured: "0", //boolean
      title: "Title", //string
      avatar: {
        "url": string,
        "thumb_100": { "url": string }
        "thumb_200": { "url": string }
      }
      state: "customer", //customer, partner, both
      industry: "IT",
      sexual_preference: "straight",
      ethnicity: "customer",
      gender: "male",
      organization: "Provectus It",
      birthdate: <datetime>,
      status: string,
      tags: [11,22],
      email: "www@mail.ru",
      phone: "12312123123233",
      address: "home",
      country: "3241412",
      region: "Kazan",
      city: "Kazan",
      zip: "3241412",
      website: "asdasdasda.com",
      facebook: "name.surname",
      twitter: "name.surname",
      instagram: "name.surname",
      skype: "name.surname",
      last_update: <datetime>,
      last_visit: <datetime>,
      created_at: <datetime>,
      total_spent: 100000,
      average_spent: 25000,
      highest_spent: 50000,
      total_comp: 100,
      reservations_count: 1,
      campaigns_count: 1,
      guestlists_count: 1,
      no_shows: 1,
      last_reservation: "2012-12-19T15:14:49Z",
      visited_venue_ids : [1, 2, 3]
    }

## {user_venue_last_changes#HASH}
  {
    "venue_id": integer,
    "id": integer,
    "home": boolean,
    "venue_name": string
  }

## {contact_qualification_last_changes#HASH}
  {
    "contact_id": integer,
    "venue_id": integer,
    "status": string
  }


## {log_element#HASH}
    {
      action: "create", // or "update", or "destroy"
      id: <integer>,
      class_name: {class_name#STRING},

      // if action != 'destroy'

      data: {contact_last_changes#HASH} | {tag#HASH} | {tag_category#HASH} | {task#HASH} | {log_method#HASH} | {notification#HASH} | {note#HASH} | {reservation#HASH} |
      {user_venue_last_changes#HASH} | {contact_qualification_last_changes#HASH}
    }

## Take changes since '2013-02-12 8:20:00'
    url: /last_changes
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      start_date: "2013-02-12T08:20:00GMT+04:00", // optional
      options: {
          "Contact": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          },
          "Tag": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          },
          "TagCategory": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          },
          "Task": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          },
          "LogMethod": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          },
          "Notification": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          },
          "Note": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          },
          "Reservation": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          },
          "UserVenue": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          },
          "ContactQualification": {
            "start_date": "2013-03-12T15:23:14GMT+04:00",
          }
      }
    }
    out: {
      status: 0 | 1
      timestamp: "2013-03-19T12:23:23GMT+04:00",
      activity_log: [{log_element#HASH}, {log_element#HASH}, ...],
      message: string // if status is 1
    }

## Last Changes Acknowledgment
    url: /last_changes/acknowledgment
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      timestamp: "2013-02-12T08:20:00GMT+04:00"
    }
    out: {
      message: "Success"
    }


---
# Push Tokens

## {push_token#HASH}
    {
      token: string
      device_id: string
    }

## Create push token
    url: api/v1/push_tokens
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      push_token: {push_token#HASH}
    }
    out: {push_token#HASH}

---
# APN Tokens

## Create APN token
    url: api/v1/apn_tokens
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      apn_token: "8723892u894728934297347"
    }
    out: {
      token: "8723892u894728934297347"
    }

## Ping APN token (for testing)
    url: api/v1/apn_tokens/ping
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      apn_token: "8723892u894728934297347"
    }
    out: {
      message: "Success"
    }

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

