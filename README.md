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
# After accessing several times, it says `x-cache: Hit from cloudfront`
DISTRIBUTION_DOMAIN="YOUR_DISTRIBUTION_DOMAIN_NAME" make access
```

```shell
# After WAF rejects DoS attack, it says `HTTP/2 403`
DISTRIBUTION_DOMAIN="YOUR_DISTRIBUTION_DOMAIN_NAME" make attack
```
