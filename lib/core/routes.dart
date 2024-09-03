import 'package:chat_pro/features/authentication/presentation/login_screen.dart';
import 'package:chat_pro/features/authentication/presentation/signup_screen.dart';
import 'package:chat_pro/features/chat/presentation/chat_list_screen.dart';
import 'package:chat_pro/features/chat/presentation/chat_view_screen.dart';
import 'package:chat_pro/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String loginScreen = "/login_screen";
  static const String signUpScreen = "/signup_screen";
  static const String profileScreen = "/profile_screen";
  static const String chatListScreen = "/chat_list_screen";
  static const String chatViewScreen = "/chat_view_screen";


  static Route onGenerateRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case signUpScreen:
        return _materialRoute(const SignUpScreen());
      case profileScreen:
        return _materialRoute(const ProfileScreen());
      case loginScreen:
        return _materialRoute(const LoginScreen());
      case chatListScreen:
        return _materialRoute(const ChatListScreen());
      case chatViewScreen:
        return _materialRoute(const ChatViewScreen());
      default:
        return _materialRoute(const ChatListScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
