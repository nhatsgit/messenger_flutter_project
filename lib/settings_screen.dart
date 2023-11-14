import 'package:flutter/material.dart';
import 'package:messenger/model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(244, 32, 38, 53),
        body: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20,top:20, bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyColor.contentColor2),
                        width: 35,
                        height: 35,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          iconSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text('Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                const Expanded(child: SizedBox())
              ],
            ),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(35),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Theme',
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.keyboard_arrow_right))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Font Size',
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.keyboard_arrow_right))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Delay sending',
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.keyboard_arrow_right))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Swipe Actions',
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.keyboard_arrow_right))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Night Mode',
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {
                              setState(() {
                                
                              });
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Notification',
                          ),
                          Switch(
                            value: false,
                            onChanged: (value) {
                              setState(() {
                                
                              });
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Automatic contact colors',
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {
                              setState(() {
                                
                              });
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Use system font',
                          ),
                          Switch(
                            value: false,
                            onChanged: (value) {
                              setState(() {
                                
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  )),
            )
          ],
        )));
  }
}
