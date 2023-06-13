import 'package:flutter/material.dart';
import 'package:flutter_cookbook/Animation/animiate_page_route_transition.dart';
import 'package:flutter_cookbook/design/tabs_example.dart';
import 'package:flutter_cookbook/effects/download_button.dart';
import 'package:flutter_cookbook/flutter_tip_and_trick_ui/presenting_future/preseting_future.dart';
import 'package:flutter_cookbook/flutter_tip_and_trick_ui/presenting_stream_in_futter/presenting_stream.dart';
import 'package:flutter_cookbook/flutter_tip_and_trick_ui/text_stroke_flutter/text_stroke.dart';
import 'package:flutter_cookbook/stateManagement/chapter_1/contact_book.dart';
import 'package:flutter_cookbook/stateManagement/inheritwidget_example.dart/myInherit_widget.dart';
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
            TitleFontText(title: 'SateMangement... chapter 2'),
            SubScription(
              title: 'InheritWidget',
              newPage: showInheritedWidget(),
            ),
            TitleFontText(title: 'Flutter tip and Trick Ui'),
            SubScription(
              title: 'Move to see Strocke text',
              newPage: TextStroke(),
            ),
            SubScription(
              title: 'Move to see presenting stream',
              newPage: PresentingUi(),
            ),
            SubScription(
              title: 'Move to see streamBuilder example',
              newPage: PresentingUiVersion2(),
            ),
            SubScription(
              title: 'Future presenting',
              newPage: PresentingFuture(),
            ),
          ],
        ),
      ),
    );
  }
}
