import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_constants.dart';
import '../../utils/string_utils.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';

class BorderedTextField extends StatefulWidget {
  final FocusNode? focusNode;
  final double textBoxHeight;
  final String? labelText;
  final String? hintText;
  final Color? hintColor;
  final void Function(String)? onTextChanged;
  final void Function(String)? onSubmitted;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double leftPadding;
  final double rightPadding;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final int? maxLines;
  final int minLines;
  final TextAlign textAlign;
  final Color? textColor;
  final TextAlignVertical textAlignVertical;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Stream<String?>? errorStream;
  final bool enabled;
  final bool obscureText;
  final bool enableSelection;
  final bool alignLabelWithHint;
  final TextCapitalization textCapitalization;
  final bool isMandatory;
  final bool readOnly;
  final Widget? prefixIcon;
  final Color errorMessageColor;
  final bool isRequired;
  final Color? borderColor;
  final TextEditingController? controller;

  const BorderedTextField({
    super.key,
    this.focusNode,
    this.textBoxHeight = Units.kTextBoxHeight,
    this.labelText,
    this.hintText,
    this.hintColor,
    this.onTextChanged,
    this.onSubmitted,
    this.onTap,
    this.leftPadding = Units.kLPadding,
    this.rightPadding = Units.kLPadding,
    this.textInputType = TextInputType.text,
    this.suffix,
    this.suffixIcon,
    this.maxLines,
    this.minLines = 1,
    this.textInputAction,
    this.inputFormatters,
    this.textColor,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.alignLabelWithHint = false,
    this.errorStream,
    this.enabled = true,
    this.obscureText = false,
    this.enableSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.isMandatory = false,
    this.readOnly = false,
    this.backgroundColor,
    this.prefixIcon,
    this.errorMessageColor = AppColors.white,
    this.isRequired = false,
    this.borderColor,
    this.controller,
  });

  @override
  _BorderedTextFieldState createState() => _BorderedTextFieldState();
}

class _BorderedTextFieldState extends State<BorderedTextField> {
  late TextEditingController _controller;
  FocusNode? _focusNode;

  @override
  void dispose() {
    super.dispose();
    if (widget.focusNode == null) _focusNode?.dispose();
    _focusNode!.removeListener(_onFocusChange);
    if (widget.controller == null) {
      _controller.dispose();
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();
    _focusNode?.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.errorStream != null) {
      return StreamBuilder<String?>(
        stream: widget.errorStream,
        builder: (context, snapshot) {
          return _getBodyLayout(context, snapshot.data);
        },
      );
    }
    return _getBodyLayout(context, null);
  }

  Widget _getBodyLayout(
    BuildContext context,
    String? error,
  ) {
    return Focus(
      focusNode: _focusNode,
      child: _getContentLayout(context, error),
    );
  }

  Widget _getContentLayout(
    BuildContext context,
    String? error,
  ) {
    final color = Theme.of(context).colorScheme;
    final hasFocus = _focusNode!.hasFocus;
    return AbsorbPointer(
      absorbing: !widget.enabled,
      child: Opacity(
        opacity: widget.enabled ? 1 : .75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: widget.leftPadding,
                right: widget.rightPadding,
                top: StringUtils.isNotNullAndEmpty(widget.labelText)
                    ? Units.kSPadding
                    : Units.kZero,
              ),
              constraints: BoxConstraints(
                minHeight: widget.textBoxHeight,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Units.kButtonBorderRadius),
                border: Border.all(
                  color: widget.borderColor ??
                      (hasFocus ? color.secondary : color.surface),
                ),
                color: widget.backgroundColor ?? color.onSecondary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    readOnly: widget.readOnly,
                    textCapitalization: widget.textCapitalization,
                    textAlign: widget.textAlign,
                    textAlignVertical: widget.textAlignVertical,
                    minLines: widget.minLines,
                    enableInteractiveSelection: widget.enableSelection,
                    enabled: widget.enabled,
                    controller: _controller,
                    onTap: widget.onTap,
                    onSubmitted: (value) => widget.onSubmitted?.call(value),
                    cursorColor:
                        Theme.of(context).textSelectionTheme.cursorColor,
                    keyboardType: widget.textInputType,
                    textInputAction: widget.textInputAction,
                    maxLines: widget.maxLines,
                    obscureText: widget.obscureText,
                    inputFormatters: [
                      ...?widget.inputFormatters,
                    ],
                    style: TextStyles.bodyRegular(context)?.copyWith(
                      color: widget.textColor ?? color.onSurface,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyles.title2Medium(context)!.copyWith(
                        color: widget.hintColor ??
                            color.onSurfaceVariant.withOpacity(0.8),
                      ),
                      border: InputBorder.none,
                      isDense: false,
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.only(
                        top: Units.kXSPadding,
                        bottom: Units.kXSPadding,
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minHeight: Units.kAppIconSizeSmall,
                        minWidth: Units.kAppIconSizeSmall,
                      ),
                      prefixIcon: widget.prefixIcon,
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: Units.kAppIconSizeLarge,
                        minWidth: Units.kAppIconSizeLarge,
                      ),
                      suffix: widget.suffix,
                      suffixIcon: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          hasFocus ? color.secondary : color.surface,
                          BlendMode.srcIn,
                        ), // Applies color filter
                        child: widget.suffixIcon,
                      ),
                      labelStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: color.surface,
                              ),
                    ),
                    onChanged: widget.onTextChanged != null
                        ? (text) => widget.onTextChanged!(text)
                        : null,
                  ),
                ],
              ),
            ),
            if (StringUtils.isNotNullAndEmpty(error))
              Padding(
                padding: const EdgeInsets.only(
                  top: Units.kXSPadding,
                ),
                child: Text(
                  error!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: widget.errorMessageColor,
                      ),
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
