// import 'package:flutter/material.dart';
//
// const Color kMediumGreen = Color(0xFF689F38);
// const Color kBackground = Color(0xFFF9F9F9);
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Row(
//                   children: [
//                     const CircleAvatar(
//                       radius: 20,
//                       backgroundImage: AssetImage('assets/user.png'),
//                     ),
//                     const SizedBox(width: 10),
//                     const Text(
//                       'Hello, Alex!',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//                 Icon(Icons.notifications_outlined, color: Colors.black),
//               ],
//             ),
//             SizedBox(height: 20,),
//             // ECO TIP IMAGE
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Image.asset(
//                 'assets/auth/create.png',
//                 height: 180,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             const Text(
//               "Today's Eco Tip",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//
//             const Text(
//               "Did you know that turning off the tap while brushing your teeth can save up to 8 gallons of water a day? It's a small change with a big impact!",
//               style: TextStyle(fontSize: 15, height: 1.4),
//             ),
//             const SizedBox(height: 12),
//
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: kMediumGreen,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
//                 child: Text('Learn More'),
//               ),
//             ),
//
//             const SizedBox(height: 24),
//
//             const Text(
//               'My Impact Summary',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//
//             _impactCard(
//               title: 'Carbon Footprint',
//               value: '12.5 kg CO2e',
//               changeText: 'This Week ↓5%',
//             ),
//
//             const SizedBox(height: 16),
//
//             _impactCard(
//               title: 'Waste Reduction',
//               value: '3.2 lbs Saved',
//               changeText: 'This Week ↑10%',
//             ),
//
//             const SizedBox(height: 16),
//
//             _progressCard(),
//
//             const SizedBox(height: 24),
//
//             const Text(
//               'Discover More',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//
//             _discoverCard(
//               image: 'assets/auth/create.png',
//               title: 'Zero-Waste Veggie Bowl',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Impact Card
// Widget _impactCard({
//   required String title,
//   required String value,
//   required String changeText,
// }) {
//   return Container(
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       boxShadow: [
//         BoxShadow(color: Colors.grey, blurRadius: 6),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: const TextStyle(fontSize: 16)),
//         const SizedBox(height: 8),
//
//         Text(
//           value,
//           style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 6),
//
//         Text(changeText, style: const TextStyle(color: Colors.grey)),
//       ],
//     ),
//   );
// }
//
// // Progress Card
// Widget _progressCard() {
//   return Container(
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       boxShadow: [
//         BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 6),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Challenge Progress', style: TextStyle(fontSize: 16)),
//             Text('75%', style: TextStyle(fontWeight: FontWeight.bold)),
//           ],
//         ),
//         const SizedBox(height: 10),
//
//         LinearProgressIndicator(
//           value: 0.75,
//           color: kMediumGreen,
//           backgroundColor: Colors.grey.shade300,
//         ),
//
//         const SizedBox(height: 10),
//         const Text('Plastic-Free July', style: TextStyle(color: Colors.grey)),
//       ],
//     ),
//   );
// }
//
// // Discover More Card
// Widget _discoverCard({required String image, required String title}) {
//   return Container(
//     padding: const EdgeInsets.all(8),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(16),
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 6),
//       ],
//     ),
//     child: Column(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.asset(
//             image,
//             height: 150,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 6),
//       ],
//     ),
//   );
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

const Color kMediumGreen = Color(0xFF689F38);
const Color kBackground = Color(0xFFF9F9F9);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final user = snapshot.data;
              // derive a friendly name: displayName -> local part of email -> 'User'
              final displayName = user?.displayName ??
                  (user?.email != null ? user!.email!.split('@')[0] : 'User');

              final avatarImageProvider = user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : const AssetImage('assets/user.png') as ImageProvider;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: avatarImageProvider,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Hello, $displayName!',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.notifications_outlined, color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // ECO TIP IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/auth/create.png',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Today's Eco Tip",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Did you know that turning off the tap while brushing your teeth can save up to 8 gallons of water a day? It's a small change with a big impact!",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kMediumGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Text('Learn More'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'My Impact Summary',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _impactCard(
                    title: 'Carbon Footprint',
                    value: '12.5 kg CO2e',
                    changeText: 'This Week ↓5%',
                  ),
                  const SizedBox(height: 16),
                  _impactCard(
                    title: 'Waste Reduction',
                    value: '3.2 lbs Saved',
                    changeText: 'This Week ↑10%',
                  ),
                  const SizedBox(height: 16),
                  _progressCard(),
                  const SizedBox(height: 24),
                  const Text(
                    'Discover More',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _discoverCard(
                    image: 'assets/auth/create.png',
                    title: 'Zero-Waste Veggie Bowl',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// Impact Card
Widget _impactCard({
  required String title,
  required String value,
  required String changeText,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(color: Colors.grey, blurRadius: 6),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(changeText, style: const TextStyle(color: Colors.grey)),
      ],
    ),
  );
}

// Progress Card
Widget _progressCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 6),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Challenge Progress', style: TextStyle(fontSize: 16)),
            Text('75%', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: 0.75,
          color: kMediumGreen,
          backgroundColor: Colors.grey.shade300,
        ),
        const SizedBox(height: 10),
        const Text('Plastic-Free July', style: TextStyle(color: Colors.grey)),
      ],
    ),
  );
}

// Discover More Card
Widget _discoverCard({required String image, required String title}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 6),
      ],
    ),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
      ],
    ),
  );
}
