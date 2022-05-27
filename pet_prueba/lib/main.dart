import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_prueba/consulta.dart';
import 'package:pet_prueba/dashboard.dart';
import 'package:pet_prueba/login.dart';
import 'package:pet_prueba/registro.dart';
import 'package:pet_prueba/reserva.dart';
import 'package:pet_prueba/mascotas.dart';

import 'my_drawer_header.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context){
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashBoardPage();
    } else if (currentPage == DrawerSections.reservar) {
      container = ReservaPage();
    } else if (currentPage == DrawerSections.consulta) {
      container = ConsultaPage();
    }else if (currentPage == DrawerSections.mascotas) {
      container = MascotasPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[700],
        title: Text("PetBook"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget MyDrawerList(){
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // muestra la lista del menu
        children: [
          menuItem(1, "Home", Icons.home,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Reserva de Citas", Icons.event,
              currentPage == DrawerSections.reservar ? true : false),
          menuItem(3, "Consulta Médica", Icons.message,
              currentPage == DrawerSections.consulta ? true : false),
          menuItem(4, "Tus Mascotas", Icons.pets,
              currentPage == DrawerSections.mascotas ? true : false),
          menuItem(5, "SignOut", Icons.exit_to_app,
              currentPage == DrawerSections.signout ? true : false),
        ],

      ),
    );
  }
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(

      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.reservar;
            } else if (id == 3) {
              currentPage = DrawerSections.consulta;
            }else if (id == 4) {
              currentPage = DrawerSections.mascotas;
            }else if (id == 5) {
              FirebaseAuth.instance.signOut();
            }
          });

        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child:  Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}


enum DrawerSections {
  dashboard,
  reservar,
  consulta,
  mascotas,
  signout,
}




