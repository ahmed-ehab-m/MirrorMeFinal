import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/itemModel.dart';

class Item extends StatefulWidget {
  const Item({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    //bool change = true;
    return Container(
      height: 200,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(widget.itemModel.image),
              Row(
                children: [
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.itemModel.isFavorite =
                              !widget.itemModel.isFavorite;
                        });
                      },
                      icon: widget.itemModel.isFavorite
                          ? Icon(
                              CupertinoIcons.heart_fill,
                              color: kPrimaryColor,
                            )
                          : Icon(CupertinoIcons.heart, color: kPrimaryColor)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                widget.itemModel.title,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0A2472)),
              ),
              Text(
                widget.itemModel.price,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0A2472)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
