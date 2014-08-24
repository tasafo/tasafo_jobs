namespace :generate_user_setting do
  task :run => :environment do
    User.all.each do |user|
      user.create_setting if user.setting.blank?
    end
  end
end