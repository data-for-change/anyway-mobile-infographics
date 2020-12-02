import 'package:anyway_app/business_logic/utils/enums.dart';
import 'package:anyway_app/ui/views/infographic_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/view_models/news_view_model.dart';
import '../../services/service_locator.dart';
import '../app_styles.dart';
import '../widgets/news_flash_cell.dart';

class NewsFlashesScreen extends StatefulWidget {
  @override
  _NewsFlashesScreenState createState() => _NewsFlashesScreenState();
}

class _NewsFlashesScreenState extends State<NewsFlashesScreen> {
  final NewsFlashesScreenViewModel _viewModel =
      serviceLocator<NewsFlashesScreenViewModel>();

  //TODO: move call to get the news flashes to better place?
  @override
  void initState() {
    super.initState();
    _viewModel.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ANYWAY APP'),
      ),
      body: _buildBody(_viewModel),
    );
  }

  void _navigateToInfographicPage({@required NewsFlashPresentation item}) =>
      Navigator.push(
          context,
          MaterialPageRoute<void>(
              builder: (context) => InfographicPage(
                    roadSegment: item.roadSegment,
                    id: item.id,
                    locationDescription: item.location,
                  )));

  Widget _buildBody(NewsFlashesScreenViewModel viewModel) =>
      ChangeNotifierProvider<NewsFlashesScreenViewModel>(
          create: (context) => viewModel,
          child: Container(
            color: AnywayColors.lightGreyBackground,
            child: Consumer<NewsFlashesScreenViewModel>(
                builder: (_, model, child) => Container(
                      padding: const EdgeInsets.all(16),
                      child: model.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : model.newsList.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _sourceFilterButtons(model),
                                    Expanded(child: _buildNewsList(model))
                                  ],
                                )
                              : const Center(child: Text('ERROR GETTING NEWS')),
                    )),
          ));

  Widget _sourceFilterButtons(NewsFlashesScreenViewModel viewModel) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 65,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: NewsSource.values.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 16, top: 16),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: AnywayColors.lightBlue,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8)),
                minWidth: 30,
                child: Text(
                  NewsSource.values[index].displayName(),
                  style: smallBoldLightBlue,
                  textAlign: TextAlign.right,
                ),
                onPressed: () =>
                    viewModel.sortBy(source: NewsSource.values[index])),
          ),
        ),
      );

  Widget _buildNewsList(NewsFlashesScreenViewModel viewModel) =>
      ListView.builder(
          itemCount: viewModel.newsList.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () =>
                    _navigateToInfographicPage(item: viewModel.newsList[index]),
                child: NewsFlashCell(
                    organization: viewModel.newsList[index].organization,
                    description: viewModel.newsList[index].description,
                    date: viewModel.newsList[index].date),
              ));
}
