# Api::V1::Contacts
Contact is an entity that you upload from mobile or through the web application,
 or create using mobile or web application.

You can create [reservations](/api/reservations.md),
 [guestlists](/api/guestlists.md), [tasks](/api/tasks.md),
 [log_methods](/api/log_methods.md), [notes](/api/notes.md) for contacts. Some
 field values are taken from [dictionaries](/api/dictionaries.md).

**phone** format should be "(123)456-7890"

**contact_qualifications** shows the status of contact at specific venue. It may
 be 'qualified', 'unqualified' or 'disqualified'.

**notes** field is an array of [notes](/api/notes.md).

**tags** and **tag_ids** fields are arrays of [tag](/api/tags.md) ids that are
 bound to contact.

**contact_owners** represents what user owns contact at what venue. Different
 [users](/api/users.md) can own contact at different venues. Contact owners can
 be changed at create and update requests (if user has permissions).

#### {state#STRING}
    'customer', 'partner', 'both'

#### {gender#STRING}
    'male', 'female'

#### {status#STRING}
    'no_level', 'silver', 'gold', 'platinum', 'black'

#### {contact_qualification#HASH}
    {
      id: integer,
      venue_id: integer,
      status: string // 'qualified', 'unqualified', 'disqualified'
    }

#### [{note#HASH}](/api/notes.md#notehash)

