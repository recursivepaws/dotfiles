#!/usr/bin/env zsh
session="banyan-develop"

banyan_path="~/Documents/banyan"
cd $banyan_path

core_path="$banyan_path/banyan-core"

tmux new-session -d -s $session

window=1
tmux rename-window -t $session:$window "cli"
tmux send-keys -t $session:$window "cd ~/Documents/banyan/banyan-cli && clear && nvim" C-m

window=2
tmux new-window -t $session:$window -n "core"
tmux send-keys -t $session:$window "cd ~/Documents/banyan/banyan-core && clear && nvim" C-m

window=3
tmux new-window -t $session:$window -n "run"
tmux send-keys -t $session:$window "cd $core_path && clear" C-m

tmux split-window -v -t $session:$window
tmux send-keys -t $session:$window "cd $core_path/crates/banyan-core-service && clear" C-m

tmux split-window -v -t $session:$window
tmux send-keys -t $session:$window "cd $core_path/crates/banyan-staging-service && clear" C-m

tmux split-window -v -t $session:$window
tmux send-keys -t $session:$window "cd $core_path/crates/banyan-staging-service && clear" C-m

tmux select-layout -t $session:$window even-horizontal

tmux attach-session -t $session
