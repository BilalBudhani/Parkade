namespace :assets do
  desc 'Precompile assets locally and then rsync to web servers'
  task :precompile do
    run_locally do
      with rails_env: "#{fetch(:stage)}" do
        execute 'bundle exec rails assets:precompile'
      end
    end

    on roles(:app), in: :parallel do |server|
      run_locally do
        execute :rsync,
          "-av --delete ./public/packs/ deployer@#{server.hostname}:#{shared_path}/public/packs/"
        execute :rsync,
          "-av --delete ./public/assets/ deployer@#{server.hostname}:#{shared_path}/public/assets/"
      end
    end

    run_locally do
      execute :rm, '-rf public/assets'
      execute :rm, '-rf public/packs'
    end
  end

  after 'deploy:finished', 'assets:precompile'
end