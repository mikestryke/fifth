User1= User.create(name: "Luke", email: 'luke@gmail.com', password: '12345678')
User2 = User.create(name: "Han Solo", email: 'han@gmail.com', password: '12345678')
User3 = User.create(name: "Leia", email: 'leia@gmail.com', password: '12345678')
User4 = User.create(name: "Boba Fett", email: 'boba@gmail.com', password: '12345678')
User5 = User.create(name: "Emperor", email: 'emperor@gmail.com', password: '12345678')

Secret1 = Secret.create(description: "The force is strong is my family.", user: User.third)
Secret2 = Secret.create(description: "Never tell me the odds.", user: User.find(4)) 
Secret3 = Secret.create(description: "May the force be with you.", user: User.find(3)) 

like1 = Like.create(user: User.find(1), secret: Secret.find(1))
like2 = Like.create(user: User.find(2), secret: Secret.find(2))
like3 = Like.create(user: User.find(3), secret: Secret.find(3))