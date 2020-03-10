# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Base Channels
# Todo - Improvement will be to include it in a separate seed file of channels.

puts 'Seeding Channel Data'

sony_six = Channel.find_or_create_by(name: 'Sony Six')
ten_sports = Channel.find_or_create_by(name: 'Ten Sports')
hbo = Channel.find_or_create_by(name: 'HBO')
discovery = Channel.find_or_create_by(name: 'Discovery')

# Seed Base TVShows
# Todo - Improvement will be to include it in a separate seed file of tv_shows.

puts 'Seeding Tv Shows Data'

TvShow.find_or_create_by(channel_id: sony_six.id, code: 123, name: 'La Liga Show', start_at: '09:00', end_at: '09:30', repeats_on: '0,1,2,3,4,5,6')
TvShow.find_or_create_by(channel_id: sony_six.id, code: 124, name: 'Bundes Liga Show', start_at: '10:00', end_at: '10:30', repeats_on: '0,1,2,3,4')
TvShow.find_or_create_by(channel_id: ten_sports.id, code: 223, name: 'Cricket Extra', start_at: '09:00', end_at: '09:30', repeats_on: '0,1,2,3,4,5,6')
TvShow.find_or_create_by(channel_id: ten_sports.id, code: 224, name: 'Badminton Show', start_at: '10:00', end_at: '10:30', repeats_on: '0,1,2,3,4')
TvShow.find_or_create_by(channel_id: ten_sports.id, code: 225, name: 'WWE', start_at: '15:00', end_at: '15:30', repeats_on: '0,1,2,3,4,5,6')
TvShow.find_or_create_by(channel_id: ten_sports.id, code: 226, name: 'F1 Pro Season', start_at: '15:30', end_at: '16:30', repeats_on: '0,1,2,3,4')
TvShow.find_or_create_by(channel_id: hbo.id, code: 323, name: 'Game Of Thrones', start_at: '09:00', end_at: '10:00', repeats_on: '0,1,2,3')
TvShow.find_or_create_by(channel_id: hbo.id, code: 324, name: 'Breaking Bad', start_at: '10:00', end_at: '11:00', repeats_on: '0,1,2,3,4')
TvShow.find_or_create_by(channel_id: discovery.id, code: 423, name: 'Man vs Wild', start_at: '09:00', end_at: '10:00', repeats_on: '0,1,2,3,4')
TvShow.find_or_create_by(channel_id: discovery.id, code: 424, name: 'Next Level Tech', start_at: '10:00', end_at: '11:00', repeats_on: '0,1,2,3,4')
TvShow.find_or_create_by(channel_id: discovery.id, code: 425, name: 'Untold Stories', start_at: '16:00', end_at: '15:00', repeats_on: '0,1,2,3,4')

puts 'Seeding Successful!!'
