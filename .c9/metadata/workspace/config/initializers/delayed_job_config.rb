{"filter":false,"title":"delayed_job_config.rb","tooltip":"/config/initializers/delayed_job_config.rb","undoManager":{"mark":0,"position":0,"stack":[[{"start":{"row":0,"column":0},"end":{"row":8,"column":84},"action":"insert","lines":["Delayed::Worker.destroy_failed_jobs = false","Delayed::Worker.sleep_delay = 60","Delayed::Worker.max_attempts = 3","Delayed::Worker.max_run_time = 5.minutes","Delayed::Worker.read_ahead = 10","Delayed::Worker.default_queue_name = 'default'","Delayed::Worker.delay_jobs = !Rails.env.test?","Delayed::Worker.raise_signal_exceptions = :term","Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))"],"id":1}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":8,"column":84},"end":{"row":8,"column":84},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1499459887358,"hash":"8b8bb55445d8985ac3522d3de33fb7d87e305fca"}