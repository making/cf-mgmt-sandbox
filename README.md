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