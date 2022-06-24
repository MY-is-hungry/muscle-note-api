namespace :db do
  desc "dbをresetし、その後seedを実行する"
  task :reset_with_seed do
    system("rails db:migrate:reset")
    system("rails db:seed")
  end
end
