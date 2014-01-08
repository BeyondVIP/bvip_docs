# AUTH

## Sign in

    url: "/api/v1/tokens(.:format)"
    format: json
    method: POST
    in: {
      email: "email@test.ru",
      password: "123123",
      device_token: "324628746283682634",
      mobile_os: "android"/"ios"
    }

    out: {
      token: "<auth_token>",
      promoter: false
    }

    example: "/api/v1/tokens.json"

## Destroy token

    url: "/api/v1/tokens/:user_id(.:format)"
    format: json
    method: DELETE
    in: {
      auth_token: "<auth_token>",
      apn_token: "<apn_token>",
    }

    out: {
      message: "User signed out."
    }

    example: "/api/v1/tokens/22.json"

## Send reset password instructions
    url: "/api/v1/tokens/reset"
    format: json
    method: POST
    in: {
      email: "<email>"
    }

## Send phone verification
    url: "/api/v1/settings/send_phone_verification(.:format)"
    format: json
    method: POST
    in: {
      phone: "<phone>"
    }

## Verify phone
    url: "/api/v1/settings/verify_phone(.:format)"
    format: json
    method: POST
    in: {
      token: "<token>"
    }
---

# Dictionaries

## Index
    url: "/api/v1/dictionaries(.:format)"
    format: json
    method: POST
    out: [{
      key: "contact_state",
      value: ["customer","partner"]
    },{...},...]

## Show
    url: "/api/v1/dictionaries/:key(.:format)"
    format: json
    method: POST
    out: {
      key: "contact_state",
      value: ["customer","partner"]
    }

---

# PROFILE

## SHOW
    url: /api/v1/profile
    format: json
    method: GET
    in: no params
    out: {
      "id": 1,
      "email": "elitvinkov@gmail.com",
      "first_name": "123123",
      "last_name": "asdasd",
      "title": "asdasd"
      "gender": "male", // male/female,
      "birthdate": "1213123123",
      "personalized_url": "elitvinkov",
      "user_image": {
        "photo": {
          "url": "/uploads/user_image/photo/19/apple.png",
          "thumb_100": {
            "url": "/uploads/user_image/photo/19/thumb_100_apple.png"
          },
          "thumb_200": {
            "url": "/uploads/user_image/photo/19/thumb_200_apple.png"
          }
        }
      },
      all_venues: [
        {
          "id": 1,
          "name": "SBE",
          "home": true,
          "selected": false
        }
      ],
      permissions_struct: {
        "Departments and Levels": {"manage":[{}],"read":[{}]},
        "Task": {"manage":[{}],"read":[{}]},
        "Goal":{"manage":[{}],"read":[{}]},
        "Template":{"manage":[{}],"read":[{}]},
        "Artist":{"manage":[{}],"read":[{}]},
        "Reports":{"read":[{}]},
        "ContactQualification":{"update":[{}],"read":[{}]},
        "Company":{"manage":[{}],"read":[{}]},
        "Guestlist":{"manage":[{}],"read":[{}]},
        "Event":{"manage":[{}],"read":[{}],"manage_tickets":[{}],"read_tickets":[{}]},
        "User":{"manage":[{}],"read":[{}]},
        "Contact":{"create":[{}],"transfer":[{}],"merge":[{}],"manage":[{}],"read":[{}]},
        "Reservation":{"read":[{}],"manage":[{}],"seat":[{}],"transfer":[{"home_venue":true}]},
        "PermissionLevel":{"manage":[{}],"read":[{}]}
      },
      department_name: string
    }

## Update
    url: /api/v1/profile
    format: json
    method: PUT
    in: { "avatar": <file> }
    out: {
      "id": 1,
      "email": "elitvinkov@gmail.com",
      "first_name": "123123",
      "last_name": "asdasd",
      "title": "asdasd"
      "gender": "male", // male/female,
      "birthdate": "1213123123",
      "user_image": {
        "photo": {
          "url": "/uploads/user_image/photo/19/apple.png",
          "thumb_100": {
            "url": "/uploads/user_image/photo/19/thumb_100_apple.png"
          },
          "thumb_200": {
            "url": "/uploads/user_image/photo/19/thumb_200_apple.png"
          }
        }
      }
    }

## Get sign up flag
    url: /api/v1/profile/signup_flag
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: {
      status: boolean;
    }

