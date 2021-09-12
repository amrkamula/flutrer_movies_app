import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHandler{
  static final String _apiKey = '28b1c9ee9fb7a7e893481c534ca17787';
  static final String _mostPopular = 'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&page=1';
  static final String _topRated = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$_apiKey&language=en-US&page=1';
  static final String _nowPlaying = 'https://api.themoviedb.org/3/movie/now_playing?api_key=$_apiKey&language=en-US&page=1';

  static Future<Map> getMovies(int flag) async{
    String? link;
    switch(flag){
      case 1:
        link = _mostPopular;
        break;
      case 2:
        link = _topRated;
        break;
      case 3:
        link = _nowPlaying;
    }

    http.Response response = await http.get(Uri.parse(link!));
    var result = jsonDecode(response.body);
    return result;
  }
}