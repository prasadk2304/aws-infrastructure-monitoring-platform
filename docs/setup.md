# Setup Guide

## Prerequisites

- AWS account
- Ubuntu EC2 instance
- IAM role attached to EC2
- Grafana installed
- SNS topic created

---

## IAM Policies

Attach the following policies to the EC2 role:

- AmazonSSMManagedInstanceCore
- CloudWatchAgentServerPolicy
- CloudWatchReadOnlyAccess

---

## Deploy Web Server

```bash
sudo apt update

sudo apt install nginx -y

sudo systemctl enable nginx

sudo systemctl start nginx
```

Verify:

```bash
curl http://localhost
```

---

## Install CloudWatch Agent

```bash
wget https://amazoncloudwatch-agent.s3.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

sudo dpkg -i amazon-cloudwatch-agent.deb
```

Copy configuration:

```bash
sudo cp scripts/amazon-cloudwatch-agent.json \
/opt/aws/amazon-cloudwatch-agent/etc/
```

Start the agent:

```bash
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a fetch-config \
-m ec2 \
-c file:/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json \
-s
```

---

## Configure SNS

1. Create SNS topic: `infra-alerts`
2. Add email subscription
3. Confirm subscription

---

## Configure CloudWatch Alarms

Create alarms for:

- CPUUtilization > 70%
- mem_used_percent > 80%
- disk_used_percent > 80%
- StatusCheckFailed > 0

Configure all alarms to use the SNS topic.

---

## Install Grafana

Add Grafana repository:

```bash
sudo apt-get install -y apt-transport-https software-properties-common wget
```

Install Grafana:

```bash
sudo apt update

sudo apt install grafana -y
```

Enable service:

```bash
sudo systemctl enable grafana-server

sudo systemctl start grafana-server
```

Open port 3000 in the security group.

Access:

```text
http://<EC2_PUBLIC_IP>:3000
```

Default credentials:

```text
admin / admin
```

---

## Configure Grafana

1. Add CloudWatch data source
2. Authentication: AWS SDK Default
3. Region: Your AWS region
4. Save and test

Create panels for:

- CPU Utilization
- Memory Usage
- Disk Usage
- Network In
- Network Out
- Instance Health

Save dashboard as:

```text
Infrastructure Monitoring Dashboard
```
