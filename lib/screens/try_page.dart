import 'package:flutter/material.dart';

class TryPage extends StatefulWidget {
  const TryPage({super.key});
  static String id = 'TryPage';

  @override
  State<TryPage> createState() => _TryPageState();
}

class _TryPageState extends State<TryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset('images/itemsPage/Arrow - Left.png'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
