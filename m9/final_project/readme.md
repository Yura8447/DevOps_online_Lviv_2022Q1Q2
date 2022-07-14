# Project

```
terraform init \
    -backend-config "bucket=infrastructure-final-project" \
    -backend-config "key=state/infrastructure.tfstate" \
    -backend-config "region=us-east-2"
```

```
terraform plan
```

```
terraform apply
```
