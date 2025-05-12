import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const DefaultButtonWidget(
      {required this.title, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .07,
        color: Colors.blue,
        child: Center(
            child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height * .022,
          ),
        )),
      ),
    );
  }
}
