import 'package:flutter/material.dart';

class ThridPage extends StatefulWidget {
  const ThridPage({super.key});

  State<ThridPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThridPage> {
  String _str = "";
  final _ctrlEmail = TextEditingController();
  final _ctrlPwd = TextEditingController();
  final _ctrlName = TextEditingController();

  TextStyle textStyle() => const TextStyle(
        color: Colors.indigo,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  OutlineInputBorder OutlinedBorder() => const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      );

  void updateText() => setState(() {
        _str = "Email: ${_ctrlEmail.value.text}";
      });

  Widget textFieldEmail() => TextField(
        controller: _ctrlEmail,
        decoration: InputDecoration(
          border: OutlinedBorder(),
          hintText: "Email",
        ),
        keyboardType: TextInputType.emailAddress,
        style: textStyle(),
        onChanged: (text) => updateText(),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Test Textfield'),
        ),
        body: const Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFieldEmail(),
                const SizedBox(
                  height: 30,
                ),
                TextFieldPwd(),
                const SizedBox(
                  height: 30,
                ),
                TextFieldName(),
                const SizedBox(
                  height: 30,
                ),
                Text(_str),
              ],
            ),
          ),
        ),
      );
}
