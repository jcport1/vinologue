dan = User.create(first_name: "Dan",user_name:"dan1", email: "dan@dan.com", password: "123", favorite_wine: "Malbec")
mary = User.create(first_name: "Mary",user_name:"mary1", email: "mary@mary.com", password: "123", favorite_wine: "Cabernet Sauvignon")
keisha = User.create(first_name: "Kesiha",user_name:"keisha1", email: "keisha@keisha.com", password: "123", favorite_wine: "Petillant Naturel")
marco = User.create(first_name: "Marco",user_name:"marco1", email: "marco@marco.com", password: "123", favorite_wine: "Pinot Noir")

type1 = WineType.create(name: "white wine")
type2 = WineType.create(name: "red wine")
type3 = WineType.create(name: "red wine")
type4 = WineType.create(name: "red wine")
type5 = WineType.create(name: "sparkling")

Wine.create(name: "Chateau du moulin-a-vent", year: 2018, varietal: "beaujolais nouveau", rating: 5, comment:"delicious", user_id:dan.id, wine_type_id:type1.id)
Wine.create(name: "Acadie", year: 2018, varietal: "pinot noir", rating: 3, comment:"full-bodied", user_id:mary.id, wine_type_id:type2.id)
Wine.create(name: "Botego Norton Reserve", year: 2017, varietal: "malbec", rating: 4, comment:"tasty", user_id:keisha.id, wine_type_id:type3.id)
Wine.create(name: "Pull Red Wine Blend", year: 2017, varietal: "red wine blend", rating: 2, comment:"satisfying", user_id:marco.id, wine_type_id:type4.id)
Wine.create(name: "Channing Daughters Bianco Pettilant", year: 2017, varietal: "pettilant natural", rating: 3, comment:"satisfying", user_id:keisha.id, wine_type_id:type5.id)

