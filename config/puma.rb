# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_min = Integer(ENV['MIN_THREADS'] || 5)
threads_max = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_min, threads_max
preload_app!

# Specifies the `port` that Puma will listen on to receive requests, default is 3000.
#

# Specifies the `environment` that Puma will run in.
#
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'
# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
 workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory. If you use this option
# you need to make sure to reconnect any threads in the `on_worker_boot`
# block.

# The code in the `on_worker_boot` will be called if you are using
# clustered mode by specifying a number of `workers`. After each worker
# process is booted this block will be run, if you are using `preload_app!`
# option you will want to use this block to reconnect to any threads
# or connections that may have been created at application boot, Ruby
# cannot share connections between processes.
#
before_fork do
    puts "Puma master process about to fork. Closing existing Active record connections."
    ActiveRecord::Base.connection_pool.disconnect!
    require 'puma_worker_killer'
    PumaWorkerKiller.config do |config|
        config.ram           = 522 # mb
        config.frequency     = 5    # seconds
        config.percent_usage = 0.98
        config.rolling_restart_frequency = 12 * 3600 # 12 hours in seconds
        config.reaper_status_logs = true # setting this to false will not log lines like:
        # PumaWorkerKiller: Consuming 54.34765625 mb with master and 2 workers.
    end

    PumaWorkerKiller.start
    
end

on_worker_boot do
    ActiveSupport.on_load(:active_record) do
        config = ActiveRecord::Base.configurations[Rails.env] || Rails.application.config.database_configuration[Rails.env]
        config['pool'] = ENV['RAILS_MAX_THREADS'] || 5
        ActiveRecord::Base.establish_connection(config)
    end

end

lowlevel_error_handler do |e|
    [500, {}, ["A ocurrido un error, y los ingenieron deben ser informados. Porfavor recargue la pagina. Si continua con el problema, contacte a contacto@konsigue.com,"]]
end



# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
