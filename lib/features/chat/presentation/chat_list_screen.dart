import 'package:chat_pro/core/utils/color_assets.dart';
import 'package:chat_pro/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Define the slide animation from bottom to top
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from the bottom
      end: Offset.zero,          // End at the original position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: ColorAssets.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 40.h),
        child: Column(
          children: [
            const Expanded(
              child: SearchAndRecentChat(),
            ),
            SizedBox(height: 20.h),
            const Expanded(
              flex: 2,
              child: ChatPeopleList(),
            ),
            SizedBox(height: 20.h),
            const Expanded(
              flex: 10,
              child: RecentChatsList(),
            ),
          ],
        ),

      ),
    );
  }
}

/// Horizontal list of chat people
class ChatPeopleList extends StatelessWidget {
  const ChatPeopleList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://randomuser.me/api/portraits/men/1.jpg',
      'https://randomuser.me/api/portraits/women/1.jpg',
      'https://randomuser.me/api/portraits/men/2.jpg',
      'https://randomuser.me/api/portraits/women/2.jpg',
      'https://randomuser.me/api/portraits/men/3.jpg',
      'https://randomuser.me/api/portraits/women/3.jpg',
      'https://randomuser.me/api/portraits/men/4.jpg',
      'https://randomuser.me/api/portraits/women/4.jpg',
      'https://randomuser.me/api/portraits/men/5.jpg',
      'https://randomuser.me/api/portraits/women/5.jpg',
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageUrls.length, // Use the length of imageUrls list
      itemBuilder: (context, index) {
        return Container(
          width: 80.w,
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: FittedBox(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.w,
                  backgroundImage: NetworkImage(imageUrls[index]),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(height: 8.h),
                Text('Person $index', style: CustomTextStyle.normalStyle),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Vertical list of recent chats
class RecentChatsList extends StatelessWidget {
  const RecentChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> recentChatImages = [
      'https://randomuser.me/api/portraits/men/6.jpg',
      'https://randomuser.me/api/portraits/women/6.jpg',
      'https://randomuser.me/api/portraits/men/7.jpg',
      'https://randomuser.me/api/portraits/women/7.jpg',
      'https://randomuser.me/api/portraits/men/8.jpg',
      'https://randomuser.me/api/portraits/women/8.jpg',
      'https://randomuser.me/api/portraits/men/9.jpg',
      'https://randomuser.me/api/portraits/women/9.jpg',
      'https://randomuser.me/api/portraits/men/10.jpg',
      'https://randomuser.me/api/portraits/women/10.jpg',
    ];

    return Container(
      padding: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40.h),topRight: Radius.circular(40.h))

      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: recentChatImages.length, // Use the length of recentChatImages list
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(recentChatImages[index]), // Use network image
              backgroundColor: Colors.grey,
            ),
            title: Text('Chat $index', style: CustomTextStyle.mediumStyle), // Replace with your data
            subtitle: Text('Recent message preview', style: CustomTextStyle.normalStyle), // Replace with your data
            trailing: Text('10:00 AM', style: CustomTextStyle.normalStyle), // Replace with your data
          );
        },
      ),
    );
  }
}

/// Header search and recent chat
class SearchAndRecentChat extends StatelessWidget {
  const SearchAndRecentChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Search(),
      ],
    );
  }
}

/// Search with icons
class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, ),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white, // White background for the search bar
          borderRadius: BorderRadius.circular(30), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4), // Shadow effect
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey,size: 25.sp,), // Search icon
            SizedBox(width: 10.w),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none, // No border for the TextField
                  hintStyle: CustomTextStyle.mediumStyle.copyWith(color: Colors.grey),
                ),
                style: CustomTextStyle.normalStyle, // Adjust style as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
