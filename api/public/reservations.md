# Api::Public::Reservations

Reservation entity represents that contact may come to specific
 [event](/api/public/events.md).

Please note - you couldn't create 2 reservations for the same contact and the
 same event.

### Create
    url: /api/public/reservations(.:format)
    format: json
    method: POST

  Request

    contact: {
      first_name: string,
      last_name: string,
      email: string,
      phone: string, // format: (123)456-7890
      birthdate: string // format: YYYY-MM-DD
    }
    reservation: {
      note: text,
      event_id: integer,
      count_males: integer,
      count_females: integer
    }
    facebook_token: string // optional

  Response

    {reservation#HASH}
