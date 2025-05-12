import 'package:flutter/material.dart';
import 'package:gm_manager/extensions/context_extension.dart';

class DefaultFormTitleSubtitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;

  const DefaultFormTitleSubtitleWidget(
      {required this.title, this.subtitle, this.trailing, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title,
          style: context.theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          )),
      subtitle: Text(
        subtitle ?? '',
        style: context.theme.textTheme.bodyLarge,
      ),
      trailing: trailing,
    );
  }
}
