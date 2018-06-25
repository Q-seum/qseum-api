# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

10.times do
    Membership.create!(
        account: '2-' + Faker::Number.number(10),
        primary_name: Faker::Name.name,
        secondary_name: Faker::Name.name, 
        address: Faker::Address.full_address,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        membership_type: 2,
        join_date: Faker::Date.between(364.days.ago, Date.today)
    )
    end

10.times do
    Membership.create!(
        account: '4-' + Faker::Number.number(10),
        primary_name: Faker::Name.name,
        secondary_name: Faker::Name.name, 
        address: Faker::Address.full_address,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        membership_type: 4,
        join_date: Faker::Date.between(364.days.ago, Date.today)
    )
    end

10.times do
    Membership.create!(
        account: '6-' + Faker::Number.number(10),
        primary_name: Faker::Name.name,
        secondary_name: Faker::Name.name, 
        address: Faker::Address.full_address,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        membership_type: 6,
        join_date: Faker::Date.between(364.days.ago, Date.today)
    )
    end

10.times do
    Membership.create!(
        account: '8-' + Faker::Number.number(10),
        primary_name: Faker::Name.name,
        secondary_name: Faker::Name.name, 
        address: Faker::Address.full_address,
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.email,
        membership_type: 8,
        join_date: Faker::Date.between(364.days.ago, Date.today)
    )
    end
