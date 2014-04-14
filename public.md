* [**Venues**](/api/public/venues.md)
* [**Events**](/api/public/events.md)
* [**Reservations**](/api/public/reservations.md)
* [**Guestlsits**](/api/public/guestlists.md)
* [**Orders**](/api/public/orders.md)
* [**Credentials**](/api/public/credentials.md)

### Introduction

All requests are made using public key (company_token) which can be found at the
 web application settings.
 First, venues should be retrieved, e.g.

    $ curl -X GET -d company_token=rsP2uhgqTdmdXAcKqKw9 https://beyondvip.com/api/public/venues.json

 Then events for specific venue can be retrieved

    $ curl -X GET -d company_token=rsP2uhgqTdmdXAcKqKw9 -d venue_id=1 https://beyondvip.com/api/public/events.json

 After that reservations, guestlists and orders can be made for specific event.
