# From bash

`tmux at`                 # attach to last session
`tmux ls`                 # list sessions
`tmux kill-session -t N`  # delete session id N

# in tmux (`^b` means `ctrl+b`)

`^b ?`         # shortcuts help
`^b %`         # split vertically
`^b "`         # split horizontally
`^b ARROW`     # move between panes
`^b ^ARROW`    # resize pane
`^b z`         # toggle zoom pane
`^b q NUMBER`  # switch to pane by index
`^b SPACEBAR`  # toggle pane layouts
`^b d`         # detach from session

