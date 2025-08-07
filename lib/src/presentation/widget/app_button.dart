import 'package:flutter/material.dart';

import '../../core/app_constants.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';
import 'app_material.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final String? label;
  final TextStyle? labelStyle;
  final EdgeInsets? labelPadding;
  final Function() onTap;
  final Color? color;
  final Color? disabledColor;
  final Color? labelColor;
  final Color? disabledLabelColor;
  final Gradient? gradient;
  final double elevation;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BorderSide borderSide;
  final FocusNode? focusNode;

  final bool enabled;

  const AppButton({
    super.key,
    this.child,
    this.label,
    this.labelStyle,
    required this.onTap,
    this.color,
    this.gradient,
    this.disabledColor,
    this.labelColor,
    this.disabledLabelColor,
    this.elevation = 0,
    this.height,
    this.width,
    this.labelPadding,
    this.borderRadius,
    this.focusNode,
    this.enabled = true,
    this.borderSide = BorderSide.none,
  }) : assert(child != null || label != null);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AbsorbPointer(
      absorbing: !enabled,
      child: AppMaterial(
        height: height == null && child == null && labelPadding == null
            ? Units.kButtonHeight
            : height,
        width: width,
        elevation: elevation,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: gradient != null
            ? AppColors.transparent
            : enabled
                ? color ?? colors.primary
                : disabledColor ?? Theme.of(context).disabledColor,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius:
              borderRadius ?? BorderRadius.circular(Units.kButtonBorderRadius),
        ),
        focusNode: focusNode,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          onTap();
        },
        child: gradient != null
            ? _getBodyLayout(context)
            : _getContentLayout(context),
      ),
    );
  }

  Widget _getBodyLayout(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: _getContentLayout(context),
    );
  }

  Widget _getContentLayout(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return child ??
        Padding(
          padding: labelPadding ??
              const EdgeInsets.symmetric(
                vertical: Units.kSPadding,
                horizontal: Units.kStandardPadding,
              ),
          child: Center(
            child: Text(
              label ?? '',
              style: labelStyle ??
                  TextStyles.buttonSemiBold(context)?.copyWith(
                    color: enabled
                        ? labelColor ?? colors.onPrimary
                        : disabledLabelColor ?? colors.onPrimary,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        );
  }
}
