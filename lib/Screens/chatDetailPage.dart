import 'package:flutter/material.dart';
import 'package:chat_view/Model/chatMessageModel.dart';
import 'package:chat_view/globals.dart';


class ChatDetailPage extends StatefulWidget{
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hii Mohammed How are you. It's been a long time since we talked to each other. I need a small help from you. could you be able to do it.", messageType: "receiver"),
    ChatMessage(messageContent: "Yaaa sure. I will do it for you. Can we have Zoom call tomorrow evening around 7:00PM", messageType: "receiver"),
    ChatMessage(messageContent: "Okay. Sure", messageType: "sender")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: appThemeColor,
          centerTitle: true,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                  const SizedBox(width: 2,),
                  CircleAvatar(
                    backgroundImage: NetworkImage(netWorkImage),
                    maxRadius: 20,
                  ),
                  const SizedBox(width: 5),
                  const Expanded(
                    child:  Text("Kumar",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                  ),
                  const Icon(Icons.info_outline,color: Colors.black),
                ],
              ),
            ),
          ),
        ),
      body: Stack(
        children: <Widget>[
      ListView.builder(
      itemCount: messages.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Container(
            padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
            child: Align(
              alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                ),
                padding: const EdgeInsets.all(16),
                child: Text(messages[index].messageContent, style: const TextStyle(fontSize: 15),),
              ),
            ),
          );
        },
      ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20,bottom: 5),
                      child:  TextField(
                        decoration: InputDecoration(
                            hintText: "Type your message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    child: const Icon(Icons.keyboard_voice,color: Colors.black54,size: 30),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}