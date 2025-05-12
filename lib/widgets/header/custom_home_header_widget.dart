import 'package:flutter/material.dart';
import 'package:gm_manager/extensions/context_extension.dart';

class CustomHomeHeaderWidget extends StatefulWidget {
  const CustomHomeHeaderWidget({super.key});

  @override
  State<CustomHomeHeaderWidget> createState() => _CustomHomeHeaderWidgetState();
}

class _CustomHomeHeaderWidgetState extends State<CustomHomeHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.11,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem-vindo',
                    style: context.theme.textTheme.titleMedium?.copyWith(
                      color: context.theme.colorScheme.surface,
                    ),
                  ),
                  Text(
                    'Josias Félix',
                    style: context.theme.textTheme.titleLarge?.copyWith(
                      color: context.theme.colorScheme.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.jt5y3tRyYCoVdWLg1DBFgQHaHa?rs=1&pid=ImgDetMain',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*   appBar: AppBar(
            title: const Text('GM Manager'),
          ), */
//drawer:

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 4,
        size.height - 40,
        size.width / 2,
        size.height - 20,
      )
      ..quadraticBezierTo(
        3 / 4 * size.width,
        size.height,
        size.width,
        size.height - 30,
      )
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
