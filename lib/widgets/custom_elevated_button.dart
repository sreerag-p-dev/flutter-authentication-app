import 'package:flutter/material.dart';

Widget customElevatedButton({required String label, required void Function()? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      backgroundColor: Colors.amber[900],
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 32),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: Colors.brown[900],
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
