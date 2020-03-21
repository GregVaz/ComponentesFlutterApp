import 'package:flutter/material.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/pages/alert_page.dart';

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
          // El builder contiene una referencia al BuilderContext, para hacer referencia a la pagina donde nos encontramos
          
          // print('builder');
          // print(snapshot.data);

          return ListView(
            children: _listaItems( snapshot.data , context),
          );  

        },
    );
      
  }
      
  List<Widget> _listaItems( List<dynamic> data , BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text( opt['texto'] ),
        leading: getIcon( opt['icon'] ),
        trailing: Icon( Icons.keyboard_arrow_down, color: Colors.blue ),
        onTap: () {
          // Navegacion sencilla
          // final route = MaterialPageRoute(
          //   builder: ( context ) => AlertPage()
          //   ); //Ruta simple
          // Navigator.push(context, route);   

          //Navegacion de rutas con nombre
          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );
    });

    return opciones;

  }
}