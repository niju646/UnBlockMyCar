import 'package:flutter/material.dart';
import 'package:unblockmycar/shared/common_text.dart';

class CommonListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  const CommonListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[50],
        ),
        child: Icon(icon, color: Color.fromARGB(255, 15, 86, 119)),
      ),
      title: CommonText(name: title, textcolor: Colors.grey),
      subtitle: CommonText(name: subtitle),
    );
  }
}
