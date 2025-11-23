import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yoga_app/courses_screen.dart';

class YogaHomeScreen extends StatelessWidget {
  const YogaHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF4F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

            // TOP SECTION
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with Namaste and Illustration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Namaste Text
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Namaste,",
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 28,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "Vani",
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3),

                      const SizedBox(width: 10),

                      // Illustration + Background circles
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                color: Color(0xffCBD7A6),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              right: -10,
                              top: -10,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffCBD7A6),
                                ),
                              ),
                            ),
                            Image.asset(
                              "assets/images/yoga_girl.png",
                              height: 140,
                              fit: BoxFit.contain,
                            ).animate().scale(duration: 400.ms),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Call to action text
                  Center(
                    child: Text(
                      "Let's start basic\nyoga and meditation",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ).animate().fadeIn(delay: 300.ms),
                ],
              ),
            ),

            // GRAPH CONTAINER
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Calories Statistics",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Daily"),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down, size: 18),
                          ],
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "27,000.87",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: " cal",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    height: 150,
                    child: LineChart(
                      LineChartData(
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                                if (value.toInt() >= 0 && value.toInt() < days.length) {
                                  return Text(
                                    days[value.toInt()],
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            spots: const [
                              FlSpot(0, 3),
                              FlSpot(1, 3.5),
                              FlSpot(2, 2.5),
                              FlSpot(3, 2),
                              FlSpot(4, 1.5),
                              FlSpot(5, 4.5),
                              FlSpot(6, 3),
                            ],
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(show: false),
                            color: Colors.orange,
                            barWidth: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().slideY(begin: 0.3),

            const SizedBox(height: 20),

            // RECOMMENDED
            const Padding(
              padding: EdgeInsets.only(left: 22, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recommended Courses",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ),
            ),

            // COURSE CARD
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CourseScreen(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [

                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xffF7E0CF),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Image.asset("assets/images/yoga_pilates.png"),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Yoga Pilates",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "5 lessons",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "By Sarah William • All Level",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: const [
                              Icon(Icons.star,
                                  size: 16,
                                  color: Colors.orange),
                              SizedBox(width: 4),
                              Text(
                                "4.5",
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(delay: 500.ms).slideX(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // BOTTOM NAV
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Iconsax.home, color: Colors.orange),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Iconsax.chart, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Iconsax.search_favorite, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Iconsax.user, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
