import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final double radius;
  final Widget? child;
  final Color? containerColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? shadow;
  final DecorationImage? decorationImage;
  final void Function()? onTap;
  final void Function(DragUpdateDetails)? onHorizontalDragUpdate;
  final void Function(DragUpdateDetails)? onPanUpdate;
  final void Function(DragEndDetails)? onHorizontalDragEnd;

  final BoxConstraints? constraints;
  const RoundedContainer(
      {Key? key,
      this.radius = 15,
      this.child,
      this.containerColor = Colors.white,
      this.width,
      this.height,
      this.onTap,
      this.onHorizontalDragUpdate,
      this.onHorizontalDragEnd,
      this.onPanUpdate,
      this.padding,
      this.shadow,
      this.decorationImage,
      this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onPanUpdate: onPanUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        constraints: constraints,
        decoration: BoxDecoration(
            boxShadow: shadow,
            image: decorationImage,
            borderRadius: BorderRadius.circular(radius),
            color: containerColor),
        child: child,
      ),
    );
  }
}
