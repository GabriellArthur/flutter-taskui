import 'package:flutter/material.dart';
import 'package:taskui/themes/constants.dart';

class TitleTaskCard extends StatelessWidget {
  const TitleTaskCard(
      {super.key,
      required this.displayHeight,
      required this.displayWidth,
      required this.title,
      required this.quant});

  final double displayHeight;
  final double displayWidth;

  final String title;
  final String quant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: displayHeight * .0,
        left: displayHeight * .01,
        right: displayHeight * .01,
        top: displayHeight * .02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).customColorBlackOpacity,
                  fontSize: displayWidth * .045,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Nunito",
                ),
              ),
              SizedBox(
                width: displayWidth * .02,
              ),
              Container(
                width: displayWidth * .07,
                height: displayWidth * .07,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    quant,
                    style: TextStyle(
                      fontSize: displayHeight * .025,
                      fontFamily: "Nunito",
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Icon(
            Icons.more_horiz,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
