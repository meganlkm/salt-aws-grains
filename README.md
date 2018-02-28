# AWS Grains

## Environment

```bash
export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."
export AWS_REGION="us-east-1"
```


## Run it

```bash
make sandbox
docker exec -it salt-sandbox bash

git clone https://github.com/saltstack-formulas/pip-formula.git /tmp/pip-formula
cp -r /tmp/pip-formula/pip /srv/salt/pip
salt-call state.apply pip

pip install boto3
salt-call saltutil.sync_grains
salt-call grains.item aws
```


**When you're finished:**

```bash
make dead
```
