import 'package:burger_app/burger_details_screen.dart';
import 'package:burger_app/burger_model.dart';
import 'package:flutter/material.dart';

class BurgerHomeScreen extends StatefulWidget {
  const BurgerHomeScreen({super.key});

  @override
  State<BurgerHomeScreen> createState() => _BurgerHomeScreenState();
}

class _BurgerHomeScreenState extends State<BurgerHomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,

                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(2, 3),
                                  // ignore: deprecated_member_use
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(Icons.menu, color: Colors.black),
                            ),
                          ),
                          Positioned(
                            top: 3,
                            right: 4,
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.withOpacity(0.1),
                        ),
                        child: Center(
                          child: Image.network(
                            "https://imgproxy.attic.sh/insecure/f:webp/q:90/w:1920/plain/https://attic.sh/t1w1j40fpgrh623lsigw6t2vkio8",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Find and order", style: TextStyle(fontSize: 40)),
                        Text(
                          "burger for you 🍔",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
                searchBar(),
                SizedBox(height: size.height * 0.04),
                categorySection(),
                SizedBox(height: size.height * 0.04),
                Text(
                  "Most Popular",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Visibility(
                  visible: selectedIndex == 0 ? true : false,
                  child: SizedBox(
                    width: size.width,
                    height: 270,
                    child: ListView.builder(
                      itemCount: burgers.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final burger = burgers[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BurgerDetailsScreen(burger: burger),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width / 2,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7,
                                    offset: Offset(0, 5),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        burger.isFavorite = !burger.isFavorite;
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          color: burger.isFavorite
                                              ? Colors.orange.withOpacity(0.15)
                                              : Colors.grey.withOpacity(0.1),
                                        ),
                                        child: Icon(
                                          Icons.favorite,
                                          color: burger.isFavorite
                                              ? Colors.orange
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Hero(tag: burger.name, child: Image.network(
                                        burger.imageUrl,
                                        height: 120,
                                      ),),
                                      SizedBox(height: 10),
                                      Text(
                                        burger.name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                            size: 20,
                                          ),
                                          Text(
                                            "${burger.rating} | ",
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            burger.distance,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "\$",
                                            style: TextStyle(
                                              color: Colors.orange,
                                            ),
                                          ),
                                          Text(
                                            "${burger.price}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox categorySection() {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.orange.withOpacity(0.15)
                    : Colors.white,
                border: Border.all(
                  color: isSelected ? Colors.orange : Colors.black26,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Text(categories[index].emoji, style: TextStyle(fontSize: 12)),
                  SizedBox(width: 6),
                  Text(
                    categories[index].title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w400,
                      color: isSelected ? Colors.orange : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Find your burger",
          hintStyle: TextStyle(fontSize: 18, color: Colors.black38),
          prefixIcon: Icon(Icons.search, size: 30),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding: EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
