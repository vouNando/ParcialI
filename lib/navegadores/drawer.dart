
import 'package:app002_prueba/main.dart';
import 'package:app002_prueba/screens/screens1.dart';
import 'package:app002_prueba/screens/screens2.dart';
import 'package:app002_prueba/screens/screens3.dart';
import 'package:app002_prueba/screens/screens4.dart';
import 'package:app002_prueba/screens/screens5.dart';
import 'package:flutter/material.dart';


class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Inicio"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screens1())),
          ),
          ListTile(
            title: Text("registro"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen2())),
          ),
          ListTile(
            title: Text("nada"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screens3())),
          ),
          ListTile(
            title: Text("depositos"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screens4())),
          ),
           ListTile(
            title: Text("Api"),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => ListaTransferenciasScreen())),
          ),

         
        ],
      ),
    );
  }
}
