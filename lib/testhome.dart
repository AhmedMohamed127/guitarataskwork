import 'package:flutter/material.dart';

class TopUsersGrid extends StatelessWidget {
  const TopUsersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      TopUserCardData(
        title: "TOP 5 STREAMER",
        subtitle: "Middle East",
        period: "Monthly",
        bgGradient: const LinearGradient(
          colors: [Color(0xFF9DD6F9), Color(0xFF72BDEB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        icon: Icons.videocam_rounded,
        users: [
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
        ],
      ),
      TopUserCardData(
        title: "TOP 5 SUPPORTER",
        subtitle: "Middle East",
        period: "Monthly",
        bgGradient: const LinearGradient(
          colors: [Color(0xFFB84A8A), Color(0xFF6A1D45)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        icon: Icons.emoji_events_rounded,
        users: [
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
          "assets/images/Avatar.png",
        ],
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2, // adjust for shape
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => TopUserCard(data: items[i]),
    );
  }
}

class TopUserCardData {
  final String title;
  final String subtitle;
  final String period;
  final LinearGradient bgGradient;
  final IconData icon;
  final List<String> users;

  TopUserCardData({
    required this.title,
    required this.subtitle,
    required this.period,
    required this.bgGradient,
    required this.icon,
    required this.users,
  });
}

class TopUserCard extends StatelessWidget {
  final TopUserCardData data;
  const TopUserCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: data.bgGradient,
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
                  data.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(data.icon, size: 16, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Subtitle + Period
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                data.period,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Users
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: data.users
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
}
