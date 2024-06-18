import 'package:flutter/cupertino.dart';
import 'package:mirror_me_app/models/catemodel.dart';

class Category extends StatelessWidget {
  Category({super.key, required this.cateModel, this.ontap});
  final CateModel cateModel;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 200,
        child: Column(
          children: [
            Image.asset(
              cateModel.image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              cateModel.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0A2472)),
            ),
          ],
        ),
      ),
    );
  }
}
