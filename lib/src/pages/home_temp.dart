import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItems()
      ),
    );
  }

  List<Widget> _crearItems() {

    List<Widget> lista = new List<Widget>(); // Sin numero se declara un lista dinamica

    for(String opcion in opciones) {
      
      final tempWidget = ListTile(
        title: Text( opcion ),
      );
      
      lista..add( tempWidget )
           ..add( Divider() );

      // lista.add( tempWidget );
      // lista.add( Divider() );
    }
    return lista;
  }


}