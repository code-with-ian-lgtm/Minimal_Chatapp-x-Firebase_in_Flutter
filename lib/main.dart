import 'package:chatapp/pages/intro_page.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    child: const MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const introPage(),
      // const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,

    );
    }
    }
    
    class LoginPage {
    }