import 'package:cryptocoins/ui/widgets/index.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key key,
    @required Color backgroudColor,
  }) : super(
          key: key,
          title: SearchBar(),
          backgroundColor: backgroudColor,
        );
}
