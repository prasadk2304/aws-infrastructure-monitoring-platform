#!/bin/bash

SERVICE="nginx"

TOPIC_ARN="YOUR_SNS_TOPIC_ARN"

if systemctl is-active --quiet "$SERVICE"
then
    echo "$(date): $SERVICE is running"
else
    MESSAGE="$(date): $SERVICE is DOWN on $(hostname)"

    echo "$MESSAGE"

    aws sns publish \
        --topic-arn "$TOPIC_ARN" \
        --message "$MESSAGE"
fi
