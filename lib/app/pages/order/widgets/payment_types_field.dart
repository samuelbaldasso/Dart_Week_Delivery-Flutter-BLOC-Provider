import 'package:dw_delivery_flutter/app/core/ui/base_state/helpers/size_extension.dart';
import 'package:dw_delivery_flutter/app/core/ui/styles/texts.dart';
import 'package:dw_delivery_flutter/app/models/payment_types_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';

class PaymentTypesField extends StatelessWidget {
  final List<PaymentTypesModel> model;
  const PaymentTypesField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forma de pagamento',
            style: context.texts.textRegular.copyWith(
              fontSize: 16,
            ),
          ),
          SmartSelect<String>.single(
            title: '',
            selectedValue: '',
            modalType: S2ModalType.bottomSheet,
            onChange: (value) {},
            tileBuilder: (context, state) {
              return InkWell(
                onTap: state.showModal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: context.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.selected.title ?? '',
                            style: context.texts.textRegular,
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            choiceItems: S2Choice.listFrom<String, Map<String, String>>(
              source: model
                  .map((p) => {
                        'value': p.id.toString(),
                        'title': p.name,
                      })
                  .toList(),
              title: (index, item) => item['title'] ?? '',
              value: (index, item) => item['value'] ?? '',
              group: (index, item) => 'Selecione uma forma de pagamento',
            ),
            choiceType: S2ChoiceType.chips,
            choiceGrouped: true,
            modalFilter: false,
            placeholder: '',
          ),
        ],
      ),
    );
  }
}
