import 'package:get_it/get_it.dart';

import '../business_logic/view_models/infographics_view_model.dart';
import '../business_logic/view_models/news_view_model.dart';
import '../services/web_api/web_api.dart';
import '../services/web_api/web_api_implementation.dart';

// Using GetIt is a convenient way to provide services and view models
// anywhere we need them in the app.
GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiImplementation());

  // view models
  serviceLocator.registerFactory<NewsFlashesScreenViewModel>(
      () => NewsFlashesScreenViewModel());
  serviceLocator.registerFactory<InfographicsScreenViewModel>(
      () => InfographicsScreenViewModel());
}
