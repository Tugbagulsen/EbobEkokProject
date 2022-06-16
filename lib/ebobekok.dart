import 'package:flutter/material.dart';

class EbobEkok extends StatefulWidget {
  const EbobEkok({Key? key}) : super(key: key);

  @override
  State<EbobEkok> createState() => _EbobEkokState();
}

class _EbobEkokState extends State<EbobEkok> {
  TextEditingController number1Text = TextEditingController();
  TextEditingController number2Text = TextEditingController();
  TextEditingController number3Text = TextEditingController();
  TextEditingController number4Text = TextEditingController();
  int ebob = 1;
  double ekok = 0;
  void ebobCalculation(var num1, var num2) {
    for (var i = 1; i <= num1 && i < num2; i++) {
      if (num1 % i == 0 && num2 % i == 0) {
        ebob = i;
      }
    }
    ekok = (num1 * num2) / ebob;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _appBar,
            _sizedBox,
            _textFieldNum1,
            _sizedBox,
            _textFieldNum2,
            _sizedBox,
            _row,
            _elevatedButton,
          ]),
        ),
      ),
    );
  }

  Widget get _appBar => AppBar(
        elevation: 1,
        title: const Text("Ebob-Ekok Calculation"),
        centerTitle: true,
      );
  Widget get _sizedBox => const SizedBox(height: 40);
  Widget get _textFieldNum1 => TextField(
        keyboardType: TextInputType.number,
        controller: number1Text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "1. Number",
        ),
      );
  Widget get _textFieldNum2 => TextField(
        keyboardType: TextInputType.number,
        controller: number2Text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "2. Number",
        ),
      );
  Widget get _expandedEbob => Expanded(
        child: TextField(
          keyboardType: TextInputType.number,
          controller: number3Text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Ebob",
          ),
        ),
      );
  Widget get _expandedEkok => Expanded(
        child: TextField(
          keyboardType: TextInputType.number,
          controller: number4Text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Ekok",
          ),
        ),
      );
  Widget get _elevatedButton => ElevatedButton(
        child: const Text("Calculate"),
        onPressed: () {
          ebobCalculation(double.tryParse(number1Text.text),
              double.tryParse(number2Text.text));
          setState(() {
            number3Text.text = ebob.toString();
            number4Text.text = ekok.toString();
          });
        },
      );

  Widget get _row => Row(
        children: [
          _expandedEbob,
          const SizedBox(
            width: 10,
          ),
          _expandedEkok
        ],
      );
}
