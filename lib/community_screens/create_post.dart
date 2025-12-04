import 'package:flutter/material.dart';


class AppColors {
  static const Color primaryGreen = Color(0xFF4A9B5E); // used for placeholders
  static const Color paleGreen1 = Color(0xFFE7F7E8); // title field bg
  static const Color paleGreen2 = Color(0xEFFAF1); // content field bg (approx)
  static const Color addMediaBg = Color(0xFFE9F8EB);
  static const Color inputBorder = Color(0xFFC8EACD);
  static const Color neonPost = Color(0xFF00FF44);
}

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _contentCtrl = TextEditingController();

  final List<String> _thumbnails = [
    'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?w=800',
    'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?w=800',
  ];

  void _onPost() {
    final title = _titleCtrl.text.trim();
    // ignore: unused_local_variable
    final content = _contentCtrl.text.trim();
    // In a real app you'd validate and send this data.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Posted${title.isNotEmpty ? ": $title" : ''}'),
    ));
  }

  void _onAddMedia() {
    // Placeholder for media picker
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Add Photo/Video tapped'),
    ));
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _contentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 20.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 26),
          onPressed: () {},
        ),
        title: const Text('Create Post',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),

              // Title label
              const Text('Title', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black)),
              const SizedBox(height: 10),

              // Title input (pill)
              Container(
                height: 58,
                decoration: BoxDecoration(
                  color: AppColors.paleGreen1,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: _titleCtrl,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Add a title (optional)',
                    hintStyle: TextStyle(fontSize: 16, color: AppColors.primaryGreen),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Content label
              const Text('Content', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black)),
              const SizedBox(height: 10),

              // Content large text area
              Container(
                height: 350,
                decoration: BoxDecoration(
                  color: AppColors.paleGreen1,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                alignment: Alignment.topLeft,
                child: TextField(
                  controller: _titleCtrl,
                  maxLines: null, // ← IMPORTANT: allows multi-line hint & text
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                  decoration: const InputDecoration.collapsed(
                    hintText: "What's on your mind? Share a tip, ask a\nquestion, or start a discussion...",
                    hintStyle: TextStyle(fontSize: 16, color: AppColors.primaryGreen),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Thumbnails
              Row(
                children: _thumbnails
                    .map((url) => Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      url,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
                    .toList(),
              ),

              const SizedBox(height: 22),

              // Add Photo/Video button (pill)
              GestureDetector(
                onTap: _onAddMedia,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.addMediaBg,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: AppColors.inputBorder, width: 1.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_photo_alternate_outlined, size: 22, color: Colors.black87),
                      SizedBox(width: 12),
                      Text('Add Photo/Video', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black87)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Post button (neon green)
              GestureDetector(
                onTap: _onPost,
                child: Container(
                  height: 66,
                  decoration: BoxDecoration(
                    color: AppColors.neonPost,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Post', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
