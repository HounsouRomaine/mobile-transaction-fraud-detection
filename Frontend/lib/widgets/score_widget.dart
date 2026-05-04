import 'package:flutter/material.dart';

class ScoreWidget extends StatefulWidget {
  final int score;

  const ScoreWidget({required this.score});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> anim;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    anim = Tween<double>(begin: 0, end: widget.score.toDouble())
        .animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: anim,
      builder: (context, _) {
        return Container(
          height: 170,
          width: 170,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green
              ],
            ),
          ),
          child: Center(
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: Color(0xFF0B1220),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "${anim.value.toInt()}%",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}