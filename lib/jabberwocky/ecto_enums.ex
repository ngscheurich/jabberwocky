import EctoEnum

defenum ServiceRequestTypeEnum, :service_request_type, [
  :tall_grass,
  :junk_property,
  :condemn_property,
  :abandoned_vehicle,
  :swimming_pool,
  :missing_portal,
  :illegal_sign
]

defenum ServiceRequestStatusEnum, :service_request_status,
  [:open, :in_progress, :closed]
