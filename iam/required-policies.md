# Required IAM Policies

Attach the following managed policies to the EC2 IAM role.

## Monitoring

- CloudWatchAgentServerPolicy
- CloudWatchReadOnlyAccess

## Access

- AmazonSSMManagedInstanceCore

## Optional

- AmazonSNSFullAccess

For production environments, replace broad permissions with least-privilege custom policies.
