import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:mirror_me_app/screens/try_page.dart';

class Tp extends StatefulWidget {
  const Tp({super.key});

  @override
  State<Tp> createState() => _TpState();
}

class _TpState extends State<Tp> {
  TextEditingController personImagePathController = TextEditingController();
  TextEditingController clothesImagePathController = TextEditingController();

  void tryOn() async {
    String apiUrl =
        'http://10.0.2.2:5000/tryon'; // تعديل هنا على حسب عنوان Flask app الخاص بك

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Map<String, dynamic> data = {
      "personImage": personImagePathController.text,
      "clothImage": clothesImagePathController.text,
    };

    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(data), // تحويل البيانات إلى JSON قبل إرسالها
    );

    if (response.statusCode == 200) {
      print('Try-on request sent successfully!');
    } else {
      print('Error during try-on request: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TryOn App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: personImagePathController,
              decoration: InputDecoration(labelText: 'مسار صورة الشخص'),
            ),
            TextField(
              controller: clothesImagePathController,
              decoration: InputDecoration(labelText: 'مسار صورة الملابس'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: tryOn,
              child: Text('جرب التجربة'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TryPage(
                        // imageBytes: responseData,
                        ),
                  ),
                );
              },
              child: Text('try it '),
            ),
          ],
        ),
      ),
    );
  }
}
