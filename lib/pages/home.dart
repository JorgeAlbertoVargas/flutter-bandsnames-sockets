import 'dart:io';

import 'package:band_names/models/band.dart';
import 'package:flutter/material.dart';

//Crear una Lista
List<Band>bands = [
  Band(id: '1', name: 'Metalica', votes: 5),
  Band(id: '2', name: 'Queen', votes: 3),
  Band(id: '3', name: 'Heroes Del Silencio', votes: 4),
  Band(id: '4', name: 'Bon Jovi', votes: 2),
  Band(id: '5', name: 'Def Lepard', votes: 5),
];

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //Agregar un AppBar
      appBar: AppBar(
        title: const Text('BandNames',style: TextStyle(color: Colors.indigo)),
        backgroundColor: Colors.indigo,
        elevation: 1,
      ),

      //Crear un List View en el Body
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) { 
        return _bandTile(bands[index]);
       }),
      //Crear un Action Button
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed:addNewBand,
        child: const Icon(Icons.add),
         ),
   );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0,2)),
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}',style:const  TextStyle(fontSize: 20)),
        onTap: () {
          print(band.name);
        },
      );
      
  }

  //Metodo AddNewBand
  addNewBand(){
    final textController =  TextEditingController();
    if(Platform.isAndroid){ //Verifica si estamos en Android
      return  showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('New Banda Name'),
          content:  TextField(
            controller: textController,
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5,
              textColor: Colors.blue,
              
              //Llamar al Metodo AddBandToList
              onPressed:()=> addBandToList(textController.text),
              child:const Text('Add'), 
              )
          ],
        );
        
      },
    );
    } 
  }

  //Metodo Para agregar una Nueva Banda
  addBandToList(String name){
    print(name);
    if(name.length > 0){
      bands.add(Band(id: DateTime.now().toString(),name: name,votes: 3));
      setState(() {
        
      });
    }

    //Cerrar el Dialog
    Navigator.pop(context);
  }
}