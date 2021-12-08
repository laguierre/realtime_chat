import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(image: AssetImage('lib/assets/images/tag-logo.png')),
            Text(title, style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}