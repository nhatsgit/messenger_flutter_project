import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/model.dart';

class ChatScreen extends StatefulWidget {
  final Friend myFriend;
  const ChatScreen({super.key, required this.myFriend});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Color backgroundColor = const Color.fromARGB(500, 28, 33, 45);
  final Color contentColor = const Color.fromARGB(255, 41, 48, 64);
  final Color contentColor2 = const Color.fromARGB(255, 123, 128, 149);
  final TextEditingController _txtMessCtrl = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  List<String> conversation1 = [
    'hello',
    'who the fuck are you',
    'i am your dad',
    'fuck you',
    'abchaduagdsuadsjadhjahjdsahdhạdhạdhadạhjahsjhdjsahdjhạdhjhd',
    '?',
    'ABCDEFGHKLSLAKSKDKẠHSDHHẠHFạhJHJHJHHẠHFSJHFJHSJHFJHAHHJF'
        'shdhahdhahdhsahdhahdh',
    'HEHEHEHEHHEHEHEHxxhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
    'ZzZzZZZZZZZ',
    'avcca',
    'zzzzzzzzzzzzzzzzzzzzzz',
    'lan cuoi chat'
  ];
  List<String> conversation2 = [
    'hello Again',
    'who the fuck are yoy Again =))))',
    'i am your mom',
    'fuck you bitch!!!',
    'fuck you too',
    '?',
    'hehee',
    'bái bai'
  ];
  List<List<String>> listConversation = [];

  bool isMyMessage = true;

  @override
  void initState() {
    listConversation.add(conversation1);
    listConversation.add(conversation2);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 65,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                  child: ClipOval(
                    child: widget.myFriend.avatar,
                  ),
                ),
                title: Text(
                  widget.myFriend.name,
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () {},
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ),
            ),
            Expanded(
              flex: 30,
              child: Container(
                  color: backgroundColor,
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: listConversation.length,
                      itemBuilder: (context, index) {
                        return _conversationAtTime(
                            listConversation[index], widget.myFriend.lastTime);
                      })),
            ),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: contentColor),
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 20, 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: contentColor2),
                width: 30,
                height: 30,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt),
                  color: Colors.white,
                  iconSize: 15,
                ),
              ),
              Flexible(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  maxLines: null,
                  controller: _txtMessCtrl,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Message',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 123, 128, 149))),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (_txtMessCtrl.text != '') {
                    isMyMessage = true;
                    setState(() {
                      conversation2.add(_txtMessCtrl.text);
                      _scrollController
                          .jumpTo(_scrollController.position.maxScrollExtent);
                      _txtMessCtrl.text = '';
                      _focusNode.unfocus();
                    });
                  }
                },
                icon: const Icon(Icons.send),
                color: Colors.white,
                iconSize: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myBoxMessage(String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(top: 10, right: 10, left: 70),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: contentColor2, borderRadius: BorderRadius.circular(15)),
            child: Text(
              content,
              style: const TextStyle(color: Colors.white),
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _friendBoxMessage(String content) {
    return Row(
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 50),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: contentColor, borderRadius: BorderRadius.circular(15)),
            child: Text(content, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _conversationAtTime(List<String> conversation, DateTime time) {
    return ListView.builder(
        itemCount: conversation.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == 0) {
            isMyMessage = !isMyMessage;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateFormat('dd/MM/yyyy').format(time),
                  style: TextStyle(color: contentColor2),
                ),
                _myBoxMessage(conversation[index]),
              ],
            );
          }
          if (isMyMessage) {
            isMyMessage = !isMyMessage;
            return _myBoxMessage(conversation[index]);
          } else {
            isMyMessage = !isMyMessage;
            return _friendBoxMessage(conversation[index]);
          }
        });
  }
}
