
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mirror_me_app/screens/items_page.dart';

class ItemCategory extends StatelessWidget {
  ItemCategory({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context,ItemsPage.id,
                arguments: text);
          },
          child: Container(
            // color: kprimaryColor,
            height: 50,
            width: double.infinity,
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 16, top: 8),
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
