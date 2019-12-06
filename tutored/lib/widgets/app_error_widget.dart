import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
 const AppErrorWidget({this.onPressed});
 final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
 return  Column(children: <Widget>[
              const Text('OOOOOOPPPPSSSS'),
              RaisedButton(
                onPressed: onPressed,
                child: const Text('Reload all'),
              )
            ]);
  }
}