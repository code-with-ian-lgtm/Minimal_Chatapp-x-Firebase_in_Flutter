import 'package:chatapp/sevices/auth/auth_service.dart';
import 'package:chatapp/components/my_btn.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginPage extends StatelessWidget {
  // email and pw controller

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  //tap to go to reg page
  final void Function()? onTap;


  loginPage({super.key,
  required this.onTap,
  });

  //login method
  void login(BuildContext context) async{
    //auth service
    final authService = AuthService();

    //try login
    try{
      await authService.signInWithEmailPassword(
        _emailController.text, _pwController.text,);
    }

    //catch any errors

    catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
        
      ));
    }


    // catch any errors

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50,),
            //welcome back
            Text(
              "Welcome back you`ve been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16
              ),
              ),

              const SizedBox(height: 50,),

        
        
            //email txtfield
            MyTextField(
              controller: _emailController,
              obscuretxt: false,
              hintText: "Enter Email",
            ),
            const SizedBox(
              height: 10,
            ),
            //pw textfield
             MyTextField(
              controller: _pwController,
              obscuretxt: true,
              hintText: "Password",
            ),
            const SizedBox(height: 10,),

            //login button
             MyBtn(
              text: "Login",
              onTap: () =>login(context),
              ),
              const SizedBox(height: 25,),


               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                  ),),
                  GestureDetector(
                    onTap: onTap,
                    child: Text("Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary
                    ),),
                  )
                ],
              )
        
        
        
            //register now
        
        
        
          ],
        ),
      ),
    );
  }
}