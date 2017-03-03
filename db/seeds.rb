# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# create_table "users", force: :cascade do |t|
#   t.string   "username"
#   t.string   "email"
#   t.text     "bio"
#   t.string   "photo_url"
#   t.datetime "created_at",                  null: false
#   t.datetime "updated_at",                  null: false
#   t.integer  "posts_count",     default: 0
#   t.string   "password_digest"
#   t.string   "api_token"
# end
#--------------------------------------
# 5.times do
#
#   name = Faker::LordOfTheRings.character
#   user = User.create(user_name: name,
#                          email: name.gsub(/\s/,'') + ".gmail")
#
#   rand(1..5).times do
#     #-------
#     post = user.posts.create!(
#       title: Faker::Friends.character,
#       body: Faker::Friends.quote,
# #      user_id: user.id    Chris said this isn't needed....
#          )
#
#          rand(1..10).times do
#            post.comments.create!(
#              body: Faker::Hacker.say_something_smart,
#              user: user
#        #      user_id: user.id    Chris said this isn't needed....
#                 )
#          end
#     #-------
#   end
# end

5.times do
  fakename = Faker::LordOfTheRings.character
  User.create!( username:       fakename.gsub(/\s+/, ""),
                    name:       fakename,
                    photo_url:  "tbd",
                    password:   "test")
end
