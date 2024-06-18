import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';

class FeedbackPage extends StatefulWidget {
  static const String id = 'FeedbackPage';

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String _selectedLanguage = 'English'; // اللغة المختارة افتراضيًا
  String _feedbackMessage = ''; // الرسالة التي ستظهر بعد الإرسال

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Feedback',
          style: TextStyle(
              fontSize: 23, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text(
            //   'Write your feedback:',
            //     style: TextStyle(
            //       color: Colors.blue,
            //       fontSize: 18,
            //       fontWeight: FontWeight.w400),
            // ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your feedback here',
                hintStyle: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20),

            SizedBox(height: 10),

            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ))),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Feedback Submitted',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 35,
                            fontWeight: FontWeight.w400),
                      ),
                      content: Text('Feedback has been submitted in'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Center(
                child: Text(
                  'submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),

            if (_feedbackMessage.isNotEmpty) Text(_feedbackMessage),
          ],
        ),
      ),
    );
  }
}
