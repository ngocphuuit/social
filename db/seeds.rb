# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Category.create([
  {title: 'Laptop',description: 'You can sell or buy Laptop.'},
  {title: 'PC', description: 'You can sell or buy PC.'},
  {title: 'Phone', description: 'HaveYou can sell or buy Laptop Phone.'}
])