## Set sign up flag
    url: /api/v1/profile/signup_flag
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: {
      message: "Success";
    }


---

[**Staff**](/api/users.md)

---

# CONTACTS

## {contact#HASH}
    {
      first_name  : "Chuck",
      last_name   : "Norris"
      nurtured    : "0",            //boolean
      title       : "Title",        //string
      avatar      : {                                       // Output. Input multipart file
                      "url": string,
                      "thumb_100": { "url": string }
                      "thumb_200": { "url": string }
                    },
      state       : "customer",     //customer, partner, both
      industry    : "customer",     //string (Dictionary key industries)
      sexual_preference: ""         //string (Dictionary key sexual_preferences)
      ethnicity   : "customer",     //string (Dictionary key ethnicities)
      gender      : "male",         //string
      organization: "Provectus It", //string
      birthdate   : <datetime>      //datetime
      status      : string          // no_level, silver, gold, platinum, black

      // tags only output
      tags        : [11,22],

      // only inputs
      tag_ids     : [1,2,3,4]

      email     : "www@mail.ru"     //string
      phone     : "12312123123233"  //string
      address : "home",         //string
      country : "3241412",      //string
      region  : "Kazan",        //(Dictionary key locations)
      city    : "Kazan",        //(Dictionary key locations)
      zip     : "3241412",      //string
      website   : "asdasdasda.com"  //string
      facebook  : "name.surname"  //string
      twitter   : "name.surname"  //string
      instagram : "name.surname"  //string
      skype     : "name.surname"  //string

      last_update : <datetime>,
      last_visit : <datetime>,
      created_at : <datetime>,

      total_spent: 100000,
      average_spent: 25000,
      highest_spent: 50000,
      total_comp: 100,
      reservations_count: 1,
      campaigns_count: 1,
      guestlists_count: 1,
      no_shows: 1,
      last_reservation: "2012-12-19T15:14:49Z",

      visited_venue_ids : [1, 2, 3],
      contact_qualifications: [
        {
          id: integer,
          venue_id: integer,
          status: string  // "unqualified", "qualified", "disqualified"
        },
        ...
      ]
      notes: [
        {
          text: string
        }
      ]
    }

