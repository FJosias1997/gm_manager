import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class DefaultSpeedDialWidget extends StatefulWidget {
  final List<SpeedDialChild> widgets;
  const DefaultSpeedDialWidget({required this.widgets, super.key});

  @override
  State<DefaultSpeedDialWidget> createState() => _DefaultSpeedDialWidgetState();
}

class _DefaultSpeedDialWidgetState extends State<DefaultSpeedDialWidget> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.remove,
      visible: true,
      closeManually: false,
      renderOverlay: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: const CircleBorder(),
      children: widget.widgets,
    );
  }
}
