import 'package:dw_delivery_flutter/app/core/extensions/formatter.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/colors.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:dw_delivery_flutter/app/dto/order_product_dto.dart';
import 'package:dw_delivery_flutter/app/models/product_model.dart';
import 'package:dw_delivery_flutter/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product, this.orderProductDto});

  final ProductModel product;
  final OrderProductDto? orderProductDto;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProduct = await Navigator.of(context)
            .pushNamed('/product_details', arguments: {
          'product': product,
          'order': orderProductDto,
        });

        if (orderProduct != null) {
          controller.addOrUpdateBag(orderProduct as OrderProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.name,
                      style: context.texts.textExtraBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.description,
                      style: context.texts.textRegular.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.price.currencyPtBr,
                      style: context.texts.textMedium.copyWith(
                        fontSize: 12,
                        color: context.colors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: product.image,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
