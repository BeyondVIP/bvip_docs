# Permissions

#### {permission_scope#HASH}
    {
      "self": true, // optional
      "home_venue": true, // OBSOLETE (use "selected_venues"), optional
      "selected_venues": array of integers // optional
    }


#### {permissions_struct#HASH}
    {
      "VenueGoalTemplate": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "Departments and Levels": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "Contact": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...],
        "view_full": [{permission_scope#HASH}, ...]
      },
      "PermissionLevel": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "Reservation": {
        "closeout": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...],
        "create": [{permission_scope#HASH}, ...],
        "manage": [{permission_scope#HASH}, ...],
        "override_minimum": [{permission_scope#HASH}, ...],
        "override_party_size": [{permission_scope#HASH}, ...],
        "manage_at_the_rope": [{permission_scope#HASH}, ...]
      },
      "Template": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "Task": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "Company": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "EventVenueGoalTemplate": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "GeneralAdmissionEntranceType": {
        "closeout": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "Promoter": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "LeadUser": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "Guestlist": {
        "closeout": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...],
        "manage": [{permission_scope#HASH}, ...]
      },
      "ContactQualification": {
        "update": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "Event": {
        "read": [{permission_scope#HASH}, ...],
        "manage": [{permission_scope#HASH}, ...],
        "closeout": [{permission_scope#HASH}, ...]
      },
      "Reports": {
        "read": [{permission_scope#HASH}, ...]
      },
      "User": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "ContactOwner": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "TierLevel": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "VenueNotificationTemplate": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...]
      },
      "Campaign": {
        "manage": [{permission_scope#HASH}, ...],
        "read": [{permission_scope#HASH}, ...],
        "have": [{permission_scope#HASH}, ...]
      }
    }