import 'package:flutter/material.dart';

class PAnimatedIcon extends StatefulWidget {
  final IconData icon;
  const PAnimatedIcon({
    super.key,
    required this.icon,
  });

  @override
  PAnimatedIconState createState() => PAnimatedIconState();
}

class PAnimatedIconState extends State<PAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(widget.icon, color: Colors.white, size: 60),
          ),
        );
      },
    );
  }
}
