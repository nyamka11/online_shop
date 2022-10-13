import 'package:flutter/material.dart';

class requestLoader extends StatelessWidget {
  const requestLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 100,
        child: Center(
          child: Column(
            children: const [
              Text("読み込み中..."),
              SizedBox(height: 20),
              CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 193, 224, 247),
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
