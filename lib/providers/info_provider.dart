import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';
import '../widgets/cell_small.dart';
import '../widgets/counter_secondary.dart';
import '../widgets/discount.dart';
import '../widgets/info_widget.dart';
import '../widgets/service_widget.dart';
import '../widgets/service_widget_ext.dart';

class InfoProvider extends ChangeNotifier {
  late List<Map<String, dynamic>> _aboutUsTableDataList;
  late List<Map<String, dynamic>> _discountDataList;
  late List<Map<String, dynamic>> _cleanerOptionsDataList;
  late List<Map<String, dynamic>> _dryCleanerOptionsDataList;
  late List<Map<String, dynamic>> _flatCleanerOptionsDataList;
  late List<Map<String, dynamic>> _windowCleanerOptionsDataList;
  late List<Map<String, dynamic>> _repairCleanerOptionsDataList;
  late List<Map<String, dynamic>> _doNotDoCleanerOptionsDataList;
  late List<Map<String, dynamic>> _reviewsDataList;
  late List<Map<String, dynamic>> _abonementDataList;
  late List<Map<String, dynamic>> _questionsDataList;

  late int _selectedDiscountId = 1;

  Future<void> init() async {
    _aboutUsTableDataList = [
      {
        'title': 'Фіксовані та зрозумілі ціни',
        'uriPicture': 'lib/assets/icons/fixed-price 1.svg',
        'subtitle':
            'Ви відразу бачите остаточну вартість прибирання. Всі ціни на прибирання та додаткові послуги відображаються на сторінці замовлення.',
      },
      {
        'title': 'Замовлення оформлюється швидко та зручно',
        'uriPicture': 'lib/assets/icons/quick-order 1.svg',
        'subtitle':
            'Замовити прибирання або хімчистку можна за одну хвилину. Вкажіть кількість кімнат і додаткові опції, виберіть дату і час.',
      },
      {
        'title': 'Оплата карткою або готівкою',
        'uriPicture': 'lib/assets/icons/Advantages.svg',
        'subtitle': 'Співпраця з юридичними особами',
      },
      {
        'title': 'Досвідчена команда',
        'uriPicture': 'lib/assets/icons/team 1.svg',
        'subtitle':
            'Ми працюємо з 2016 року. Всі наші співробітники проходять відбір і навчання.',
      },
      {
        'title': 'Прибирання хороше або безкоштовне',
        'uriPicture': 'lib/assets/icons/good-or-free 1.svg',
        'subtitle':
            'Якщо вас не влаштує якість прибирання, ми зробимо його безкоштовно.',
      },
      {
        'title': 'Договір публічної оферти',
        'uriPicture': 'lib/assets/icons/public-contract 1.svg',
        'subtitle':
            'Ми завжди працюємо з договором і всіма необхідними документами.',
      },
      {
        'title': 'Пунктуальність і відповідальність',
        'uriPicture': 'lib/assets/icons/punctuality 1.svg',
        'subtitle':
            'Наші співробітники приходять вчасно і відповідально ставляться до роботи',
      },
      {
        'title': 'Замовлення прибирання на той самий день, доставлення ключів',
        'uriPicture': 'lib/assets/icons/day 1.svg',
        'subtitle':
            'Ми можемо приїхати до вас вже через 3 години після оформлення замовлення',
      },
      {
        'title': 'Подарункові сертифікати',
        'uriPicture': 'lib/assets/icons/gift 1.svg',
        'subtitle':
            'Прибирання — чудовий подарунок. Сплатіть за сертифікат онлайн, а ми доставимо його протягом дня.',
      },
      {
        'title': 'Бонусна програма',
        'uriPicture': 'lib/assets/icons/bonus 1.svg',
        'subtitle':
            'У нас є знижки та бонусні бали. Постійним клієнтам ми даруємо карту',
      },
    ];
    _discountDataList = [
      {
        'id': 1,
        'percent': '-20%',
        'title': 'Раз на тиждень',
        'price': '119.92 zł'
      },
      {
        'id': 2,
        'percent': '-15%',
        'title': 'Раз на два тижні',
        'price': '127.42 zł'
      },
      {
        'id': 3,
        'percent': '-10%',
        'title': 'Раз на місяць',
        'price': '134.91 zł'
      },
      {'id': 4, 'title': 'Разове прибирання', 'price': '149.90 zł'},
    ];
    _cleanerOptionsDataList = [
      {
        'title': 'Миття духової шафи',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/oven.svg',
        'isSingle': true,
      },
      {
        'title': 'Миття витяжки',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/hood.svg',
        'isSingle': true,
      },
      {
        'title': 'Прибирання в кухоних шафах',
        'price': '55 zł',
        'uriPicture': 'lib/assets/icons/cabinets.svg',
        'isSingle': true,
      },
      {
        'title': 'Миття посуду',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/dishes.svg',
        'isSingle': false,
      },
      {
        'title': 'Миття холодильника',
        'price': '30 zł',
        'uriPicture': 'lib/assets/icons/fridge.svg',
        'isSingle': false,
      },
      {
        'title': 'Миття мікрохвильовки',
        'price': '15 zł',
        'uriPicture': 'lib/assets/icons/microoven.svg',
        'isSingle': true,
      },
      {
        'title': 'Прибирання балкона',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/balcony.svg',
        'isSingle': false,
      },
      {
        'title': 'Помиємо вікна з внутрішної сторони (шт.)',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/windows.svg',
        'isSingle': false,
      },
      {
        'title': 'Прасування',
        'price': '45 zł',
        'uriPicture': 'lib/assets/icons/ironing.svg',
        'isSingle': false,
      },
      {
        'title': 'Прибрати лоток для тварин',
        'price': '10 zł',
        'uriPicture': 'lib/assets/icons/tray.svg',
        'isSingle': false,
      },
      {
        'title': 'Додаткові години',
        'price': '45 zł',
        'uriPicture': 'lib/assets/icons/hours.svg',
        'isSingle': false,
      },
      {
        'title': 'Прибирання гардеробу',
        'price': '20 zł',
        'uriPicture': 'lib/assets/icons/wardrobe.svg',
        'isSingle': false,
      },
      {
        'title': 'Прибрати в шафі',
        'price': '40 zł',
        'uriPicture': 'lib/assets/icons/closet.svg',
        'isSingle': false,
      },
    ];
    _dryCleanerOptionsDataList = [
      {
        'title': 'Хімчистка двомісного дивана',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/sofa.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка тримісного дивана',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/corner-sofa.svg',
        'isSingle': false,
      },
      {
        'title': 'Прання кутового дивана (4 чол)',
        'price': '160 zł',
        'uriPicture': 'lib/assets/icons/sofa-corner.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка кутового дивана (5-6 чол)',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/corner-sofa-5-6.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка кутового дивана (7+  чол)',
        'price': '160 zł',
        'uriPicture': 'lib/assets/icons/corner-sofa-6-more.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка односпального матраца',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/single-mattress.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка односпального матраца з двох сторін',
        'price': '140 zł',
        'uriPicture': 'lib/assets/icons/double-mattress.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка двоспального матраца ',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/single-mattress.svg',
        'isSingle': false,
      },
      {
        'title': 'Прасування',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/double-mattress.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка килима',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/carpet.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка килимового покриття',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/carpeting.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка крісла',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/armchair.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка стільців і табуретів',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/tabouret.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка офісних стільців',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/office-chair.svg',
        'isSingle': false,
      },
      {
        'title': 'Хімчистка м’якого узголів’я ліжка',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/bed.svg',
        'isSingle': false,
      },
      {
        'title': 'Чищення дитячого візка',
        'price': '120 zł',
        'uriPicture': 'lib/assets/icons/baby-carriage.svg',
        'isSingle': false,
      },
    ];

    _flatCleanerOptionsDataList = [
      {
        'title': 'Вікна після ремонту',
        'price': '45.00 zł',
        'uriPicture': 'lib/assets/icons/window-order.svg',
        'isSingle': true,
      },
      {
        'title': 'Площа',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/area.svg',
        'isSingle': true,
      },
    ];

    _repairCleanerOptionsDataList = [
      {
        'title': 'Вікна після ремонту',
        'price': '45.00 zł',
        'uriPicture': 'lib/assets/icons/window-order.svg',
        'isSingle': true,
      },
      {
        'title': 'Площа',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/area.svg',
        'isSingle': true,
      },
      {
        'title': 'Миття вікон',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/window-order.svg',
        'isSingle': true,
      },
      {
        'title': 'Прибирання балкона',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/balcony.svg',
        'isSingle': true,
      },
    ];

    _windowCleanerOptionsDataList = [
      {
        'title': 'Миття вікон',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/window-order.svg',
        'isSingle': true,
      },
      {
        'title': 'Прибирання балкона',
        'price': '25 zł',
        'uriPicture': 'lib/assets/icons/balcony.svg',
        'isSingle': true,
      },
    ];

    _doNotDoCleanerOptionsDataList = [
      {
        'title': 'Ми не рухаємо меблі та габаритну техніку',
        'uriPicture': 'lib/assets/icons/not-clean 1.svg',
        'isSingle': true,
      },
      {
        'title': 'Ми не чистимо штори, жалюзі та москітні решітки',
        'uriPicture': 'lib/assets/icons/not-clean 1.svg',
      },
      {
        'title': 'Ми не миємо люстри',
        'uriPicture': 'lib/assets/icons/not-clean 1.svg',
      },
      {
        'title': 'Ми не миємо сходовий майданчик у під\'їзді',
        'uriPicture': 'lib/assets/icons/not-clean 1.svg',
      },
      {
        'title': 'Ми не миємо стелі',
        'uriPicture': 'lib/assets/icons/not-clean 1.svg',
      },
      {
        'title': 'Ми не проводимо дезінфекцію приміщень',
        'uriPicture': 'lib/assets/icons/not-clean 1.svg',
      },
    ];

    _reviewsDataList = [
      {
        'author': 'Аліна',
        'description':
            'Дівчата все класно і швидко прибрали. Дуже чисто відмили кухню. Були дуже уважні до всіх зауважень.',
        'star': 5,
      },
      {
        'author': 'Сергій',
        'description':
            'Велике спасибі п. Любові! Вкрай відповідальна, дуже сумлінна, високопрофесійна Людина! Все зроблено на 5+.',
        'star': 4,
      },
      {
        'author': 'Надія',
        'description': 'Все сподобалось, ідеальне прибирання! Дякую!.',
        'star': 5,
      },
      {
        'author': 'Аліна',
        'description':
            'Дівчата все класно і швидко прибрали. Дуже чисто відмили кухню. Були дуже уважні до всіх зауважень.',
        'star': 5,
      },
      {
        'author': 'Сергій',
        'description':
            'Велике спасибі п. Любові! Вкрай відповідальна, дуже сумлінна, високопрофесійна Людина! Все зроблено на 5+.',
        'star': 4,
      },
      {
        'author': 'Надія',
        'description': 'Все сподобалось, ідеальне прибирання! Дякую!.',
        'star': 5,
      },
      {
        'author': 'Аліна',
        'description':
            'Дівчата все класно і швидко прибрали. Дуже чисто відмили кухню. Були дуже уважні до всіх зауважень.',
        'star': 5,
      },
      {
        'author': 'Сергій',
        'description':
            'Велике спасибі п. Любові! Вкрай відповідальна, дуже сумлінна, високопрофесійна Людина! Все зроблено на 5+.',
        'star': 4,
      },
      {
        'author': 'Надія',
        'description': 'Все сподобалось, ідеальне прибирання! Дякую!.',
        'star': 5,
      },
    ];

    _abonementDataList = [
      {
        'title': 'Не потрібно підтверджувати кожне окреме прибирання',
        'uriPicture': 'lib/assets/icons/shutterstock_1488402020-(1).svg',
      },
      {
        'title': 'Завжди один і той самий виконавець',
        'uriPicture': 'lib/assets/icons/icons.svg',
      },
      {
        'title': 'Оплата тільки після кожного прибирання',
        'uriPicture': 'lib/assets/icons/payments 1.svg',
      },
      {
        'title':
            'Дату, час та параметри завжди можна змінити – знижка зберігається',
        'uriPicture': 'lib/assets/icons/date 1.svg',
      },
      {
        'title':
            'Передплату легко оформити, її завжди можна призупинити або скасувати',
        'uriPicture': 'lib/assets/icons/shutterstock_1488402020-(2).svg',
      },
      {
        'title': 'Усі наші послуги застраховані',
        'uriPicture': 'lib/assets/icons/shutterstock_1488402020-(3).svg',
      },
    ];

    _questionsDataList = [
      {
        'title': 'Загальні питання',
        'uriPicture': 'lib/assets/icons/shutterstock_1488402020-(1).svg',

        'subtitle1': [
          {
            'question',
            'Чи потрібно надавати свої мийні засоби?',
            'answer',
            'Наші фахівці мають усе необхідне для повноцінного прибирання квартири та миття вікон. Ми використовуємо професійні засоби для чищення, а в кожного співробітника є пилосос. Вам достатньо лише відчинити двері.',
          },
          {
            'question',
            'Чи прибираєте ви в котеджах?',
            'answer',
            'Так, ми прибираємо на дачах, у котеджах, а також у будинках і квартирах нестандартного планування. Замовлення можна оформити через сайт: вкажіть кількість кімнат і сан. вузлів і напишіть метраж у коментарях. Інша опція — залишити заявку в соцмережах або через кол-центр.',
          },
          {'question', 'Хто ваші працівники?', 'answer', ''},
          {
            'question',
            'Чи можуть мені привезти ключі після прибирання?',
            'answer',
            ''
          },
          {'question', 'А що як мене не влаштує якість прибирання?', 'answer', ''},
        ],
      },
      {
        'title': 'Знижки',
        'uriPicture': 'lib/assets/icons/shutterstock_1488402020-(1).svg',

        'subtitle1': [
          {
            'question',
            'Чи потрібно надавати свої мийні засоби?',
            'answer',
            'Наші фахівці мають усе необхідне для повноцінного прибирання квартири та миття вікон. Ми використовуємо професійні засоби для чищення, а в кожного співробітника є пилосос. Вам достатньо лише відчинити двері.',
          },
          {
            'question',
            'Чи прибираєте ви в котеджах?',
            'answer',
            'Так, ми прибираємо на дачах, у котеджах, а також у будинках і квартирах нестандартного планування. Замовлення можна оформити через сайт: вкажіть кількість кімнат і сан. вузлів і напишіть метраж у коментарях. Інша опція — залишити заявку в соцмережах або через кол-центр.',
          },
          {'question', 'Хто ваші працівники?', 'answer', ''},
          {
            'question',
            'Чи можуть мені привезти ключі після прибирання?',
            'answer',
            ''
          },
          {'question', 'А що як мене не влаштує якість прибирання?', 'answer', ''},
        ],
      },
      {
        'title': 'Прибирання',
        'uriPicture': 'lib/assets/icons/shutterstock_1488402020-(1).svg',

        'subtitle1': [
          {
            'question',
            'Чи потрібно надавати свої мийні засоби?',
            'answer',
            'Наші фахівці мають усе необхідне для повноцінного прибирання квартири та миття вікон. Ми використовуємо професійні засоби для чищення, а в кожного співробітника є пилосос. Вам достатньо лише відчинити двері.',
          },
          {
            'question',
            'Чи прибираєте ви в котеджах?',
            'answer',
            'Так, ми прибираємо на дачах, у котеджах, а також у будинках і квартирах нестандартного планування. Замовлення можна оформити через сайт: вкажіть кількість кімнат і сан. вузлів і напишіть метраж у коментарях. Інша опція — залишити заявку в соцмережах або через кол-центр.',
          },
          {'question', 'Хто ваші працівники?', 'answer', ''},
          {
            'question',
            'Чи можуть мені привезти ключі після прибирання?',
            'answer',
            ''
          },
          {'question', 'А що як мене не влаштує якість прибирання?', 'answer', ''},
        ],
      },
      {
        'title': 'Оплата',
        'uriPicture': 'lib/assets/icons/shutterstock_1488402020-(1).svg',

        'subtitle1': [
          {
            'question',
            'Чи потрібно надавати свої мийні засоби?',
            'answer',
            'Наші фахівці мають усе необхідне для повноцінного прибирання квартири та миття вікон. Ми використовуємо професійні засоби для чищення, а в кожного співробітника є пилосос. Вам достатньо лише відчинити двері.',
          },
          {
            'question',
            'Чи прибираєте ви в котеджах?',
            'answer',
            'Так, ми прибираємо на дачах, у котеджах, а також у будинках і квартирах нестандартного планування. Замовлення можна оформити через сайт: вкажіть кількість кімнат і сан. вузлів і напишіть метраж у коментарях. Інша опція — залишити заявку в соцмережах або через кол-центр.',
          },
          {'question', 'Хто ваші працівники?', 'answer', ''},
          {
            'question',
            'Чи можуть мені привезти ключі після прибирання?',
            'answer',
            ''
          },
          {'question', 'А що як мене не влаштує якість прибирання?', 'answer', ''},
        ],
      },

    ];

    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }

