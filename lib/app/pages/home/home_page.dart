import 'package:dw_delivery_flutter/app/pages/home/widgets/shopping_bag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dw_delivery_flutter/app/core/ui/base_state/base_state.dart';
import 'package:dw_delivery_flutter/app/core/ui/base_state/helpers/loader.dart';
import 'package:dw_delivery_flutter/app/core/ui/base_state/helpers/messages.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_delivery_flutter/app/models/product_model.dart';
import 'package:dw_delivery_flutter/app/pages/home/home_controller.dart';
import 'package:dw_delivery_flutter/app/pages/home/home_state.dart';
import 'package:dw_delivery_flutter/app/pages/home/widgets/product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    super.onReady();
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro não informado.');
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          success: () => true,
          error: () => false,
        ),
        builder: (BuildContext context, state) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  final orders = state.shoppingBag
                      .where((element) => element.product == product);
                  return ProductTile(
                    product: product,
                    orderProductDto: orders.isNotEmpty ? orders.first : null,
                  );
                },
              ),
            ),
            Visibility(
              visible: state.shoppingBag.isNotEmpty,
              child: ShoppingBagWidget(shoppingBag: state.shoppingBag),
            ),
          ],
        ),
      ),
    );
  }
}
