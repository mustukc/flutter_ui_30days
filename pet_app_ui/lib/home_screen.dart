import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/draw1.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search, size: 33),
                  filled: true,
                  fillColor: Color(0xffffc368).withOpacity(0.1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "categories",
                    style: GoogleFonts.cairo(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xffffc368),
                    ),
                  ),
                ],
              ),
            ),
            Category(),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "The Best price",
                    style: GoogleFonts.cairo(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xffffc368),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 45,),
            PetPriceCard(name: 'Cat Cat', age: 1, desc: 'Lorem ipsum dolor sit \namet, consectetur ', price: 30, img: 'assets/cat.png', bg: 'assets/react1.png',),
            PetPriceCard(name: 'Cute Dog', age: 1, desc: 'Lorem ipsum dolor sit \namet, consectetur ', price: 30, img: 'assets/dog.png', bg: 'assets/react2.png',)

          ],
        ),
      ),
    );
  }
}

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<Map<String, String>> categories = const [
    {"name": "All", "image": "assets/pets.png"},
    {"name": "Cat", "image": "assets/cat_category.png"},
    {"name": "Dog", "image": "assets/dog_category.png"},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedIndex== index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                  color: isSelected?Colors.brown:Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      category['image']!,
                     
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category['name']!,
                      style:  TextStyle(
                        color: isSelected ? Colors.white : Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PetPriceCard extends StatelessWidget {
  final String name;
  final int age;
  final String desc;
  final int price;
  final String img;
  final String bg;
  
  const PetPriceCard({
    super.key, required this.name, required this.age, required this.desc, required this.price, required this.img, required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bg))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
    
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  
                  children: [
                    Text(name,style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w600
                    ),),
                    SizedBox(width: 10,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("Age | $age Y",style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ],
                ),
                Text(desc,style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                    ),),
                Text("Price:$price\$",style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),),
              ],
            ),
          ),
    
          Image.asset(img)
        ],
      )
      );
  }
}
