#!/bin/bash

if [[ $# -ne 4 ]]; then
    echo "Usage: $0 signal_config_path sender_phone_number receiver_phone_number \"signal_message\""
    exit 1
fi

SIGNAL_CONFIG_PATH=$1
SENDER_PHONE_NUMBER=$2
RECEIVER_PHONE_NUMBER=$3
SIGNAL_MESSAGE=$4

SIGNAL_CLI_PATH=/app/signal-cli-0.7.1/bin/signal-cli

timestamp=`date -I"seconds"`
echo -e "$timestamp $SENDER_PHONE_NUMBER => $RECEIVER_PHONE_NUMBER: $SIGNAL_MESSAGE"

$SIGNAL_CLI_PATH \
    --config $SIGNAL_CONFIG_PATH \
    --username $SENDER_PHONE_NUMBER \
    send --message "$SIGNAL_MESSAGE" $RECEIVER_PHONE_NUMBER > /dev/null 2>&1
