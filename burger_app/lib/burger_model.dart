class CategoryModel {
  final String title;
  final String emoji;

  CategoryModel({required this.title, required this.emoji});
}

class BurgerModel {
  final String name;
  final String description;
  final double price;
  final double rating;
  final String distance;
  final String imageUrl;
  bool isFavorite;

  BurgerModel(
   {
    required this.rating, 
    required this.distance,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  
}

final List<BurgerModel> burgers = [
  BurgerModel(
    rating: 4.8,
    distance: "1.2 km",
    name: "Chicken  Burger",
    description: "A tender, perfectly seasoned grilled chicken patty layered with creamy melted cheese, fresh crisp lettuce, juicy vine-ripened tomatoes, and crunchy pickles.",
    price: 149.00,
    imageUrl: "https://media.istockphoto.com/id/1273265655/photo/burger-with-fried-chicken-meat-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=iwDZMUYie0zldQBJY6vXjidTqw6rNKrSEnSPszXpJCI=",
  ),
 
  BurgerModel(
    rating: 4.9,
    distance: "800 m",
    name: "Cheese  Burger",
    description: "Loaded with extra cheese, caramelized onions & mayo",
    price: 169.00,
    imageUrl: "https://media.istockphoto.com/id/2148672887/photo/beef-patty-burger-with-vegetables-and-lettuce-on-white-background-file-contains-clipping-path.jpg?s=612x612&w=is&k=20&c=jwNo8FrSfkIcFzn9_0F_eQyEzsaso3XCV39BBQ1tZUE=",
  ),
   BurgerModel(
    rating: 4.6,
    distance: "2.0 km",
    name: "Veggie  Burger",
    description: "Crispy veg patty with fresh veggies and tangy sauce",
    price: 129.00,
    imageUrl: "https://i.pinimg.com/564x/2d/bd/ac/2dbdac24cd052777bec2c4f64ae89f01.jpg",
  ),
  BurgerModel(
    rating: 4.5,
    distance: "1.5 km",
    name: "Spicy Peri Peri Burger",
    description: "Fiery peri-peri sauce, crunchy lettuce & spicy fried patty",
    price: 159.00,
    imageUrl: "https://media.istockphoto.com/id/2148672887/photo/beef-patty-burger-with-vegetables-and-lettuce-on-white-background-file-contains-clipping-path.jpg?s=612x612&w=is&k=20&c=jwNo8FrSfkIcFzn9_0F_eQyEzsaso3XCV39BBQ1tZUE=",
  ),
  BurgerModel(
    rating: 4.7,
    distance: "3.2 km",
    name: "Fish Fillet Burger",
    description: "Crispy fish fillet, tartar sauce & fresh lettuce",
    price: 189.00,
    imageUrl: "https://media.istockphoto.com/id/2148672887/photo/beef-patty-burger-with-vegetables-and-lettuce-on-white-background-file-contains-clipping-path.jpg?s=612x612&w=is&k=20&c=jwNo8FrSfkIcFzn9_0F_eQyEzsaso3XCV39BBQ1tZUE=",
  ),
];


List<CategoryModel> categories = [
  CategoryModel(title: "Chicken Burger", emoji: "🍗"),
  CategoryModel(title: "Veggie Burger", emoji: "🥦"),
  CategoryModel(title: "Cheese Burger", emoji: "🧀"),
  CategoryModel(title: "Spicy Burger", emoji: "🌶️"),
  CategoryModel(title: "Fish Burger", emoji: "🐟"),
];
