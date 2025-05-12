import 'package:flutter/material.dart';
import 'package:gm_manager/extensions/context_extension.dart';

class DefaultHomeItemCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function() onTap;
  const DefaultHomeItemCardWidget(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 25,
            backgroundColor: Colors.lightBlue,
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            softWrap: true,
            style: context.theme.textTheme.bodySmall?.copyWith(
              fontSize: MediaQuery.of(context).size.height * 0.013,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
