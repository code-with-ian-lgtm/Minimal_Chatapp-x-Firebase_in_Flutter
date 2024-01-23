import 'package:chatapp/sevices/auth/auth_service.dart';
import 'package:chatapp/components/my_btn.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPAge extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  //tap to login
  final void Function()? onTap;


  RegisterPAge({super.key,
  required this.onTap});

  //register method
  void register(BuildContext context){
    //get Auth service

    // ignore: no_leading_underscores_for_local_identifiers
    final _auth = AuthService();

    //password match => create user
    if (_pwController.text == _confirmController.text){
      try{
        _auth.signUpWithEmailPassword(
          _emailController.text, 
          _pwController.text
          );

      } catch (e) {
         // ignore: use_build_context_synchronously
      showDialog(context: context,
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
        
      ));

      }

    }
    //password missmatch show error
    else {
      showDialog(context: context,
      builder: (context) => const AlertDialog(
        title: Text("Password missmatch"),
        
      ));
    }

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
              "Lets create an account for you",
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

             MyTextField(
              controller: _confirmController,
              obscuretxt: true,
              hintText: "Confirm Password",
            ),
            const SizedBox(height: 10,),


            //login button
             MyBtn(
              text: "Register",
              onTap: () => register(context),
              ),
              const SizedBox(height: 25,),


               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                  ),),
                  GestureDetector(
                    onTap: onTap,
                    child: Text("Login",
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