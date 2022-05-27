import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300] ,
      body: SafeArea(

        child: Center(

          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text(
                  'BIENVENIDO A PETBOOK',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),

                Container(
                  width: 500,
                  height: 500,
                  child: Image.asset('assets/images/veterinario.jpg'),
                )

              ]
          ),
        ),
      ),
    );
  }
}