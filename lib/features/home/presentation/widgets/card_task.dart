import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taskui/themes/constants.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.displayWidth,
    required this.displayHeight,
    required this.title,
    required this.day,
    required this.type,
    required this.photo,
    required this.name,
  });

  final double displayWidth;
  final double displayHeight;

  final String title;
  final int day;
  final String type;
  final String photo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: displayHeight * .01,
        vertical: displayWidth * .02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 10,
            offset: const Offset(5, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: displayWidth * .05,
          vertical: displayHeight * .02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).customColorBlackOpacity,
                    fontSize: displayWidth * .045,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Nunito",
                  ),
                ),
                Container(
                  width: displayWidth * .1,
                  height: displayWidth * .1,
                  decoration: BoxDecoration(
                    color: Theme.of(context).customColorOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${day}d",
                      style: TextStyle(
                        fontSize: displayWidth * .042,
                        color: Colors.white,
                        fontFamily: "Nunito",
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: displayHeight * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: displayWidth * .04,
                    vertical: displayHeight * .008,
                  ),
                  decoration: BoxDecoration(
                    color: type == "Developer"
                        ? Theme.of(context).customColorOrangeOpacity
                        : type == "Prototype"
                            ? Theme.of(context).customColorBlueOpacity
                            : Theme.of(context).customColorYellowOpacity,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: displayWidth * .042,
                        color: type == "Developer"
                            ? Theme.of(context).customColorOrange
                            : type == "Prototype"
                                ? Theme.of(context).customColorBlue
                                : Theme.of(context).customColorYellow,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Nunito",
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: displayWidth * .042,
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Nunito",
                      ),
                    ),
                    SizedBox(width: displayWidth * .02),
                    CircleAvatar(
                      radius: displayWidth * .05,
                      backgroundImage: AssetImage(photo),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
