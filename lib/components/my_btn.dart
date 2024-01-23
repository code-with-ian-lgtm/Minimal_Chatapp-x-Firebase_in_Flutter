import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyBtn({super.key,
  required this.text,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child:  Center(
          
          child: Text(text),
        ),
      ),
    );
  }
}