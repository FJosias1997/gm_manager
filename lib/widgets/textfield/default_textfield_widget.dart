import 'package:flutter/material.dart';

class DefaultTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final TextInputType? type;
  final Function()? onTap;
  final bool? enabled;
  const DefaultTextFieldWidget({
    this.controller,
    this.label,
    this.type,
    this.onTap,
    this.enabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: type ?? TextInputType.name,
      decoration: const InputDecoration(
        // labelText: '',
        border: OutlineInputBorder(),
      ),
      onTap: onTap,
    );
  }
}
