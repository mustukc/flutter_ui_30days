import 'dart:math' as math;

import 'package:animation/power_usage_screen.dart';
import 'package:animation/routes.dart';
import 'package:animation/splash_screen.dart';
import 'package:animation/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() => runApp(const EnergyApp());

class EnergyApp extends StatelessWidget {
  const EnergyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboard: (context) => const OnboardScreen(),
        AppRoutes.dashboard: (context) => const EnergyDashboard(),
        AppRoutes.powerUsage: (context) => const PowerUsageScreen(),
      },
    );
  }
}

class EnergyDashboard extends StatefulWidget {
  const EnergyDashboard({super.key});

  static const routeName = AppRoutes.dashboard;

  @override
  State<EnergyDashboard> createState() => _EnergyDashboardState();
}

class _EnergyDashboardState extends State<EnergyDashboard> {
  double percent = 0.0;
  int selectedDeviceIndex = 2;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        percent = 0.45;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const gaugeStartAngle = 210.0;
    const gaugeRadius = 125.0;
    const gaugeLineWidth = 24.0;
    final gaugePercent = percent.clamp(0.0, 1.0);
    final pointerRadius = gaugeRadius - gaugeLineWidth / 2;
    final startAngleRad = (gaugeStartAngle - 90) * (math.pi / 180);
    final sweepRadians = 2 * math.pi * gaugePercent;
    final tipAngle = startAngleRad + sweepRadians;
    final tipOffset = Offset(
      pointerRadius * math.cos(tipAngle),
      pointerRadius * math.sin(tipAngle),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1B1B), Color(0xFF3D330A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              'https://randomuser.me/api/portraits/men/33.jpg'),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Good Morning 👋",
                                style: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 14)),
                            Text("Mustu",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Icon(Icons.notifications_none_rounded,
                            color: Colors.white, size: 30),
                        Positioned(
                          right: 4,
                          top: 4,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 15),

                // ENERGY USAGE CIRCLE
                Center(
                  child: SizedBox(
                    width: gaugeRadius * 2 + 20,
                    height: gaugeRadius * 2 + 20,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: gaugeRadius * 2 + 12,
                          height: gaugeRadius * 2 + 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const RadialGradient(
                              colors: [
                                Color(0xFF2B2518),
                                Color(0xFF161417),
                              ],
                              radius: 0.92,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.45),
                                blurRadius: 42,
                                offset: const Offset(0, 28),
                              ),
                            ],
                          ),
                        ),
                        CircularPercentIndicator(
                          radius: gaugeRadius,
                          lineWidth: gaugeLineWidth,
                          backgroundWidth: gaugeLineWidth,
                          percent: gaugePercent,
                          animation: true,
                          animationDuration: 1200,
                          startAngle: gaugeStartAngle,
                          arcType: ArcType.FULL,
                          arcBackgroundColor: const Color(0xFF2D2A24),
                          circularStrokeCap: CircularStrokeCap.round,
                          linearGradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFFFE276),
                              Color(0xFFF8BF3A),
                              Color(0xFFF29A1C),
                            ],
                            stops: [0.0, 0.68, 1.0],
                          ),
                          center: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.powerUsage);
                            },
                            child: Container(
                              width: gaugeRadius * 2 - 32,
                              height: gaugeRadius * 2 - 32,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    Color(0xFFFFD955),
                                    Color(0xFFF2A321),
                                  ],
                                  radius: 0.82,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x66FFDA60),
                                    blurRadius: 36,
                                    spreadRadius: -8,
                                    offset: Offset(0, 18),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Energy Usages",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white.withOpacity(0.82),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "${(gaugePercent * 100).round()}%",
                                    style: GoogleFonts.poppins(
                                      fontSize: 56,
                                      letterSpacing: -1.4,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: tipOffset,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xFFFFE276).withOpacity(0.6),
                                  blurRadius: 12,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 16,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.bolt_rounded,
                              color: Color(0xFFF29D1B),
                              size: 30,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0.72, -0.68),
                          child: Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.07),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.08),
                                width: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(duration: 800.ms).scale(delay: 300.ms),

                const SizedBox(height: 10),

                // DEVICES SECTION
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Devices",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text("See More",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFFFFC107), fontSize: 14)),
                  ],
                ),

                const SizedBox(height: 15),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.28,
                    children: [
                      _buildDeviceCard(
                        index: 0,
                        icon: Icons.ac_unit_rounded,
                        title: "Air Condition",
                        kwh: "278 Kwh",
                      ),
                      _buildDeviceCard(
                        index: 1,
                        icon: Icons.computer_rounded,
                        title: "Computer",
                        kwh: "155 Kwh",
                      ),
                      _buildDeviceCard(
                        index: 2,
                        icon: Icons.chair_rounded,
                        title: "Livingroom",
                        kwh: "198 Kwh",
                      ),
                      _buildDeviceCard(
                        index: 3,
                        icon: Icons.videocam_rounded,
                        title: "CCTV Camera",
                        kwh: "88 Kwh",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // INVITE FRIENDS SECTION
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8E1),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text("Invite your friends",
                            style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        Row(
                          children: [
                            const CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(
                                    "https://randomuser.me/api/portraits/men/75.jpg")),
                            const SizedBox(width: 6),
                            const CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(
                                    "https://randomuser.me/api/portraits/men/78.jpg")),
                            const SizedBox(width: 6),
                            const CircleAvatar(
                                radius: 18,
                                backgroundImage: NetworkImage(
                                    "https://randomuser.me/api/portraits/men/83.jpg")),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ]),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC107),
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 12),
                        ),
                        onPressed: () {},
                        child: Text("Invite Now",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceCard({
    required int index,
    required IconData icon,
    required String title,
    required String kwh,
  }) {
    final bool isActive = selectedDeviceIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDeviceIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFFFC107) : const Color(0xFFF7F5E6),
          borderRadius: BorderRadius.circular(28),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: const Color(0xFFFFD45A).withOpacity(0.45),
                    blurRadius: 24,
                    offset: const Offset(0, 18),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 12,
                    offset: const Offset(0, 8),
                  ),
                ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,
                color: isActive ? Colors.black87 : Colors.black54, size: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                        color: isActive ? Colors.black87 : Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(kwh,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}
