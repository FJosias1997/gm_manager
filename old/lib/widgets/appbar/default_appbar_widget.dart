import 'package:flutter/material.dart';
import 'package:gm_manager/extensions/context_extension.dart';

PreferredSizeWidget defaultAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      'Relatório Anual',
      style: context.theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    automaticallyImplyLeading: true,
    leading: GestureDetector(
      onTap: () => context.pop(context),
      child: Icon(
        Icons.chevron_left,
        size: MediaQuery.of(context).size.height * 0.04,
      ),
    ),
  );
}
