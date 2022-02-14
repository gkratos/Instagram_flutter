import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/WIdgets/notification_window.dart';
import 'package:instagram_flutter/model/user.dart';
import 'package:instagram_flutter/screens/notification_screen_data.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/utils.dart';

class FollowNotification extends StatefulWidget {
  const FollowNotification({Key? key}) : super(key: key);

  @override
  _FollowNotificationState createState() => _FollowNotificationState();
}

class _FollowNotificationState extends State<FollowNotification> {
  late List follow = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        automaticallyImplyLeading: true,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 14,
            top: 10,
          ),
          child: Text(
            "Activity",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: primaryColor,
              fontSize: 20.0,
            ),
          ),
        ),
        leadingWidth: 170.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where("uid",
                      isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    flex: 1,
                    child: Container(
                      // height: 200,
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8.0),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            // (snapshot.data!.docs[index]['following'] as List)
                            //     .forEach(
                            //   (element) {
                            //     print(element);
                            //     follow.add(element);
                            //   },
                            // );
                            // print(snapshot.data!.docs[index]['following']);

                            // print(snapshot.data!.docs[index]['following']);
                            // print(!snapshot.hasData);
                            if (snapshot.hasData) {
                              extractFromList(
                                  snapshot.data!.docs[index]['following']);

                              // return ListView.builder(
                              //     shrinkWrap: true,
                              //     itemCount: follow.length,
                              //     itemBuilder: (context, index) {
                              //       return NotificationWindow(
                              //         snap: FirebaseFirestore.instance
                              //             .collection("users")
                              //             .doc(follow[index])
                              //             .snapshots(),
                              //       );
                              //     });
                              // return NotificationWindow(
                              //   snap: FirebaseFirestore.instance
                              //       .collection("users")
                              //       .doc(element)
                              //       .snapshots(),

                              //   // following: snapshot.data!.docs[index]
                              //   //     ['following'],
                              //   // username: snapshot.data!.docs[index]['username'],
                              //   // photoUrl: snapshot.data!.docs[index]['photoUrl'],
                              // );
                            }
                            // return ListView.builder(
                            //     shrinkWrap: true,
                            //     itemCount: follow.length,
                            //     itemBuilder: (context, index) {
                            //       return NotificationWindow(
                            //         snap: FirebaseFirestore.instance
                            //             .collection("users")
                            //             .doc(follow[index])
                            //             .snapshots(),
                            //       );
                            //     });
                            return Container(
                                padding: const EdgeInsets.all(8),
                                child: extractFromList(
                                    snapshot.data!.docs[index]['following']));
                            // return Container();

                            // print(snapshot.data!.docs[index]['following'][index]);
                            // return Container();
                          }),
                    ),
                  );
                }
              }),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Suggestions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where("uid",
                      isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8.0),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          if (!snapshot.hasData) {
                            return NotificationWindowData(
                              following: snapshot.data!.docs[index]
                                  ['following'],
                              username: snapshot.data!.docs[index]['username'],
                              photoUrl: snapshot.data!.docs[index]['photoUrl'],
                              bio: snapshot.data!.docs[index]['bio'],
                              followers: snapshot.data!.docs[index]
                                  ['followers'],
                            );
                          }
                          return NotificationWindowData(
                            following: snapshot.data!.docs[index]['following'],
                            username: snapshot.data!.docs[index]['username'],
                            photoUrl: snapshot.data!.docs[index]['photoUrl'],
                            bio: snapshot.data!.docs[index]['bio'],
                            followers: snapshot.data!.docs[index]['followers'],
                          );
                        }),
                  );
                }
              }),
        ],
      ),
    );
  }
}
