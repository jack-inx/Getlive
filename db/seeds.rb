# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Creating admin user....."
@admin_user = User.new(:email => 'admin@getlive.com', :password => 'admin123', :role => 'admin')
@admin_user.skip_confirmation!
@admin_user.save!