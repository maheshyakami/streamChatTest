import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stream/routes/routes.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../app_config.dart';

const kStreamApiKey = 'STREAM_API_KEY';
const kStreamUserId = 'STREAM_USER_ID';
const kStreamToken = 'STREAM_TOKEN';

class ChooseUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = defaultUsers;

    return Scaffold(
      backgroundColor: StreamChatTheme.of(context).colorTheme.whiteSnow,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(),
            ),
            Text(
              'Please select a user ',
              style: StreamChatTheme.of(context).textTheme.body,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ListView.separated(
                  separatorBuilder: (context, i) {
                    return Container(
                      height: 1,
                      color: StreamChatTheme.of(context).colorTheme.greyWhisper,
                    );
                  },
                  itemCount: users.length + 1,
                  itemBuilder: (context, i) {
                    return [
                      ...users.entries.map((entry) {
                        final token = entry.key;
                        final user = entry.value;
                        return ListTile(
                          visualDensity: VisualDensity.compact,
                          onTap: () async {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              barrierColor: StreamChatTheme.of(context)
                                  .colorTheme
                                  .overlay,
                              builder: (context) => Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: StreamChatTheme.of(context)
                                        .colorTheme
                                        .white,
                                  ),
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            );

                            final client = StreamChat.of(context).client;
                            client.apiKey = kDefaultStreamApiKey;
                            await client.connectUser(
                              user,
                              token,
                            );

                            if (!kIsWeb) {
                              final secureStorage = FlutterSecureStorage();
                              secureStorage.write(
                                key: kStreamApiKey,
                                value: kDefaultStreamApiKey,
                              );
                              secureStorage.write(
                                key: kStreamUserId,
                                value: user.id,
                              );
                              secureStorage.write(
                                key: kStreamToken,
                                value: token,
                              );
                            }
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.HOME,
                              ModalRoute.withName(Routes.HOME),
                            );
                          },
                          leading: UserAvatar(
                            user: user,
                            constraints: BoxConstraints.tight(
                              Size.fromRadius(20),
                            ),
                          ),
                          title: Text(
                            user.name,
                            style:
                                StreamChatTheme.of(context).textTheme.bodyBold,
                          ),
                          // subtitle: Text(
                          //   'Stream test account',
                          //   style: StreamChatTheme.of(context)
                          //       .textTheme
                          //       .footnote
                          //       .copyWith(
                          //         color: StreamChatTheme.of(context)
                          //             .colorTheme
                          //             .grey,
                          //       ),
                          // ),
                          // trailing: StreamSvgIcon.arrowRight(
                          //   color: StreamChatTheme.of(context)
                          //       .colorTheme
                          //       .accentBlue,
                          // ),
                        );
                      }),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.LOGIN_PAGE);
                        },
                        leading: CircleAvatar(
                          child: StreamSvgIcon.settings(
                            color: StreamChatTheme.of(context).colorTheme.black,
                          ),
                          backgroundColor: StreamChatTheme.of(context)
                              .colorTheme
                              .greyWhisper,
                        ),
                        title: Text(
                          'Login to another account',
                          style: StreamChatTheme.of(context).textTheme.bodyBold,
                        ),
                        subtitle: Text(
                          'Requires API Key, ID, and Token',
                          style: StreamChatTheme.of(context)
                              .textTheme
                              .footnote
                              .copyWith(
                                color:
                                    StreamChatTheme.of(context).colorTheme.grey,
                              ),
                        ),
                        // trailing: SvgPicture.asset(
                        //   'assets/icon_arrow_right.svg',
                        //   height: 24,
                        //   width: 24,
                        //   clipBehavior: Clip.none,
                        // ),
                      ),
                    ][i];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
