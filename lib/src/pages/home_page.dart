import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _lista()
    );
  }

  Widget _lista() {

    // print(menuProvider.opciones);
    
    /*menuProvider.cargarData().then( (opciones) {
        print('Lista');
        print(opciones);
       });
      Si decidieramos hacer lo anterior, para obtener la data de donde la consumamos, 
      y colocamos el metodo 
        return ListView(
          children: _listaItems(),
        );
      dentro de nuestro cargarData(). La aplicacion, pareceria congelada, por lo que la
      respuesta para resolve esto es a traves del FutureBuilder de Flutter 
    */
    // Utilizaremos el Future Builder
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [], // Data que se cargara en espera de la informacion en consumo
        builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){
          
          // print('builder');
          // print(snapshot.data);

          return ListView(
            children: _listaItems( snapshot.data ),
          );  

        },
    );
      
  }
      
  List<Widget> _listaItems( List<dynamic> data ) {

    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text( opt['texto'] ),
        leading: getIcon( opt['icon'] ),
        trailing: Icon( Icons.keyboard_arrow_down, color: Colors.blue ),
        onTap: () {},
      );

      opciones..add( widgetTemp )
              ..add( Divider() );
    });

    return opciones;

  }
}