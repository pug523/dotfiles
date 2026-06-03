function wn() {
    local start_time=$SECONDS
    local cmd="$@"
    echo "Running: $cmd"
    eval "$cmd"
    local st=$?
    local end_time=$SECONDS
    local elapsed=$(( end_time - start_time ))

    if (( elapsed < 10 && st == 0 )); then
        return 0
    fi
    local duration=""
    if (( elapsed >= 3600 )); then
        duration+="$(( elapsed / 3600 ))h "
    fi
    if (( elapsed >= 60 )); then
       duration+="$(( (elapsed % 3600) / 60 ))m "
    fi
    duration+="$(( elapsed % 60 ))s"

    # local emoji="✅"
    # [ $st -ne 0 ] && emoji="❌"

    wnoti \
	--profile "default" \
        --status $st \
        --title "Task Finished" \
        "Command: \`$cmd\`
Duration: **$duration**
Exit Status: $st"

    wnoti \
	--profile "slack" \
        --status $st \
        --title "Task Finished" \
        "Command: \`$cmd\`
Duration: $duration
Exit Status: $st"
}
