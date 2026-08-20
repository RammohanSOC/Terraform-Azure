resource_group_name = "rg-prod"
location            = "Central India"

private_endpoint_name = "pe-storage"
subnet_id             = "<PRIVATE_ENDPOINT_SUBNET_ID>"

target_resource_id = "<TARGET_RESOURCE_ID>"

subresource_names = [
  "blob"
]
