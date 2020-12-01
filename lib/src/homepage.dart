import 'package:flutter/material.dart';
import 'package:onny_bus_usuario/src/pages/pagina1.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.blue[300].withOpacity(0.29), BlendMode.hardLight)),
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 60)),
            Center(
              child: 
              Image(
                height: 307.19,
                width:286 ,
                image: AssetImage('assets/logo 2.png'),
              ),
            ),
            Text("Viajar esta en tus manos",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'lobster', color: Colors.black87 ),),
            SizedBox(height: 200,),
            
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal:50, vertical: 10),
              elevation: 20,
              color: Color.fromRGBO(125, 200, 249, 1.8),
              shape: StadiumBorder(),
              child: Text("Bienvenido", style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold, fontFamily: "lobster" ),),
              onPressed: (){
                    Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (context){
                        return  homes();
                      },
                    ),
                  );
              }
            
            )
          ],
          
        ),
        
      ),
    );
  }
}
