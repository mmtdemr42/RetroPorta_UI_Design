import 'package:episode_1/custom/BorderBox.dart';
import 'package:episode_1/custom/OptionButton.dart';
import 'package:episode_1/sample_data.dart';
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
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(itemData["image"]),
                    Padding(
                      padding: EdgeInsets.all(padding),
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
                    )
                  ],
                ),
                addVerticalSpace(padding),
                addVerticalSpace(padding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: sidepadding,
                          child: Text(
                            "${formatCurrency(itemData["amount"])}",
                            style: themeData.textTheme.headline1,
                          ),
                        ),
                        Padding(
                          padding: sidepadding,
                          child: Text(
                            "${itemData["address"]}",
                            style: themeData.textTheme.bodyText2,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: sidepadding,
                        child: BorderBox(
                          width: size.width,
                          child: Text(
                            "20 Hours Ago",
                            style: themeData.textTheme.headline5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(padding * 1.5),
                Padding(
                  padding: sidepadding,
                  child: Text(
                    "House İnformation",
                    style: themeData.textTheme.headline3,
                  ),
                ),
                SingleChildScrollView(
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
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: sidepadding,
                      child: Text(itemData["description"]),
                    ),
                  ),
                )
              ],
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
