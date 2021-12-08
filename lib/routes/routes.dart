import 'package:flutter/widgets.dart';
import 'package:realtime_chat/pages/chat_page.dart';
import 'package:realtime_chat/pages/loading_page.dart';
import 'package:realtime_chat/pages/login_page.dart';
import 'package:realtime_chat/pages/register_page.dart';
import 'package:realtime_chat/pages/users_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'user': (_) => UsersPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};
