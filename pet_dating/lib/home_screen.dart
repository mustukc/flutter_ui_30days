import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class DogProfile {
  final String name;
  final String breed;
  final String imageUrl;

  DogProfile({required this.name, required this.breed, required this.imageUrl});
}

class DogHomeScreen extends StatefulWidget {
  const DogHomeScreen({Key? key}) : super(key: key);

  @override
  State<DogHomeScreen> createState() => _DogHomeScreenState();
}

class _DogHomeScreenState extends State<DogHomeScreen> {
  int selectedDog = 0;
  int selectedIndex = 0;

  Widget _buildBottomNavBar() {
  return Container(
    height: 100,
    padding: const EdgeInsets.symmetric(horizontal: 35),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          offset: const Offset(0, -4),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _navItem(Icons.home_rounded, 0),
        _navItem(Icons.chat_bubble_outline, 1),
        const SizedBox(width: 50),
        _navItem(Icons.favorite_border_rounded, 2),
        _navItem(Icons.person_outline_rounded, 3),
      ],
    ),
  );
}

Widget _navItem(IconData icon, int index) {
  return GestureDetector(
    onTap: () {
      setState(() {
        selectedIndex = index;
      });
    },
    behavior: HitTestBehavior.translucent,
    child: Icon(
      icon,
      size: 28,
      color: selectedIndex == index
          ? const Color(0xFFEF7E06)
          : Colors.grey.shade400,
    ),
  );
}

Widget _buildCenterButton(VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
       //color: const Color(0xFFEF7E06),
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(image: AssetImage("assets/cenetr.png",),fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      // child:  Center(
      //  child: Image.asset("assets/cenetr.png",fit: BoxFit.fill,),
      // ),
    ),
  );
}


  final List<DogProfile> dogs = [
    DogProfile(
      name: 'Dubby',
      breed: 'Golden Retriever',
      imageUrl:
          'https://images.unsplash.com/photo-1633722715463-d30f4f325e24?w=800',
    ),
    DogProfile(
      name: 'Max',
      breed: 'German Shepherd',
      imageUrl:
          'https://images.unsplash.com/photo-1568572933382-74d440642117?w=800',
    ),
    DogProfile(
      name: 'Luna',
      breed: 'Border Collie',
      imageUrl:
          'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=800',
    ),
    DogProfile(
      name: 'Charlie',
      breed: 'Labrador',
      imageUrl:
          'https://images.unsplash.com/photo-1552053831-71594a27632d?w=800',
    ),
    DogProfile(
      name: 'Bella',
      breed: 'Husky',
      imageUrl:
          'https://images.unsplash.com/photo-1605568427561-40dd23c2acea?w=800',
    ),
  ];

  int currentIndex = 0;

  void _onSwipeLeft() {
    setState(() {
      if (currentIndex < dogs.length - 1) {
        currentIndex++;
      }
    });
  }

  void _onSwipeRight() {
    setState(() {
      if (currentIndex < dogs.length - 1) {
        currentIndex++;
      }
    });
  }

  void _onSuperLike() {
    setState(() {
      if (currentIndex < dogs.length - 1) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color(0xFFF7B327).withOpacity(0.06), Colors.white],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 20, 28, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7B327),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      child: Icon(Iconsax.menu_bold),
                    ),
                  ],
                ),
              ),

              // Location
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 20, 28, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF9A8F87),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'London, UK',
                      style: TextStyle(
                        fontSize: 34,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Filter and Dog Avatars
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: const Color(0xFFF7B327),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: Color(0xFFF7B327),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 16),
                    _buildDogAvatar(selectedDog == 0, "assets/dog1.png", () {
                      setState(() {
                        selectedDog = 0;
                      });
                    }),

                    const SizedBox(width: 12),

                    _buildDogAvatar(selectedDog == 1, "assets/dog2.png", () {
                      setState(() {
                        selectedDog = 1;
                      });
                    }),

                    const SizedBox(width: 12),

                    _buildDogAvatar(selectedDog == 2, "assets/dog3.png", () {
                      setState(() {
                        selectedDog = 2;
                      });
                    }),
                  ],
                ),
              ),

              const Spacer(),

              // Swipeable Cards
              Center(
                child: SizedBox(
                  height: 500,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background cards
                      if (currentIndex + 1 < dogs.length)
                        Positioned(
                          child: Transform.scale(
                            scale: 0.9,
                            child: Opacity(
                              opacity: 0.5,
                              child: _buildDogCard(
                                dogs[currentIndex + 1],
                                false,
                              ),
                            ),
                          ),
                        ),
                      // Current card
                      if (currentIndex < dogs.length)
                        SwipeableCard(
                          dog: dogs[currentIndex],
                          onSwipeLeft: _onSwipeLeft,
                          onSwipeRight: _onSwipeRight,
                          onSuperLike: _onSuperLike,
                        ),
                    ],
                  ),
                ),
              ),

              const Spacer(),
              
 

              Stack(
  alignment: Alignment.bottomCenter,
  children: [
    _buildBottomNavBar(),
    Positioned(
      bottom: 28,
      child: _buildCenterButton(() {
        print("ADD CLICKED");
      }),
    ),
  ],
)

            ],
          ),
        ),

        // Bottom Navigation
      ),

    );
    
  }

  Widget _buildDot() {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: Color(0xFF3F2D20),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildDogAvatar(bool isSelected, String img, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFFEF7E06) : Colors.transparent,
            width: 3,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF7B327),
            shape: BoxShape.circle,
          ),
          child: ClipOval(child: Image.asset(img, fit: BoxFit.cover)),
        ),
      ),
    );
  }

  Widget _buildDogCard(DogProfile dog, bool interactive) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 420,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              dog.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.pets, size: 100, color: Colors.white),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dog.name,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dog.breed,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, bool isActive) {
    return Icon(
      icon,
      color: isActive ? const Color(0xFFF7B327) : const Color(0xFFB8C0C8),
      size: 28,
    );
  }
}

