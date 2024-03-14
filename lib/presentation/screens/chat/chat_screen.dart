import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            //https://image.enjoymovie.net/adqPoRGPMia8uSeAJevgE8074B0=/256x256/smart/core/p/Oewk3x3nNV.jpg
            //https://scontent.fmex10-4.fna.fbcdn.net/v/t39.30808-6/240868432_2052152904938673_7579065487338578634_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH2Aj09WGQR_T5cyBxXKAFqTQ2uLkoT6t9NDa4uShPq38TmsZEh-nowy5SwOz3J7sq2lEvXLMYdzFCatqSkS9wa&_nc_ohc=cOd518GTvjUAX-eqez9&_nc_ht=scontent.fmex10-4.fna&oh=00_AfB9oWCsUo5QHoirFsyISryQwgDYCH1DiD9WGY4FhR6ckw&oe=65322603
            backgroundImage: NetworkImage(
                "https://image.enjoymovie.net/adqPoRGPMia8uSeAJevgE8074B0=/256x256/smart/core/p/Oewk3x3nNV.jpg"),
          ),
        ),
        title: const Text("Novia 1 <3"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messages[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble()
                          : MyMessageBubble(myMessage: message);
                      /* return (index % 2 == 0)
                          ? const HerMessageBubble()
                          : const MyMessageBubble(); */
                    })),
            MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value); 
              },
            ),
            const SizedBox(height: 2)
          ],
        ),
      ),
    );
  }
}
