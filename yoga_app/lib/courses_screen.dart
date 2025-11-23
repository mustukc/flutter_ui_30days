import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  double _playbackPosition = 0.33; // 0.0 to 1.0, starting at 33%
  double _totalDuration = 300.0; // Total duration in seconds (5:00)
  bool _isPlaying = false;

  String _formatTime(double seconds) {
    final minutes = (seconds / 60).floor();
    final secs = (seconds % 60).floor();
    return '${minutes}:${secs.toString().padLeft(2, '0')}';
  }

  void _updatePlaybackPosition(double localX, double waveformWidth) {
    final newPosition = (localX / waveformWidth).clamp(0.0, 1.0);
    setState(() {
      _playbackPosition = newPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF4F2),

      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 20),

            // BACK BUTTON
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, size: 20, color: Colors.black87),
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ).animate().fadeIn(delay: 200.ms).scale(),

            const SizedBox(height: 30),

            // IMAGE CARD - Large and prominent
            Container(
              height: 320,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xffE3E7A3),
                borderRadius: BorderRadius.circular(24),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/relax_yoga.png',
                fit: BoxFit.cover,
              ),
            ).animate().scale(duration: 800.ms).fadeIn(),

            const SizedBox(height: 35),

            // TITLE
            Text(
              "Relaxing Music",
              style: GoogleFonts.playfairDisplay(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ).animate().fadeIn(delay: 300.ms),

            const SizedBox(height: 8),

            // SUBTITLE
            Text(
              "Now Playing",
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 35),

            // WAVEFORM - Custom visualization (Interactive)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calculate number of bars that fit
                  const barWidth = 3.0;
                  const barSpacing = 4.0; // 2px margin on each side
                  const totalBarWidth = barWidth + barSpacing;
                  final availableWidth = constraints.maxWidth;
                  final numberOfBars = (availableWidth / totalBarWidth).floor();
                  
                  return GestureDetector(
                    onTapDown: (details) {
                      _updatePlaybackPosition(details.localPosition.dx, availableWidth);
                    },
                    onPanUpdate: (details) {
                      _updatePlaybackPosition(details.localPosition.dx, availableWidth);
                    },
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(numberOfBars, (index) {
                          // Generate varying bar heights
                          double height = 20 + (index % 5) * 8.0;
                          if (index % 3 == 0) height += 10;
                          if (index % 7 == 0) height += 15;
                          
                          // Determine color based on playback position
                          Color barColor;
                          final barPosition = index / numberOfBars;
                          if (barPosition <= _playbackPosition) {
                            // Orange section (played portion)
                            barColor = Colors.orange;
                          } else {
                            // Grey sections (unplayed portion)
                            barColor = Colors.grey.shade600;
                          }
                          
                          return Container(
                            width: barWidth,
                            height: height.clamp(15.0, 70.0),
                            margin: EdgeInsets.only(
                              right: index < numberOfBars - 1 ? barSpacing : 0,
                            ),
                            decoration: BoxDecoration(
                              color: barColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                },
              ),
            ).animate().slideY(begin: 0.5),

            const SizedBox(height: 12),

            // TIME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatTime(_playbackPosition * _totalDuration),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    _formatTime(_totalDuration),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // CONTROLS
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Previous Track Button
                  Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.skip_previous, color: Colors.black87, size: 24),
                      onPressed: () {},
                    ),
                  ),

                  const SizedBox(width: 30),

                  // Play Button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ).animate().scale().shimmer(),

                  const SizedBox(width: 30),

                  // Next Track Button
                  Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.black87, size: 24),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 600.ms),
          ],
        ),
      ),
    );
  }
}
