import 'package:dw_delivery_flutter/app/core/extensions/formatter.dart';
import 'package:dw_delivery_flutter/app/core/ui/base_state/helpers/size_extension.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/colors.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:dw_delivery_flutter/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagWidget extends StatelessWidget {
  const ShoppingBagWidget({super.key, required this.shoppingBag});

  Future<void> _goOrder(BuildContext context) async {
    final nav = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      final loginResult = await nav.pushNamed('/auth/login');
      if (loginResult == null || loginResult == false) {
        return;
      }
    }
    await nav.pushNamed('/order', arguments: shoppingBag);
  }

  final List<OrderProductDto> shoppingBag;
  @override
  Widget build(BuildContext context) {
    var totalBag = shoppingBag
        .fold(0.0,
            (previousValue, element) => previousValue += element.totalPrice)
        .currencyPtBr;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: context.screenWidth,
        height: 50,
        decoration: BoxDecoration(
          color: context.colors.primary,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: ElevatedButton(
          onPressed: () => _goOrder(context),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Ver sacola',
                  style: context.texts.textExtraBold.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  totalBag,
                  style: context.texts.textExtraBold.copyWith(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
