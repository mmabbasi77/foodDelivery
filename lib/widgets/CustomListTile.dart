import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  CustomListTile({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: size.height * 1.8 / 75, fontWeight: FontWeight.bold),
      ),
    );
  }
}
