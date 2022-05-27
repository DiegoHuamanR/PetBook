import 'package:flutter/material.dart';

class ConsultaPage extends StatefulWidget{
  const ConsultaPage({Key? key}) : super(key : key);
  State<ConsultaPage> createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
  var _lista = ['Juan Fernando Pérez del Corral','Valentina Laverde de la Rosa','Efraín de las Casas Mejía'];
  String _vista = 'Seleccione un veterinario';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Container(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/images/consulta.jpg')
                  ),
                  Text(
                    'Consultas Médicas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ingrese la consulta que desea realizar.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButton(

                    items: _lista.map((String a){
                      return DropdownMenuItem(
                          value: a,
                          child: Text(a));
                    }).toList(),
                    onChanged: (_value)=>{
                      setState((){
                        _vista == _value;
                      })
                    },
                    hint: Text(_vista),
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
                            hintText: 'Ingrese la consulta que va a realizar',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'Enviar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
            )
        )
      )
    );
  }
}
