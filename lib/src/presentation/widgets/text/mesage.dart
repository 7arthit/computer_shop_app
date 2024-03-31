import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  final IconData icon;

  const Message({Key? key, required this.message, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.grey, size: 60),
          const SizedBox(width: 10, height: 10),
          Text(
            message,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
