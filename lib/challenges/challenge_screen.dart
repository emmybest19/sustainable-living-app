// lib/challenges_screen.dart
import 'package:flutter/material.dart';

const Color kGreen = Color(0xFF13D03B);
const Color kMediumGreen = Color(0xFF1FA62B);
const Color kSoftGreen = Color(0xFFE9FCEB);
const Color kBackground = Color(0xFFF7FBF7);

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          toolbarHeight: 74,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Challenges',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Icon(Icons.emoji_events_outlined, color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.search, color: Colors.black),
            ),
          ],
        ),
        body: Column(
          children: [
            // Tab bar (Active / Recommended / All)
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                indicatorColor: kGreen,
                labelColor: kGreen,
                unselectedLabelColor: Colors.black54,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                tabs: const [
                  Tab(text: 'Active'),
                  Tab(text: 'Recommended'),
                  Tab(text: 'All'),
                ],
              ),
            ),

            // Tab contents
            Expanded(
              child: TabBarView(
                children: [
                  // Active tab
                  _ChallengesListView(activeOnly: true),

                  // Recommended tab
                  _ChallengesListView(recommendedOnly: true),

                  // All tab
                  _ChallengesListView(),
                ],
              ),
            ),
          ],
        ),

        // // bottom navigation bar similar to screenshot
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: 1,
        //   selectedItemColor: kGreen,
        //   unselectedItemColor: Colors.black54,
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.emoji_events),
        //       label: 'Challenges',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.explore),
        //       label: 'Explore',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.people),
        //       label: 'Community',
        //     ),
        //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        //   ],
        // ),
      ),
    );
  }
}

/// A reusable page content that shows the "Active Challenges", "Recommended For You",
/// and "All Challenges" sections. Use the boolean flags to render subsets.
class _ChallengesListView extends StatelessWidget {
  final bool activeOnly;
  final bool recommendedOnly;

  const _ChallengesListView({
    this.activeOnly = false,
    this.recommendedOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    // Use SingleChildScrollView so whole page scrolls (like screenshot)
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ActiveChallenges header + card
          if (!recommendedOnly) ...[
            const Text(
              'Active Challenges',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Big card
            Expanded(
              child: _ActiveChallengeCard(
                image: 'assets/auth/waste_one.jpg',
                category: 'Waste',
                title: 'Zero-Waste Week',
                subtitle: 'Reduce your weekly waste to a minimum.',
                progress: 5 / 7,
                progressText: '5/7 days completed',
              ),
            ),
            const SizedBox(height: 22),
          ],

          // Recommended header + horizontal list
          if (!activeOnly) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommended For You',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All', style: TextStyle(color: kGreen)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(width: 4),
                  _RecommendedCard(
                    image: 'assets/auth/local_waste.jpg',
                    category: 'Food',
                    title: 'Local Produce Challenge',
                    buttonLabel: 'Join Challenge',
                    bgColor: kSoftGreen,
                  ),
                  SizedBox(width: 12),
                  _RecommendedCard(
                    image: 'assets/auth/digital_clean.jpg',
                    category: 'Energy',
                    title: 'Digital Declutter',
                    buttonLabel: 'Join',
                    bgColor: Color(0xFFFEF0E6),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            const SizedBox(height: 22),
          ],

          // All Challenges
          const Text(
            'All Challenges',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _AllChallengeCard(
            image: 'assets/auth/reusable_cup.jpg',
            category: 'Waste',
            title: 'No Disposable Cups',
            subtitle: 'Use a reusable cup for a month.',
            buttonLabel: 'Join',
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

/// Big card used in ActiveChallenges
class _ActiveChallengeCard extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String subtitle;
  final double progress;
  final String progressText;

  const _ActiveChallengeCard({
    required this.image,
    required this.category,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.progressText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // make rounded white card with shadow
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image at top
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: const TextStyle(color: kGreen)),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 12),
                Text(
                  progressText,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    color: kGreen,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// small horizontal recommended card
class _RecommendedCard extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String buttonLabel;
  final Color bgColor;

  const _RecommendedCard({
    required this.image,
    required this.category,
    required this.title,
    required this.buttonLabel,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: const TextStyle(color: kGreen)),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        buttonLabel,
                        style: const TextStyle(color: kGreen),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// All challenges card (smaller)
class _AllChallengeCard extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String subtitle;
  final String buttonLabel;

  const _AllChallengeCard({
    required this.image,
    required this.category,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // white rounded card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: const TextStyle(color: kGreen)),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: kSoftGreen,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      buttonLabel,
                      style: const TextStyle(color: kGreen),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// // lib/challenges_screen.dart
// import 'package:flutter/material.dart';
//
// const Color kGreen = Color(0xFF13D03B);
// const Color kMediumGreen = Color(0xFF1FA62B);
// const Color kSoftGreen = Color(0xFFE9FCEB);
// const Color kBackground = Color(0xFFF7FBF7);
//
// class ChallengesScreen extends StatelessWidget {
//   const ChallengesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: kBackground,
//         appBar: AppBar(
//           toolbarHeight: 74,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: const Text(
//             'Challenges',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//           leading: const Padding(
//             padding: EdgeInsets.only(left: 12.0),
//             child: Icon(Icons.emoji_events_outlined, color: Colors.black),
//           ),
//           actions: const [
//             Padding(
//               padding: EdgeInsets.only(right: 12.0),
//               child: Icon(Icons.search, color: Colors.black),
//             )
//           ],
//         ),
//         body: Column(
//           children: [
//             // Tab bar (Active / Recommended / All)
//             Container(
//               color: Colors.transparent,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: TabBar(
//                 indicatorColor: kGreen,
//                 labelColor: kGreen,
//                 unselectedLabelColor: Colors.black54,
//                 labelStyle:
//                 const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//                 tabs: const [
//                   Tab(text: 'Active'),
//                   Tab(text: 'Recommended'),
//                   Tab(text: 'All'),
//                 ],
//               ),
//             ),
//
//             // Tab contents
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   _ChallengesListView(activeOnly: true),
//                   _ChallengesListView(recommendedOnly: true),
//                   _ChallengesListView(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
