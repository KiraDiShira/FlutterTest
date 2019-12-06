import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget(this.message);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child:
      Column(      
        children: <Widget>[const CircularProgressIndicator(),
        Text(message)],
    ));
  }
}