import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({Key? key, required this.route, required this.title, required this.subtitles}) : super(key: key);

  final String route;
  final String title, subtitles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        SizedBox(height: 10),
        GestureDetector(
          child: Text(
            subtitles,
            style: TextStyle(
              color: Colors.blue[600],
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          onTap: (){
            Navigator.pushReplacementNamed(context, route);
          },
        )
      ],
    );
  }
}