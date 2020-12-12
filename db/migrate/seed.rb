dan = User.create(first_name: "Dan",user_name:"dan1", email: "dan@dan.com", password: "123", favorite_wine: "Malbec")
mary = User.create(first_name: "Mary",user_name:"mary1", email: "mary@mary.com", password: "123", favorite_wine: "Cabernet Sauvignon")
keisha = User.create(first_name: "Kesiha",user_name:"keisha1", email: "keisha@keisha.com", password: "123", favorite_wine: "Petillant Naturel")
marco = User.create(first_name: "Marco",user_name:"marco1", email: "marco@marco.com", password: "123", favorite_wine: "Pinot Noir")

Review.create(wine_name: "Chateau du moulin-a-vent", rating: 5, comment:"delicious", user_id:dan.id)
Review.create(wine_name: "Acadie", rating: 3, comment:"not bad - good value", user_id:mary.id)
Review.create(wine_name: "Botego Norton Reserve", rating: 2, comment:"it was ok", user_id:keisha.id)
Review.create(wine_name: "Pull Red Wine Blend", rating: 4, comment:"dry but good", user_id:marco.id)
Review.create(wine_name: "Channing Daughters Bianco Pettilant ", rating: 5, comment:"This was delicious. I can't wait to try more!", user_id:keisha.id)


# Wine.create(name: "Chateau du moulin-a-vent", year: 2018, varietal: "beaujolais nouveau", note:"delicious", user_id:dan.id)
# Wine.create(name: "Acadie", year: 2018, varietal: "pinot noir", note:"full-bodied", user_id:mary.id)
# Wine.create(name: "Botego Norton Reserve", year: 2017, varietal: "malbec", note:"tasty", user_id:mary.id)
# Wine.create(name: "Pull Red Wine Blend", year: 2017, varietal: "red wine blend", note:"satisfying", user_id:mary.id)