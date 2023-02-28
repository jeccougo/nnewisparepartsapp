import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/button.dart';

class TexttoBuy extends StatefulWidget {
  const TexttoBuy({Key? key}) : super(key: key);

  @override
  State<TexttoBuy> createState() => _TexttoBuyState();
}

class _TexttoBuyState extends State<TexttoBuy> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            title: const Text('Send us your list',
                style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      maxLines: 8,
                      minLines: 3,
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter some text',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    DefaultButton(
                      text: "Send",
                      press: () {
                        String text = _controller.text;
                      },

                      // disabled: isCartEmpty,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}





