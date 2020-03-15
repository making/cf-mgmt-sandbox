#!/bin/bash

set -ex

TEAM=main
PIPELINE=$(basename ${PWD})

vault kv put /concourse/${TEAM}/${PIPELINE}/git_repo_uri value=https://github.com/making/cf-mgmt-sandbox
vault kv put /concourse/${TEAM}/${PIPELINE}/git_repo_branch value=master
vault kv put /concourse/${TEAM}/${PIPELINE}/config_dir value=config
vault kv put /concourse/${TEAM}/${PIPELINE}/time-trigger value=1h
vault kv put /concourse/${TEAM}/${PIPELINE}/system_domain value=sys.sandbox.a.ik.am
vault kv put /concourse/${TEAM}/${PIPELINE}/user_id value=cf-mgmt
vault kv put /concourse/${TEAM}/${PIPELINE}/password value=
vault kv put /concourse/${TEAM}/${PIPELINE}/client_secret value=$(vault kv get -field=value concourse/main/cf_mgmt_secret)
vault kv put /concourse/${TEAM}/${PIPELINE}/log_level value=debug
vault kv put /concourse/${TEAM}/${PIPELINE}/ldap_server value=
vault kv put /concourse/${TEAM}/${PIPELINE}/ldap_user value=
vault kv put /concourse/${TEAM}/${PIPELINE}/ldap_password value=
