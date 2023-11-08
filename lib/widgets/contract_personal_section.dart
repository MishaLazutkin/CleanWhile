import 'package:flutter/material.dart';
import 'all.dart';

class ContractPersonalSection extends StatefulWidget {
  final bool isSelectedPublicContract;
  final bool isSelectedUsePersonalData;
  final Function onCheckContract;
  final Function onCheckPersonalData;
  final bool showContractError;

  const ContractPersonalSection(
      {Key? key,
      required this.isSelectedPublicContract,
      required this.isSelectedUsePersonalData,
      required this.onCheckContract,
      required this.onCheckPersonalData,
      this.showContractError = false})
      : super(key: key);

  @override
  State<ContractPersonalSection> createState() => _ContractPersonalSectionState();
}

class _ContractPersonalSectionState extends State<ContractPersonalSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckbox(
              isChecked: widget.isSelectedPublicContract,
              showContractError: widget.showContractError,
              onChanged: (value) {
                widget.onCheckContract(value);
              },
            ),
            const SizedBox(
              width: 18,
            ),
              PublicContractTitle(showContractError:widget.showContractError)
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckbox(
                isChecked: widget.isSelectedUsePersonalData,

                onChanged: (value) {
                  widget.onCheckPersonalData(value);
                }),
            const SizedBox(
              width: 18,
            ),
            const PersonalDataTitle()
          ],
        ),
      ],
    );
  }
}
