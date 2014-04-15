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

  Example

    $ curl -X POST -d company_token=rsP2uhgqTdmdXAcKqKw9 -d contact[first_name]=John -d contact[last_name]=Doe -d contact[email]=john.doe@example.com -d reservation[event_id]=759 -d reservation[count_males]=1 -d reservation[count_females]=1 https://app.beyondvip.com/api/public/reservations.json