  bool get isInited {
    return true;
  }

  Future<void> load(int task_id) async {
    notifyListeners();
  }

  List<Widget> aboutUsTableList() {
    return List.generate(
        _aboutUsTableDataList.length,
        (index) => InfoWidget(
              title: _aboutUsTableDataList[index]['title'],
              subTitle: _aboutUsTableDataList[index]['subtitle'],
              image: SvgPicture.asset(
                _aboutUsTableDataList[index]['uriPicture'],
              ),
            ));
  }

  List<Widget> cleanerOptionsList() {
    return List.generate(
        _cleanerOptionsDataList.length,
        (index) => ServiceWidgetExtend(
              title: _cleanerOptionsDataList[index]['title'],
              price: _cleanerOptionsDataList[index]['price'],
              textColor: const Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
              image: SvgPicture.asset(
                _cleanerOptionsDataList[index]['uriPicture'],
                // height: 30,
              ),
            ));
  }

  List<Widget> dryCleanerList() {
    return List.generate(
        _dryCleanerOptionsDataList.length,
        (index) => ServiceWidgetExtend(
              title: _dryCleanerOptionsDataList[index]['title'],
              price: _dryCleanerOptionsDataList[index]['price'],
              textColor: const Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
              image: SvgPicture.asset(
                  _dryCleanerOptionsDataList[index]['uriPicture']),
            ));
  }

