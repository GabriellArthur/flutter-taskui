import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskui/db/db.dart';
import 'package:taskui/features/home/presentation/widgets/card_task.dart';
import 'package:taskui/features/home/presentation/widgets/title_task_card.dart';
import 'package:taskui/themes/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  var currentIndex = 0;
  List<IconData> listofIcons = [
    Icons.home,
    Icons.add,
    Icons.calendar_today,
    Icons.people,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  setCurrentPage(page) {
    setState(() {
      currentIndex = page;
    });
  }

  setPage(page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).customBackgroundColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: setCurrentPage,
        children: [
          const Home(),
          Container(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: displayWidth * .05,
          left: displayWidth * .05,
          right: displayWidth * .05,
        ),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(displayWidth * .1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              offset: const Offset(5, 0),
            ),
          ],
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listofIcons.length,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                setPage(index);
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .14
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .20 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Theme.of(context).customColorPurple
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .13
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listofIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.white
                                : Theme.of(context).customColorBlackOpacity,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).customBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: displayWidth * .05,
          vertical: displayHeight * .02,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: displayHeight * .04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: displayWidth * .1,
                        height: displayWidth * .1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).customColorPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.edit, color: Colors.white),
                      ),
                      SizedBox(width: displayWidth * .02),
                      Text(
                        "Task",
                        style: TextStyle(
                          color: Theme.of(context).customColorBlackOpacity,
                          fontSize: displayHeight * .035,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Nunito",
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Theme.of(context).customColorBlackOpacity,
                        size: displayHeight * .035,
                      ),
                      SizedBox(width: displayWidth * .02),
                      Icon(
                        Icons.notifications,
                        color: Theme.of(context).customColorBlackOpacity,
                        size: displayHeight * .035,
                      ),
                    ],
                  ),
                ],
              ),
              TitleTaskCard(
                title: "To do",
                quant: "${taskTodo.length}",
                displayWidth: displayWidth,
                displayHeight: displayHeight,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: taskTodo.length,
                itemBuilder: (context, index) => TaskCard(
                  day: taskTodo[index]["day"] as int,
                  name: taskTodo[index]["name"] as String,
                  photo: taskTodo[index]["photo"] as String,
                  title: taskTodo[index]["title"] as String,
                  type: taskTodo[index]["type"] as String,
                  displayWidth: displayWidth,
                  displayHeight: displayHeight,
                ),
              ),
              TitleTaskCard(
                title: "IN PROGRESS",
                quant: "${taskProgress.length}",
                displayWidth: displayWidth,
                displayHeight: displayHeight,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: taskProgress.length,
                itemBuilder: (context, index) => TaskCard(
                  day: taskProgress[index]["day"] as int,
                  name: taskProgress[index]["name"] as String,
                  photo: taskProgress[index]["photo"] as String,
                  title: taskProgress[index]["title"] as String,
                  type: taskProgress[index]["type"] as String,
                  displayWidth: displayWidth,
                  displayHeight: displayHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
