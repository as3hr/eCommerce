import 'dart:async';

import 'package:flutter/material.dart';

class ColorChangingContainer extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Widget? child;

  const ColorChangingContainer({
    super.key,
    required this.color1,
    required this.color2,
    this.child,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ColorChangingContainerState createState() => _ColorChangingContainerState();
}

class _ColorChangingContainerState extends State<ColorChangingContainer> {
  final _animationDuration = const Duration(seconds: 1);
  late Timer _timer;
  late Color _color;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(_animationDuration, (timer) => _changeColor());
    _color = widget.color1;
  }

  void _changeColor() {
    final newColor = _color == widget.color1 ? widget.color2 : widget.color1;
    setState(() {
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _animationDuration,
      color: _color,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
