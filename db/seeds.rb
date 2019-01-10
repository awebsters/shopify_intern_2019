# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(title: 'White Shirt', price: 19.99, inventory_count: 10)
Product.create(title: 'Black Shirt', price: 19.99, inventory_count: 10)
Product.create(title: 'Basic Jeans', price: 59.99, inventory_count: 25)
Product.create(title: 'Basic Sweater', price: 59.99, inventory_count: 25)
Product.create(title: 'Basic Jacket', price: 79.99, inventory_count: 5)