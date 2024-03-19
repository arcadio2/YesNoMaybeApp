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
            //https://www.facebook.com/photo.php?fbid=1586175898203045&set=pb.100004319493938.-2207520000&type=3
            backgroundImage: NetworkImage(
                "https://scontent.fmex16-1.fna.fbcdn.net/v/t1.6435-9/91467905_1586175904869711_3379409297900306432_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeENkBNAKa5QCUzmqV6tLkk6D1zsD-JNcw8PXOwP4k1zDzfQ_tM8Sb1GI5P2neGjIYD8E9fGwwe4HTmrbFKnemDb&_nc_ohc=IExyNacTmsUAX9zT_ge&_nc_ht=scontent.fmex16-1.fna&oh=00_AfA5RQfNTZQYauivXclNNC377jyD6fVu0jAKn1u4jlL5FQ&oe=661DEBD0"),
          ),
        ),
        title: const Text("Mi novia hermosa"),
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
                          ? HerMessageBubble(herMessage: message)
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
