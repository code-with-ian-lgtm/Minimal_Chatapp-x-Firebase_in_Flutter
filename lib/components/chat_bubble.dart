// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  ChatBubble({super.key,
  required this.message,
  required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: isCurrentUser ? Colors.green : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white
        ),),
    );
  }
}