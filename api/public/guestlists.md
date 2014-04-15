# Api::Public::Guestlists

Please note - you couldn't create 2 guestlists for the same contact and the
 same event.

**facebook_token** should be present if
 [event](/api/public/events.md#eventhash) has facebook_token_required
 set to true.

### Create
    url: /api/public/guestlists(.:format)
    format: json
    method: POST

  Request

    contact: {
      first_name: string,
      last_name: string,
      email: string,
      phone: string, // format: (123)456-7890
      birthdate: string // format: YYYY-MM-DD
    },
    guestlist: {
      note: text,
      event_id: integer,
      count_males: integer,
      count_females: integer
    },
    facebook_token: string

  Response

    {guestlist#HASH}

  Example

    $ curl -X POST -d company_token=rsP2uhgqTdmdXAcKqKw9 -d contact[first_name]=John -d contact[last_name]=Doe -d contact[email]=john.doe@example.com -d guestlist[event_id]=759 -d guestlist[count_males]=1 -d guestlist[count_females]=1 https://app.beyondvip.com/api/public/guestlists.json
