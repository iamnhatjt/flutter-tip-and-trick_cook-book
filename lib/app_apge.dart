import 'package:flutter/material.dart';
import 'package:flutter_cookbook/Animation/animiate_page_route_transition.dart';
import 'package:flutter_cookbook/design/tabs_example.dart';
import 'package:flutter_cookbook/effects/download_button.dart';
import 'package:flutter_cookbook/stateManagement/chapter_1/contact_book.dart';
import 'package:flutter_cookbook/stateManagement/chapter_1/simple_todo_list.dart';
import 'package:flutter_cookbook/widgets/common.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cookbook',
          style: TextStyle(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TitleFontText(title: 'Animation'),
            SubScription(
              title: 'Add a drawer to a screen',
              newPage: AnimatePageRote(),
            ),
            TitleFontText(title: 'Design'),
            SubScription(
              title: 'Working with tab',
              newPage: TabExample(),
            ),
            TitleFontText(title: 'Effect'),
            SubScription(title: 'Download Button', newPage: DownloadExample()),
            TitleFontText(title: 'SateMangement... chapter 1'),
            SubScription(
                title: 'Move to see contactBook stateManagement',
                newPage: ChappterOneStateManagement()),
            TitleFontText(title: 'SateMangement... chapter 1'),
            SubScription(
                title: 'Move to see todoList stateManagement',
                newPage: ChapterTwoTodoList()),
          ],
        ),
      ),
    );
  }
}
