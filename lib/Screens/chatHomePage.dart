import 'package:flutter/material.dart';
import 'package:chat_view/Model/chatUsersModel.dart';
import 'package:chat_view/Widgets/conversationList.dart';
import 'package:chat_view/globals.dart';


class ChatHomePage extends StatefulWidget {
  @override
  _ChatHomePageState createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Rahul", messageText: "Ok sure", imageURL: netWorkImage, time: "17/12/2021",),
    ChatUsers(name: "Kumar", messageText: "That's Great", imageURL: netWorkImage1, time: "18/12/2021"),
    ChatUsers(name: "Harini", messageText: "Hey how are you?", imageURL: netWorkImage2, time: "19/12/2021"),
    ChatUsers(name: "Siva kumar", messageText: "Busy! Call me in 20 mins", imageURL: netWorkImage3, time: "20/12/2021"),
    ChatUsers(name: "Kumaravel", messageText: "Thank you, It's awesome", imageURL: netWorkImage1, time: "21/12/2021"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemeColor,
        title: const Text("Conversations"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
              child: Icon(Icons.add,color: Colors.black,size: 40))]
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  suffixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 30,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}
