import 'package:animated_check/animated_check.dart';
import 'package:flutter/material.dart';

///-----------------------------------------------------------------------------
///   CHECK MARK ANIMATION UPON CONFIRMATION - msh checkmark
///-----------------------------------------------------------------------------

class AnimatedCheckMark extends StatefulWidget {
  const AnimatedCheckMark({Key? key}) : super(key: key);

  @override
  State<AnimatedCheckMark> createState() => _AnimatedCheckMarkState();
}

class _AnimatedCheckMarkState extends State<AnimatedCheckMark> with SingleTickerProviderStateMixin{
  bool isChecked = true;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1)
    );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInCirc
    ));
  }//end init state


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    controller.forward();
    return Center(
      child: SizedBox(
        child: AnimatedCheck(
            progress: animation,
            size: height/5
        ),
      ),
    );
  }
}