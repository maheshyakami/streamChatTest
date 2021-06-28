import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/src/channel_info.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatChannelHeader extends StatelessWidget {
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? title;
  final Widget? subTitle;
  final VoidCallback? onSubTitleTap;

  final Size preferredSize;

  ChatChannelHeader(
      {Key? key,
      this.showBackButton = true,
      this.onBackPressed,
      this.title,
      this.subTitle,
      this.onSubTitleTap})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final channel = StreamChannel.of(context).channel;
    final chatThemeData = StreamChatTheme.of(context);

    final leadingWidget = showBackButton
        ? StreamBackButton(
            onPressed: onBackPressed,
            showUnreads: true,
          )
        : SizedBox.shrink();
    return PreferredSize(
        child: AppBar(
          textTheme: Theme.of(context).textTheme,
          brightness: Theme.of(context).brightness,
          elevation: 1,
          leading: leadingWidget,
          backgroundColor: chatThemeData.channelTheme.channelHeaderTheme.color,
          centerTitle: true,
          title: SizedBox(
            height: preferredSize.height,
            width: preferredSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title ??
                    ChannelName(
                      textStyle:
                          chatThemeData.channelTheme.channelHeaderTheme.title,
                    ),
                const SizedBox(height: 2),
                InkWell(
                  onTap: onSubTitleTap,
                  child: subTitle ??
                      ChannelInfo(
                        channel: channel,
                        textStyle: chatThemeData
                            .channelTheme.channelHeaderTheme.subtitle,
                      ),
                ),
              ],
            ),
          ),
        ),
        preferredSize: preferredSize);
  }
}
