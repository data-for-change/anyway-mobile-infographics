import 'package:flutter/foundation.dart';

import '../../services/service_locator.dart';
import '../../services/web_api/web_api.dart';

//This class is responsible for getting the infographics data and prepping it for the UI layer.
//Any data manipulation or parsing should happen here and not in the UI layer

class InfographicsScreenViewModel extends ChangeNotifier {
  final WebApi _webService = serviceLocator<WebApi>();
  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  //TODO: implement infographic API
}
