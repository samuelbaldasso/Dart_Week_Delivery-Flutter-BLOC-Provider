import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:flutter/material.dart';

class OrderField extends StatelessWidget {
  const OrderField(
      {super.key,
      required this.title,
      required this.controller,
      required this.hintText,
      this.validator});
  final String title;
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    const defaultBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                title,
                style: context.texts.textRegular.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              border: defaultBorder,
              enabledBorder: defaultBorder,
              focusedBorder: defaultBorder,
            ),
          ),
        ],
      ),
    );
  }
}
