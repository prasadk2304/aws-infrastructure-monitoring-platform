# AWS Infrastructure Monitoring & Observability Platform

A production-style infrastructure monitoring solution built on AWS using EC2, CloudWatch, SNS, Grafana, and Bash automation.

This project demonstrates how to deploy, monitor, visualize, and proactively manage Linux workloads in AWS.

## Features

- Real-time infrastructure monitoring
- Custom CloudWatch metrics collection
- Centralized application and system logs
- Automated alerting using SNS
- Interactive Grafana dashboards
- Bash-based service health checks
- IAM role-based authentication
- Session Manager access without SSH keys

---

## Architecture

![Architecture Diagram](architecture/architecture-diagram.png)

```text
+----------------------+
|   EC2 Ubuntu Server  |
|----------------------|
|      Nginx App       |
| Health Check Scripts |
| CloudWatch Agent     |
+----------+-----------+
           |
           v
+----------------------+
|      CloudWatch      |
|----------------------|
| Metrics              |
| Logs                 |
| Alarms               |
+----------+-----------+
           |
           +------------------+
           |                  |
           v                  v
+----------------+   +----------------+
|      SNS       |   |    Grafana     |
| Email Alerts   |   | Dashboards     |
+----------------+   +----------------+
```

---

## Technology Stack

- AWS EC2
- Amazon CloudWatch
- Amazon SNS
- AWS IAM
- AWS Systems Manager
- Grafana
- Ubuntu Linux
- Bash
- Nginx

---

## Monitored Metrics

| Metric | Source | Threshold |
|--------|--------|------------|
| CPU Utilization | EC2 | > 70% |
| Memory Usage | CloudWatch Agent | > 80% |
| Disk Usage | CloudWatch Agent | > 80% |
| Network Traffic | EC2 | Informational |
| Instance Health | EC2 | > 0 |

---

## CloudWatch Logs

The following log files are centralized:

- `/var/log/nginx/access.log`
- `/var/log/nginx/error.log`

---

## Alerts

Amazon SNS sends email notifications when:

- CPU utilization exceeds threshold
- Memory usage exceeds threshold
- Disk usage exceeds threshold
- EC2 status checks fail
- Application service health checks fail

---

## Repository Structure

```text
aws-infrastructure-monitoring-platform/

├── README.md
├── architecture/
├── docs/
├── iam/
└── scripts/
```

---

## Setup

Detailed setup instructions are available in:

```text
docs/setup-guide.md
```

---

## Health Check Automation

The Bash script verifies service availability and publishes notifications when failures occur.

Location:

```text
scripts/health-check.sh
```

Scheduled using cron:

```cron
*/5 * * * * /home/ssm-user/scripts/health-check.sh
```

---

## Screenshots

Screenshots are available in:

```text
docs/screenshots/
```

Recommended screenshots:

- EC2 instance
- CloudWatch metrics
- CloudWatch alarms
- SNS notification email
- CloudWatch log groups
- Grafana dashboard
- Session Manager access

---

## Future Enhancements

- Infrastructure as Code using Terraform
- Container monitoring with Docker
- Prometheus integration
- Multi-instance monitoring
- Cross-account dashboards
- Auto Scaling integration

---


## License

MIT License
