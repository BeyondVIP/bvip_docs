# Api::V1::Promoters

#### {promoter#HASH}
    {
      id: integer,
      first_name: string,
      last_name: string,
      mobile_phone: string,
      gender: string,
      email: string,
      birthdate: string, // format: "YYYY-MM-DD"
      address: string,
      personal_website: string,
      promoter_company: string,
      start_date: string, // format: "YYYY-MM-DD"
      title: string,
      promoter: boolean,
      user_image: {
        photo: {
          url: string,
          thumb_100: {
            "url": string
          },
          mobile_thumb: {
            url: string
          },
          thumb_200: {
            url: string
          }
        }
      }
    }

### Create
    url: /api/v1/promoters(.:format)
    format: json
    method: POST

  Request

    auth_token: string
    promoter: {
      first_name: string,
      last_name: string,
      mobile_phone: string,
      gender: string,
      email: string,
      birthdate: datetime,
      address: string,
      personal_website: string,
      promoter_company: string,
      start_date: datetime,
      title: string
    }
    avatar: <file>

  Response

    [{promoter#HASH}, ...]


### Update
    url: /api/v1/promoters/:id(.:format)
    format: json
    method: PUT

  Request

    auth_token: string
    promoter: {
      first_name: string,
      last_name: string,
      mobile_phone: string,
      gender: string,
      email: string,
      birthdate: datetime,
      address: string,
      personal_website: string,
      promoter_company: string,
      start_date: datetime,
      title: string
    }
    avatar: <file>

  Response

    [{promoter#HASH}, ...]