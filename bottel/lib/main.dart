import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const List<Color> _orangeGradient = [
    Color(0xFFFFD847),
    Color.fromARGB(255, 224, 210, 159),
    Color.fromARGB(255, 219, 190, 85),
  ];

  static const List<Color> _greenGradient = [
    Color(0xFFBCDB4E),
    Color.fromARGB(255, 198, 209, 161),

    Color(0xFF8EC648),
  ];

  static const List<Color> _purpuleGradient = [
    Color(0xFFAE4EDB),
    Color.fromARGB(255, 191, 158, 206),
        Color(0xFF6848C6),

  ];

  late final AnimationController _orangeAnimController;
  late final Animation<double> _orangeScale;

  late final AnimationController _orangePopController;
  late final Animation<double> _orangePopScale;

  bool _showMainOrange = false;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
    }
  }

  @override
  void initState() {
    super.initState();

    _orangeAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Big to small (1.3x down to 0), then effectively gone
    _orangeScale = Tween<double>(
      begin: 1.3,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _orangeAnimController,
        curve: Curves.easeInOutBack,
      ),
    );

    // Pop-out animation for the final orange image
    _orangePopController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _orangePopScale = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _orangePopController,
        curve: Curves.elasticOut,
      ),
    );

    _orangeAnimController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showMainOrange = true;
        });
        _orangePopController.forward();
      }
    });

    _orangeAnimController.forward();
  }

  @override
  void dispose() {
    _orangeAnimController.dispose();
    _orangePopController.dispose();
    _pageController.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SizedBox.expand(
        child: Stack(
          children: [
        
            // Page content - properly constrained
            Positioned.fill(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (index) {
                  if (mounted) {
                    setState(() {
                      _currentPage = index;
                      // Restart the shared animation on every page change
                      _showMainOrange = false;
                      _orangeAnimController
                        ..reset()
                        ..forward();
                      _orangePopController.reset();
                    });
                  }
                },
                itemBuilder: (_, index) {
                  switch (index) {
                    case 0:
                      return _bottleOrange();
                    case 1:
                      return _bottelPurpele();
                    case 2:
                      return _bottleMango();
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
            
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Image.asset('assets/logo.png')),

          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  // Page 0 – orange
                  _DotIndicator(
                    isActive: _currentPage == 0,
                    assetPath: 'assets/orange_dot.png',
                  ),
                  // Page 1 – purple
                  _DotIndicator(
                    isActive: _currentPage == 1,
                    assetPath: 'assets/purpule_dot.png',
                  ),
                  // Page 2 – green
                  _DotIndicator(
                    isActive: _currentPage == 2,
                    assetPath: 'assets/green_dot.png',
                  ),
                ],
              ),
            ),
          ),
            ],
          ),
        ),
    );
  }
  
  // Reusable builder: same animation, different gradients / images
  Widget _buildBottlePage({
    required List<Color> gradient,
    required String splitAsset,
    required String mainAsset,
    double mainHeight = 750,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // First: split image shrinks away
        if (!_showMainOrange)
          Center(
            child: ScaleTransition(
              scale: _orangeScale,
              child: Image.asset(
                splitAsset,
                fit: BoxFit.cover,
              ),
            ),
          )
        // Then: main image pops out
        else
          Center(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ScaleTransition(
                      scale: _orangePopScale,
                      child: Image.asset(
                        mainAsset,
                        height: mainHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // Page 1 – orange theme
  Widget _bottleOrange() {
    return _buildBottlePage(
      gradient: _orangeGradient,
      splitAsset: 'assets/slipt_orange.png',
      mainAsset: 'assets/orange.png',
    );
  }

  // Page 2 – same animation, you can swap assets/gradient later
  Widget _bottelPurpele() {
    return _buildBottlePage(
      gradient: _purpuleGradient,
      splitAsset: 'assets/purple_slice.png',
      mainAsset: 'assets/purpule.png',
    );
  }

  // Page 3 – same animation, you can swap assets/gradient later
  Widget _bottleMango() {
    return _buildBottlePage(
      gradient: _greenGradient,
      splitAsset: 'assets/green_slice.png',
      mainAsset: 'assets/green.png',
    );
  }
}

class _DotIndicator extends StatelessWidget {
  final bool isActive;
  final String assetPath;

  const _DotIndicator({
    required this.isActive,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isActive ? 1.2 : 0.8,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: isActive ? 1.0 : 0.9,
        duration: const Duration(milliseconds: 250),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:isActive? Border.all(
              color: Colors.white.withOpacity(isActive ? 1.0 : 0.6),
              width: 4,
            ):null,
          
          ),
          child: Image.asset(
            assetPath,
            width: isActive ? 50 : 30,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
