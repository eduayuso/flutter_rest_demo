
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/data/model/User.dart';
import 'package:flutter_rest_demo/ui/models/HomeModel.dart';
import 'package:flutter_rest_demo/config/constants.dart' as Constants;

class UserListView extends StatelessWidget {

  final HomeModel model;

  UserListView({this.model});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(

      itemBuilder: (context, position) {

        final User user = this.model.users[position];

        return
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Constants.PAGE_PROFILE, arguments: user.id),
            child:
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      AvatarSection(user.avatar),
                      InfoSection(user),
                      OtherSection(user),
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey,
                  )
                ],
              ),
        );
      },
      itemCount: this.model.users.length,
    );
  }

  Widget AvatarSection(String url) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        CachedNetworkImage(
            imageUrl: url,
            height: 56,
            width: 64,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error)
        ),
      );
  }

  Widget InfoSection(User user) {
    return
      Expanded(
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.fromLTRB(6.0, 12.0, 12.0, 6.0),
                child: Text(
                  user.firstName + " " + user.lastName,
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.fromLTRB(6.0, 6.0, 12.0, 12.0),
                child: Text(
                  user.email,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
      );
  }

  Widget OtherSection(User user) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "5m",
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.star_border,
                size: 35.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
  }
}