import 'package:episode_1/custom/BorderBox.dart';
import 'package:episode_1/custom/OptionButton.dart';
import 'package:episode_1/sample_data.dart';
import 'package:episode_1/utils/constants.dart';
import 'package:episode_1/utils/custom_functions.dart';
import 'package:episode_1/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final dynamic itemData;
  const DetailPage({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 15;
    final EdgeInsets sidepadding = EdgeInsets.symmetric(horizontal: padding);
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(itemData["image"]),
                      Positioned(
                        width: size.width,
                        top: padding,
                        child: Padding(
                          padding: sidepadding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: BorderBox(
                                  width: 50,
                                  height: 50,
                                  child: const Icon(Icons.keyboard_backspace),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              BorderBox(
                                width: 50,
                                height: 50,
                                child: Icon(Icons.favorite_outline_outlined),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  addVerticalSpace(padding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: sidepadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${formatCurrency(itemData["amount"])}",
                              style: themeData.textTheme.headline1,
                            ),
                            addVerticalSpace(5),
                            Text(
                              "${itemData["address"]}",
                              style: themeData.textTheme.subtitle2,
                            )
                          ],
                        ),
                      ),
                      BorderBox(
                        width: size.width * 0.5,
                        child: Text(
                          "20 Hours Ago",
                          style: themeData.textTheme.headline5,
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(padding * 1.5),
                  Padding(
                    padding: sidepadding,
                    child: Text(
                      "House İnformation",
                      style: themeData.textTheme.headline4,
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InformationTile(
                          name: "Sguare Foot",
                          value: itemData["area"],
                        ),
                        InformationTile(
                          name: "Bedrooms",
                          value: itemData["bedrooms"],
                        ),
                        InformationTile(
                          name: "Bathrooms",
                          value: itemData["bathrooms"],
                        ),
                        InformationTile(
                          name: "Garage",
                          value: itemData["garage"],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: sidepadding,
                    child: Text(
                      itemData["description"],
                      style: themeData.textTheme.bodyText2,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              width: size.width,
              bottom: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionButton(
                    icon: Icons.message,
                    width: size.width * 0.40,
                    text: "Message",
                  ),
                  addHorizontalSpace(padding),
                  OptionButton(
                    icon: Icons.call,
                    width: size.width * 0.40,
                    text: "Call",
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class InformationTile extends StatelessWidget {
  final String name;
  final dynamic value;
  const InformationTile({Key? key, required this.name, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 13),
      child: Column(
        children: [
          BorderBox(
            width: 100,
            height: 100,
            child: Text(
              "$value",
              style: themeData.textTheme.headline3,
            ),
          ),
          addVerticalSpace(15),
          Text(
            name,
            style: themeData.textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
