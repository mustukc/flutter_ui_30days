import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class PowerUsageScreen extends StatefulWidget {
  const PowerUsageScreen({super.key});

  @override
  State<PowerUsageScreen> createState() => _PowerUsageScreenState();
}

class _PowerUsageScreenState extends State<PowerUsageScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _chartController;
  late final Animation<double> _chartAnimation;

  @override
  void initState() {
    super.initState();
    _chartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _chartAnimation =
        CurvedAnimation(parent: _chartController, curve: Curves.easeOutCubic);
    _chartController.forward();
  }

  @override
  void dispose() {
    _chartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18150A),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1C1B1A), Color(0xFF2E2A10), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // Top bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 18),
                    ),
                    const Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),

                const SizedBox(height: 25),

                Text(
                  "Power usages",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // Power Card
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F5D7),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("78.36",
                                  style: GoogleFonts.poppins(
                                    fontSize: 28,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text("Kwh",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 5),
                              Text(
                                "Report on your power consumption",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey[700],
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Text("Week",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Animated Bar Chart
                      SizedBox(
                        height: 220,
                        child: AnimatedBuilder(
                          animation: _chartAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _chartAnimation.value,
                              child: Transform.translate(
                                offset: Offset(
                                  0,
                                  20 * (1 - _chartAnimation.value),
                                ),
                                child: BarChart(
                                  BarChartData(
                                    borderData: FlBorderData(show: false),
                                    gridData: const FlGridData(show: false),
                                    titlesData: FlTitlesData(
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 28,
                                          getTitlesWidget: (value, meta) {
                                            const months = [
                                              'Jan',
                                              'Feb',
                                              'Mar',
                                              'Apr',
                                              'May',
                                              'June',
                                              'July',
                                              'Aug',
                                              'Sep'
                                            ];
                                            return Text(
                                              months[value.toInt()],
                                              style: GoogleFonts.poppins(
                                                color: Colors.black87,
                                                fontSize: 12,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      leftTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                      rightTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                      topTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                    ),
                                    barGroups: _getBarGroups(
                                      progress: _chartAnimation.value,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // History Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("History",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    Text("See More",
                        style: GoogleFonts.poppins(
                            color: const Color(0xFFFFC107), fontSize: 14)),
                  ],
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final tiles = [
                        _HistoryTileData(Icons.computer, "Computer System",
                            "2 Devices", "20%"),
                        _HistoryTileData(Icons.ac_unit, "Air Conditioner",
                            "5 Devices", "40%"),
                        _HistoryTileData(
                            Icons.chair, "Livingroom", "6 Devices", "60%"),
                        _HistoryTileData(
                            Icons.videocam, "CCTV Camera", "4 Devices", "50%",
                            faded: true),
                      ];
                      final tile = tiles[index];
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: Duration(milliseconds: 500 + index * 100),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0, 20 * (1 - value)),
                              child: child,
                            ),
                          );
                        },
                        child: _buildHistoryTile(
                          icon: tile.icon,
                          title: tile.title,
                          subtitle: tile.subtitle,
                          percent: tile.percent,
                          faded: tile.faded,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups({double progress = 1}) {
    final heights = [8.0, 12.0, 15.0, 9.0, 10.0, 18.0, 12.0, 14.0, 9.0];
    return List.generate(
      heights.length,
      (i) => BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: heights[i] * progress,
            color: i == 5 ? const Color(0xFFFFC107) : const Color(0xFFB59E4D),
            width: 18,
            borderRadius: BorderRadius.circular(6),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String percent,
    bool faded = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child:
                Icon(icon, color: faded ? Colors.grey : Colors.white, size: 26),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                        color: faded
                            ? Colors.white.withOpacity(0.4)
                            : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Text(subtitle,
                    style: GoogleFonts.poppins(
                        color: faded
                            ? Colors.white.withOpacity(0.3)
                            : Colors.white70,
                        fontSize: 13)),
              ],
            ),
          ),
          Text(percent,
              style: GoogleFonts.poppins(
                  color: faded
                      ? Colors.yellow.withOpacity(0.3)
                      : const Color(0xFFFFC107),
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ],
      ),
    );
  }
}

class _HistoryTileData {
  const _HistoryTileData(this.icon, this.title, this.subtitle, this.percent,
      {this.faded = false});

  final IconData icon;
  final String title;
  final String subtitle;
  final String percent;
  final bool faded;
}
