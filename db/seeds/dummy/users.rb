
user_attr = {
  uid: ENV['DEV_USER_ID'],
  status: 'active',
  authentication_type: 'apple'
}

user = User.find_or_initialize_by(user_attr)
user.save!