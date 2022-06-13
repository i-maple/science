import 'package:flutter/material.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Science'),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          Center(child: Text('data'),)
        ],
      ),
    );
  }
}