## Index
    url: "/api/v1/contacts(.:format)"
    format: json
    method: GET
    in: {
      ids: [<integer>,<integer>,<integer>,...]
    }
    out: [{contact#HASH}, {contact#HASH}, .....]

## Show
    url: "/api/v1/contacts/:id(.:format)"
    format: json
    method: GET
    in: no params
    out: {contact#HASH}

## Update
    url: "/api/v1/contacts/:id(.:format)"
    format: json
    method: PUT
    in: {
      contact: {contact#HASH},  // contact_qualifications are set out of contact hash
      contact_qualifications: [
        {
          venue_id: integer,
          status: string  // "unqualified", "qualified", "disqualified"
        },
        ...
      ]
    }

## Create
    url: "/api/v1/contacts(.:format)"
    format: json
    method: POST
    in: {
      contact: {contact#HASH},  // contact_qualifications are set out of contact hash
      contact_qualifications: [
        {
          venue_id: integer,
          status: string  // "unqualified", "qualified", "disqualified"
        },
        ...
      ]
    }
    out:
      {contact#HASH}
      // or if contact's email or phone are found in system:
      {
        message: "The (insert email or phone number here) you entered is already associated with (insert contact name here) owned by (owner or owners here)."
        contact: {contact#HASH}
      }

    example:
    $ curl -d auth_token=axoHMCz97rN7TGgDwyxT -d contact[email]=contact@example.com -d contact[first_name]="John" http://localhost:3000/api/v1/contacts.json


## Import
    url: "/api/v1/contacts/import(.:format)"
    format: json
    method: POST
    in: {"contacts" => <file.vcf>} //File vCard
    out: no params

## Get expenditures
    url: "/api/v1/contacts/:id/expenditures(.:format)"
    format: json
    method: GET
    in: {
      venue_id: 1 //optional
    }
    out: {
      "total_spent": 100000,
      "average_spent": 25000,
      "highest_spent": 50000,
      "total_comp": 100,
      "reservations": 1,
      "campaigns": 1,
      "guestlists": 1,
      "no_shows": 1,
      "cancellations": 1,
      "last_reservation": "2012-12-19T15:14:49Z"
    }

## Set qualification status by venue
    url: "/api/v1/contacts/:id/set_qualification(.:format)"
    format: json
    method: POST
    in: {
      venue_id: integer,
      status: string  // "unqualified", "qualified", "disqualified"
    }
    out: {
      contact_id: integer,
      venue_id: integer,
      status: string
    }

## Delete contact
    url: "/api/v1/contacts/:id(.:format)"
    format: json
    method: DELETE
    in: {
      auth_token: "axoHMCz97rN7TGgDwyxT"
    }
    out: {
      message: "Success" // if contact's successfully deleted
      message: "This contact can not be deleted" // otherwise
    }

## Search contact
    url: "/api/v1/contacts/search(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "axoHMCz97rN7TGgDwyxT",
      email: string, // optional if phone is set
      phone: string // optional if email is set
    }
    out: [
      {contact#HASH}, ...
    ]

---

# GOALS

## {goal#HASH}
    {
      method: string, // "monthly", "weekly"
      goal_type: string, // "sales", "new_contacts", "logged_tasks", "guestlist", "partner_outreach", "social_media", "email_blasts"
      current_amount: float,
      goal_amount: float,
      percents_towards_goal: float,
      event_sales: [{event_goal#HASH}, {event_goal#HASH}, ...] // only monthly sales goals have this
    }

## {event_goal#HASH}
    {
      event_id: integer,
      goal#HASH
    }

## All goals (monthly)
    url: "/api/v1/goals/all(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "axoHMCz97rN7TGgDwyxT",
      year: 2012,
      month: 12,
      method: "monthly"
    }
    out: [
      {goal#HASH#sales},
      {goal#HASH#new_contacts},
      {goal#HASH#logged_tasks},
      {goal#HASH#guestlist},
      {goal#HASH#partner_outreach},
      {goal#HASH#social_media},
      {goal#HASH#email_blasts}
    ]

## Sales goals
    url: "/api/v1/goals/sales(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      year: 2012,
      month: 12,
      method: "monthly"
    }
    out: {goal#HASH#sales}

## Task goals
    url: "/api/v1/goals/tasks(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      year: 2012,
      month: 12,
      day: 13, // not needed for "monthly"
      goal_type: string, // "new_contacts", "logged_tasks", "guestlist", "partner_outreach", "social_media", "email_blasts"
      method: string
    }
    out: {goal#HASH}

## Get goals by goal type
    url: "/api/v1/goals/get(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      year: 2012,
      month: 12,
      day: 13, // not needed for "monthly"
      goal_type: string, // "sales", "new_contacts", "logged_tasks", "guestlist", "partner_outreach", "social_media", "email_blasts"
      method: string
    }
    out: sales goals out or task goals out

## Get goals by event
    url: "/api/v1/goals/events(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      event_id: integer
    }
    out: {
      "goal_amount": float
    }

---

# LEADERBOARD

## Sales leaderboard
    url: "/api/v1/leaderboard/sales(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      year: 2012,
      month: 12
    }
    out: [
      {
        id: 2,
        name: "John Smith",
        current_amount: 20
      },
      {
        id: 1,
        name: "John Doe",
        current_amount: 10
      },
      ...
    ]

## Contacts leaderboard
    url: "/api/v1/leaderboard/contacts(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      year: 2012,
      month: 12
    }
    out: [
      {
        id: 2,
        name: "John Smith",
        current_amount: 20
      },
      {
        id: 1,
        name: "John Doe",
        current_amount: 10
      },
      ...
    ]

## Tasks leaderboard
    url: "/api/v1/leaderboard/tasks(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      year: 2012,
      month: 12
    }
    out: [
      {
        id: 2,
        name: "John Smith",
        current_amount: 20
      },
      {
        id: 1,
        name: "John Doe",
        current_amount: 10
      },
      ...
    ]

## Guestlists leaderboard
    url: "/api/v1/leaderboard/guestlists(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      year: 2012,
      month: 12
    }
    out: [
      {
        id: 2,
        name: "John Smith",
        current_amount: 20
      },
      {
        id: 1,
        name: "John Doe",
        current_amount: 10
      },
      ...
    ]

---

# DASHBOARD

## Get goals and leaderboards
    url: "/api/v1/dashboard/get(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      year: 2012,
      month: 12
    }
    out: {
      goals: [
        {goal#HASH#sales},
        {goal#HASH#new_contacts},
        {goal#HASH#logged_tasks},
        {goal#HASH#guestlist}
      ],
      sales_leaderboard: [
        {
          id: 2,
          name: "John Smith",
          current_amount: 20
        },
        {
          id: 1,
          name: "John Doe",
          current_amount: 10
        },
        ...
      ],
      contacts_leaderboard: [
        {
          id: 2,
          name: "John Smith",
          current_amount: 20
        },
        {
          id: 1,
          name: "John Doe",
          current_amount: 10
        },
        ...
      ],
      tasks_leaderboard: [
        {
          id: 2,
          name: "John Smith",
          current_amount: 20
        },
        {
          id: 1,
          name: "John Doe",
          current_amount: 10
        },
        ...
      ],
      guestlists_leaderboard: [
        {
          id: 2,
          name: "John Smith",
          current_amount: 20
        },
        {
          id: 1,
          name: "John Doe",
          current_amount: 10
        },
        ...
      ]
    }

---

# NOTIFICATIONS

## Get all notifications
    url: "/api/v1/notifications/all(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: [
      {
        id: 1,
        sender_id: 1,
        sender_type: "User",
        read: false,
        title: "New message",
        message: "Message text",
        created_at: <datetime>,
        user_id: 1
      },
      ...
    ]

## Get current user's all notifications
    url: "/api/v1/notifications/list(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: [
      {
        id: 4,
        sender_id: 1,
        sender_type: "User",
        read: true,
        title:"New message",
        message: "Message text",
        created_at: <datetime>,
      },
      ...
    ]

## Get current user's unread notifications
    url: "/api/v1/notifications/unread(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: [
      {
        id: 4,
        sender_id: 1,
        sender_type: "User",
        read: false,
        title:"New message",
        message: "Message text",
        created_at: <datetime>,
      },
      ...
    ]

## Get current user's unread notifications count
    url: "/api/v1/notifications/unread_count(.:format)"
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: {
      count: 2
    }

## Mark notifications as "read"
    url: "/api/v1/notifications(.:format)"
    format: json
    method: PUT
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      ids: [1,2,3] //optional
    }

---
# Tasks

## {task#HASH}
    {
      id: <integer>,
      category: <string>, // (Dictionary key task_categories)
      date: <datetime>,
      state: <string>,
      contact_id: <integer>,
      contact_name: <string>,
      owner_id: <integer>,
      completed_at: <datetime>
      kind: <string>, // (Dictionary key task_kinds)
      event_id: <integer>,
      result: <text>,
      log_methods: [{log_method#HASH}, {log_method#HASH}, ...]
      notes: []
    }

## Create task
    url: /api/v1/tasks(.:format)
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      contact_ids: [<integer>,<integer>,...]
      task: {
        category: <string>    //(Dictionary key task_categories)
        date: <datetime>
      }
    }
    out: {task#HASH}

## Update task
    url: /api/v1/tasks/:id(.:format)
    format: json
    method: PUT
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      task: {
        category: <string>  // (Dictionary key task_categories)
        date: <date> //"2012-12-07"
      }
    }
    out: {task#HASH}

## List of tasks
    url: /api/v1/tasks(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      contact_id: <integer> //optional (all tasks returned if not set)
      page: <integer>       //optional number of page
      per_page: <integer>   //optional (default 10)
      kind: <string> // (Dictionary key task_kinds)
    }
    out: [{task#HASH}, {task#HASH}, .....]

## Get task
    url: /api/v1/tasks/:id(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: {task#HASH}

## Get task possible results
    url: /api/v1/tasks/:id/results(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: [
      "Different Venue", "Price", "No Availability", "Win", "Qualified",
      "Unqualified", "Disqualified", "Waitlist", "Interested",
      "Want Reservation (Qualified)", "Want Reservation (Not Qualified)",
      "No Response", "No Response (Loss)", "Not Interested"
    ]

## Delete task
    url: /api/v1/tasks/:id(.:format)
    format: json
    method: DELETE
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }

---

[**Notes**](/api/notes.md)

---
# LOG METHODS
## {log_method#HASH}
    {
      id: integer,
      kind: string,
      result: string,
      note: string,
      location: string,
      location_lat: float,
      location_lng: float,
      task_id: integer,
      contact_id: integer,
      user_id: integer,
      date: date, // "2013-02-25T11:46:59+0000"
      created_at: date,
      updated_at: date
    }

## Create
    url: /api/v1/logs(.:format)
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      contact_id: integer,
      task_id: integer,
      log: {
        kind: string, // call, text, email, social, meet
        result: string,
        note: string,
        location: string,
        location_lat: float,
        location_lng: float,
        date: date
      }
    }
    out: {log_method#HASH}

## Update
    url: /api/v1/logs/:id(.:format)
    format: json
    method: PUT
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      log: {
        kind: string, // call, text, email, social, meet
        result: string,
        note: string,
        location: string,
        location_lat: float,
        location_lng: float,
        date: date
      }
    }
    out: {log_method#HASH}

## Index
    url: /api/v1/logs(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      contact_ids: [1,2,3] // optional. cap dearray of integer or integer
      kinds: ["call", "text"] or "call" // call, text, email, social, meet
      page: integer
      per_page: integer
    }
    out:[{log_method#HASH}, {log_method#HASH}, ...]

---
[**Events**](/api/events.md)

---
# Artists
## List of artists
    url: api/v1/artists(.:format)
    format: json
    method: GET
    in {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      date_start: "2012-12-01", // optional
      date_end: "2012-12-28", // optional
    }
    out: [
      {
        id: integer,
        name: string,
        avatar_url: string,
        description: text
      }, ...]

---
# Guestlist Types
## List of guestlist types
    url: api/v1/guestlist_types(.:format)
    format: json
    method: GET
    in {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      date_start: "2012-12-01", // optional
      date_end: "2012-12-28", // optional
    }
    out: [
      {
        id: integer,
        guestlist_template_id: integer,
        name: string,
        person_count: integer,
        price_per_person: float,
        gender_type: string,
        default: boolean
      }, ...]

---
[**Reservations**](/api/reservations.md)

---
# Tags
## {tag#HASH}
    {
      "id": integer,
      "tag_category_id": integer,
      "name": string
    }

## List
    url: /api/v1/settings/tags
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: [{
      "ancestry": "1",
      "id": 2,
      "name": "TagCategory2",
      "tags": [
        {
          "id": 2,
          "name": "Tag2",
        },
        {
          "id": 3,
          "name": "Tag3",
        },
        ....
      ]
    }, {...}, ...]

---
# Tag categories
## {tag_category#HASH}
    {
      "id": integer,
      "parent_id": integer, // optional (return null if not present),
      "name": string
    }
---
# Venue filter
## List available venues
    url: /api/v1/venues/list(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: [
      {
        id: 1,
        name: "Venue name",
        home: true,
        selected: false
      },
      {
        id: 2,
        name: "Second venue name",
        home: false,
        selected: false
      },
      ...
    ]

## Set venue filter for staff
    url: /api/v1/venues/set_filters(.:format)
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      venue_ids: "1,3,4" // "0" for all venues
    }
    out: [
      {
        id: 1,
        name: "Venue name",
        home: true,
        selected: true
      },
      {
        id: 2,
        name: "Second venue name",
        home: false,
        selected: false
      },
      ...
    ]

---
# Guestlist

## {tense#STRING}
  'past', 'upcoming'

## {guestlist#HASH}
    {
      "contact_id": integer,
      "count_females": integer,
      "count_males": integer,
      "event_id": integer,
      "event_info": {
        name: "Awesome event",
        date: "2013-09-22T04:00:00Z"
      },
      "id": integer,
      "note":"note",
      "state":"active",
      "type_for_females_id": integer,
      "type_for_males_id": integer,
      "user_id":1,
      "qualification": string,

      "contact_info": {
        name: "Heather Sjule"
        state: "customer"
        title: ""
        organization: "FLUXX wrangler"
        avatar: "/uploads/contact/avatar/2593/thumb_100_avatar.JPEG"
        facebook: null
        twitter: null
        email: "heathersjule@gmail.com"
        phone: "(949)547-6080"
        tag_names: "'East Carolina Pirates','Wolverine'"
      }

      "type_for_females_name": string,
      "type_for_males_name": string,
      "event_name" : string,
      "event_date" : string,
      "contact_name" : string,
      "status": string,  // e.g. "not_confirmed"
      "status_name": string,  // e.g. "Not Confirmed"
      "available_statuses": {
        "not_confirmed": "Not Confirmed",
        "confirmed": "Confirmed",
        ...
      }
      "notes": []
    }

## Index
    url: /api/v1/guestlists(/{tense#STRING})(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      event_id: integer // optional
      contact_ids: [1,2,3] or <integer> // optional
      contact_id: integer // optional
      upcoming: string // to get upcoming guestlists, this parameter should be present ('1' for example), otherwise - should be omitted
    }
    out [{guestlist#HASH}, {guestlist#HASH}, ...]

## Show
    url: /api/v1/guestlists/:id(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out {guestlist#HASH}

## Create
    url: /api/v1/guestlists(.:format)
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      contact_ids: [<integer>,<integer>,...],
      guestlist: {
        event_id: integer,
        state: string,                // optional active(default), canceled
        count_males: integer,
        count_females: integer,
        note: text,
        type_for_females_id: integer,
        type_for_males_id: integer,
        qualification: string
      }
    }
    out {guestlist#HASH}

## Delete
    url: /api/v1/guestlists/:id
    format: json
    method: DELETE
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }

## Update
    url: /api/v1/guestlists/:id(.:format)
    format: json
    method: PUT
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      guestlist: {
        status: string,
        count_males: integer,
        count_females: integer,
        note: text,
        type_for_females_id: integer,
        type_for_males_id: integer,
        qualification: string,
        actual_count_males: integer,   // if these are present guestlist will be closed out
        actual_count_females: integer  // could be present only for past events
      }
    }
    out {guestlist#HASH}

## All guestlist types
    url: /api/v1/guestlists/:guestlist_id/types(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      gender_type: string, // optional. choices: 'males' or 'females'. All records returned if not set.
    }
    out: [
      {
        "person_count":5,
        "guestlist_template_id":1,
        "id": 1,
        "name": "Full",
        "price_per_person": 500.0,
        "gender_type": "male"
      }, ...
    ]

## Available statuses
    url: /api/v1/guestlists/available_statuses(.:format)
    format: json
    method: GET
    in {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: {
      "not_confirmed": "Not Confirmed",
      "confirmed": "Confirmed",
      ...
    }


---
# Guestlist

## {tally#HASH}
    {
      "id": integer,
      "event_id": integer,
      "user_id": integer,
      "actual_count_males": integer,
      "actual_count_females": integer,
      "type_for_males_id": integer,
      "type_for_females_id": integer
    }

## Index
    url: /api/v1/tallies(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      event_id: integer
    }
    out [{tally#HASH}, {tally#HASH}, ...]

## Update
    url: /api/v1/tallies/:id(.:format)
    format: json
    method: PUT
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
      tally: {
        actual_count_males: integer,
        actual_count_females: integer
      }
    }
    out {tally#HASH}

---
# Static text (i.e. terms of use, privacy policy etc.)

## {static_text#HASH}
    {
      "id": integer,
      "text_type": string, // "terms" or "privacy"
      "title": string,
      "body": text
    }

## Get static text by type
    url: /api/v1/static_texts(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      type: "terms"
    }
    out: {static_text#HASH}

# FILTERS

## {filter#HASH}
    {
      is_included: string,
      key: string,
      value: string
    }

## {filter_pattern#HASH}
    {
      id: integer,
      name: string,
      filters: [{filter#HASH}, {filter#HASH}, ...]
    }

## List of filter patterns
    url: /api/v1/filters(.:format)
    format: json
    method: GET
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: [{filter_pattern#HASH}, {filter_pattern#HASH}, ...]

## Create filter pattern
    url: /api/v1/filters(.:format)
    format: json
    method: POST
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      filter_pattern: {filter_pattern#HASH}
    }
    out: {filter_pattern#HASH}

## Update filter pattern
    url: /api/v1/filters/:id(.:format)
    format: json
    method: PUT
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH",
      filter_pattern: {filter_pattern#HASH}
    }
    out: {filter_pattern#HASH}

## Delete filter pattern
    url: /api/v1/filters/:id(.:format)
    format: json
    method: DELETE
    in: {
      auth_token: "o1ey7RZg13xzyPHPJnAH"
    }
    out: {message: 'Filter pattern was removed'}

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

