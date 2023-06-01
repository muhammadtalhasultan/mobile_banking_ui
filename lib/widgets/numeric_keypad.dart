// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;

  const NumericKeypad({
    super.key,
    required this.controller,
  });

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildButton('1'),
            SizedBox(
              width: 40.w,
            ),
            _buildButton('2'),
            SizedBox(
              width: 40.w,
            ),
            _buildButton('3'),
          ],
        ),
        SizedBox(
          height: 28.h,
        ),
        Row(
          children: [
            _buildButton('4'),
            SizedBox(
              width: 40.w,
            ),
            _buildButton('5'),
            SizedBox(
              width: 40.w,
            ),
            _buildButton('6'),
          ],
        ),
        SizedBox(
          height: 28.h,
        ),
        Row(
          children: [
            _buildButton('7'),
            SizedBox(
              width: 40.w,
            ),
            _buildButton('8'),
            SizedBox(
              width: 40.w,
            ),
            _buildButton('9'),
          ],
        ),
        SizedBox(
          height: 28.h,
        ),
        Row(
          children: [
            // _buildButton(''),
            SizedBox(
              width: 104.w,
            ),
            _buildButton('0'),
            SizedBox(
              width: 40.w,
            ),
            _buildButton('⌫', onPressed: _backspace),
          ],
        ),
      ],
    );
  }

  // Individual keys
  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(

            //disabledBackgroundColor: Color(0xFF292E32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 15.h),
            backgroundColor: secondaryColor,
            textStyle: heading2),
        onPressed: onPressed ?? () => _input(text),
        child: Text(
          text,
          style: heading2,
        ),
      ),
    );
  }

  void _input(String text) {
    final value = widget.controller.text + text;
    widget.controller.text = value;
  }

  void _backspace() {
    final value = widget.controller.text;
    if (value.isNotEmpty) {
      widget.controller.text = value.substring(0, value.length - 1);
    }
  }
}
