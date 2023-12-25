import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/chat_screen.dart';
import 'package:messenger/model.dart';
import 'package:messenger/settings_screen.dart';
import 'package:messenger/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


    @override
  void initState() {
    setState(() {
      MyAccount.listFriend.sort((a, b) => b.lastTime.compareTo(a.lastTime));
    });
    super.initState();
  }
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 800),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: MyColor.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Messenger Fake',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsScreen()));
                    },
                    icon: const Icon(Icons.settings),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TestScreen()));
                    },
                    icon: const Icon(Icons.apps_rounded),
                    color: Colors.white,
                    iconSize: 30,
                  )
                ],
              ),
              const Text(
                ' R E C E N T',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                  flex: 3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: MyAccount.listFriend.length,
                      itemBuilder: (context, index) {
                        return myFriend(MyAccount.listFriend[index]);
                      })),
              Expanded(
                flex: 10,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: MyColor.contentColor),
                  child: ListView.builder(
                    itemCount: MyAccount.listFriend.length,
                    itemBuilder: (context, index) {
                      return chat(MyAccount.listFriend[index]);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget chat(Friend friend) {
    return SizedBox(
      height: 80,
      child: ListTile(
        leading: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(color: Colors.blue,shape:BoxShape.circle),
              child: ClipOval(
                child: friend.avatar,
              ),
            ),
        title: Text(
          friend.name,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle:
            Text(friend.lastChat, style: const TextStyle(color: Colors.white54)),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(myFriend: friend,)));
        },
        trailing: Text(DateFormat('dd/MM/yyyy').format(friend.lastTime)),
      ),
    );
  }

  Widget myFriend(Friend friend) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(myFriend: friend,)));
      },
      child: SizedBox(
        width: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(color: Colors.blue,shape:BoxShape.circle),
              child: ClipOval(
                child: friend.avatar,
              ),
            ),
            Text(
              friend.name,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
