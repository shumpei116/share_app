user1 = User.create!( name: "sample_user",
                      email: "sample@example.com",
                      introduction: "hello_room",
                      password: "foobar",
                      password_confirmation: "foobar" )
user1.image.attach(io: File.open(Rails.root.join('app/assets/images/cover_top.jpg')),
filename: 'cover_top.jpg')

5.times do |n|
  name = "sample_user#{n+1}"
  email = "sample#{n+1}@example.com"
  introduction = "hello_room_#{n+1}"
  password =  "foobar"
  password_confirmation = "foobar"
  user2 = User.create!( name:      name,
                        email:     email,
                        introduction: introduction,
                        password:  password,
                        password_confirmation: password_confirmation)
  user2.image.attach(io: File.open(Rails.root.join('app/assets/images/cover_top.jpg')),
  filename: 'cover_top.jpg')
end

user = User.first
5.times do |n|
  room_name =         "test_room#{n}"
  room_introduction = "hello_room #{n}"
  room_fee =          "#{1000 + n}"
  room_address =       "test_room_address#{n}"
  room = user.rooms.create!( room_name: room_name,
                             room_introduction: room_introduction,
                             room_fee: room_fee,
                             room_address: room_address
                             )
  room.image.attach(io: File.open(Rails.root.join('app/assets/images/cover_top.jpg')),
  filename: 'cover_top.jpg')
end