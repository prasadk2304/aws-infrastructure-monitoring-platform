# Troubleshooting

## Session Manager Offline

### Cause

IAM role attached after EC2 launch.

### Solution

Reboot the instance.

---

## CloudWatch Metrics Missing

Verify agent status:

```bash
sudo systemctl status amazon-cloudwatch-agent
```

Check logs:

```bash
sudo tail -f /opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log
```

---

## Grafana Cannot Connect to CloudWatch

Ensure the EC2 IAM role has:

- CloudWatchReadOnlyAccess

Verify region configuration.

---

## Grafana Dashboard Not Loading

Verify:

```bash
sudo systemctl status grafana-server
```

Check port:

```bash
sudo ss -tulpn | grep 3000
```

Ensure the security group allows inbound traffic on port 3000.

---

## SNS Notifications Not Received

Verify:

- Email subscription is confirmed
- Alarm state changed to "In alarm"

---

## Nginx Logs Not Appearing

Generate traffic:

```bash
curl http://localhost

curl http://localhost/invalid
```

Verify log groups:

- nginx-access
- nginx-error
