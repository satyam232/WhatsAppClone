import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srchat1/common/extension/custom_theme_extension.dart';

import 'package:srchat1/feature/auth/auth_controller.dart';

import 'package:srchat1/feature/home/call_home_page.dart';
import 'package:srchat1/feature/home/chat_home_page.dart';
import 'package:srchat1/feature/home/status_home_page.dart';
import 'package:srchat1/main.dart';

import '../../common/widgets/custom_icon_button.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool isSearching = true;
  late Timer timer;

  updateUserPresence() {
    ref.read(authControllerProvider).updateUserPresence();
  }

  @override
  void initState() {
    updateUserPresence();
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) => setState(() {}),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: isSearching
              ? Text(
                  'SRChats',
                  style: TextStyle(letterSpacing: 1),
                )
              : TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2),
                    hintText: "search",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 12),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
          elevation: 1,
          actions: [
            CustomIconButton(
                onPressed: () {
                  setState(() {
                    this.isSearching = !this.isSearching;
                  });
                },
                icon: Icons.search),
            pop()
          ],
          bottom: const TabBar(
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChatHomePage(),
            StatusHomePage(),
            CallHomePage(),
          ],
        ),
      ),
    );
  }

  PopupMenuButton pop() {
    SampleItem? selectedMenu;
    return PopupMenuButton<SampleItem>(
      icon: Icon(
        Icons.more_vert_sharp,
        color: Colors.white70,
      ),
      color: Theme.of(context).backgroundColor,
      initialValue: selectedMenu,
      // Callback that sets the selected popup menu item.
      onSelected: (SampleItem item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (
        BuildContext context,
      ) =>
          <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('New Group'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('New broadcast'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Text('Linked devices'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Text('Starred messages'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Text('Settings'),
        ),
      ],
    );
  }
}
