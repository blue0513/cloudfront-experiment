# cloudfront-experiment

Make Cloudfront and S3 bucket

## Usage

```shell
# Setup terraform.tfvars
make setup

# Deploy S3 & Cloudfront
make plan
make apply
```

```shell
export DISTRIBUTION_DOMAIN="YOUR_DISTRIBUTION_DOMAIN_NAME"

# After accessing several times, it says `x-cache: Hit from cloudfront`
curl -I "${DISTRIBUTION_DOMAIN}/index.html"
```
