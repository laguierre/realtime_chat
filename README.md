# Realtime Chat App

Realtime Chat App, using a backend en Node. Using 'http://localhost:3000/api' y sockets

## General Info

**Packages used:**

- pull_to_refresh: ^2.0.0 [link](https://pub.dev/packages/pull_to_refresh)
- provider: ^6.0.1 [link](https://pub.dev/packages/provider)
- http: ^0.13.4 [link](https://pub.dev/packages/http)
- flutter_secure_storage: ^5.0.2 [link](https://pub.dev/packages/flutter_secure_storage)
- socket_io_client: ^1.0.2 [link](https://pub.dev/packages/socket_io_client)

## Screenshots
<p align="center">
<img src="https://github.com/laguierre/realtime_chat/blob/master/screenshots/Screenshot_1645485263.png" height="700">
<img src="https://github.com/laguierre/realtime_chat/blob/master/screenshots/Screenshot_1645485316.png" height="700">
</p>

```
final Map<String, Widget Function(BuildContext)> appRoutes = {
  'user': (_) => UsersPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
        ChangeNotifierProvider(create: (_) => ChatService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RealTime Chat',
        initialRoute: 'login',
        routes: appRoutes,
      ),
    );
  }
}
```
