import 'package:flutter/material.dart';
import 'package:youtube/model/Video.dart';

import '../Api.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

  _listarVideos(){


    Api api = Api();
    return api.pesquisar("");
    }

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

    Api api = Api();
    api.pesquisar("");

    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot){
        switch( snapshot.connectionState ){
          case ConnectionState.none :
          case ConnectionState.waiting :
          return Center(
            child: CircularProgressIndicator(),
          );
          break;
          case ConnectionState.active :
          case ConnectionState.done :
          if(snapshot.hasData){
            return ListView.separated(
              itemBuilder: (context, index){

                List<Video> videos = snapshot.data;
                Video video = videos[ index ];

                return Column(
                  children: <Widget>[
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(video.imagem)
                        )
                      ),
                    ),
                    ListTile(
                      title: Text(video.titulo),
                      subtitle: Text( video.canal),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 2,
                color: Colors.grey,
              ),
               itemCount: snapshot.data.length);
          }else{
            return Center(
            child: Text("Nenhum dado a ser exibido!"),
          );
          }
          break;
        }
      },
    );
  }
}