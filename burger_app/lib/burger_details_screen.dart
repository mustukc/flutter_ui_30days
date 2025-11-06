import 'package:burger_app/burger_model.dart';
import 'package:flutter/material.dart';

class BurgerDetailsScreen extends StatefulWidget {
  final BurgerModel burger;
  const BurgerDetailsScreen({super.key, required this.burger});

  @override
  State<BurgerDetailsScreen> createState() => _BurgerDetailsScreenState();
}

class _BurgerDetailsScreenState extends State<BurgerDetailsScreen> {
  int totalItem = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      "Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.burger.isFavorite = !widget.burger.isFavorite;
                        });
                      },
                      icon: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                Center(
                  child: Hero(
                    tag: widget.burger.name,
                  child: Image.network(widget.burger.imageUrl, height: 350)),
                ),
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Text(
                        widget.burger.rating.toString(),
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 220,
                      child: Text(
                        widget.burger.name,
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (totalItem > 1) {
                                setState(() {
                                  totalItem -= 1;
                                });
                              }
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            "$totalItem",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                totalItem += 1;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "Ingerdients",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 14),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ingerdientsBox("🍗", "Chicken"),
                      ingerdientsBox("🧀", "Cheese"),
                      ingerdientsBox("🥬", "Lettuce"),
                      ingerdientsBox("🍅", "Tomatoes"),
                      ingerdientsBox("🧅", "Onion"),
                      ingerdientsBox("🍞", "Burger"),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  
                  "Description",
                  style: TextStyle(
                    
                    fontSize: 18, fontWeight: FontWeight.w600
                    ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.burger.description,
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Add to Cart - \$${(widget.burger.price * totalItem).toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Colors.transparent,
      //   onPressed: () {},
      //   label: Row(
      //     children: [
      //       Text("{\$}"),
      //       Text(
      //         "${widget.burger.price}",
      //         style: TextStyle(
      //           fontSize: 30,
      //           color: Colors.black,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       ),
      //       SizedBox(width: 50,),
      //       Container(width: 230,height: 60,decoration: BoxDecoration(
      //         color: Colors.black,
      //         borderRadius: BorderRadius.circular(30),

      //       ),
      //       child: Center(
      //         child: Text("Add to Cart",style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 18,
      //         ),),

      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  Padding ingerdientsBox(icon, name) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Container(
        padding: EdgeInsets.all(5),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 5)],
        ),
        child: Column(
          children: [
            Text(icon, style: TextStyle(fontSize: 25)),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
