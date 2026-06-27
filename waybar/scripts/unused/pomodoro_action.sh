#!/bin/bash
STATE_FILE="/tmp/pomodoro_state"
NOTIFY_FILE="/tmp/pomodoro_notified"

# Function to atomically write the state file
write_state() {
    local tmpfile="${STATE_FILE}.tmp.$$"
    cat > "$tmpfile" <<<"$1"
    mv "$tmpfile" "$STATE_FILE"
}

# Determine which mouse button was pressed
BTN="$1"

# ---------- No state file exists (UNACTIVE) ----------
if [ ! -f "$STATE_FILE" ]; then
    if [ "$BTN" = "1" ]; then
        # Left click: start a 25-minute timer
        rm -f "$NOTIFY_FILE"   # clear old notification sentinel
        write_state "RUNNING=true
START_TIME=$(date +%s)
DURATION=1500
PAUSED=false"
    fi
    # Right click does nothing in UNACTIVE
    exit 0
fi

# ---------- Read current state ----------
source "$STATE_FILE"

# ---------- STOPPED state ----------
if [ "${RUNNING:-false}" = "false" ]; then
    if [ "$BTN" = "3" ]; then
        # Right click: reset → go back to UNACTIVE (remove file)
        rm -f "$STATE_FILE" "$NOTIFY_FILE"
    fi
    # Left click does nothing when stopped
    exit 0
fi

# ---------- RUNNING or PAUSED state ----------
case "$BTN" in
    1)  # Left click → toggle pause
        if [ "${PAUSED:-false}" = "true" ]; then
            # Unpause: restart from the frozen remaining time
            NOW=$(date +%s)
            REMAINING="${REMAINING_AT_PAUSE:-0}"
            NEW_START=$((NOW - (DURATION - REMAINING)))
            write_state "RUNNING=true
START_TIME=$NEW_START
DURATION=$DURATION
PAUSED=false"
        else
            # Pause: freeze the remaining time
            NOW=$(date +%s)
            ELAPSED=$((NOW - START_TIME))
            REMAINING=$((DURATION - ELAPSED))
            [ "$REMAINING" -lt 0 ] && REMAINING=0
            write_state "RUNNING=true
PAUSED=true
REMAINING_AT_PAUSE=$REMAINING
DURATION=$DURATION"
        fi
        ;;
    3)  # Right click → stop
        # Go to stopped state
        write_state "RUNNING=false"
        # Do NOT delete the notification sentinel here; it remains so no extra notification fires.
        ;;
esac