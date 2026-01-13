labels = {
  "team"    = "platform"
  "project" = "infrastructure"
}

# Infomaniak KaaS configuration
infomaniak_token        = ""    # Set via TF_VAR_infomaniak_token env var
public_cloud_id         = 00000 # You need to create this first, no iAC for this, the jq commands was not working, so use the ID out of the UI
public_cloud_project_id = 00000 # You need to create this first
cluster_name            = "my-cluster"
pack_name               = "shared"
kubernetes_version      = "1.34"
region                  = "dc3-a"
