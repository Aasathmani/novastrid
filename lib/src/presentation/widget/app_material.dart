import 'package:flutter/material.dart';

/// Created by Jemsheer K D on 27 May, 2025.
/// File Name : app_material
/// Project : ThinkSwipe

class AppMaterial extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final MaterialType type;
  final double elevation;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final Clip clipBehavior;
  final Duration animationDuration;
  final double? height;
  final double? width;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function()? onTapDown;
  final Function()? onTapCancel;
  final Function()? onTapUp;

  const AppMaterial({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.type = MaterialType.canvas,
    this.elevation = 0.0,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.textStyle,
    this.borderRadius,
    this.shape,
    this.borderOnForeground = true,
    this.clipBehavior = Clip.none,
    this.animationDuration = kThemeChangeDuration,
    this.height,
    this.width,
    this.focusNode,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
  })  : assert(elevation >= 0.0),
        assert(!(shape != null && borderRadius != null)),
        assert(
          !(identical(type, MaterialType.circle) &&
              (borderRadius != null || shape != null)),
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin != null ? margin! : EdgeInsets.zero,
      child: Material(
        key: key,
        type: type,
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        textStyle: textStyle,
        borderRadius: borderRadius,
        shape: shape,
        borderOnForeground: borderOnForeground,
        clipBehavior: clipBehavior,
        animationDuration: animationDuration,
        child: (height != null || width != null)
            ? SizedBox(
                height: height,
                width: width,
                child: _getBodyLayout(context),
              )
            : _getBodyLayout(context),
      ),
    );
  }

  Widget? _getBodyLayout(BuildContext context) {
    if (onTap != null ||
        onTapDown != null ||
        onTapUp != null ||
        onTapCancel != null) {
      return InkWell(
        focusNode: focusNode,
        onTap: () => onTap?.call(),
        onTapDown: (_) => onTapDown?.call(),
        onTapUp: (_) => onTapUp?.call(),
        onTapCancel: () => onTapCancel?.call(),
        child: _getContentLayout(context),
      );
    }
    return _getContentLayout(context);
  }

  Widget? _getContentLayout(BuildContext context) {
    if (padding != null) {
      return Padding(
        padding: padding!,
        child: child,
      );
    }
    return child;
  }
}
