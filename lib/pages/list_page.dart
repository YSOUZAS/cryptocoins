import 'package:cryptocoins/data/fake/index.dart';
import 'package:cryptocoins/ui/widgets/index.dart';
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
                    color: Color(0xFF7E57C2),
                    child: Stack(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: Text("asd"),
                              ),
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
}
