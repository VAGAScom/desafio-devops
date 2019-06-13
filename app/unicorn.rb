@dir = "/opt/vagas/devops/"

worker_processes 2
working_directory @dir

timeout 30

listen "/tmp/unicorn.sock", :backlog => 64

pid "/tmp/unicorn.pid"

stderr_path "/var/log/unicorn/unicorn.stderr.log"
stdout_path "/var/log/unicorn/unicorn.stdout.log"