import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../business_logic/models/news_flash.dart';
import 'web_api.dart';

//Concrete implementation of the web api service
//https://www.anyway.co.il/api/news-flash?news_flash_count=10&road_segment_only=true&interurban_only=true

class WebApiImplementation implements WebApi {
  final _host = 'www.anyway.co.il';
  final _path = '/api/news-flash';
  final _queryParams = {
    'news_flash_count': '10',
    'road_segment_only': 'true',
    'interurban_only': 'true'
  };

  List<NewsFlashModel> _newsList;

  @override
  Future<List<NewsFlashModel>> getNewsFlashes() async {
    if (_newsList == null) {
      print('getting news flashes from the web');
      final uri = Uri.https(_host, _path, _queryParams);
      final result = await http.get(uri);
      final List jsonObject = json.decode(result.body) as List;
      _newsList =
          jsonObject.map((dynamic e) => NewsFlashModel.fromJson(e)).toList();
    } else {
      //TODO: implement cache / local storage or something
      print('getting news from cache');
    }
    return _newsList;
  }
}
