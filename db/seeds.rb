# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CITIES = %w(Амстердам Берлин Варшава Ватикан Дублин Загреб Кишинёв Лиссабон Лондон Мадрид Москва Париж Прага Рим Стокгольм Хельсинки)
CATEGORIES = %w(Городская Историческая Природная Горная Развлекательная Автобусная Пешеходная Обзорная)
CITIES.each{|name| City.create(name: name)}
CATEGORIES.each{|name| Category.create(name: name)}

50.times do
  tour = Tour.new(title: FFaker::Lorem.sentence)
  tour.description = FFaker::Lorem.paragraph if rand(100) < 70
  tour.published = true if rand(100) < 90
  tour.city = City.limit(10).sample
  tour.categories = Category.all.sample(rand(1..4)).uniq
  tour.save
end