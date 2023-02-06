import 'package:dw_delivery_flutter/app/core/ui/base_state/base_state.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_button.dart';
import 'package:dw_delivery_flutter/app/dto/order_product_dto.dart';
import 'package:dw_delivery_flutter/app/models/payment_types_model.dart';
import 'package:dw_delivery_flutter/app/pages/order/order_controller.dart';
import 'package:dw_delivery_flutter/app/pages/order/order_state.dart';
import 'package:dw_delivery_flutter/app/pages/order/widgets/order_field.dart';
import 'package:dw_delivery_flutter/app/pages/order/widgets/order_product_tile.dart';
import 'package:dw_delivery_flutter/app/pages/order/widgets/payment_types_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        return state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro não informado.');
            });
      },
      child: Scaffold(
        appBar: DeliveryAppBar(
          elevation: 1,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Row(
                  children: [
                    Text(
                      'Carrinho',
                      style: context.texts.textTitle,
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/trashRegular.png'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            BlocSelector<OrderController, OrderState, List<OrderProductDto>>(
              selector: (state) {
                return state.products;
              },
              builder: (context, orderProducts) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: orderProducts.length, (context, index) {
                    final orderProduct = orderProducts[index];
                    return Column(
                      children: [
                        OrderProductTile(
                          index: index,
                          orderProduct: orderProduct,
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                      ],
                    );
                  }),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total do pedido',
                          style: context.texts.textExtraBold
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          r'R$ 200,00',
                          style: context.texts.textExtraBold
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OrderField(
                    title: 'Endereço de entrega',
                    controller: TextEditingController(),
                    validator: Validatorless.required(""),
                    hintText: "Digite seu endereço",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OrderField(
                    title: 'CPF',
                    controller: TextEditingController(),
                    validator: Validatorless.required(""),
                    hintText: "Digite o CPF",
                  ),
                  BlocSelector<OrderController, OrderState,
                      List<PaymentTypesModel>>(
                    selector: (state) {
                      return state.model;
                    },
                    builder: (context, paymentTypes) {
                      return PaymentTypesField(model: paymentTypes);
                    },
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DeliveryButton(
                      label: 'FINALIZAR',
                      onPressed: () {},
                      width: double.infinity,
                      height: 48,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
