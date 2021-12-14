import 'package:flutter/material.dart';

class BlueBtn extends StatelessWidget {
  const BlueBtn({Key? key, required this.onTap, required this.label}) : super(key: key);

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
          shape: StadiumBorder(),
          elevation: 5,
        ),
        child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(label, style: TextStyle(color: Colors.white, fontSize: 17),),
          ),
        ),
        onPressed: onTap);
  }
}
