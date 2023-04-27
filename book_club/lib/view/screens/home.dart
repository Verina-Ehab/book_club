import 'package:book_club/service/auth.dart';
import 'package:book_club/view/widgets/wide_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME!'),
      ),
      body: Container(child:
        WideButton(name: "Sign out",
        tap: () {
          Auth _currentUser = Provider.of<Auth>(context, listen: false);
        },
        )
      ),
    );
  }
}