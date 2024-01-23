// ignore_for_file: unused_field

import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/sevices/auth/auth_service.dart';
import 'package:chatapp/sevices/chat/chat_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  //chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:const  Center(child:  Text("Home")),

        
      ),
      drawer: const MyDrawer(),
      
      body: _buildUserList(),
      
    );
  }


  // Build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }


        //return listview
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      }
      );
  }

  //build individual list tile for user
  Widget _buildUserListItem(
    Map<String, dynamic> userData, BuildContext context){
    //display all users except current user
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
      text: userData["email"],
      onTap: () {
        //tapped on a user go to chat page
        Navigator.push(context, MaterialPageRoute(builder: (context) => chatPage(
          receiverEmail: userData["email"] ,
          receiverID: userData["uid"],
        )));
        
      },
    );
    } else {
      return Container();
    }
  }

}