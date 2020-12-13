dan = User.create(first_name: "Dan",user_name:"dan1", email: "dan@dan.com", password: "123", favorite_wine: "Malbec")
mary = User.create(first_name: "Mary",user_name:"mary1", email: "mary@mary.com", password: "123", favorite_wine: "Cabernet Sauvignon")
keisha = User.create(first_name: "Kesiha",user_name:"keisha1", email: "keisha@keisha.com", password: "123", favorite_wine: "Petillant Naturel")
marco = User.create(first_name: "Marco",user_name:"marco1", email: "marco@marco.com", password: "123", favorite_wine: "Pinot Noir")

dan_review = Wine.create(name: "Chateau du moulin-a-vent", year: 2018, varietal: "beaujolais nouveau", wine_style: "sample", note:"delicious")
mary_review = Wine.create(name: "Acadie", year: 2018, varietal: "pinot noir", wine_style: "sample", note:"full-bodied")
keisha_review = Wine.create(name: "Botego Norton Reserve", year: 2017, varietal: "malbec", wine_style: "sample", note:"tasty")
marco_review = Wine.create(name: "Pull Red Wine Blend", year: 2017, varietal: "red wine blend", wine_style: "sample", note:"satisfying")
keisha_review_2 = Wine.create(name: "Channing Daughters Bianco Pettilant", year: 2017, varietal: "red wine blend", wine_style: "sample", note:"satisfying")

Review.create(wine_name: "Chateau du moulin-a-vent", rating: 5, comment:"delicious", user_id:dan.id, wine_id:dan_review.id)
Review.create(wine_name: "Acadie", rating: 3, comment:"not bad - good value", user_id:mary.id, wine_id:mary_review.id)
Review.create(wine_name: "Botego Norton Reserve", rating: 2, comment:"it was ok", user_id:keisha.id, wine_id:keisha_review.id)
Review.create(wine_name: "Pull Red Wine Blend", rating: 4, comment:"dry but good", user_id:marco.id, wine_id:marco_review.id)
Review.create(wine_name: "Channing Daughters Bianco Pettilant ", rating: 5, comment:"This was delicious. I can't wait to try more!", user_id:keisha.id, wine_id:keisha_review_2.id)