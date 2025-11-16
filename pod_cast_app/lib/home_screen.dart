import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  List<String> image = ["assets/img1.png", "assets/img2.png"];
final trending = [
      {
        "image": "assets/music_podcast.png",
        "title": "See Mama Be",
        "creator": "Creative Studio",
        "time": "15 min",
      },
      {
        "image": "assets/festival.png",
        "title": "Festival on the Beach",
        "creator": "Rock Electrics",
        "time": "10 min",
      },
      {
        "image": "assets/your_time.png",
        "title": "Your Time",
        "creator": "Pod Vibes",
        "time": "8 min",
      },
    ];

  Widget _navIcon(IconData icon, int index, bool active) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _currentIndex = index;
            });
          },
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: 72,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: active ? Color(0xFF9333EA) : Color(0xFF6B7280),
                  size: 27,
                ),
                SizedBox(height: 6),
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: active ? 4 : 0,
                  width: active ? 4 : 0,
                  decoration: BoxDecoration(
                    color: Color(0xFF9333EA),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 55,
                left: 35,
                right: 35,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/logo.png"),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffEDEDED),
                    ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Center(child: Icon(Icons.notifications)),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 45),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hint: Text(
                    "Search the podcast here...",
                    style: GoogleFonts.publicSans(
                      color: Color(0XFF1F1F1F),
                      fontSize: 16,
                    ),
                  ),
                  fillColor: Color(0xffEDEDED),
                  focusColor: Color(0xffEDEDED),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Promoted Podcasts",
                style: GoogleFonts.publicSans(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 200,
        
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: image.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset(
                          image[index],
                          width: 331,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 32,),
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                "Trending Podcasts",
                style: GoogleFonts.publicSans(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              Text(
                "See more",
                style: GoogleFonts.publicSans(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
                ],
              ),
                          SizedBox(height: 32,),
        
                 Column(
                    children: trending.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item["image"]!,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"]!,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    item["creator"]!,
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    item["time"]!,
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurple.withOpacity(0.1),
                              ),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                 )
                ],
              ),
            ),
          ),
          // Custom Bottom Navigation Bar
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Container(
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 25,
                    offset: Offset(0, -3),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFE9D5FF).withOpacity(0.65),
                          Color(0xFFFFFFFF).withOpacity(0.88),
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _navIcon(Icons.headphones_rounded, 0, _currentIndex == 0),
                        _navIcon(Icons.explore_rounded, 1, _currentIndex == 1),
                        _navIcon(Icons.favorite_rounded, 2, _currentIndex == 2),
                        _navIcon(Icons.person_rounded, 3, _currentIndex == 3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
