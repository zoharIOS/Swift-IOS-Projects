//tests
let u1 = UserController(), u2 = UserController()

//user 2 - Groot
u2.set(id: 2)
u2.set(name: "Groot")
u2.send("I am Groot", to: 1)
u2.send("I am Groot?!", to: 1)
u2.send("I am Groot...", to: 1)

//user 1 - Bubu
u1.set(id: 1)
u1.set(name: "Bubu")
u1.send("Hey dude", to: 2)

u1.reloadView()
