import 'package:flutter/material.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/emAlta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';
import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    

    List<Widget> telas = [
      Inicio( _resultado ),
      EmAlta(),
      Inscricao(),
      Biblioteca()

    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,

          ),
        actions: <Widget>[

          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("acao: videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("acao: user");
            },
          )
          */
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
                            });
              print("resultado: " + res);
            },
          )

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _indiceAtual,
      onTap: (indice){
        setState(() {
          _indiceAtual = indice;        
        });
      },
      type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            title: Text("Inicio"),
            icon: Icon(Icons.home)
          ),
           BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot)
          ),
           BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            title: Text("inscrições"),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            title: Text("biblioteca"),
            icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}