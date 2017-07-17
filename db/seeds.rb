#create users
u0 = User.create!(name: "Leia", rank: "Princess")
u1 = User.create!(name: "Luke Skywalker", rank: "Jedi")
u2 = User.create!(name: "Obiwan", rank: "Jedi")
u3 = User.create!(name: "Darth Vader", rank: "Lord")
u4 = User.create!(name: "Finn", rank: "Storm Trooper")

#create categories
c1 = Category.create!(name: "Battle Plans")
c2 = Category.create!(name: "Maintenance")
c3 = Category.create!(name: "Wookie Problems")
c4 = Category.create!(name: "Intergalactic Domination")
c5 = Category.create!(name: "Sprint Planning")
c6 = Category.create!(name: "Battle Plans")
c7 = Category.create!(name: "Misc")
c8 = Category.create!(name: "Jedis")

#create surveys
Survey.create!(question: "Is Samuel L. Jackson your favorite jedi?", category: c8, user: u2)
Survey.create!(question: "Are you our only hope?", category: c4, user: u3)
Survey.create!(question: "Should we clear the tentacle monster infestation from the trash compactors?", category: c2, user: u4)
Survey.create!(question: "Should we book a new band for the cantina?", category: c7, user: u0)
Survey.create!(question: "Is BB-8 your favorite robot?", category: c6, user: u0)
Survey.create!(question: "Is Luke's call signal on Hoth Echo 7?", category: c7, user: u0)
Survey.create!(question: "Do wookies like cookies?", category: c3, user: u1)
Survey.create!(question: "Are red lightsabers more powerful than green?", category: c1, user: u0)
Survey.create!(question: "Do you think the Death Star is production ready?", category: c5, user: u0)
Survey.create!(question: "Do ewoks have fleas?", category: c7, user: u0)
Survey.create!(question: "Are you one with the force?", category: c8, user: u0)
Survey.create!(question: "Do you think we can use parts from the Oakland shipyard cranes to fix the AT-ATs?", category: c2, user: u1)

#create responses
User.all.each do |u|
  Survey.order("RANDOM()").limit(5).each do |s|
    u.responses.create!(survey: s, answer: [0, 1].sample)
  end
end

Survey.reindex
