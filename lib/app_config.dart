import 'package:stream_chat_flutter/stream_chat_flutter.dart';

const kDefaultStreamApiKey = 'm5xbzqy6fzn9';

final defaultUsers = <String, User>{
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoicmFzcHktd2F0ZXItMCJ9.tpWry4LgA9EULHHukQg7iHgc6h98Re7-0sluWwFDhAM':
      User(
    id: 'super-band-9',
    extraData: {
      'name': 'Messi',
      'image':
          'https://cdn.dribbble.com/users/986811/screenshots/4601947/argentina_leo_messi.png',
    },
  ),
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoicHJvdWQtZGFya25lc3MtMyJ9.T3lUp99qAAMj-oV1ya8nKyCh3C03rj79keLb1vWCUkw':
      User(
    id: 'proud-darkness-3',
    extraData: {
      'name': 'Hazard',
      'image':
          'https://cdn.dribbble.com/users/986811/screenshots/4609181/belgium_eden_hazard.png',
    },
  ),
  'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiYWdlZC1yaWNlLTMifQ.NSUo16MvZEz2RnJhAqFRvgWqeH-_6tGJIg09UREcjN4':
      User(
    id: 'aged-rice-3',
    extraData: {
      'name': 'Mahesh Yakamoi',
      'image': 'https://avatars.githubusercontent.com/u/30024656?v=4',
    },
  ),
  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FoaWwifQ.WnIUoB5gR2kcAsFhiDvkiD6zdHXZ-VSU2aQWWkhsvfo':
  //     User(
  //   id: 'sahil',
  //   extraData: {
  //     'name': 'Sahil Kumar',
  //     'image':
  //         'https://avatars.githubusercontent.com/u/25670178?s=400&u=30ded3784d8d2310c5748f263fd5e6433c119aa1&v=4',
  //   },
  // ),
  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYmVuIn0.nAz2sNFGQwY7rl2Og2z3TGHUsdpnN53tOsUglJFvLmg':
  //     User(
  //   id: 'ben',
  //   extraData: {
  //     'name': 'Ben Golden',
  //     'image': 'https://avatars.githubusercontent.com/u/1581974?s=400&v=4',
  //   },
  // ),
  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidGhpZXJyeSJ9.lEq6TrZtHzjoNtf7HHRufUPyGo_pa8vg4_XhEBp4ckY':
  //     User(
  //   id: 'thierry',
  //   extraData: {
  //     'name': 'Thierry Schellenbach',
  //     'image':
  //         'https://avatars.githubusercontent.com/u/265409?s=400&u=2d0e3bb1820db992066196bff7b004f0eee8e28d&v=4',
  //   },
  // ),
  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidG9tbWFzbyJ9.GLSI0ESshERMo2WjUpysD709NEtn1zmGimUN2an7g9o':
  //     User(
  //   id: 'tommaso',
  //   extraData: {
  //     'name': 'Tommaso Barbugli',
  //     'image': 'https://avatars.githubusercontent.com/u/88735?s=400&v=4',
  //   },
  // ),
  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiZGV2ZW4ifQ.z3zI4PqJnNhc-1o-VKcmb6BnnQ0oxFNCRHwEulHqcWc':
  //     User(
  //   id: 'deven',
  //   extraData: {
  //     'name': 'Deven Joshi',
  //     'image':
  //         'https://avatars.githubusercontent.com/u/26357843?s=400&u=0c61d890866e67bf69f58878be58915e9bfd39ee&v=4',
  //   },
  // ),
  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibmVldmFzaCJ9.3EdHegTxibrz3A9cTiKmpEyawwcCVB8FXnoFzr4eKvw':
  //     User(
  //   id: 'neevash',
  //   extraData: {
  //     'name': 'Neevash Ramdial',
  //     'image':
  //         'https://avatars.githubusercontent.com/u/25674767?s=400&u=1d7333baf7dd9d143db8bfcdb31a838b89cfff9c&v=4',
  //   },
  // ),
  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoicWF0ZXN0MSJ9.fnelU7HcP7QoEEsCGteNlF1fppofzNlrnpDQuIgeKCU':
  //     User(
  //   id: 'qatest1',
  //   extraData: {
  //     'name': 'QA test 1',
  //   },
  // ),
  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoicWF0ZXN0MiJ9.vSCqAEbs2WVmMWsOsa7065Fsjq-rsTih6qsHPynl7XM':
  //     User(
  //   id: 'qatest2',
  //   extraData: {
  //     'name': 'QA test 2',
  //   },
  // ),
};
