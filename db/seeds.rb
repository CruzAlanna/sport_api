User.create(name: "Alanna", email: "alanna@mail.com", password: "pass", role: "user")

User.create(name: "regular-user", email: "regular@test.com", password: "passwordu", role: "user")

User.create(name: "admin-user", email: "admin@test.com", password: "passworda", role: "admin")

User.create(name: "user-to-promote", email: "futureadmin@mail.com", password: "makemeadmin", role: "user")

Team.create(name: "Red Team", user_id: 3)

Team.create(name: "Green Team", user_id: 1)

Player.create(name: "Polo", team_id: 2)
Player.create(name: "Marco", team_id: 2)

Player.create(name: "Susan", team_id: 1)
Player.create(name: "Constantine", team_id: 1)