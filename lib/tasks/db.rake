namespace :db do
  namespace :seed do
    namespace :dummy do
      Dir[Rails.root.join('db', 'seeds', 'dummy', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb')
        desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/dummy/*.rb`"
        task task_name.to_sym => :environment do
          load(filename) if File.exist?(filename)
        end
      end
    end
  end

  task :reset_with_seed do
    system("rails db:migrate:reset")
    system("rails db:seed:dummy:all")
  end
end