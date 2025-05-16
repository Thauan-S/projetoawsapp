import 'package:flutter/material.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final _chatController=TextEditingController();

    String  text ="9o";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatBot'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: SizedBox(
                  child: Row(
                children: [
                  Image.asset('assets/queue.png',
                      height: 70, 
                      width:
                          70, 
                      fit: BoxFit
                          .contain), 
                  Image.asset('assets/livro.png',
                      height: 70, 
                      width:
                          70, 
                      fit: BoxFit.contain),
                ],
              )),
            ),
            ListTile(
              title: const Text('Nome'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Email'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:MainAxisAlignment.end ,
        children: [ 
          Text(text),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              children: [
                
      
                  
                  SizedBox(height: 20,),
               Center(
                
                 child: SizedBox(
                  height: 70,
                  width: 800,
                   child: TextField(  
                    controller:_chatController,
                   onChanged: (value) {
                     
                     setState(() {
                       text+=_chatController.text=value;
                     });
                   },
                    decoration: InputDecoration(border: const OutlineInputBorder())),
                 ),
               ),
                IconButton(
                  padding: EdgeInsets.only(bottom: 25),
                  icon: Icon(Icons.send, color: Colors.tealAccent),
                  onPressed: (){

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
