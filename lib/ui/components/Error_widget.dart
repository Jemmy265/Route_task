import 'package:flutter/material.dart';

class ExceptionWidget extends StatelessWidget {
  String Errormessage;

  ExceptionWidget(this.Errormessage);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(Errormessage),
    );
  }
}
