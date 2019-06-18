import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'package:cryptocoins/data/fake/index.dart';
import 'package:cryptocoins/ui/widgets/index.dart';
import 'package:cryptocoins/utils/colors.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroudColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: coins.length,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Card(
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 40.0,
                    color: Color(0xFF1B1B4D),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: _randomColor(),
                                    child: Text(
                                      coins[index]["show_symbol"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: _getFontSize(coins[index]
                                                  ["show_symbol"]
                                              .toString())),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          coins[index]["name"],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_money,
                                              color: Colors.yellowAccent,
                                              size: 20.0,
                                            ),
                                            Text(
                                              formatedNumber(coins[index]
                                                      ['price']
                                                  .toString()),
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      _getIcon(
                                          coins[index]['delta_24h'].toString()),
                                      Text(
                                        formatedNumber(
                                            coins[index]['delta_24h']),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _randomColor() {
    var rng = new Random();
    return colors[rng.nextInt(colors.length)];
  }

  _getFontSize(String symbol) {
    return symbol.length > 3 ? 12.0 : 20.0;
  }
}

Icon _getIcon(String delta) {
  final double deltaNumber = double.parse(delta);
  final IconData iconData =
      deltaNumber > 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down;
  final Color iconColor =
      deltaNumber > 0 ? Colors.greenAccent : Colors.redAccent;
  return Icon(
    iconData,
    color: iconColor,
    size: 30.0,
  );
}

String formatedNumber(String string) {
  final formatter = NumberFormat("#,##0.00", "en_US");
  return "${formatter.format(double.parse(string))}";
}
