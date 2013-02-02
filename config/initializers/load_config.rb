if ENV['TR_SECRET']
  TASKRABBIT[:secret] = ENV['TR_SECRET']
  TASKRABBIT[:key] = ENV['TR_key']
  TASKRABBIT[:url] = ENV['TR_url']
else
  TASKRABBIT = HashWithIndifferentAccess.new(YAML.load_file("#{Rails.root}/config/taskrabbit.yml"))
end

Taskrabbit.configure do |config|
  config.api_secret = TASKRABBIT[:secret]
  config.api_key    = TASKRABBIT[:key]
  config.base_uri   = TASKRABBIT[:url]
  config.endpoint   = 'api/v2'
end