#### {contact#HASH}
    {
      id: integer,
      first_name: string,
      last_name: string,
      title: string,
      state: {state#STRING},
      avatar_mobile_thumb_url: string,
      gender: {gender#STRING},
      birthdate: string, // format: "YYYY-MM-DD"
      organization: string,
      industry: string, // dictionary key 'industries'
      ethnicity: string, // dictionary key 'ethnicities'
      sexual_preference: string, // dictionary key 'sexual_preferences'
      status: {status#STRING},
      email: string,
      phone: string, // format: "(123)456-7890",
      address: string,
      country: string,
      region: string, // dictionary key 'locations'
      city: string, // dictionary key 'locations'
      zip: string,
      facebook: string,
      twitter: string,
      instagram: string,
      skype: string,
      website: string,
      total_spent: float, // money that cotnact spent at events in all venues
      average_spent: float, // average money that is spent per event
      highest_spent: float, // highest spent at one event
      reservations_count: integer, // total reservations made for contact
      campaigns_count: integer, // total contact campaigns count
      guestlists_count: integer, // total guestlists created for contact
      last_reservation: timestamp, // contact's last reservation date
      last_visit: timestamp, // last reservation or guestlist event date (past events)
      last_update: timestamp, // last time user communicated with contact (log_method created)
      created_at: timestamp,
      visited_venue_ids: array of integers, // ids of venues where contact has completed reservations or guestlists
      contact_qualifications: [{contact_qualification#HASH}, ...],
      total_comp: float, // total comp money made in contact's reservations
      no_shows: integer, // how many times contact had completed reservation or guestlist but didn't come
      avatar: {
        url: string,
        thumb_100: {
          url: string
        },
        mobile_thumb: {
          url: string
        },
        thumb_200: {
          url: string
        }
      },
      notes: [{note#HASH}, ...],
      tags: array of integers,
      name: string,
      contact_owners: [ // included only when 'join_owners' parameter is true during search request
        {
          id: integer,
          user_id: integer,
          venue_id: integer
        },
        ...
      ]
    }

#### Validations
    always required:
      first_name, email or phone

### List
    url: /api/v1/contacts(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    ids: array of integers // optional. Find by given ids

  Response

    [{contact#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/contacts.json

### Get
    url: /api/v1/contacts/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    join_owners: boolean // optional. If "1" then owners are included

  Response

    {contact#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/contacts/1.json

### Create
    url: /api/v1/contacts(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    contact: { // contact_qualifications are set out of contact hash
      first_name: string,
      last_name: string,
      title: string,
      state: {state#STRING},
      gender: {gender#STRING},
      birthdate: string, // format: "YYYY-MM-DD"
      organization: string,
      industry: string, // dictionary key 'industries'
      ethnicity: string, // dictionary key 'ethnicities'
      sexual_preference: string, // dictionary key 'sexual_preferences'
      status: {status#STRING},
      email: string,
      phone: string, // format: "(123)456-7890",
      address: string,
      country: string,
      region: string, // dictionary key 'locations'
      city: string, // dictionary key 'locations'
      zip: string,
      facebook: string,
      twitter: string,
      instagram: string,
      skype: string,
      website: string,
      tag_ids: array of integers,
      avatar: <file>,
      contact_owners: [ // change contact owners at particular venue
        {
          venue_id: integer,
          user_id: integer
        },
        ...
      ]
    }
    contact_qualifications: [
      {
        venue_id: integer,
        status: string
      },
      ...
    ]
    join_owners: boolean // optional. If "1" then owners are included

  Response

    {contact#HASH}
    // or if contact's email or phone are found in system:
    {
      message: "Email (insert email here) and phone (insert phone here) are already in use by (insert contact name here)." // if email and phone are found
      message: "Email (insert email here) is already in use by (insert contact name here)." // if only email is found
      message: "Phone (insert phone here) is already in use by (insert contact name here)." // if only phone is found

      contact: {contact#HASH}
    }

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact[email]=contact@example.com -d contact[first_name]="John" https://app.beyondvip.com/api/v1/contacts.json

### Update
    url: /api/v1/contacts/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    contact: { // contact_qualifications are set out of contact hash
      first_name: string,
      last_name: string,
      title: string,
      state: {state#STRING},
      gender: {gender#STRING},
      birthdate: string, // format: "YYYY-MM-DD"
      organization: string,
      industry: string, // dictionary key 'industries'
      ethnicity: string, // dictionary key 'ethnicities'
      sexual_preference: string, // dictionary key 'sexual_preferences'
      status: {status#STRING},
      email: string,
      phone: string, // format: "(123)456-7890",
      address: string,
      country: string,
      region: string, // dictionary key 'locations'
      city: string, // dictionary key 'locations'
      zip: string,
      facebook: string,
      twitter: string,
      instagram: string,
      skype: string,
      website: string,
      tag_ids: array of integers,
      avatar: <file>,
      contact_owners: [ // change contact owners at particular venue
        {
          venue_id: integer,
          user_id: integer
        },
        ...
      ]
    }
    contact_qualifications: [
      {
        venue_id: integer,
        status: string
      },
      ...
    ]
    join_owners: boolean // optional. If "1" then owners are included

  Response

    {contact#HASH}
    // or if contact's email or phone are found in system:
    {

      // if email and phone are found
      message: "Invalid contact attributes. Email (insert email here) is already in use by (insert contact name here) who is owned by (insert contact owner name here) so you can not own this contact, Phone (insert phone here) is already in use by (insert contact name here) who is owned by (insert contact owner name here) so you can not own this contact"

      // if only email is found
      message: "Invalid contact attributes. Email (insert email here) is already in use by (insert contact name here) who is owned by (insert contact owner name here) so you can not own this contact"

      // if only phone is found
      message: "Invalid contact attributes. Phone (insert phone here) is already in use by (insert contact name here) who is owned by (insert contact owner name here) so you can not own this contact"

      contact: {contact#HASH}
    }

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact[first_name]="Jack" https://app.beyondvip.com/api/v1/contacts/2.json

### Import
    url: /api/v1/contacts/import(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    contacts: <file.vcf> // File vCard

  Response

    { message: "File successfully uploaded" }

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contacts=<file.vcf> https://app.beyondvip.com/api/v1/contacts/import.json

### Get expenditures
    url: /api/v1/contacts/:id/expenditures(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    venue_id: integer // optional

  Response

    {
      total_spent: float, // money that cotnact spent at events in all venues
      average_spent: float, // average money that is spent per event
      highest_spent: float, // highest spent at one event
      total_comp: float, // total comp money made in contact's reservations
      reservations: integer, // total reservations made for contact
      campaigns: integer, // total contact campaigns count
      guestlists: integer, // total guestlists created for contact
      no_shows: integer, // how many times contact had completed reservation or guestlist but didn't come
      cancellations: integer, // number of reservations cancellations
      last_reservation: timestamp // contact's last reservation date
    }

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/contacts/1/expenditures.json

### Set qualification status by venue
    url: /api/v1/contacts/:id/set_qualification(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    venue_id: integer
    status: string

  Response

    {
      contact_id: integer,
      status: string,
      venue_id: integer
    }

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d venue_id=1 -d status=qualified https://app.beyondvip.com/api/v1/contacts/1/set_qualification.json

### Delete contact
    url: /api/v1/contacts/:id(.:format)
    format: json
    method: DELETE

  Request

    auth_token: string

  Response

    {
      message: "Success" // if contact's successfully deleted
      message: "This contact can not be deleted" // otherwise
    }

  Example

    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://app.beyondvip.com/api/v1/contacts/1.json

### Search contact
    url: /api/v1/contacts(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    search[email]: string // optional
    search[phone]: string // optional
    search[name]: string // optional
    join_owners: boolean // optional. If "1" then owners are included

  Response

    [{contact#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d search[email]=mail  https://app.beyondvip.com/api/v1/contacts.json
