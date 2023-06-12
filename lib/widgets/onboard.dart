import 'package:flutter/material.dart';

class Onboard {
  final String ilustrator;
  final String title;
  final String description;

  Onboard(
      {required this.ilustrator,
      required this.title,
      required this.description});
}

class OnboardDot extends StatefulWidget {
  const OnboardDot({Key? key, this.isActive = false}) : super(key: key);
  final bool isActive;

  @override
  State<OnboardDot> createState() => _OnboardDotState();
}

class _OnboardDotState extends State<OnboardDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _widthAnimation = Tween<double>(begin: 6.0, end: 24.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    if (widget.isActive) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(OnboardDot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isActive != widget.isActive) {
      if (widget.isActive) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _widthAnimation,
        builder: (context, child) {
          return Container(
            height: 6.0,
            width: _widthAnimation.value,
            decoration: BoxDecoration(
                color: widget.isActive ? Colors.blue : Colors.blue[100],
                borderRadius: const BorderRadius.all(Radius.circular(16))),
          );
        });
  }
}
