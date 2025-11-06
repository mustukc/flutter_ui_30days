import 'package:burger_app/burger_home_screen.dart';
import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int selectedIndex = 0;
  late final List<Widget> page;
   
   @override
     void initState(){
      page = [
        BurgerHomeScreen(),
        navBarpage(Icons.shopping_cart_outlined),
        navBarpage(Icons.favorite_outline),
        navBarpage(Icons.note_add_outlined)
      ];
    super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type:BottomNavigationBarType.fixed,
        iconSize: 33,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        } ,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_outlined),
            label: "",
          ),
        ],
      ),
      body: page[selectedIndex],
    );
  }

  navBarpage(iconName){
    return Center(
      child: Icon(iconName,size: 100,color: Colors.black,),
    );
  }
}
