import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outputInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: "Escribe finalizando con '?'",
      enabledBorder: outputInputBorder,
      focusedBorder: outputInputBorder,
      filled: true,
      suffix: IconButton(
        color: Colors.black,
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print(textValue);
          textController.clear();
          onValue(textValue); 
        },
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      keyboardAppearance: Brightness.dark,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        print(value);
        textController.clear();
        focusNode.requestFocus();
        onValue(value); 
      },
      /*  onChanged: (value) {
        print(value);
      }, */
    );
  }
}
