#!/bin/sh

session_one="tc"
session_two="serp"

cd ~/Documents/tapclicks

# Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
tmux has-session -t $session_one>/dev/null

if [ $? != 0 ]; then
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

tmux has-session -t $session_two>/dev/null
if [ $? != 0 ]; then
  tmux new-session -d -s $session_two

  tmux send-keys 'cd microservices/SerpTracker/ && ./dev-env' Enter
fi

tmux a -t $session_one
