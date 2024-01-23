import 'package:chatapp/sevices/auth/auth_gate.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class introPage extends StatelessWidget {
  const introPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.message_rounded,
            size: 250,
            color:Theme.of(context).colorScheme.primary ),
            const SizedBox(height: 10,),
            Text("Get the new experience of lit messaging"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => const AuthGate())),
                child: Container(
                  decoration:  BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)
                    
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Text(
                    "Empezar",
                    style: 
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    )),
                ),
              ),
            )

           
          ],
        ),
      )

    );
  }
}