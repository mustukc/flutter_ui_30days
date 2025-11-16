
import 'dart:ui';
import 'package:flutter/material.dart';

class CarouselItem {
  const CarouselItem({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.backgroundColor,
    required this.flavorNotes,
  });

  final String name;
  final String subtitle;
  final String price;
  final String imagePath;
  final Color backgroundColor;
  final List<String> flavorNotes;
}

class AnimatedCarouselApp extends StatefulWidget {
  const AnimatedCarouselApp({super.key});

  @override
  State<AnimatedCarouselApp> createState() => _AnimatedCarouselAppState();
}

class _AnimatedCarouselAppState extends State<AnimatedCarouselApp> {
  static const _items = <CarouselItem>[
     CarouselItem(
      name: 'Mint Breeze',
      subtitle: 'Iced matcha julep',
      price: '\$7.40',
      imagePath: 'assets/images/mint_breeze.png',
      backgroundColor: Color(0xFFF2A516),
      flavorNotes: ['Garden mint', 'Jasmine', 'Lime peel'],
    ),
    CarouselItem(
      name: 'Citrus Glow',
      subtitle: 'Sparkling citrus refresher',
      price: '\$7.80',
      imagePath: 'assets/images/citrus_glow.png',
      backgroundColor: Color(0xFF2E8B7C),
      flavorNotes: ['Calamansi', 'Lemongrass', 'Sea salt'],
    ),
    CarouselItem(
      name: 'Spiced Delight',
      subtitle: 'Chai-infused cold brew',
      price: '\$8.50',
      imagePath: 'assets/images/spiced_delight.png',
      backgroundColor: Color(0xFFB75C42),
      flavorNotes: ['Cardamom', 'Toasted sugar', 'Orange zest'],
    ),
   
    CarouselItem(
      name: 'Berry Velvet',
      subtitle: 'Velvety berry frappe',
      price: '\$8.10',
      imagePath: 'assets/images/berry_velvet.png',
      backgroundColor: Color(0xFF6A2C70),
      flavorNotes: ['Blackberry', 'Vanilla bean', 'Rose petals'],
    ),
  ];

  static const _loopMultiplier = 1000;

  late final int _initialPage;
  late final PageController _pageController;
  int _centerIndex = 0;

  @override
  void initState() {
    super.initState();
    _initialPage = _items.length * _loopMultiplier;
    _centerIndex = _initialPage % _items.length;
    _pageController = PageController(
      initialPage: _initialPage,
      viewportFraction: 0.72,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _items[_centerIndex].backgroundColor;
    final activeItem = _items[_centerIndex];

    final colorScheme = ColorScheme.fromSeed(
      seedColor: backgroundColor,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            letterSpacing: 0.2,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
      home: AnimatedContainer(
        duration: const Duration(milliseconds: 360),
        curve: Curves.easeInOut,
        color: backgroundColor,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0, -0.3),
              radius: 1.1,
              colors: [
                Colors.white.withOpacity(0.14),
                Colors.transparent,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Signature Mixology',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.white.withOpacity(0.12),
                          ),
                          icon: const Icon(Icons.tune_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Discover chef-crafted refreshments with layered textures and aromas.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                    const SizedBox(height: 28),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        physics: const BouncingScrollPhysics(),
                        clipBehavior: Clip.none,
                        onPageChanged: (rawIndex) {
                          setState(() {
                            _centerIndex = rawIndex % _items.length;
                          });
                        },
                        itemCount: _items.length * _loopMultiplier * 2,
                        itemBuilder: (context, rawIndex) {
                          final item = _items[rawIndex % _items.length];
                          return _AnimatedCarouselCard(
                            controller: _pageController,
                            index: rawIndex,
                            initialPage: _initialPage.toDouble(),
                            item: item,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 320),
                      switchInCurve: Curves.easeOutCubic,
                      switchOutCurve: Curves.easeInCubic,
                      child: Column(
                        key: ValueKey(activeItem.name),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activeItem.name,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            activeItem.subtitle,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white70,
                                    ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: activeItem.flavorNotes
                                .map((note) => _ChipPill(label: note))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: Colors.white.withOpacity(0.16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activeItem.price,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Limited release',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.white70),
                              ),
                            ],
                          ),
                          Container(
                            height: 36,
                            width: 2,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.24),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const Text(
                            'Swipe',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                    label: const Text('Order'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedCarouselCard extends StatelessWidget {
  const _AnimatedCarouselCard({
    required this.controller,
    required this.index,
    required this.initialPage,
    required this.item,
  });

  final PageController controller;
  final int index;
  final double initialPage;
  final CarouselItem item;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final hasPage =
            controller.hasClients && controller.positions.isNotEmpty;
        final currentPage = hasPage
            ? (controller.page ?? controller.initialPage.toDouble())
            : initialPage;

        final distance = (currentPage - index).abs();
        final t = (1 - distance).clamp(0.0, 1.0);
        final scale = lerpDouble(0.84, 1.0, Curves.easeOut.transform(t))!;
        final opacity = lerpDouble(0.4, 1.0, Curves.easeOutQuad.transform(t))!;
        final translationX = lerpDouble(60, 0, Curves.easeInOut.transform(t))! *
            (currentPage - index);
        final elevation = lerpDouble(6, 28, Curves.easeOut.transform(t))!;
        final blurSigma = lerpDouble(0, 22, Curves.easeOut.transform(t))!;

        return Align(
          alignment: Alignment.center,
          child: Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(translationX, 0),
              child: Transform.scale(
                alignment: Alignment.center,
                scale: scale,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.28),
                        blurRadius: elevation,
                        offset: Offset(0, elevation * 0.42),
                      ),
                    ],
                  ),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: blurSigma * 0.015,
                      sigmaY: blurSigma * 0.015,
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: _CarouselCard(item: item),
    );
  }
}

class _CarouselCard extends StatelessWidget {
  const _CarouselCard({required this.item});

  final CarouselItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Hero(
                tag: item.imagePath,
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.25),
                      Colors.black.withOpacity(0.65),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.2, -0.4),
                    radius: 1.1,
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1.1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 26, 26, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _ChipPill(
                        label: item.price,
                        icon: Icons.local_fire_department_outlined,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: item.flavorNotes
                        .map((note) => _ChipPill(label: note))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChipPill extends StatelessWidget {
  const _ChipPill({
    required this.label,
    this.icon,
  });

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.16),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: hasIcon ? 14 : 16,
          vertical: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasIcon) ...[
              Icon(
                icon,
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
