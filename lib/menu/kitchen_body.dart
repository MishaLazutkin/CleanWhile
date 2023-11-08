import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/info_provider.dart';
import '../utils/style.dart';
import '../widgets/all.dart';

class KitchenBody extends StatefulWidget {
  const KitchenBody({Key? key}) : super(key: key);

  @override
  State<KitchenBody> createState() => _KitchenBodyState();
}

class _KitchenBodyState extends State<KitchenBody> {
  @override
  Widget build(BuildContext context) {
    return     SingleChildScrollView(
      child: Column(
        children: [


          Image.asset('lib/assets/icons/what-we-clean-3 1.png'),
          const SizedBox(
            height: 15,
          ),
          _chaptersList(),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: const [
              Expanded(
                child: Text('Що можна замовити додатково',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.primarySubtitleInfoPages),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          _cleanerOptionsSection(),
          const SizedBox(
            height: 20,
          ),
          const DottedLine(),
          const SizedBox(
            height: 20,
          ),
          _dryCleanerSection(),
          const SizedBox(
            height: 20,
          ),
          const DottedLine(),
          const SizedBox(
            height: 20,
          ),
          _repairCleanerSection(),
          const SizedBox(
            height: 70,
          ),
          _whatWeDontDoSection(),
          const SizedBox(height: 75,),
        ],
      ),
    );
  }



  Widget _chaptersList() {
    return Column(children: [
      _chapterItem('Протираємо підвіконня, батареї, плінтуси, двері, вимикачі'),
      const SizedBox(
        height: 5,
      ),
      _chapterItem('Миємо плиту, раковину та стільницю'),
      const SizedBox(
        height: 5,
      ),
      _chapterItem('Миємо підлогу'),
      const SizedBox(
        height: 5,
      ),
      _chapterItem('Миємо фасади та меблі'),
      const SizedBox(
        height: 5,
      ),
      _chapterItem('Миємо техніку та меблі в середині - це додаткова опція її можна вибрати при необхідності'),
      const SizedBox(
        height: 5,
      ),
      _chapterItem(
          'Протираємо плитку'),
      const SizedBox(
        height: 5,
      ),
      _chapterItem('Розставляємо стільці, наводимо лад'),
       const SizedBox(
        height: 5,
      ),
      _chapterItem('Миємо посуд. Але йдеться про невелику кількість у раковині. Якщо брудного посуду багато, ми просимо вас все ж поставити галочку в додаткових послугах.'),


    ]);
  }

  Widget _chapterItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 3),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primary, width: 2),
              color: AppColor.backgroundPage,
              borderRadius: BorderRadius.circular(100)),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(text, style: AppTextStyle.secondaryTitleInfoPages),
        )
      ],
    );
  }

  Widget _cleanerOptionsSection() {
    return Column(
      children: [
        Consumer<InfoProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: const EdgeInsets.only(top: 10),
              crossAxisCount: 3,

              listWidget: provider.cleanerOptionsList(),
              onTap: (index) {},
            );
          },
        ),
      ],
    );
  }

  Widget _dryCleanerSection() {
    return Consumer<InfoProvider>(
      builder: (context, provider, child) {
        return CustomGridView(
          padding: const EdgeInsets.only(top: 10),
          crossAxisCount: 3,

          listWidget: provider.dryCleanerList(),
          onTap: (index) {},
        );
      },
    );
  }

  Widget _repairCleanerSection() {
    return Consumer<InfoProvider>(
      builder: (context, provider, child) {
        return CustomGridView(
          padding: const EdgeInsets.only(top: 10),
          crossAxisCount: 3,

          listWidget: provider.repairCleanerOptionsList(),
          onTap: (index) {},
        );
      },
    );
  }

  Widget _whatWeDontDoSection() {
    return Column(
      children: [
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Чого ми ',
                    style: AppTextStyle.primarySubtitleInfoPages),
                TextSpan(
                  text: 'не робимо',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppFont.heavy,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(221, 53, 46, 1),
                  ),
                ),
                TextSpan(
                    text: ' під час прибиранняприбиранняприбирання',
                    style: AppTextStyle.primarySubtitleInfoPages),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30,),
        Consumer<InfoProvider>(
          builder: (context, provider, child) {
            return CustomGridView(
              padding: const EdgeInsets.only(top: 10),


              listWidget: provider.doNotDoCleanerOptionsList(),
              onTap: (index) {},
            );
          },
        ),
      ],
    );
  }
}
