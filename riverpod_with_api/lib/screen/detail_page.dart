import 'package:flutter/material.dart';
import 'package:riverpod_with_api/model/usermodel.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 70,
                backgroundImage: NetworkImage(userModel.avatar),
              ),
            ),
            Text('First Name :- ${userModel.firstName}'),
            Text('Last Name :- ${userModel.lastName}'),
            Text('Email :- ${userModel.email}')
          ],
        ),
      ),
    );
  }
}
