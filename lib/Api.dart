import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDz6BUU8LOvl2ZRJWQpFoFsn7Ht8Rbn4PQ";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://youtube.googleapis.com/youtube/v3/";

class Api {

  pesquisar(String pesquisa) async{

  http.Response response = await http.get(
    URL_BASE + "search"
    "?part=snippet"
    "&type=video"
    "&maxResults=20"
    "&order=date"
    "&key=$CHAVE_YOUTUBE_API"
    "&channelId=$ID_CANAL"
    "&q=$pesquisa"
  );

  if( response.statusCode == 200){
    
    Map<String, dynamic> dadosJson = json.decode( response.body );

    //List<Video> video = dadosJson["items"];

    for( var video in dadosJson["items"]){
      print("Resultado: " + video.toString());
    }

    //print("resultado: " + dadosJson["items"][2]["snippet"]["title"].toString() );

  }else{
    
  }

  }

}