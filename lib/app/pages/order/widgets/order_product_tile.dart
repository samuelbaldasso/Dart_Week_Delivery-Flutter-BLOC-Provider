import 'package:dw_delivery_flutter/app/core/extensions/formatter.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/colors.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:dw_delivery_flutter/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTile(
      {super.key, required this.index, required this.orderProduct});

  @override
  Widget build(BuildContext context) {
    final products = orderProduct.product;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(
            products.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products.name,
                    style: context.texts.textRegular.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (orderProduct.amount * products.price).currencyPtBr,
                        style: context.texts.textMedium.copyWith(
                            fontSize: 14, color: context.colors.secondary),
                      ),
                      DeliveryIncrementDecrementButton.compact(
                          incrementPress: () {},
                          decrementPress: () {},
                          amount: 1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
