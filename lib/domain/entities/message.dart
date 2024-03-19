enum FromWho { me, hers }

class Message {
  final String text;
  final String? url;
  final FromWho fromWho; 

  //consstructor
  Message({
    required this.text,
    this.url,
    required this.fromWho
  });

}
