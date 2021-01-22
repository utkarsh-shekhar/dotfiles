#!/bin/bash

session_one="tc"
session_two="serp"

cd ~/Documents/tapclicks

if [[ $1 = '' ]] || [[ $1 = 'tc' ]]; then
  # Check if the session exists, discarding output
  # We can check $? for the exit status (zero for success, non-zero for failure)
  tmux has-session -t $session_one>/dev/null

  if [[ $? != 0 ]]; then
    localip=$(ip addr | grep 192. | tr '/' ' ' | awk '{ print $2 }')
    host="http://$localip:8080/"
    substitute="SERP_SERVICE_BASE_API=$host"

    cat .env | tr '\n' ' ' | awk "{sub(/SERP_SERVICE_BASE_API=.\S+/, \"${substitute}\"); print $1}" | tr ' ' '\n' > temp
    mv temp .env
    rm temp
    echo "Added SERP IP"

    ./docker/start.cmd

    # Set up your session
    tmux new-session -d -s $session_one

    tmux new-window
    tmux send-keys './docker/exec.cmd' Enter
    tmux rename-window 'docker'

    tmux new-window
    tmux send-keys './docker/exec.cmd' Enter
    tmux send-keys 'cd client/grok' Enter
    tmux send-keys 'yarn && yarn serve-light' Enter
    tmux rename-window 'webpack'

    tmux new-window
    tmux send-keys 'cd client/grok' Enter
    tmux send-keys 'vim' Enter
    tmux rename-window 'nvim-client'

    tmux new-window
    tmux send-keys 'cd server' Enter
    tmux send-keys 'vim' Enter
    tmux rename-window 'nvim-server'

    tmux new-window
    tmux send-keys './docker/exec.cmd' Enter
    tmux send-keys 'tail -f /var/log/tcworker/worker.log' Enter
    tmux rename-window 'logs-worker'

    tmux new-window
    tmux send-keys './docker/exec.cmd' Enter
    tmux send-keys "mysql -uroot -p'!Montreal' cust_docker -h mysqldb -A" Enter
    tmux rename-window 'mysql'

    tmux select-window -t "$session_one:1"
  fi
fi

if [[ $1 = '' ]] || [[ $1 = 'serp' ]]; then
  tmux has-session -t $session_two>/dev/null
  if [[ $? != 0 ]]; then
    cd microservices/SerpTracker

    tmux new-session -d -s $session_two

    tmux send-keys './dev-env' Enter

    tmux new-window
    tmux send-keys './dev-env bash' Enter
    tmux rename-window 'docker'

    tmux new-window
    tmux send-keys 'vim' Enter
    tmux rename-window 'nvim'

    tmux select-window -t "$session_two:1"
  fi
fi

if [[ $1 = 'stop' ]]; then
  cd ~/Documents/tapclicks
  ./docker/stop.cmd

  cd ~/Documents/tapclicks/microservices/SerpTracker
  ./dev-env stop
fi

if [[ $1 = '' ]] || [[ $1 = 'tc' ]]; then
  tmux a -t $session_one
elif [[ $1 = 'serp' ]]; then
  tmux a -t $session_two
fi
