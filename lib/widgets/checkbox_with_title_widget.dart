import 'package:flutter/material.dart';

class CheckboxWithTitle extends StatefulWidget {
  CheckboxWithTitle(
      {super.key,
      required this.title,
      required this.value,
      required this.paddingFactor});
  final String title;
  final double paddingFactor;
  bool value;

  @override
  State<CheckboxWithTitle> createState() => _CheckboxWithTitleState();
}

class _CheckboxWithTitleState extends State<CheckboxWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0 * widget.paddingFactor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title),
          Checkbox(
              value: widget.value,
              fillColor: const MaterialStatePropertyAll(
                  Colors.lightBlue), // Colors.lightBlue To Follow design
              onChanged: (val) {
                setState(() {
                  widget.value = val!;
                });
              })
        ],
      ),
    );
  }
}
