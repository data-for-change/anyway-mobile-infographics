import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../business_logic/view_models/infographics_view_model.dart';
import '../../services/service_locator.dart';
import '../app_styles.dart';

class InfographicPage extends StatefulWidget {
  const InfographicPage(
      {@required this.roadSegment,
      @required this.id,
      @required this.locationDescription});
  final String roadSegment;
  final String locationDescription;

  final int id;

  @override
  _InfographicPageState createState() => _InfographicPageState();
}

class _InfographicPageState extends State<InfographicPage> {
  final InfographicsScreenViewModel _viewModel =
      serviceLocator<InfographicsScreenViewModel>();
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _indicatorIndex = 0;
  List<Widget> _infographics = [];

  @override
  void initState() {
    super.initState();

    //TODO: create real infographics array from API when ready
  }

  void _getInfographicsData() {
    if (_infographics.isEmpty) {
      _infographics = [
        _infographicWidget(),
        _infographicWidget(),
        _infographicWidget(),
        _infographicWidget()
      ];
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _getInfographicsData();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.roadSegment),
      ),
      body: _buildBody(_viewModel),
    );
  }

  Widget _buildBody(InfographicsScreenViewModel viewModel) =>
      ChangeNotifierProvider<InfographicsScreenViewModel>(
          create: (context) => viewModel,
          child: Container(
            color: AnywayColors.lightGreyBackground,
            child: Consumer<InfographicsScreenViewModel>(
                builder: (_, model, child) => Container(
                      padding: const EdgeInsets.all(16),
                      child: model.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _infographics.isNotEmpty
                              ? Stack(
                                  children: [
                                    PageView(
                                        controller: _pageController,
                                        onPageChanged: (index) {
                                          setState(() {
                                            _indicatorIndex = index;
                                          });
                                        },
                                        children: _infographics),
                                    Positioned(
                                        bottom: 0,
                                        child: Container(
                                            height: 50,
                                            child: Center(
                                                child: _pageViewIndicators()))),
                                  ],
                                )
                              : const Center(
                                  child: Text('ERROR GETTING INFOGRAPHICS')),
                    )),
          ));

//TODO: create actual widget
  Widget _infographicWidget() => Container(
        margin: const EdgeInsets.all(8),
        decoration: whiteRoundedContainerWithShadow,
        child: Column(
          children: [
            _infographicSection(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.locationDescription,
                style: darkBoldTitle,
                textAlign: TextAlign.center,
              ),
            ),
            const Expanded(
                child: Center(
              child: Text(
                'COMMENTS SECTION',
                style: darkBoldTitle,
              ),
            ))
          ],
        ),
      );

//TODO: replace with url linke sent from yuval
  Widget _infographicSection() => SvgPicture.asset(
        'assets/freesample.svg',
        height: MediaQuery.of(context).size.height / 3,
      );

  Widget _pageViewIndicators() => Container(
      color: Colors.white,
      height: 20,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _infographics.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  color: index == _indicatorIndex
                      ? AnywayColors.lightBlue
                      : AnywayColors.blackish.withOpacity(0.7),
                  width: 10,
                ),
              );
            }),
      ));
}
