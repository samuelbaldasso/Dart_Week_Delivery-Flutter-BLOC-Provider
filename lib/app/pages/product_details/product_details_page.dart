import 'package:auto_size_text/auto_size_text.dart';
import 'package:dw_delivery_flutter/app/core/extensions/formatter.dart';
import 'package:dw_delivery_flutter/app/core/ui/base_state/helpers/size_extension.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_delivery_flutter/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:dw_delivery_flutter/app/dto/order_product_dto.dart';
import 'package:dw_delivery_flutter/app/models/product_model.dart';
import 'package:dw_delivery_flutter/app/pages/product_details/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_state.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage(
      {super.key, required this.product, this.orderProductDto});
  final ProductModel product;
  final OrderProductDto? orderProductDto;
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState
    extends BaseState<ProductDetailsPage, ProductDetailsController> {
  @override
  void initState() {
    super.initState();
    final amount = widget.orderProductDto?.amount ?? 0;
    controller.initial(amount, widget.orderProductDto != null);
  }

  void _showConfirmDelete(int amount) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deseja excluir o produto?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancelar',
              style: context.texts.textBold.copyWith(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(
                  OrderProductDto(product: widget.product, amount: amount));
            },
            child: Text('Confirmar', style: context.texts.textBold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(widget.product.name,
                style: context.texts.textExtraBold.copyWith(fontSize: 22)),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description,
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailsController, int>(
                  bloc: controller,
                  builder: (context, state) {
                    return DeliveryIncrementDecrementButton(
                      decrementPress: () => controller.decrement(),
                      incrementPress: () => controller.increment(),
                      amount: state,
                    );
                  },
                ),
              ),
              Container(
                height: 68,
                padding: const EdgeInsets.all(8),
                width: context.percentWidth(.5),
                child: BlocBuilder<ProductDetailsController, int>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: state == 0
                            ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.red)
                            : null,
                        onPressed: () {
                          if (state == 0) {
                            _showConfirmDelete(state);
                          } else {
                            Navigator.of(context).pop(OrderProductDto(
                                product: widget.product, amount: state));
                          }
                        },
                        child: Visibility(
                          visible: state > 0,
                          replacement: Text(
                            'Excluir produto',
                            style: context.texts.textExtraBold,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Adicionar',
                                style: context.texts.textExtraBold
                                    .copyWith(fontSize: 13),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  (widget.product.price * state).currencyPtBr,
                                  maxFontSize: 13,
                                  minFontSize: 5,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: context.texts.textExtraBold
                                      .copyWith(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
