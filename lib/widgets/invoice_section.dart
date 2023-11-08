import 'package:clean_whale/widgets/all.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../utils/style.dart';
import 'custom_dropdown.dart';

class InvoiceSection extends StatelessWidget {
  final TextEditingController invoiceName;

  final TextEditingController invoiceNip;

  final TextEditingController invoiceAdress;

  final TextEditingController invoicePostalCode;

  final FocusNode invoiceNameNode;

  final FocusNode invoiceNipNode;

  final FocusNode invoiceAddressNode;

  final FocusNode invoicePostalCodeNode;

  final String title;

  final Function onFirstNameTyping;
  final Function onNipTyping;
  final Function onAdressTyping;
  final Function onPostalCodeTyping;

  InvoiceSection({
    Key? key,
    required this.title,
    required this.onFirstNameTyping,
    required this.onNipTyping,
    required this.onAdressTyping,
    required this.onPostalCodeTyping,
    required this.invoiceName,
    required this.invoiceNip,
    required this.invoiceAdress,
    required this.invoicePostalCode,
    required this.invoiceNameNode,
    required this.invoiceNipNode,
    required this.invoiceAddressNode,
    required this.invoicePostalCodeNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleSecondary(title: title),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: invoiceNameNode,
                  controller: invoiceName,
                  labelText: 'First name',
                  onTyping: (x) {
                    onFirstNameTyping(x);
                  }),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: invoiceNipNode,
                  controller: invoiceNip,
                  labelText: 'NIP',
                  onTyping: (x) {
                    onNipTyping(x);
                  }),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: invoiceAddressNode,
                  controller: invoiceAdress,
                  labelText: 'Adress',
                  onTyping: (x) {
                    onAdressTyping(x);
                  }),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  focusNode: invoicePostalCodeNode,
                  controller: invoicePostalCode,
                  labelText: 'Postal code',
                  onTyping: (x) {
                    onPostalCodeTyping(x);
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
