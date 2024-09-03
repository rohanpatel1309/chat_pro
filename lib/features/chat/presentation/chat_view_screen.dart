import 'package:chat_pro/core/utils/color_assets.dart';
import 'package:chat_pro/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatViewScreen extends StatelessWidget {
  const ChatViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            EdgeInsets.only(top: 40.h, left: 15.w, right: 15.w, bottom: 15.h),
        color: ColorAssets.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          children: [
            Header(),
            MessageList(),
            MessageInputArea(),
          ],
        ),
      ),
    );
  }
}

/// Header
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25.w,
          backgroundImage: const NetworkImage(
            'https://randomuser.me/api/portraits/men/1.jpg',
          ),
          backgroundColor: Colors.grey,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text('Parath Xavier', style: CustomTextStyle.mediumStyle),
      ],
    );
  }
}

/// Search with icons
class MessageInputArea extends StatelessWidget {
  const MessageInputArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w),
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
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Message...',
                  border: InputBorder.none, // No border for the TextField
                  hintStyle:
                      CustomTextStyle.mediumStyle.copyWith(color: Colors.grey),
                  suffixIcon: Icon(Icons.send)),
              style:
                  CustomTextStyle.mediumStyle.copyWith(color: Colors.black54),
              // Adjust style as needed
            ),
          ),
        ],
      ),
    );
  }
}

/// Message list
class MessageList extends StatelessWidget {
  const MessageList({super.key});

  static const List<String> msg = [
    "Hello",
    "Hi",
    "Parath this side",
    "Ohh Embedded Dev",
    "Yes",
    "Okay",

    "Hello",
    "Hi",
    "Parath this side",
    "Ohh Embedded Dev",
    "Yes",
    "Okay",
    "Hello",
    "Hi",
    "Parath this side",
    "Ohh Embedded Dev",
    "Yes",
    "Okay",
    "Hello",
    "Hi",
    "Parath this side",
    "Ohh Embedded Dev",
    "Yes",
    "Okay",
    "Hello",
    "Hi",
    "Parath this side",
    "Ohh Embedded Dev",
    "Yes",
    "Okay",
    "Hello",
    "Hi",
    "Parath this side",
    "Ohh Embedded Dev",
    "Yes",
    "Okay",
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        // Ensure this is appropriate for your needs
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: msg.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: index % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery
                        .of(context)
                        .size
                        .width * 0.8, // Max width constraint
                  ),

                  margin:  EdgeInsets.symmetric(vertical: 8.h),
                  // Add margin between messages
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.h),
                    color: index % 2 == 0 ? Colors.white12 : Colors.white60,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  // Add padding inside the container
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        msg[index],
                        style: CustomTextStyle.normalStyle.copyWith(
                            color: index % 2 == 1 ? Colors.black : Colors.white),
                      ),
                      Text(
                        "08:00 PM",
                        style: CustomTextStyle.normalStyle.copyWith(fontSize: 9.sp,
                            color: index % 2 == 1 ? Colors.black : Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );

  }
}
