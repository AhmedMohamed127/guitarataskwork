// presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:hometest/top_banner.dart';

import 'banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            const CustomAppBar(),

            // Navigation Tabs
            NavigationTabs(
              selectedIndex: selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  selectedTabIndex = index;
                });
              },
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Auto-sliding carousel banner
                    const AutoCarousel(height: 150, autoSlideInterval: 2),

                    const SizedBox(height: 16),

                    // Second carousel/ad section
                    const TopAutoCarousel(
                      height: 200,
                      autoSlideInterval: 3,
                      showSupporters: true,
                    ),

                    const SizedBox(height: 20),
                    buildTopUsersGrid(),
                    const SizedBox(height: 20),

                    // Bottom grid sections
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 120,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/ad.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.6),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Live Stream',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 120,
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/ad.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.6),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Top 1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Home
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.home_filled,
                        color: Colors.pink,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // Trending/Flash
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.flash_on,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Flash',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                // Live/Radio
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.radio_outlined,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Live',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                // Profile
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage(
                          'assets/images/profile.jpg',
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Profile',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// presentation/widgets/custom_app_bar.dart
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to vibez 👋',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                Text(
                  'Login to your account',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 24),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline, size: 24),
          ),
        ],
      ),
    );
  }
}

// presentation/widgets/navigation_tabs.dart
class NavigationTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const NavigationTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['Popular', 'Explore', 'Virtual Live', 'PK'];

    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          int index = entry.key;
          String tab = entry.value;
          bool isSelected = index == selectedIndex;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.pink : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    tab,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}



Widget buildTopUserCard({
  required String title,
  required IconData icon,
  required String subtitle,
  required String period,
  required Gradient background,
  required List<String> users, // asset or network URLs
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: background,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title with icon
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 6),
              Icon(icon, size: 16, color: Colors.white),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Subtitle + Period
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            Text(
              period,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const Spacer(),

        // User avatars
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: users
              .map((u) => CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(u),   
                  ))
              .toList(),
        ),
      ],
    ),
  );
}


Widget buildTopUsersGrid() {
  return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 1.2,
    padding: const EdgeInsets.all(16),
    children: [
      buildTopUserCard(
        title: "TOP 5 STREAMER",
        icon: Icons.videocam_rounded,
        subtitle: "Middle East",
        period: "Monthly",
        background: const LinearGradient(
          colors: [Color(0xFF9DD6F9), Color(0xFF72BDEB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        users: [
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
        ],
      ),
      buildTopUserCard(
        title: "TOP 5 SUPPORTER",
        icon: Icons.emoji_events_rounded,
        subtitle: "Middle East",
        period: "Monthly",
        background: const LinearGradient(
          colors: [Color(0xFFB84A8A), Color(0xFF6A1D45)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        users: [
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
        ],
      ),
    ],
  );
}
