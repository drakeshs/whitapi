# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/panzer/workspace/whiston/whitsonwatt_api"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/panzer/workspace/whiston/whitsonwatt_api/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/panzer/workspace/whiston/whitsonwatt_api/log/unicorn.log"
stdout_path "/home/panzer/workspace/whiston/whitsonwatt_api/log/unicorn.log"

# Number of processes
# Rule of thumb: 2x per CPU core available
worker_processes 4
# worker_processes 2

# Time-out
timeout 30

unicorn_rails worker[0] -l0.0.0.0:8080 must be run inside RAILS_ROOT: #<LoadError: cannot load such file -- /home/panzer/workspace/whiston/whitsonwatt_api/log/config/boot>
