import 'package:flutter/material.dart';

class LongPressDragFluctuation extends StatefulWidget {
  final Widget child;
  final int count;
  final int maxCount;
  final Widget fadeContainer;
  final Axis axis;
  final ValueChanged<int> onChanged;

  const LongPressDragFluctuation({
    super.key,
    required this.child,
    required this.fadeContainer,
    this.axis = Axis.horizontal,
    required this.count,
    required this.maxCount,
    required this.onChanged,
  });

  @override
  State<LongPressDragFluctuation> createState() => _LongPressFluctuationState();
}

class _LongPressFluctuationState extends State<LongPressDragFluctuation> {
  late int count;
  late double dx = 0.0;

  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(dx, 0),
      child: LongPressDraggable(
        onDragEnd: (details) {
          setState(() {
            dx = 0.0;
          });
        },
        onDragUpdate: (details) {
          int val = count;
          if (details.delta.dx > 0) {
            val = _increaseQty();
          } else if (details.delta.dx < 0) {
            val = _decreaseQty();
          }
          widget.onChanged(val);
          setState(() {
            dx += details.delta.dx;
          });
        },
        axis: widget.axis,
        feedback: widget.fadeContainer,
        child: widget.child, // call the builder here
      ),
    );
  }

  int _increaseQty() {
    if (widget.maxCount > count) {
      setState(() => count++);
    }
    return count;
  }

  int _decreaseQty() {
    setState(() {
      if (count > 0) count--;
    });
    return count;
  }
}
