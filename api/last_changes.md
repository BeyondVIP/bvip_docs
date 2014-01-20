# Api::V1::LastChanges

#### {class_name#STRING}
    "Contact", "Tag", "TagCategory", "Task", "LogMethod", "Notification", "Note", "Reservation", "StaticText", "UserVenue", "ContactQualification"

#### {contact_last_changes#HASH}
    {
      id: integer,
      first_name: string,
      last_name: string,
      name: string, // only for web
      nurtured: boolean,
      title: string
      avatar: {
        url: string,
        thumb_100: {
          url: string
        }
        thumb_200: {
          url: string
        }
      }
      state: string, // customer, partner, both
      industry: string,
      sexual_preference: string,
      ethnicity: string,
      gender: string,
      organization: string,
      birthdate: datetime,
      status: string,
      tags: array of integers,
      email: string,
      phone: string,
      address: string,
      country: string,
      region: string,
      city: string,
      zip: string,
      website: string",
      facebook: string,
      twitter: string,
      instagram: string,
      skype: string,
      last_update: timestamp,
      last_visit: timestamp,
      created_at: timestamp,
      total_spent: float,
      average_spent: float,
      highest_spent: float,
      total_comp: float,
      reservations_count: integer,
      campaigns_count: integer,
      guestlists_count: integer,
      no_shows: integer,
      last_reservation: timestamp,
      visited_venue_ids : array of integers
    }

#### {user_venue_last_changes#HASH}
    {
      venue_id: integer,
      id: integer,
      home: boolean,
      venue_name: string
    }

#### {contact_qualification_last_changes#HASH}
    {
      contact_id: integer,
      venue_id: integer,
      status: string
    }


#### {log_element#HASH}
    {
      action: string, // "create", "update", "destroy"
      id: integer,
      class_name: {class_name#STRING},

      // if action != 'destroy'

      data: {contact_last_changes#HASH} | {tag#HASH} | {tag_category#HASH} |
        {task#HASH} | {log_method#HASH} | {notification#HASH} | {note#HASH} |
        {reservation#HASH} | {user_venue_last_changes#HASH} |
        {contact_qualification_last_changes#HASH}
    }

### Take changes since '2013-02-12 8:20:00'
    url: /last_changes(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    start_date: string, // optional, example: "2013-02-12T08:20:00GMT+04:00"
    options: {
      "Contact": {
        "start_date": string,
      },
      "Tag": {
        "start_date": string,
      },
      "TagCategory": {
        "start_date": string,
      },
      "Task": {
        "start_date": string,
      },
      "LogMethod": {
        "start_date": string,
      },
      "Notification": {
        "start_date": string,
      },
      "Note": {
        "start_date": string,
      },
      "Reservation": {
        "start_date": string,
      },
      "UserVenue": {
        "start_date": string,
      },
      "ContactQualification": {
        "start_date": string,
      }
    }

  Response

    {
      status: integer // 0 or 1
      timestamp: timestamp,
      activity_log: [{log_element#HASH}, ...],
      message: string // if status is 1
    }

### Last Changes Acknowledgment
    url: /last_changes/acknowledgment
    format: json
    method: POST

  Request

    auth_token: string
    timestamp: timestamp, // example: "2013-02-12T08:20:00GMT+04:00"

  Response

    {
      message: "Success"
    }
