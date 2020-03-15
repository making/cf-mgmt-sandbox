```
cf-mgmt export-config \
  --config-dir=config \
  --system-domain=sys.sandbox.a.ik.am \
  --user-id=cf-mgmt \
  --client-secret=$(vault kv get -field=value concourse/main/cf_mgmt_secret)

cf-mgmt-config generate-concourse-pipeline
```

```
git add -A
git commit -m "export"
git remote add origin git@github.com:making/cf-mgmt-sandbox.git
git push -u origin master
```

## Create org and space

```
cf-mgmt-config org --org demo
cf-mgmt-config space --org demo --space demo
```

Add `OrgManager`

```
cf-mgmt-config org --org demo --manager-saml-user=tmaki@pivotal.io
```

Add `SpaceManager` and `SpaceDeveloper`

```
cf-mgmt-config space --org demo --space demo --manager-saml-user=tmaki@pivotal.io
cf-mgmt-config space --org demo --space demo --developer-saml-user=tmaki@pivotal.io
```

```
git add -A
git commit -m "Add org:demo space:demo and assign tmaki@pivotal.io to the org and space."
git push origin master
```