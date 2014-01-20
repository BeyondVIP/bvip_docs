# Api::V1::Contacts

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
      birthdate: string,
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
      total_spent: float,
      average_spent: float,
      highest_spent: float,
      reservations_count: integer,
      campaigns_count: integer,
      guestlists_count: integer,
      last_reservation: timestamp,
      last_visit: timestamp,
      last_update: timestamp,
      created_at: timestamp,
      visited_venue_ids: array of integers,
      contact_qualifications: [{contact_qualification#HASH}, ...],
      total_comp: float,
      no_shows: integer,
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
      tags: array of integers
    }

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

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/contacts.json

### Get
    url: /api/v1/contacts/:id(.:format)
    format: json
    method: GET

  Request

    auth_token: string

  Response

    {contact#HASH}

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/contacts/1.json

### Create
    url: /api/v1/contacts(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    contact: {contact#HASH} // contact_qualifications are set out of contact hash
    contact_qualifications: [
      {
        venue_id: integer,
        status: string
      },
      ...
    ]

  Response

    {contact#HASH}
    // or if contact's email or phone are found in system:
    {
      message: "The (insert email or phone number here) you entered is already associated with (insert contact name here) owned by (owner or owners here)."
      contact: {contact#HASH}
    }

  Example

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact[email]=contact@example.com -d contact[first_name]="John" https://beyondvip.com/api/v1/contacts.json

### Update
    url: /api/v1/contacts/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    contact: {contact#HASH} // contact_qualifications are set out of contact hash
    contact_qualifications: [
      {
        venue_id: integer,
        status: string
      },
      ...
    ]

  Response

    {contact#HASH}

  Example

    $ curl -X PUT -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contact[first_name]="Jack" https://beyondvip.com/api/v1/contacts/2.json

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

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d contacts=<file.vcf> https://beyondvip.com/api/v1/contacts/import.json

### Get expenditures
    url: /api/v1/contacts/:id/expenditures(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    venue_id: integer //optional

  Response

    {
      total_spent: float,
      average_spent: float,
      highest_spent: float,
      total_comp: float,
      reservations: integer,
      campaigns: integer,
      guestlists: integer,
      no_shows: integer,
      cancellations: integer,
      last_reservation: timestamp
    }

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/contacts/1/expenditures.json

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

    $ curl -X POST -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d venue_id=1 -d status=qualified https://beyondvip.com/api/v1/contacts/1/set_qualification.json

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

    $ curl -X DELETE -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg https://beyondvip.com/api/v1/contacts/1.json

### Search contact
    url: /api/v1/contacts(.:format)
    format: json
    method: GET

  Request

    auth_token: string
    search[email]: string // optional
    search[phone]: string // optional
    search[name]: string // optional

  Response

    [{contact#HASH}, ...]

  Example

    $ curl -X GET -d auth_token=2zLJaxqVzKJgQ0XfYIg8Wg -d search[email]=mail  https://beyondvip.com/api/v1/contacts.json
