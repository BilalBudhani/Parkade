namespace :puma do
  desc 'Restart Puma'
  task :restart do
    on roles fetch(:puma_roles) do |role|
      execute :sudo, "systemctl", "restart", fetch(:puma_service_unit_name)
    end
  end

  desc 'Stop puma'
  task :stop do
    on roles fetch(:puma_roles) do |role|
      execute :sudo, "systemctl", "stop", fetch(:puma_service_unit_name)
    end
  end

  desc 'Start puma'
  task :start do
    on roles fetch(:puma_roles) do |role|
      execute :sudo, "systemctl", 'start', fetch(:puma_service_unit_name)
    end
  end

  after 'deploy:finished', 'puma:restart'
end
