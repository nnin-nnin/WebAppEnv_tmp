# frozen_string_literal: true

u = User.find_by(username: "admin")
if u.nil?
  puts "Creating initial admin user..."
  u = User.build(
    username: "admin",
    email: "admin@example.com",
    password: "AdminPassword123!",
    password_confirmation: "AdminPassword123!"
  )
  u.getting_started = false
  u.save!
  u.seed_aspects
  Role.add_admin(u.person)
  puts "Admin user created successfully! ID: #{u.id}, Person ID: #{u.person_id}"
else
  puts "Admin user already exists."
  Role.add_admin(u.person) unless Role.is_admin?(u.person)
end
