import 'dart:ui';

import 'package:flutter/material.dart';

class ReservaPage extends StatefulWidget {
  const ReservaPage({Key? key}) :super(key: key);

  @override
  State<ReservaPage> createState() => _ReservaPageState();
}
enum SingingCharacter { efec,tar}
class _ReservaPageState extends State<ReservaPage>{
  SingingCharacter? _character = SingingCharacter.efec;
  @override
  Widget build(BuildContext context){


    return Scaffold(

      backgroundColor: Colors.grey[300] ,
      body: SafeArea(

        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [



              Text(
                'RESERVA DE CITAS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Bienvenido, Ingrese el nombre de su mascota',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration:BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ingrese el nombre de su mascota',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Seleccione un servicio y horario',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              //RADIOBUTTON
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration:BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ingrese el servicio',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration:BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ingrese el horario',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Seleccione el metodo de pago: ',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(

                  decoration:BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(

                    padding: const EdgeInsets.only(left:20.0),
                    child: ListTile(
                      title: const Text('Pago en Efectivo'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.efec,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),

                  ),

                ),
              ),
              SizedBox(height: 10),
              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(

                  decoration:BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(

                    padding: const EdgeInsets.only(left:20.0),
                    child: ListTile(
                      title: const Text('Pago en Tarjeta'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.tar,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),

                  ),

                ),
              ),

              SizedBox(height: 10),
              Text(
                'Precio: ',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),





              SizedBox(height: 10),
              //PASSOWRD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration:BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      'Reservar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),


      ),
    );
  }

}
