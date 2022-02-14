import 'package:flutter/material.dart';

import '../utils/utils.dart';

class NotificationWindow extends StatelessWidget {
  // final List following;
  // final String username;
  // final String photoUrl;
  final snap;

  const NotificationWindow({
    Key? key,
    required this.snap,
    // required this.following,
    // required this.username,
    // required this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(snap.data['following'].isEmpty);

    try {
      if (snap.data['following'].isNotEmpty) {
        // print(following.asMap());
        // print(username);
        snap['following'].asMap().forEach(
              (key, value) => print("$key , $value"),
            );
        return Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    verticalDirection: VerticalDirection.down,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          top: 2,
                          right: 8,
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(snap['photoUrl']),
                          radius: 26.0,
                        ),
                      ),
                      Row(children: [
                        Text(
                          snap['username'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const Text(
                          " just started follwing you",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ]),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          " Following ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        width: 100,
                        height: 27,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        print(snap['following']);
        return Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            CircleAvatar(
              child: Icon(Icons.circle_outlined),
            ),
            Text("No New Notification"),
          ]),
        );
      }
      return SizedBox(
        height: 0,
      );
    } catch (e) {
      print(e.toString());
      return showSnackBar(e.toString(), context);
      // return Container();
      // print(e.toString());
    }
  }
}
