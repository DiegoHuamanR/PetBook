import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_prueba/registro.dart';
import 'package:pet_prueba/main.dart';

class LogPage extends StatefulWidget{

  LogPage({Key? key}) : super(key : key);
  State<LogPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LogPage>{
  late String _email;
  late String _password;
  Future<void> _LoginUser() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e){
      print("Error: $e");
    }
  }

  Widget build(BuildContext context){

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Container(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/pata1.jpg')
                ),
                Text(
                  '¡Hola de Nuevo!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Ingrese sus datos, por favor.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 30),

                Padding(padding:

                const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (value){
                          _email = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    )
                    ,
                  )
                  ,
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (value){
                          _password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Contraseña',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MaterialButton(
                    padding: EdgeInsets.all(20),
                    color: Colors.lightBlueAccent,
                    onPressed: _LoginUser,
                    child: Center(
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("¿No tienes cuenta? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>
                                    RegistroPage()));
                      },
                      child: Text("Registrate",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                ),

              ],
            )
              ]
            ),

        )
    )
    );
  }
}