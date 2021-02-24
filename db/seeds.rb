# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
	[
		{
			name: 'Adam',
			user_name: 'adammmm',
			email: 'a@a',
			profile_image: File.open('./app/assets/images/no_image.jpg'),
	    password:'aaaaaa'
		},
		{
			name: 'Beck',
			user_name: 'itsbeck',
			email: 'b@b',
			profile_image: File.open('./app/assets/images/no_image.jpg'),
			password: 'aaaaaa'
		},
		{
			name: 'Coney',
			user_name: 'coney123',
			email: 'c@c',
			profile_image: File.open('./app/assets/images/no_image.jpg'),
			password: 'aaaaaa'
		},
		{
			name: 'David',
			user_name: 'davi',
			email: 'd@d',
			profile_image: File.open('./app/assets/images/no_image.jpg'),
			password: 'aaaaaa'
		}
	]
)