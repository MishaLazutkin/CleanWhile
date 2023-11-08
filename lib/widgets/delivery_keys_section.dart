import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';
import 'all.dart';

class DeliveryKeysSection extends StatelessWidget {
  final Function onCheckDelivery;
  final Function onTapTakeKeys;
  final Function onTypingBefore;
  final Function onTypingAfter;
  final List<bool> selectedTakeKeys;
  final bool isCheckedDelivery;
  final TextEditingController beforeClean;
  final TextEditingController afterClean;
  final FocusNode beforeNode;
  final FocusNode afterNode;

  const DeliveryKeysSection(
      {Key? key,
      required this.onCheckDelivery,
      required this.selectedTakeKeys,
      required this.isCheckedDelivery,
      required this.onTapTakeKeys,
      required this.beforeClean,
      required this.afterClean,
      required this.beforeNode,
      required this.afterNode,
      required this.onTypingBefore,
      required this.onTypingAfter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCheckbox(
                isChecked: isCheckedDelivery,
                onChanged: (value) {
                  onCheckDelivery(value);
                },
              ),
              const SizedBox(
                width: 37,
              ),
              SvgPicture.asset(
                'lib/assets/icons/keys.svg',
                width: 36,
                height: 52,
              )
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Text(
            'Доставлення ключів',
            style: AppTextStyle.titleBlackMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              onTapTakeKeys(0);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedTakeKeys[0] == true
                        ? AppColor.primary
                        : AppColor.containersBackgroundColor,
                  ),
                  color: selectedTakeKeys[0] == true
                      ? AppColor.backgroundPage
                      : AppColor.containersBackgroundColor,
                  borderRadius:
                      BorderRadius.circular(AppValues.regularCornerRadius)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          'Забрати ключі перед прибиранням',
                          style: AppTextStyle.titleBlackSmall,
                        )),
                        CellSmall('25 zl')
                      ],
                    ),
                  ),
                  Visibility(
                    visible: selectedTakeKeys[0],
                    child: CustomTextField(
                        focusNode: beforeNode,
                        controller: beforeClean,
                        hintText: 'Address',
                        fillColor: AppColor.backgroundPage,
                        onTyping: (x) {onTypingBefore(x);}),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              onTapTakeKeys(1);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedTakeKeys[1] == true
                        ? AppColor.primary
                        : AppColor.containersBackgroundColor,
                  ),
                  color: selectedTakeKeys[1] == true
                      ? AppColor.backgroundPage
                      : AppColor.containersBackgroundColor,
                  borderRadius:
                      BorderRadius.circular(AppValues.regularCornerRadius)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          'Забрати ключі після прибиранням',
                          style: AppTextStyle.titleBlackSmall,
                        )),
                        CellSmall('25 zl')
                      ],
                    ),
                  ),
                  Visibility(
                    visible: selectedTakeKeys[1],
                    child: CustomTextField(
                        focusNode: afterNode,
                        controller: afterClean,
                        hintText: 'Address',
                        fillColor: AppColor.backgroundPage,
                        onTyping: (x) {onTypingAfter(0);}),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
