import 'package:flutter/material.dart';
import 'package:instagram_flutter/model/user.dart';

import '../utils/utils.dart';

class NotificationWindowData extends StatelessWidget {
  final List following;
  final String username;
  final String photoUrl;
  final String bio;
  final List followers;
  const NotificationWindowData(
      {Key? key,
      required this.following,
      required this.username,
      required this.photoUrl,
      required this.bio,
      required this.followers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      if (following.any((element) => followers.contains(element))) {
        return SizedBox(
          height: 0,
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            child: Column(
              children: [
                Row(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(photoUrl),
                        radius: 26.0,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            username,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          child: Text(
                            bio,
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        " Follow ",
                        style: TextStyle(
                          color: Colors.white,
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
        );
      }
    } catch (e) {
      return showSnackBar(e.toString(), context);
    }
  }
}
