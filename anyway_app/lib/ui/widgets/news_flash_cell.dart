import 'package:flutter/material.dart';
import '../app_styles.dart';

class NewsFlashCell extends StatelessWidget {
  const NewsFlashCell(
      {@required this.organization,
      @required this.description,
      @required this.date});
  final String organization;
  final String description;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: whiteRoundedContainerWithShadow,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(children: [
              Text(
                date,
                style: smallBoldLightBlue,
              ),
              const Text(
                ', ',
                style: smallBoldLightBlue,
              ),
              Text(
                organization,
                style: smallBoldLightBlue,
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              description,
              style: smallBoldLightBlue,
            ),
          ),
        ],
      ),
    );
  }
}
