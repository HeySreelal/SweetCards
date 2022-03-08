import 'package:flutter/material.dart';

class SweetLabel extends StatelessWidget {
  final String label;
  const SweetLabel(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 8),
      ],
    );
  }
}

class SweetField extends StatelessWidget {
  const SweetField({
    Key? key,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.value,
    this.readOnly = false,
    this.hintText,
    this.labelText,
    this.capitalization = TextCapitalization.sentences,
    this.leading,
    this.trailing,
    this.onTap,
    this.onChanged,
    this.borderRadius,
    this.shouldCurve = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final String? value;
  final bool readOnly;
  final String? hintText;
  final String? labelText;
  final TextCapitalization capitalization;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool shouldCurve;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: readOnly ? TextEditingController(text: value) : controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: shouldCurve
            ? OutlineInputBorder(
                borderRadius: borderRadius!,
              )
            : const OutlineInputBorder(),
        prefixIcon: leading,
        suffixIcon: trailing,
      ),
      onTap: onTap,
      onChanged: onChanged,
      textCapitalization: capitalization,
    );
  }
}
