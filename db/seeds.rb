User.create!( name: "sample_user",
              email: "sample@example.com",
              introduction: "hello_room",
              password: "foobar",
              password_confirmation: "foobar" )

5.times do |n|
  name = "sample_user#{n+1}"
  email = "sample#{n+1}@example.com"
  introduction = "hello_room_#{n+1}"
  password =  "foobar"
  password_confirmation = "foobar"
  User.create!( name:      name,
                email:     email,
                introduction: introduction,
                password:  password,
                password_confirmation: password_confirmation)
end

user = User.first
5.times do |n|
  room_name =         "test_room#{n}"
  room_introduction = "hello_room #{n}"
  room_fee =          "#{1000 + n}"
  room_address =       "test_room_address#{n}"
  room_image =        "test_image #{n}"
  user.rooms.create!( room_name: room_name,
                     room_introduction: room_introduction,
                     room_fee: room_fee,
                     room_address: room_address,
                     room_image: room_image
                     )
end