  List<Widget> flatCleanerOptionsList() {
    return List.generate(
        _flatCleanerOptionsDataList.length,
        (index) => ServiceWidgetExtend(
              title: _flatCleanerOptionsDataList[index]['title'],
              price: _flatCleanerOptionsDataList[index]['price'],
              textColor: const Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
              image: SvgPicture.asset(
                _flatCleanerOptionsDataList[index]['uriPicture'],
                height: 30,
              ),
            ));
  }

  List<Widget> windowsCleanerOptionsList() {
    return List.generate(
        _windowCleanerOptionsDataList.length,
        (index) => ServiceWidgetExtend(
              title: _windowCleanerOptionsDataList[index]['title'],
              price: _windowCleanerOptionsDataList[index]['price'],
              textColor: const Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
              image: SvgPicture.asset(
                _windowCleanerOptionsDataList[index]['uriPicture'],
                height: 30,
              ),
            ));
  }

  List<Widget> repairCleanerOptionsList() {
    return List.generate(
        _repairCleanerOptionsDataList.length,
        (index) => ServiceWidgetExtend(
              title: _repairCleanerOptionsDataList[index]['title'],
              price: _repairCleanerOptionsDataList[index]['price'],
              textColor: const Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
              image: SvgPicture.asset(
                _repairCleanerOptionsDataList[index]['uriPicture'],
                height: 30,
              ),
            ));
  }

