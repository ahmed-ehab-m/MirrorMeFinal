import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProductPagee extends StatefulWidget {
  final Productone p1;
  ProductPagee({Key? key, required this.p1});

  @override
  _ProductPageeState createState() => _ProductPageeState();
}

class _ProductPageeState extends State<ProductPagee> {
  int quantity = 1;
  int selectedIndex = -1;
  int selectedIndexColor = -1;
  String resultSize = '';
  String? resultColor;
  File? selectedImage;

  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  Map<String, Color> colors = {
    'black': Colors.black,
    'white': Colors.white,
    'grey': Colors.grey,
    'green': Colors.green,
    'red': Colors.red,
  };

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<String?> tryOnModel(String imagePath, String clothesImagePath) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:5000/tryon'),
    );
    request.files
        .add(await http.MultipartFile.fromPath('person_image', imagePath));
    request.files.add(
        await http.MultipartFile.fromPath('cloth_image', clothesImagePath));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      return base64Encode(responseData);
    } else {
      throw Exception('Failed to try on model');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Image.network(widget.p1.image!, height: 300, width: 300),
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Pick Image'),
            ),
            selectedImage != null
                ? Image.file(selectedImage!, height: 300, width: 300)
                : Placeholder(fallbackHeight: 300, fallbackWidth: 300),
            Text(
              'Size',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: sizes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        resultSize = sizes[index];
                      });
                    },
                    child: Container(
                      width: 50,
                      child: Center(
                        child: Text(
                          sizes[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.blue,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == index ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Color',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 15),
                itemCount: colors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexColor = index;
                        resultColor = colors.keys.elementAt(index);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 40,
                      child: selectedIndexColor == index
                          ? Icon(
                              Icons.check,
                              color: Colors.grey.shade400,
                            )
                          : Text(''),
                      decoration: BoxDecoration(
                        color: colors.values.elementAt(index),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (selectedImage != null) {
                  final result =
                      await tryOnModel(selectedImage!.path, widget.p1.image!);
                  if (result != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TryOnPage(outputImage: result),
                      ),
                    );
                  }
                }
              },
              child: Text('Try it virtually'),
            ),
          ],
        ),
      ),
    );
  }
}

class Productone {
  final String? name;
  final String? image;
  final int price;
  final int amount;

  Productone(
      {this.name, this.image, required this.price, required this.amount});
}

class TryOnPage extends StatelessWidget {
  final String outputImage;

  TryOnPage({required this.outputImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Try On Result'),
      ),
      body: Center(
        child: Image.memory(base64Decode(outputImage)),
      ),
    );
  }
}
