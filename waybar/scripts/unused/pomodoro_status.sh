#!/bin/bash
STATE_FILE="/tmp/pomodoro_state"
NOTIFY_FILE="/tmp/pomodoro_notified"

# ---------- idle (no state file) ----------
if [ ! -f "$STATE_FILE" ]; then
    echo "POMO UNACTIVE"
    exit 0
fi

source "$STATE_FILE"

# ---------- stopped state ----------
if [ "${RUNNING:-false}" = "false" ]; then
    echo "POMO --:--"
    exit 0
fi

# ---------- active state (running or paused) ----------
NOW=$(date +%s)
DURATION="${DURATION:-1500}"

if [ "${PAUSED:-false}" = "true" ]; then
    # Timer is paused – display frozen remaining time
    REMAINING="${REMAINING_AT_PAUSE:-0}"
else
    # Timer is running – calculate remaining seconds
    ELAPSED=$((NOW - START_TIME))
    REMAINING=$((DURATION - ELAPSED))
fi

# ---------- timer finished ----------
if [ "$REMAINING" -le 0 ]; then
    # Send notification only once per session
    if [ ! -f "$NOTIFY_FILE" ]; then
        notify-send -u critical "Pomodoro" "Time's up! Take a break."
        touch "$NOTIFY_FILE"
    fi

    # Optionally auto-stop so we don't loop 00:00 forever.
    # Remove the next line if you prefer to stay at 00:00 until manual stop.
    echo "RUNNING=false" > "$STATE_FILE"

    echo "POMO 00:00"
    exit 0
fi

# ---------- still running or paused ----------
MIN=$((REMAINING / 60))
SEC=$((REMAINING % 60))
printf "POMO %02d:%02d\n" $MIN $SEC