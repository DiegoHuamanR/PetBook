import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_prueba/main.dart';

import 'package:pet_prueba/reserva.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error : ${snapshot.hasError}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.active){
                User? user = snapshot.data as User?;

                if(user == null){
                  return LogPage();
                }else{
                  return HomePage();
                }
              }
              return Scaffold(
                body: Center(
                  child: Text("Checking Log"),
                ),
              );
            },
          );
        }
        return Scaffold(
          body:Center(
            child: Text("Conectando con la app..."),
          ),
        );
      },
    );
  }

}