import 'package:flutter/material.dart';

Widget inputfield({
  required String hintText,
  required TextEditingController controller,
  String? errorMessage,
}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
      (errorMessage != null)
          ? Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 13),
                ),
              ),
            )
          : SizedBox.shrink(),
    ],
  );
}
