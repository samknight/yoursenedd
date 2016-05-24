# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

parties = 5.times.map { |i| Party.create(name: "#{ Faker::Company.name } Party") }

60.times do |i|
  member = Member.new(
    forename: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    photo: Faker::Placeholdit.image("50x50"),
    external_id: i
  )

  constituency = Constituency.create(
    name: Faker::Address.city
  )

  member.representations.new(constituency: constituency, log_date: Date.today)
  member.memberships.new(party: parties.sample, log_date: Date.today)
  member.save
end

10.times do |i|
  number_of = i % 2
  debate = Debate.new(
    name: Faker::Lorem.sentence(3),
    log_date: number_of.days.ago
  )

  20.times do
    debate.speeches.new(
      member: Member.all.sample,
      log_date: number_of.days.ago,
      content: Faker::Lorem.paragraph
    )
  end

  debate.save
end

User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
