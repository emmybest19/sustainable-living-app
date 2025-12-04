import 'package:flutter/material.dart';

import 'package:sustainable_app/community_screens/create_post.dart';

//
// class CommunityScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text("This is community page")));
//   }
// }

class AppColors {
  static const green = Color(0xFF21D742);
  static const accentGreen = Color(0xFF26C266);
  static const pageBackground = Color(0xFFF7F8F7);
  static const textPrimary = Color(0xFF0C1A0C);
  static const textSecondary = Color(0xFF7A8D7A);
  static const chipBgSelected = Color(0xFFDBF3DB);
}

class CommunityScreen extends StatefulWidget {
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int tabIndex = 0;
  List<String> chips = ["Trending", "New", "Tips & Hacks", "Challenges"];
  int selectedChip = 0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final horizontalPadding = media.width > 600 ? 80.0 : 16.0;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.search, color: AppColors.textPrimary),
        //   onPressed: () {},
        // ),
        // title: Text(
        //   "Community",
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     color: AppColors.textPrimary,
        //   ),
        // ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.notifications_outlined, color: AppColors.textPrimary),
        //     onPressed: () {},
        //   )
        // ],
        // centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildChips(context),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  PostCard(
                    author: "Alex Johnson",
                    time: "2h ago",
                    title: "My new home garden setup!",
                    body:
                        "Just started my own little vegetable patch.\nSo excited to see these grow and reduce my carbon footprint…",
                    likes: 152,
                    comments: 12,
                    image:
                        "https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format&fit=crop&w=1200&q=80",
                  ),
                  PostCard(
                    author: "Samantha Bee",
                    time: "5h ago",
                    title: "Zero-waste grocery haul",
                    body:
                        "Here’s what I got from the local farmer’s market today, all without any plastic packaging. "
                        "It’s easier than you think!",
                    likes: 289,
                    comments: 34,
                    image:
                        "https://images.unsplash.com/photo-1528825871115-3581a5387919?auto=format&fit=crop&w=1200&q=80",
                  ),
                  PostCard(
                    author: "David Chen",
                    time: "1d ago",
                    title: "DIY Composting Bin",
                    body:
                        "Sharing my weekend project. It was surprisingly simple to build this compost bin. "
                        "Anyone have tips for a beginner?",
                    likes: 98,
                    comments: 28,
                    image:
                        "https://images.unsplash.com/photo-1523413651479-597eb2da0ad6?auto=format&fit=crop&w=1200&q=80",
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.green,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (ctx) => const CreatePostPage()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),


    );
  }

  Widget _buildChips(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        separatorBuilder: (_, __) => SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = index == selectedChip;
          return ChoiceChip(
            label: Text(
              chips[index],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.green : AppColors.textSecondary,
              ),
            ),
            selected: selected,
            selectedColor: AppColors.chipBgSelected,
            backgroundColor: Colors.white,
            onSelected: (_) => setState(() => selectedChip = index),
          );
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String author, time, title, body, image;
  final int likes, comments;

  const PostCard({
    required this.author,
    required this.time,
    required this.title,
    required this.body,
    required this.likes,
    required this.comments,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final radius = 18.0;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP IMAGE
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// AUTHOR + TIME
                Text(
                  "$author • $time",
                  style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 8),

                /// TITLE
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6),

                /// BODY
                Text(
                  body,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    height: 1.4,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 14),

                /// STATS ROW
                Row(
                  children: [
                    _action(Icons.arrow_upward, likes.toString()),
                    SizedBox(width: 14),
                    _action(Icons.chat_bubble_outline, comments.toString()),
                    Spacer(),
                    Icon(Icons.share_outlined, color: AppColors.accentGreen),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _action(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.accentGreen, size: 20),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
