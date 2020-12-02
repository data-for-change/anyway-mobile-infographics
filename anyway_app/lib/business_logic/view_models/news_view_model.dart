import 'package:flutter/foundation.dart';

import '../../services/service_locator.dart';
import '../../services/web_api/web_api.dart';
import '../models/news_flash.dart';
import '../utils/enums.dart';
import '../utils/utility.dart';

//This class is responsible for getting the news flashes data and prepping it for the UI layer.
//Any data manipulation or parsing should happen here and not in the UI layer

class NewsFlashesScreenViewModel extends ChangeNotifier {
  final WebApi _webService = serviceLocator<WebApi>();

  final List<NewsFlashPresentation> _allNews = [];

  List<NewsFlashPresentation> _news = [];

  List<NewsFlashPresentation> get newsList => _news;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getNews() async {
    _isLoading = true;
    notifyListeners();
    try {
      final data = await _webService.getNewsFlashes();
      for (final NewsFlashModel newsItem in data) {
        _allNews.add(NewsFlashPresentation(
            date: formattedDate(newsItem.date),
            description: removeSpecialChar(newsItem.description),
            organization: newsItem.organization,
            location: newsItem.location,
            roadSegment: newsItem.roadSegmentName,
            id: newsItem.id));
      }
      _news = _allNews;
    } catch (error) {
      //TODO: implement error handling
      print('error getting news flashes $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void sortBy({@required NewsSource source}) {
    if (source == NewsSource.all) {
      _news = _allNews;
    } else {
      _news = _allNews
          .where((item) => item.organization == source.displayName())
          .toList();
    }

    notifyListeners();
  }
}

//Helper class to only pass needed information to UI
class NewsFlashPresentation {
  final String date;
  final String description;
  final String organization;
  final String location;
  final String roadSegment;
  final int id;
  NewsFlashPresentation(
      {@required this.date,
      @required this.description,
      @required this.organization,
      @required this.location,
      @required this.roadSegment,
      @required this.id});
}
