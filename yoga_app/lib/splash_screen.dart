import 'package:flutter/material.dart';
import 'package:yoga_app/onboard_scren.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define professional color palette
    const mintGreen = Color(0xFFA8E6CF);
    const mintGreenLight = Color(0xFFD4F1E8);
    const orange = Color(0xFFFF8C42);
    const orangeLight = Color(0xFFFFB88C);
    const orangeDark = Color(0xFFFF6B1A);
    const white = Colors.white;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              mintGreenLight,
              white,
              orangeLight.withOpacity(0.3),
              mintGreen.withOpacity(0.5),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Decorative background elements
              Positioned(
                top: -50,
                right: -50,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        orange.withOpacity(0.2),
                        orange.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                left: -80,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        mintGreen.withOpacity(0.2),
                        mintGreen.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
              // Main content
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Yoga Illustration with professional styling
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: orange.withOpacity(0.3),
                                blurRadius: 40,
                                spreadRadius: 5,
                                offset: const Offset(0, 10),
                              ),
                              BoxShadow(
                                color: mintGreen.withOpacity(0.3),
                                blurRadius: 40,
                                spreadRadius: 5,
                                offset: const Offset(0, -10),
                              ),
                            ],
                          ),
                          child: CustomPaint(
                            painter: YogaIllustrationPainter(),
                          ),
                        ),
                        const SizedBox(height: 50),
                        // App Name with gradient text effect
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [orangeDark, orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: Text(
                            'Yoga App',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: white,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Tagline
                        Text(
                          'Find Your Inner Peace',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade700,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 80),
                        // Professional Loading Indicator
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [orange, orangeLight],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: orange.withOpacity(0.4),
                                blurRadius: 15,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(white),
                                strokeWidth: 3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Painter for Yoga Illustration with Orange and Mint Green
class YogaIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define colors
    const mintGreen = Color(0xFF7FD4B5);
    const mintGreenLight = Color(0xFFA8E6CF);
    const orange = Color(0xFFFF8C42);
    const orangeDark = Color(0xFFFF6B1A);

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Decorative circles with gradient effect
    final decorativePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // Outer decorative circle - mint green
    decorativePaint.color = mintGreenLight.withOpacity(0.4);
    canvas.drawCircle(Offset(centerX, centerY), 85, decorativePaint);
    
    // Middle decorative circle - orange
    decorativePaint.color = orange.withOpacity(0.3);
    canvas.drawCircle(Offset(centerX, centerY), 70, decorativePaint);

    // Draw yoga pose with professional styling
    // Head - mint green gradient effect
    final headGradient = Paint()
      ..shader = RadialGradient(
        colors: [mintGreen, mintGreenLight],
      ).createShader(
        Rect.fromCircle(center: Offset(centerX, centerY - 40), radius: 25),
      );
    canvas.drawCircle(
      Offset(centerX, centerY - 40),
      25,
      headGradient,
    );

    // Body (torso) - orange gradient
    final bodyGradient = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [orange, orangeDark],
      ).createShader(
        Rect.fromLTWH(centerX - 15, centerY - 15, 30, 35),
      );
    final bodyPath = Path()
      ..moveTo(centerX, centerY - 15)
      ..lineTo(centerX - 15, centerY + 20)
      ..lineTo(centerX + 15, centerY + 20)
      ..close();
    canvas.drawPath(bodyPath, bodyGradient);

    // Left arm (raised) - mint green
    final armPaint = Paint()
      ..color = mintGreen
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(centerX - 15, centerY),
      Offset(centerX - 35, centerY - 20),
      armPaint,
    );

    // Right arm (raised) - orange
    armPaint.color = orange;
    canvas.drawLine(
      Offset(centerX + 15, centerY),
      Offset(centerX + 35, centerY - 20),
      armPaint,
    );

    // Legs (crossed) - mint green
    final legPaint = Paint()
      ..color = mintGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;
    final legPath = Path()
      ..moveTo(centerX - 15, centerY + 20)
      ..quadraticBezierTo(
        centerX - 10,
        centerY + 40,
        centerX - 5,
        centerY + 50,
      )
      ..moveTo(centerX + 15, centerY + 20)
      ..quadraticBezierTo(
        centerX + 10,
        centerY + 40,
        centerX + 5,
        centerY + 50,
      );
    canvas.drawPath(legPath, legPaint);

    // Add small decorative dots
    final dotPaint = Paint()
      ..color = orange.withOpacity(0.6)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX - 50, centerY - 30), 3, dotPaint);
    canvas.drawCircle(Offset(centerX + 50, centerY - 30), 3, dotPaint);
    dotPaint.color = mintGreen.withOpacity(0.6);
    canvas.drawCircle(Offset(centerX - 45, centerY + 60), 3, dotPaint);
    canvas.drawCircle(Offset(centerX + 45, centerY + 60), 3, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}