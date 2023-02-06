import 'package:dw_delivery_flutter/app/core/ui/styles/colors.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:flutter/material.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  const DeliveryIncrementDecrementButton(
      {super.key,
      required this.incrementPress,
      required this.decrementPress,
      required this.amount,
      this.compact = false});

  const DeliveryIncrementDecrementButton.compact(
      {super.key,
      required this.incrementPress,
      required this.decrementPress,
      required this.amount,
      this.compact = true});

  final VoidCallback incrementPress;
  final VoidCallback decrementPress;
  final int amount;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: compact ? const EdgeInsets.all(5.0) : null,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => decrementPress(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '-',
                style: context.texts.textMedium
                    .copyWith(color: Colors.grey, fontSize: compact ? 10 : 22),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              amount.toString(),
              style: context.texts.textMedium.copyWith(
                  color: context.colors.secondary, fontSize: compact ? 13 : 17),
            ),
          ),
          InkWell(
            onTap: () => incrementPress(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '+',
                style: context.texts.textMedium
                    .copyWith(color: Colors.grey, fontSize: compact ? 10 : 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
