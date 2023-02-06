import 'package:dw_delivery_flutter/app/core/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  const DeliveryButton(
      {super.key,
      required this.label,
      this.onPressed,
      this.width,
      this.height});
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colors.primary,
          ),
        ));
  }
}
