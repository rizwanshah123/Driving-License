import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'eligiblity_screen_provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligiblityScreenProvider>(
      create: (context) => EligiblityScreenProvider(),
      builder: (context, child) => Scaffold(
          appBar: AppBar(
            title: const Text("Driving Licences"),
            elevation: 30,
            centerTitle: true,
            titleSpacing: 30,
          ),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Form(
              child: Consumer<EligiblityScreenProvider>(
                builder: (context, provider, child) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (provider.isEligible == true)
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    TextField(
                      controller: ageController,
                      decoration: const InputDecoration(
                        hintText: "Enter your Age",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        height: 40,
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              final int age = int.parse(ageController.text);

                              provider.checkEligiblity(age);
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ))),
                    const SizedBox(height: 20),
                    Text(provider.eligibilityMessage == ""
                        ? "you have not given any input"
                        : provider.eligibilityMessage)
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
