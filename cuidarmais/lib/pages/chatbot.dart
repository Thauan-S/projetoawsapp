import 'package:cuidarmais/widgets/stiledTileWidget.dart';
import 'package:flutter/material.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final TextEditingController _chatController = TextEditingController();
  final List<String> _messages = [];
  final double width_value = 50;
  final double heigth_value = 50;
  String text = "";
  // Widget _styledTile(String title) {

  // }

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
        backgroundColor: const Color.fromARGB(217, 217, 217, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Image.asset('assets/livro.png',
                        height: heigth_value,
                        width: width_value,
                        fit: BoxFit.contain),
                  ),
                  Image.asset('assets/lupa.png',
                      height: heigth_value,
                      width: width_value,
                      fit: BoxFit.contain),
                  Image.asset('assets/caderninho.png',
                      height: heigth_value,
                      width: width_value,
                      fit: BoxFit.contain),
                ],
              ),
            ),
            ...[
              const StyledTitleWidget(title: "Vacinas necessárias"),
              const StyledTitleWidget(title: "Rotina terapêutica"),
              const StyledTitleWidget(title: 'Fisioterapia precoce'),
              const StyledTitleWidget(title: 'Grupos de apoio'),
              const StyledTitleWidget(title: 'Como funciona o BPC'),
              const StyledTitleWidget(title: 'Escolas inclusivas'),
              const StyledTitleWidget(title: 'Microcefalia e epilepsia'),
              const StyledTitleWidget(title: 'Transporte público')
            ]
            // Container(
            //   child: ,
            // )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(217, 217, 217, 255),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Ola, Juliana",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/loggeduser.png',
                    width: width_value + 30,
                    height: heigth_value + 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(147, 167, 183, 255),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(_messages[index]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: TextField(
                      onSubmitted: (value) {
                        final text = _chatController.text.trim();
                        if (text.isNotEmpty) {
                          setState(() {
                            _messages.add(text);
                            _chatController.clear();
                          });
                        }
                      },
                      controller: _chatController,
                      decoration: InputDecoration(
                        hintText: 'Digite sua mensagem...',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.attach_file,
                                  color: Color.fromARGB(255, 55, 134, 225)),
                              onPressed: () {
                                /// criar func de envio de arquivos para a IA
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.send,
                                  color: Color.fromARGB(255, 55, 134, 225)),
                              onPressed: () {
                                final text = _chatController.text.trim();
                                if (text.isNotEmpty) {
                                  setState(() {
                                    _messages.add(text);
                                    _chatController.clear();
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
