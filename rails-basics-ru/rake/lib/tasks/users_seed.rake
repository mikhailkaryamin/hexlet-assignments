require 'csv'

namespace :hexlet do
  desc 'Create users from CSV'
  task :import_users, [:path] => :environment do |t, args|
    path_csv = args[:path]
    users = CSV.parse(File.read(path_csv), headers: true)

    users.each do |user|
      User.create!(
        birthday: Date.strptime(user['birthday'], '%m/%d/%Y'),
        first_name: user['first_name'],
        last_name: user['last_name'],
        email: user['email']
      )
    end
  end
end
