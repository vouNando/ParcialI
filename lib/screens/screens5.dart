import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app002_prueba/navegadores/drawer.dart';

// Función para obtener las transferencias desde la API
Future<List> obtenerTransferencias(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['transferencias']; // Accede a la lista bajo la clave 'transferencias'
  } else {
    throw Exception("No se pudo conectar");
  }
}

class ListaTransferenciasScreen extends StatelessWidget {
  const ListaTransferenciasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MiDrawer(),
      appBar: AppBar(
        title: Text("Transferencias", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: listViewTransferencias("https://jritsqmet.github.io/web-api/transferencias.json"),
    );
  }

  // Función que maneja la visualización de las transferencias
  Widget listViewTransferencias(String url) {
    return FutureBuilder(
      future: obtenerTransferencias(url), // Llama a la función que obtiene los datos
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final transferencia = data[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                color: Colors.black,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text("Transferencia: ${transferencia['id']}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  subtitle: Text("Banco: ${transferencia['banco']}", style: TextStyle(color: Colors.white)),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(transferencia['detalles']['imagen_comprobante'], width: 50, height: 50, fit: BoxFit.cover),
                  ),
                  onTap: () {
                    // Al tocar un elemento, mostrar más información en un AlertDialog
                    _showTransferDetails(transferencia, context);
                  },
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // Función que muestra un cuadro de diálogo con más detalles de la transferencia
  void _showTransferDetails(Map transferencia, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Transferencia: ${transferencia['id']}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(transferencia['detalles']['imagen_comprobante'], fit: BoxFit.cover),
              SizedBox(height: 10),
              Text("Monto: \$${transferencia['monto']}", style: TextStyle(color: Colors.black)),
              SizedBox(height: 10),
              Text("Fecha: ${transferencia['fecha']}", style: TextStyle(color: Colors.black)),
              SizedBox(height: 10),
              Text("Banco origen: ${transferencia['origen']['banco_origen']}", style: TextStyle(color: Colors.black)),
              Text("Cuenta origen: ${transferencia['origen']['número_cuenta']}", style: TextStyle(color: Colors.black)),
              SizedBox(height: 10),
              Text("Banco destino: ${transferencia['destino']['banco_destino']}", style: TextStyle(color: Colors.black)),
              Text("Cuenta destino: ${transferencia['destino']['número_cuenta']}", style: TextStyle(color: Colors.black)),
              SizedBox(height: 10),
              Text("Método de pago: ${transferencia['detalles']['método_pago']}", style: TextStyle(color: Colors.black)),
              Text("Estado: ${transferencia['detalles']['estado']}", style: TextStyle(color: Colors.black)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
