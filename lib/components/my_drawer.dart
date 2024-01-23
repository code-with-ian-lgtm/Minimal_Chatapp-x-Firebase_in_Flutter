import 'package:chatapp/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/sevices/auth/auth_service.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

    void logout() {
    //get auth services
    // ignore: no_leading_underscores_for_local_identifiers
    final _auth = AuthService();
    _auth.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: 
       Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                         //icon
            const DrawerHeader(child: 
            Icon(Icons.message, size: 80,)),
            //home list tile
            ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            
            ),
            
            //settings list tile
             ListTile(
              title: const Text("settings"),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, 
                MaterialPageRoute(builder: 
                (context)=> const settingsPage() ));
              },
            
            ),
              ],
            ),
          ),
 
          //logout list tile
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ListTile(
              title: const Text("logout"),
              leading: const Icon(Icons.logout),
              onTap: () {
                logout();
              },
             
                       ),
           )
        ],
      ),
    );
  }
}