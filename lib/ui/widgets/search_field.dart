import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Search Coins",
          fillColor: Colors.white,
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
          icon: Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        onSubmitted: (searchQuery) {},
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }
}
