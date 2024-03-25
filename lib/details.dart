import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {

  final String info;

  DetailsWidget({required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(info)
      ),
      body: Text(info),
    );
  }
}