  List<Widget> doNotDoCleanerOptionsList() {
    return List.generate(
        _doNotDoCleanerOptionsDataList.length,
        (index) => ServiceWidget(
              title: _doNotDoCleanerOptionsDataList[index]['title'],
              textColor: const Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
              image: SvgPicture.asset(
                _doNotDoCleanerOptionsDataList[index]['uriPicture'],
                height: 30,
              ),
            ));
  }

  List<Widget> abonementOptionsList() {
    return List.generate(
        _abonementDataList.length,
        (index) => ServiceWidget(
              title: _abonementDataList[index]['title'],
              textColor: const Color.fromRGBO(64, 64, 64, 1),
              backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
              image: SvgPicture.asset(
                _abonementDataList[index]['uriPicture'],
                //height: 30,
              ),
            ));
  }

  bool validate() {
    return false;
  }

  Future<void> reset() async {}

  List<Map<String, dynamic>> get discountDataList => _discountDataList;

  int get selectedDiscountId => _selectedDiscountId;

  set selectedDiscountId(int value) {
    _selectedDiscountId = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get repairCleanerOptionsDataList =>
      _repairCleanerOptionsDataList;

  List<Map<String, dynamic>> get reviewsDataList => _reviewsDataList;

  List<Map<String, dynamic>> get abonementDataList => _abonementDataList;

  List<Map<String, dynamic>> get questionsDataList => _questionsDataList;
}
