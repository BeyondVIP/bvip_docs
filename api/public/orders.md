# Api::Public::Orders

**section_id** is taken from [event](/api/public/events.md#eventhash) sections

**stripe_card_token** should be obtained using
 [stripe public key](/api/public/credentials.md) and credit card information

**facebook_token** should be present if
 [event](/api/public/events.md#eventhash) has facebook_token_required
 set to true

### Create
    url: /api/public/orders(.:format)
    format: json
    method: POST

  Request

    reservation: {
      event_id: integer,
      count_males: integer,
      count_females: integer
    }
    contact: {
      first_name: string,
      last_name: string,
      email: string,
      phone: string, // format: (123)456-7890
      birthdate: string, // format: YYYY-MM-DD
      gender: string // 'male' or 'female'
    }
    order_details: [{
      section_id: integer,
      tables_count: integer
    }]
    stripe_card_token: string
    facebook_token: string

  Response

    {order#HASH}

  Example

    $ curl -X POST -d company_token=rsP2uhgqTdmdXAcKqKw9 -d contact[first_name]=John -d contact[last_name]=Doe -d contact[email]=john.doe@example.com -d reservation[event_id]=759 -d reservation[count_males]=1 -d reservation[count_females]=1 -d order_details[][section_id]=12 -d order_details[][tables_count]=2 -d stripe_card_token=pk_live_clhiKQ1N7g1kGQRBIzDx8u7T -d facebook_token=<facebook_token> https://app.beyondvip.com/api/public/orders.json

