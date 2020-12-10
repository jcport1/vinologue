#Here is where I will add the seed date for my program

dan = User.create(user_name:"dan", email: "dan@dan.com", password: "Netflix")
mary = User.create(user_name:"mary", email: "mary@mary.com", password: "Hulu")

Wine.create(name: "Chateau du moulin-a-vent", year: 2018, varietal: "beaujolais nouveau", note:"delicious", user_id:dan.id)
Wine.create(name: "Acadie", year: 2018, varietal: "pinot noir", note:"full-bodied", user_id:mary.id)
Wine.create(name: "Botego Norton Reserve", year: 2017, varietal: "malbec", note:"tasty", user_id:mary.id)
Wine.create(name: "Pull Red Wine Blend", year: 2017, varietal: "red wine blend", note:"satisfying", user_id:mary.id)
