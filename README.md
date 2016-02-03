##Sessions:
configure do
  set :root, APP_ROOT.to_path

  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  set :views, File.join(Sinatra::Application.root, "app", "views")
end

require 'faker'

desc "Reset database"
task :reset do
  system "rake db:drop && rake db:create && rake db:migrate"
end


jquery scripts:


  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="/js/application.js"></script>
