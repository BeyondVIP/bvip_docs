# Api::V1::LastChanges
## Basics

'Last Changes' functionality is used to pull database changes from server.

For example, it is needed to receive any changes since March, 03 2014.
First, the following request is used:
####
    $ # request 1
    $ curl -X GET -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d start_date="2014-03-03 00:00:00 +0000" https://beyondvip.com/api/v1/last_changes.json
####

Response should have the following format:
####
    {
      status: integer // 0 - success or 1 - error
      timestamp: timestamp,
      activity_log: [{log_element#HASH}, ...],
      message: string // if status is 1
    }
####

If **status** equals 1, go to [Solving status](#solving-status) for details. 
Otherwise it equals 0. Then **activity_log** key possibly contains changes.

**timestamp** shows current server time. Clients keep it and use it for next 'Last Changes' request.

**message** describes why **stasus** equals 1. It is null if **status** equals 0. This is used for developing.

Let's suppose that **activity_log** does not contain changes:
####
    {
      "status": 0,
      "timestamp": "2014-03-03T16:34:00GMT+01:00",
      "activity_log": [],   // no changes
      "message": null
    }
####

Let's create a contact:
####
    $  curl -X POST -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d contact[email]=contact_`date +%N`@example.com -d contact[first_name]="John" https://beyondvip.com/api/v1/contacts.json
####

And then request:
####
    $ # request 2
    $ curl -X GET -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d start_date="2014-03-03 00:00:00 +0000" https://beyondvip.com/api/v1/last_changes.json
####

Response should like the following:
####
    {
      "status": 0,
      "timestamp": "2014-03-03T16:38:38GMT+01:00",
      "message": null,
      "activity_log": [
        {
          "class_name": "Contact",
          "id": 34659,
          "action": "create",
          "data": {
            "id": 34659,
            "first_name": "John",
            "last_name": null,
            "title": null,
            "state": "customer",
            "avatar_mobile_thumb_url": null,
            "gender": null,
            "birthdate": null,
            "organization": null,
            "industry": null,
            "ethnicity": null,
            "sexual_preference": null,
            "status": "no_level",
            "email": "contact_381869795@example.com",
            "phone": null,
            "address": null,
            "country": null,
            "region": null,
            "city": null,
            "zip": null,
            "facebook": null,
            "twitter": null,
            "instagram": null,
            "skype": null,
            "website": null,
            "total_spent": "0.0",
            "average_spent": "0.0",
            "highest_spent": "0.0",
            "reservations_count": 0,
            "campaigns_count": 0,
            "guestlists_count": 0,
            "cancellations": 0,
            "last_reservation": null,
            "last_visit": null,
            "last_update": null,
            "created_at": "2014-03-03T07:35:05-0800",
            "visited_venue_ids": null,
            "total_comp": null,
            "no_shows": 0,
            "avatar": {
              "url": null,
              "thumb_100": {
                "url": null
              },
              "mobile_thumb": {
                "url": null
              },
              "thumb_200": {
                "url": null
              }
            },
            "notes": [],
            "tags": [],
            "name": "John ",
            "group_id": null
          }
        } //, { ... }
      ]
    }
####

Let's look at contents of **activity_log**. Those are array of elements which have the same format:
####
    {
      "class_name": string,
      "id": integer,
      "action": string,
      "data": 
        {
            // structured entry data
        }
    }
####

**class_name** is class name of changed entry. It can equal to one of the following:
####
    "Contact", "Tag", "TagCategory", "Task", "LogMethod", "Notification", "Note", "Reservation", "StaticText", "UserVenue", "ContactQualification"
####

**id** is primary key value of changed entry

**action** specifies what's happened to entry. It can equal to one of three values: "create", "update" or "destroy"

**data** presents whole entry after change. Its format depends of entry class. See [Data Samples](#data-samples) section for details.
Note that **data** is omitted if **action** equals "destroy"


**NOTICE:** It's required to push acknowledgment to server after every pulling changes and full data loading. See [Acknowledgment](#acknowledgment) section for details.
 

Let's continue. Update just created contact:
####
    $ curl -X PUT -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d contact[first_name]="Jack" https://beyondvip.com/api/v1/contacts/34659.json
####

Request last changes:
####
    $ # request 3
    $ curl -X GET -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d start_date="2014-03-03T16:38:38GMT+01:00" https://beyondvip.com/api/v1/last_changes.json
####

Response should like the following:
####
    {
      "status":0,
      "timestamp":"2014-03-03T18:11:00GMT+01:00",
      "message":null,
      "activity_log": [
        {
          "id": 34659,
          "action": "update",
          "class_name": "Contact",
          "data": {
            "id": 34659,
            "first_name": "Jack",
            "last_name": null,
            "title": null,
            "state": "customer",
            "avatar_mobile_thumb_url": null,
            "gender": null,
            "birthdate": null,
            "organization": null,
            "industry": null,
            "ethnicity": null,
            "sexual_preference": null,
            "status": "no_level",
            "email": "contact_381869795@example.com",
            "phone": null,
            "address": null,
            "country": null,
            "region": null,
            "city": null,
            "zip": null,
            "facebook": null,
            "twitter": null,
            "instagram": null,
            "skype": null,
            "website": null,
            "total_spent": "0.0",
            "average_spent": "0.0",
            "highest_spent": "0.0",
            "reservations_count": 0,
            "campaigns_count": 0,
            "guestlists_count": 0,
            "cancellations": 0,
            "last_reservation": null,
            "last_visit": null,
            "last_update": null,
            "created_at": "2014-03-03T07:35:05-0800",
            "visited_venue_ids": null,
            "total_comp": null,
            "no_shows": 0,
            "avatar": {
              "url": null,
              "thumb_100": {
                "url": null
              },
              "mobile_thumb": {
                "url": null
              },
              "thumb_200": {
                "url": null
              }
            },
            "notes": [],
            "tags": [],
            "name": "Jack ",
            "group_id": null
          }
        }
      ]
    }
####
Notice 1: This response does not contain information about contact creation because **start_date** parameter from current request does not equal than from requests 1 and 2. It was given from response related request 2.
Notice 2: Although just one contact field was updated, the response contained whole contact.

Let's destroy our contact and request changes again:
####
    $ curl -X DELETE -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw https://beyondvip.com/api/v1/contacts/34659.json
####
####
    $ # request 4
    $ curl -X GET -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d start_date="2014-03-03T16:38:38GMT+01:00" https://beyondvip.com/api/v1/last_changes.json
####

Response:
####
    {
      "status": 0,
      "timestamp": "2014-03-04T07:42:29GMT+01:00",
      "message": null,
      "activity_log": [
        {
          "id": 34659,
          "action": "update",
          "class_name": "Contact",
          "data": {
            "id": 34659,
            "first_name": "Jack",
            "last_name": null,
            "title": null,
            "state": "customer",
            "avatar_mobile_thumb_url": null,
            "gender": null,
            "birthdate": null,
            "organization": null,
            "industry": null,
            "ethnicity": null,
            "sexual_preference": null,
            "status": "no_level",
            "email": "contact_381869795@example.com",
            "phone": null,
            "address": null,
            "country": null,
            "region": null,
            "city": null,
            "zip": null,
            "facebook": null,
            "twitter": null,
            "instagram": null,
            "skype": null,
            "website": null,
            "total_spent": "0.0",
            "average_spent": "0.0",
            "highest_spent": "0.0",
            "reservations_count": 0,
            "campaigns_count": 0,
            "guestlists_count": 0,
            "cancellations": 0,
            "last_reservation": null,
            "last_visit": null,
            "last_update": null,
            "created_at": "2014-03-03T07:35:05-0800",
            "visited_venue_ids": null,
            "total_comp": null,
            "no_shows": 0,
            "avatar": {
              "url": null,
              "thumb_100": {
                "url": null
              },
              "mobile_thumb": {
                "url": null
              },
              "thumb_200": {
                "url": null
              }
            },
            "notes": [],
            "tags": [],
            "name": "Jack ",
            "group_id": null
          }
        },
        {
          "class_name": "Contact", //
          "id": 34659,             // contact deletion
          "action": "destroy"      //
        }
      ]
    }
####
Note that response have information about contact deletion.


## Parameters

Notice: these two parameters aren't used together.

#### start_date
It specifies what time needed changes start with.

It is written in the following way:
####
    start_date="<timestamp>"
####

Timestamp can have one of the following formats:
####
    YYYY-MM-DDThh:mm:ssGMT(+|-)hh:mm
    YYYY-MM-DD hh:mm:ss (+|-)hhmm
####

Timestamp examples:
####
    2014-03-03T16:38:38GMT+01:00
    2014-03-03 05:29:17 -0300
####

Usually mobile apps take parameter value from 'Last Changes' response related previous request. For first request, clients use value from timestamp parameter of last [acknowledgment](#acknowledgment) request.

Example of using:
####
    $ curl -X GET -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d start_date="2014-03-03T16:38:38GMT+01:00" https://beyondvip.com/api/v1/last_changes.json
####

#### options
It specifies the same as start_date, but it applies to specified class.
It is written in the following way:
####
    options[<class name>][start_date]="<timestamp>" // the same timestamp format as start_date parameter
####

Example of using:
####
    $ curl -X GET -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d options[Contact][start_date]="2014-03-03 05:29:17 +0000" https://beyondvip.com/api/v1/last_changes.json
####
It is possible to request changes from different classes together. In this case [start_date] sub-parameters are independent from each other:
####
    $ curl -X GET -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d options[ContactQualification][start_date]="2014-03-03 05:29:17 +0000" -d options[Notification][start_date]="2014-03-04 05:00:00 +0000"  https://beyondvip.com/api/v1/last_changes.json
####


## Solving status

Sometimes response comes with status equal to 1.
It usually means that a client should load full data from server and push [acknowledgment](#acknowledgment).
In this case, message entry can equal to one of the following:
    
 *  "No achievements at some classes"
 *  "No achievements: '\<class name\>' "
 *  "Unknown device"
 *  "Too many changes"

There are other cases that provide equation status to 1. They happen if client send non-valid parameters. Then message entry can equal to one of the following:

 *  "Unknown params" - none of the [parameters](#parameters) is not specified
 *  "Invalid params" - one of the [parameters](#parameters) is not valid
 *  "Invalid timestamp" - start_date value have wrong format
 *  "Invalid timestamp at \<class name\>" - value of options\[\<class name\>\][start_date] have wrong format


## Acknowledgment

Clients should push acknowledgment to server after every full data loading and requesting last changes. It allows server to prevent pushing outdated changes to clients. Client can't pull changes when he haven't acknowledgment at server. If client's permissions change then client's acknowledgment expires. In this client case have to load full data and push new acknowledgment.

Notice: client should push acknowledgment before first 'Last Changes' request.

Request example:
####
    curl -X POST -d auth_token=Dyn1vbWt7Hhy1O-Elo6eSw -d timestamp="2014-03-04 05:29:17 +0000" https://beyondvip.com/api/v1/last_changes/acknowledgment.json
####

Response:
####
    { message: "Success" }
####

Timestamp parameter specifies time of device database state. For request local time is used. This parameter have the same format as from [Parameters](#parameters) section.


## Data samples

Here is general form of data:

##### \{log_element#HASH\}
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

##### \{class_name#STRING\}
    "Contact", "Tag", "TagCategory", "Task", "LogMethod", "Notification", "Note", "Reservation", "StaticText", "UserVenue", "ContactQualification"

Here is links to details of representations:

 *  [{contact_last_changes#HASH}](#contact_last_changeshash)
 *  [{user_venue_last_changes#HASH}](#user_venue_last_changeshash)
 *  [{contact_qualification_last_changes#HASH}](#contact_qualification_last_changeshash)
 *  [{tag#HASH}](/api/tags.md#taghash)
 *  [{tag_category#HASH}](/api/tags.md#tag_categoryhash)
 *  [{task#HASH}](/api/tasks.md#taskhash)
 *  [{log_method#HASH}](/api/log_methods.md#log_methodhash)
 *  [{notification#HASH}](/api/notifications.md#notificationhash)
 *  [{note#HASH}](/api/notes.md#notehash)
 *  [{reservation#HASH}](/api/reservations.md#reservationhash)


##### \{contact_last_changes#HASH\}
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

##### \{user_venue_last_changes#HASH\}
    {
      venue_id: integer,
      id: integer,
      home: boolean,
      venue_name: string
    }

##### \{contact_qualification_last_changes#HASH\}
    {
      contact_id: integer,
      venue_id: integer,
      status: string
    }




