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
