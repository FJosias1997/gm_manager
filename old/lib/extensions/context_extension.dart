import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Size get screenSize => MediaQuery.of(this).size;

  SnackBar showSnackBar(String message, BuildContext context) => SnackBar(
      content: Text(message),
      action: SnackBarAction(
          label: 'Fechar', onPressed: () => Navigator.pop(context)));

  Future<Object?> push(Widget widget, BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => widget));

  pop(BuildContext context) => Navigator.pop(context);
}
