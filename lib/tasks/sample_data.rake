namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
  
  def make_users
    admin = User.create!(name: "Freddy Rodriguez",
                 username: "kangomedia",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
  end
end