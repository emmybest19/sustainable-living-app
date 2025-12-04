import 'package:flutter/material.dart';

//Screens import
import 'package:sustainable_app/challenges/challenge_screen.dart';
import 'package:sustainable_app/community_screens/community_screen.dart';
import 'package:sustainable_app/me_screens/me_screen.dart';
import 'package:sustainable_app/dashboards/home.dart';

// --- Constants (Use the same constants defined for Page 1) ---
// import 'package:flutter/material.dart';

const Color kMediumGreen = Color(0xFF689F38);
const Color kBackgroundColor = Color(0xFFF9F9F9);

class Page22ExploreDashboard extends StatelessWidget {
  const Page22ExploreDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.0,
        children: const [
          _FeatureTile(
            title: 'Carbon Tracker',
            icon: Icons.fingerprint,
            route: '/page1',
          ),
          _FeatureTile(
            title: 'Waste Reduction',
            icon: Icons.recycling,
            route: '/page5',
          ),
          _FeatureTile(
            title: 'Sustainable Products',
            icon: Icons.shopping_bag_outlined,
            route: '/page16',
          ),
          _FeatureTile(
            title: 'Eco-Friendly Recipes',
            icon: Icons.restaurant_menu,
            route: '/page17',
          ),
          _FeatureTile(
            title: 'Energy Saving Tips',
            icon: Icons.lightbulb_outline,
            route: '/page11',
          ),
          _FeatureTile(
            title: 'Green Travel',
            icon: Icons.flight_takeoff,
            route: '/page12',
          ),
          _FeatureTile(
            title: 'Eco Certifications',
            icon: Icons.verified_user_outlined,
            route: '/page13',
          ),
          _FeatureTile(
            title: 'Articles & News',
            icon: Icons.description_outlined,
            route: '/page9',
          ),
        ],
      ),
    );
  }
}


class _FeatureTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const _FeatureTile({
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: kMediumGreen),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Helper Widgets for Page 22 ---

// class _FeatureTile extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final String route;
//
//   const _FeatureTile({
//     required this.title,
//     required this.icon,
//     required this.route,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, route);
//       },
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: kBackgroundColor,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 5,
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 48, color: kMediumGreen),
//             const SizedBox(height: 12),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MainNavigation extends StatefulWidget {
//   const MainNavigation({super.key});
//
//   @override
//   State<MainNavigation> createState() => _MainNavigationState();
// }
//
// class _MainNavigationState extends State<MainNavigation> {
//   int _currentIndex = 2; // default Explore
//
//   final List<Widget> _screens = [
//     ChallengeScreen(),
//     CommunityScreen(),
//     Page22ExploreDashboard(),
//     CommunityScreen(),
//     MeScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         selectedItemColor: kMediumGreen,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _currentIndex,
//
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.flag_outlined),
//             label: 'Challenges',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group_outlined),
//             label: 'Community',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Me',
//           ),
//         ],
//
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       );
//
//   }
// }
// class MainNavigation extends StatefulWidget {
//   const MainNavigation({super.key});
//
//   @override
//   State<MainNavigation> createState() => _MainNavigationState();
// }
//
// class _MainNavigationState extends State<MainNavigation> {
//   int _currentIndex = 2; // default Explore
//
//   final List<Widget> _screens = [
//     // replace with your actual widgets (HomeScreen if you have it)
//     const Center(child: Text('Home Screen')), // Home placeholder
//     ChallengeScreen(),
//     Page22ExploreDashboard(),
//     CommunityScreen(),
//     MeScreen(),
//   ];
//
//   final List<String> _titles = [
//     'Home',
//     'Challenges',
//     'Explore',
//     'Community',
//     'Me',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           _titles[_currentIndex],
//           style: const TextStyle(
//             color: kMediumGreen,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: _currentIndex == 2
//             ? [
//                 IconButton(
//                   icon: const Icon(Icons.search, color: kMediumGreen),
//                   onPressed: () => Navigator.pushNamed(context, '/19'),
//                 ),
//               ]
//             : null,
//       ),
//
//       // IndexedStack keeps each page alive (preserves scroll/form state)
//       body: IndexedStack(index: _currentIndex, children: _screens),
//
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         selectedItemColor: kMediumGreen,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _currentIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.flag_outlined),
//             label: 'Challenges',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group_outlined),
//             label: 'Community',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Me',
//           ),
//         ],
//         onTap: (index) => setState(() => _currentIndex = index),
//       ),
//     );
//   }
// }

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ChallengesScreen(),
    Page22ExploreDashboard(),  // Explore page
    CommunityScreen(),
    MeScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Challenges',
    'Explore',
    'Community',
    'Me',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(
            color: kMediumGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kMediumGreen,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.flag_outlined), label: 'Challenges'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Me'),
        ],
      ),
    );
  }
}


// class _BottomNavBar extends StatelessWidget {
//   const _BottomNavBar();
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.white,
//       selectedItemColor: kMediumGreen,
//       unselectedItemColor: Colors.grey,
//       currentIndex: 2, // 'Explore' is the third icon
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.flag_outlined),
//           label: 'Challenges',
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.group_outlined),
//           label: 'Community',
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Me'),
//       ],
//       onTap: (index) {
//         // Placeholder for navigation
//       },
//     );
//   }
// }
