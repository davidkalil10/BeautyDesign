import 'package:flutter/material.dart';

const Color rosaPaula = Color(0xffFA879E);

class CustomDropdown extends StatelessWidget {
  final Function settedState;
  final IconData icon;
  final String label;

  const CustomDropdown({
    this.settedState,
    this.icon,
    this.label
  });
  
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: settedState,
      label: Text(
        label,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: rosaPaula,
        ),
      ),
      icon: Icon(icon, color: rosaPaula),
    );
  }
}