
import 'package:flutter/material.dart';

class Friend {
  String name;
  Image avatar;
  String lastChat;
  DateTime lastTime;
  Friend({required this.name,required this.avatar,required this.lastChat,required this.lastTime});
}
class Conversation{
  
}
class MyAccount{
  static List<Friend> listFriend=[
    Friend(name: 'Namec', avatar: Image.asset('assets/image/0.png'), lastChat: 'Hello', lastTime: DateTime(2023,6,10)),
    Friend(name: 'Goku', avatar: Image.asset('assets/image/1.png'), lastChat: 'D!tM3M4y', lastTime: DateTime(2023,1,2)),
    Friend(name: 'Gohan', avatar: Image.asset('assets/image/2.png'), lastChat: 'Gohan an cut', lastTime: DateTime(2023,3,5)),
    Friend(name: 'Apule', avatar: Image.asset('assets/image/3.png'), lastChat: 'Test chat', lastTime: DateTime(2023,4,6)),
    Friend(name: 'Vegeta', avatar: Image.asset('assets/image/4.png'), lastChat: 'Gi do', lastTime: DateTime(2023,12,3)),
    Friend(name: 'Krilin', avatar: Image.asset('assets/image/5.png'), lastChat: 'abcxxyz', lastTime: DateTime(2023,4,5)),
    Friend(name: 'Saiyan', avatar: Image.asset('assets/image/6.png'), lastChat: 'eê', lastTime: DateTime(2023,3,2)),
    Friend(name: 'Raditz', avatar: Image.asset('assets/image/7.png'), lastChat: 'Hey', lastTime: DateTime(2023,11,22)),
    Friend(name: 'Kakarot', avatar: Image.asset('assets/image/8.png'), lastChat: 'Lan cuoi chat', lastTime: DateTime(2023,12,15)),
    Friend(name: 'Pengu', avatar: Image.asset('assets/image/9.png'), lastChat: 'Lan cuoi chat', lastTime: DateTime.now()),
  ];
}