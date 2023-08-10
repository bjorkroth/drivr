import 'package:flutter/material.dart';

class PressableCard extends StatefulWidget{

  final VoidCallback? onPressed;
  final Color color;
  final Animation<double> flattenAnimation;
  final Widget? child;

  const PressableCard({
    super.key,
    this.onPressed,
    required this.color,
    required this.flattenAnimation,
    this.child
  });

  @override
  State<StatefulWidget> createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> with SingleTickerProviderStateMixin{
  @override
  void initState(){
    super.initState();
  }

  double get flatten => 1 - widget.flattenAnimation.value;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          widget.onPressed?.call();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8) * flatten,
          child: PhysicalModel(
            borderRadius: BorderRadius.circular(12 * flatten),
            clipBehavior: Clip.antiAlias,
            color: widget.color,
            child: widget.child,
          ),
        ),
      ),
    );
  }

}