class SwipeableCard extends StatefulWidget {
  final DogProfile dog;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;
  final VoidCallback onSuperLike;

  const SwipeableCard({
    Key? key,
    required this.dog,
    required this.onSwipeLeft,
    required this.onSwipeRight,
    required this.onSuperLike,
  }) : super(key: key);

  @override
  State<SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard>
    with SingleTickerProviderStateMixin {
  Offset position = Offset.zero;
  bool isDragging = false;
  double angle = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      isDragging = true;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      position += details.delta;
      angle = position.dx / 1000;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      isDragging = false;
    });

    final swipeThreshold = MediaQuery.of(context).size.width * 0.3;

    if (position.dx.abs() > swipeThreshold) {
      final direction = position.dx > 0 ? 1 : -1;
      _animateCardOff(direction);
    } else if (position.dy < -swipeThreshold) {
      _animateCardUp();
    } else {
      _resetPosition();
    }
  }

  void _animateCardOff(int direction) {
    final targetX = MediaQuery.of(context).size.width * 1.5 * direction;
    final animation = Tween<Offset>(
      begin: position,
      end: Offset(targetX, position.dy),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    animation.addListener(() {
      setState(() {
        position = animation.value;
        angle = position.dx / 1000;
      });
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (direction > 0) {
          widget.onSwipeRight();
        } else {
          widget.onSwipeLeft();
        }
        _controller.reset();
        setState(() {
          position = Offset.zero;
          angle = 0;
        });
      }
    });

    _controller.forward();
  }

  void _animateCardUp() {
    final animation = Tween<Offset>(
      begin: position,
      end: Offset(0, -MediaQuery.of(context).size.height),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    animation.addListener(() {
      setState(() {
        position = animation.value;
      });
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onSuperLike();
        _controller.reset();
        setState(() {
          position = Offset.zero;
          angle = 0;
        });
      }
    });

    _controller.forward();
  }

  void _resetPosition() {
    final animation = Tween<Offset>(
      begin: position,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    final angleAnimation = Tween<double>(
      begin: angle,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    animation.addListener(() {
      setState(() {
        position = animation.value;
        angle = angleAnimation.value;
      });
    });

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Transform.translate(
        offset: position,
        child: Transform.rotate(
          angle: angle,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 420,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        widget.dog.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.pets,
                              size: 100,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.6),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dog.name,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.dog.breed,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Swipe indicators
                      if (position.dx > 50)
                        Positioned(
                          top: 50,
                          right: 30,
                          child: Transform.rotate(
                            angle: -0.3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF4CAF50),
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'LIKE',
                                style: TextStyle(
                                  color: Color(0xFF4CAF50),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (position.dx < -50)
                        Positioned(
                          top: 50,
                          left: 30,
                          child: Transform.rotate(
                            angle: 0.3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFF15A5A),
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'NOPE',
                                style: TextStyle(
                                  color: Color(0xFFF15A5A),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (position.dy < -50)
                        Positioned(
                          bottom: 100,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFF7B327),
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'SUPER LIKE',
                                style: TextStyle(
                                  color: Color(0xFFF7B327),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // Action Buttons
              Positioned(
                bottom: -35,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(
                      Icons.close_rounded,
                      const Color(0xFFF15A5A),
                      Colors.white,
                      52,
                      () {
                        _animateCardOff(-1);
                      },
                    ),
                    const SizedBox(width: 20),
                    _buildActionButton(
                      Icons.favorite_rounded,
                      Colors.white,
                      const Color(0xFFF7B327),
                      62,
                      () {
                        _animateCardOff(1);
                      },
                    ),
                    const SizedBox(width: 20),
                    _buildActionButton(
                      Icons.star_rounded,
                      const Color(0xFFF7B327),
                      Colors.white,
                      52,
                      () {
                        _animateCardUp();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    Color iconColor,
    Color bgColor,
    double size,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor, size: size * 0.5),
      ),
    );
  }
}



