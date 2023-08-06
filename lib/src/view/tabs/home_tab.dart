import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[600],
      child: Center(
        child: Text(
          'Page 1',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
