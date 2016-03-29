# Create users.
puts "Creating users..."
User.create(username: "admin", email: "admin@example.com", name: "Admin", password: "123456", role: User.roles[:admin])
User.create(username: "write", email: "write@example.com", name: "Write", password: "123456", role: User.roles[:write])
User.create(username: "read", email: "read@example.com", name: "Read", password: "123456", role: User.roles[:read])
puts "DONE!"
