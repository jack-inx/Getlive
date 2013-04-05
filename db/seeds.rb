# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#puts "Creating admin user....."
#@admin_user = User.new(:email => 'admin@getlive.com', :password => 'admin123', :role => 'admin')
#@admin_user.skip_confirmation!
#@admin_user.save!

p "Creating Countries..."
Country.delete_all
Country.create(:id=>1,:iso=>"CA",:name=>"Canada")
Country.create(:id=>2,:iso=>"US",:name=>"United States")

p "Creating States..."
State.delete_all
State.create(:id=>446,:iso=>"01",:name=>"Alberta",:country_id=>1)
State.create(:id=>447,:iso=>"02",:name=>"British Columbia",:country_id=>1)
State.create(:id=>448,:iso=>"03",:name=>"Manitoba",:country_id=>1)
State.create(:id=>449,:iso=>"04",:name=>"New Brunswick",:country_id=>1)
State.create(:id=>450,:iso=>"13",:name=>"Northwest Territories",:country_id=>1)
State.create(:id=>451,:iso=>"07",:name=>"Nova Scotia",:country_id=>1)
State.create(:id=>452,:iso=>"14",:name=>"Nunavut",:country_id=>1)
State.create(:id=>453,:iso=>"08",:name=>"Ontario",:country_id=>1)
State.create(:id=>454,:iso=>"09",:name=>"Prince Edward Island",:country_id=>1)
State.create(:id=>455,:iso=>"10",:name=>"Quebec",:country_id=>1)
State.create(:id=>456,:iso=>"11",:name=>"Saskatchewan",:country_id=>1)
State.create(:id=>457,:iso=>"12",:name=>"Yukon",:country_id=>1)
State.create(:id=>458,:iso=>"05",:name=>"Newfoundland and Labrador",:country_id=>1)

State.create(:id=>3510,:iso=>"AR",:name=>"Arkansas",:country_id=>2)
State.create(:id=>3511,:iso=>"DC",:name=>"Washington, D.C.",:country_id=>2)
State.create(:id=>3512,:iso=>"DE",:name=>"Delaware",:country_id=>2)
State.create(:id=>3513,:iso=>"FL",:name=>"Florida",:country_id=>2)
State.create(:id=>3514,:iso=>"GA",:name=>"Georgia",:country_id=>2)
State.create(:id=>3515,:iso=>"KS",:name=>"Kansas",:country_id=>2)
State.create(:id=>3516,:iso=>"LA",:name=>"Louisiana",:country_id=>2)
State.create(:id=>3517,:iso=>"MD",:name=>"Maryland",:country_id=>2)
State.create(:id=>3518,:iso=>"MO",:name=>"Missouri",:country_id=>2)
State.create(:id=>3519,:iso=>"MS",:name=>"Mississippi",:country_id=>2)
State.create(:id=>3520,:iso=>"NC",:name=>"North Carolina",:country_id=>2)
State.create(:id=>3521,:iso=>"OK",:name=>"Oklahoma",:country_id=>2)
State.create(:id=>3522,:iso=>"SC",:name=>"South Carolina",:country_id=>2)
State.create(:id=>3523,:iso=>"TN",:name=>"Tennessee",:country_id=>2)
State.create(:id=>3524,:iso=>"TX",:name=>"Texas",:country_id=>2)
State.create(:id=>3525,:iso=>"WV",:name=>"West Virginia",:country_id=>2)
State.create(:id=>3526,:iso=>"AL",:name=>"Alabama",:country_id=>2)
State.create(:id=>3527,:iso=>"CT",:name=>"Connecticut",:country_id=>2)
State.create(:id=>3528,:iso=>"IA",:name=>"Iowa",:country_id=>2)
State.create(:id=>3529,:iso=>"IL",:name=>"Illinois",:country_id=>2)
State.create(:id=>3530,:iso=>"IN",:name=>"Indiana",:country_id=>2)
State.create(:id=>3531,:iso=>"ME",:name=>"Maine",:country_id=>2)
State.create(:id=>3532,:iso=>"MI",:name=>"Michigan",:country_id=>2)
State.create(:id=>3533,:iso=>"MN",:name=>"Minnesota",:country_id=>2)
State.create(:id=>3534,:iso=>"NE",:name=>"Nebraska",:country_id=>2)
State.create(:id=>3535,:iso=>"NH",:name=>"New Hampshire",:country_id=>2)
State.create(:id=>3536,:iso=>"NJ",:name=>"New Jersey",:country_id=>2)
State.create(:id=>3537,:iso=>"NY",:name=>"New York",:country_id=>2)
State.create(:id=>3538,:iso=>"OH",:name=>"Ohio",:country_id=>2)
State.create(:id=>3539,:iso=>"RI",:name=>"Rhode Island",:country_id=>2)
State.create(:id=>3540,:iso=>"VT",:name=>"Vermont",:country_id=>2)
State.create(:id=>3541,:iso=>"WI",:name=>"Wisconsin",:country_id=>2)
State.create(:id=>3542,:iso=>"CA",:name=>"California",:country_id=>2)
State.create(:id=>3543,:iso=>"CO",:name=>"Colorado",:country_id=>2)
State.create(:id=>3544,:iso=>"NM",:name=>"New Mexico",:country_id=>2)
State.create(:id=>3545,:iso=>"NV",:name=>"Nevada",:country_id=>2)
State.create(:id=>3546,:iso=>"UT",:name=>"Utah",:country_id=>2)
State.create(:id=>3547,:iso=>"AZ",:name=>"Arizona",:country_id=>2)
State.create(:id=>3548,:iso=>"ID",:name=>"Idaho",:country_id=>2)
State.create(:id=>3549,:iso=>"MT",:name=>"Montana",:country_id=>2)
State.create(:id=>3550,:iso=>"ND",:name=>"North Dakota",:country_id=>2)
State.create(:id=>3551,:iso=>"OR",:name=>"Oregon",:country_id=>2)
State.create(:id=>3552,:iso=>"SD",:name=>"South Dakota",:country_id=>2)
State.create(:id=>3553,:iso=>"WA",:name=>"Washington",:country_id=>2)
State.create(:id=>3554,:iso=>"WY",:name=>"Wyoming",:country_id=>2)
State.create(:id=>3555,:iso=>"HI",:name=>"Hawaii",:country_id=>2)
State.create(:id=>3556,:iso=>"AK",:name=>"Alaska",:country_id=>2)
State.create(:id=>3557,:iso=>"KY",:name=>"Kentucky",:country_id=>2)
State.create(:id=>3558,:iso=>"MA",:name=>"Massachusetts",:country_id=>2)
State.create(:id=>3559,:iso=>"PA",:name=>"Pennsylvania",:country_id=>2)
State.create(:id=>3560,:iso=>"VA",:name=>"Virginia",:country_id=>2)
p "Done Creating Countries and States."