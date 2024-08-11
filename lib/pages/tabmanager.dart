import 'package:flutter/material.dart';
import 'package:notesai/pages/AiTab/aitab.dart';
import 'package:notesai/pages/AllNotes/allnotestab.dart';
import 'package:notesai/pages/daynotestab.dart';
import 'package:notesai/pages/HomeTab/hometab.dart';

class TabManager extends StatefulWidget {
  const TabManager({super.key});

  @override
  State<TabManager> createState() => _TabManagerState();
}

class _TabManagerState extends State<TabManager> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const HomeTab(),
    const DayNotesTab(),
    const AllNotesTab(),
    AiTab()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _currentIndex,
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notes AI',
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check_box_outline_blank),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.library_books), text: 'Today'),
              Tab(icon: Icon(Icons.book_outlined), text: 'All Notes'),
              Tab(icon: Icon(Icons.accessibility), text: 'Ai'),
            ],
          ),
        ),
        body: TabBarView(children: _tabs),
      ),
    );
  }
}
