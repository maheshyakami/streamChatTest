import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelPageArgs {
  final Channel? channel;
  final Message? initialMessage;

  const ChannelPageArgs({
    this.channel,
    this.initialMessage,
  });
}
