import 'package:app/Screens/Guest/Auth.dart';
import 'package:app/Screens/Guest/Password.dart';
import 'package:app/Screens/Guest/Terms.dart';
import 'package:flutter/material.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  List<Widget> _widget = [];

  int _indexSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widget.addAll([
      AuthScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      TermScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      PasswordScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return _widget.elementAt(_indexSelected);
  }
}
