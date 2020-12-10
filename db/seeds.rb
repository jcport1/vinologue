#Here is where I will add the seed date for my program

diana = User.create(user_name:"diana1", email: "diana@spencer.uk", password: "Netflix")
kate = User.create(user_name:"kate", email: "kate@windsor.uk", password: "Hulu")

Wine.create(name: "Beaujolais Nouveau", year: 2018, varietal: "white blend", note:"delicious", user_id:diana.id)
Wine.create(name: "Malbec", year: 2017, varietal: "malbec", note:"full-bodied", user_id:kate.id)