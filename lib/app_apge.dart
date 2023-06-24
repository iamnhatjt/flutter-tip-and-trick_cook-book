import 'package:flutter/material.dart';
import 'package:flutter_cookbook/Animation/animiate_page_route_transition.dart';
import 'package:flutter_cookbook/design/tabs_example.dart';
import 'package:flutter_cookbook/effects/download_button.dart';
import 'package:flutter_cookbook/flutter_apprentice/bottom_navigartorbar.dart';
import 'package:flutter_cookbook/flutter_navigation/deep_link_navigation.dart';
import 'package:flutter_cookbook/flutter_tip_and_trick_ui/presenting_future/preseting_future.dart';
import 'package:flutter_cookbook/flutter_tip_and_trick_ui/presenting_stream_in_futter/presenting_stream.dart';
import 'package:flutter_cookbook/flutter_tip_and_trick_ui/text_stroke_flutter/text_stroke.dart';
import 'package:flutter_cookbook/stateManagement/chapter_1/contact_book.dart';
import 'package:flutter_cookbook/stateManagement/inheriteNotifer_changeNotifier/inheritedNotifer_and_changeNotifer.dart';
import 'package:flutter_cookbook/stateManagement/inherited_model/inherit_model_example.dart';
import 'package:flutter_cookbook/stateManagement/inheritwidget_example/myInherit_widget.dart';
import 'package:flutter_cookbook/stateManagement/provider/provider_example.dart';
import 'package:flutter_cookbook/widgets/common.dart';

import 'Animation/basic_animation.dart';
import 'Animation/chained_animaiton.dart';
import 'flutter_navigation/argument_navigator.dart';
import 'flutter_navigation/simple_hero_naivigator.dart';
import 'flutter_networking/background_pasing/background_pasing.dart';
import 'flutter_networking/fetch_data_from_internet/fetch_data_from_internet.dart';
import 'flutter_tip_and_trick_ui/stream_controller_and_stream_builder/stream_controller_and_stream_builder.dart';
import 'main.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                MyApp.of(context)!.changeTheme();
              },
              icon: Icon(
                Icons.light_mode,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TitleFontText(title: 'Animation'),
            SubScription(
              title: 'Add a drawer to a screen',
              newPage: AnimatePageRote(),
            ),
            SubScription(
              title: 'Basic Animation',
              newPage: BasicAnimationExample(),
            ),
            SubScription(
              title: 'Chained Animation',
              newPage: ChainAnimationExample(),
            ),
            TitleFontText(title: 'Design'),
            SubScription(
              title: 'Working with tab',
              newPage: TabExample(),
            ),
            TitleFontText(title: 'Effect'),
            SubScription(title: 'Download Button', newPage: DownloadExample()),
            TitleFontText(title: 'SateMangement... chapter 1'),

            // state management ...
            SubScription(
                title: 'Move to see contactBook stateManagement',
                newPage: ChappterOneStateManagement()),
            TitleFontText(title: 'SateMangement... chapter 2'),
            SubScription(
              title: 'InheritWidget',
              newPage: showInheritedWidget(),
            ),
            SubScription(
              title: 'InheritedModel',
              newPage: InhertedModelExample(),
            ),
            SubScription(
              title: 'inheritedNotifier and changeNotifier',
              newPage: InheritedNotidierAndChangerNotifier(),
            ),
            SubScription(
              title: 'provider example package',
              newPage: CounterWidget(),
            ),

            // flutter tip and trick ui
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
            SubScription(
              title: 'StreamController and StreamBuild',
              newPage: StreamControllerAndStreamBuilder(),
            ),

            // book club
            TitleFontText(title: 'Flutter Apprentice Book'),
            SubScription(
              title: 'Bottom navigation bar',
              newPage: BottomNavigatorExample(),
            ),
            TitleFontText(title: 'Flutter Navigator'),
            SubScription(
              title: 'Hero Navigator',
              newPage: SimpleHeroExample(),
            ),
            SubScription(
              title: 'DeepLink Example',
              newPage: DeepLinkNavigationExample(),
            ),
            SubScription(
              title: 'Argument Navigation Example',
              newPage: ArgumenNavitionExample(),
            ),
            TitleFontText(title: 'NetWorking'),
            SubScription(
                title: 'Fetch data from internet',
                newPage: FetchDataFromInternetWidget()),
            SubScription(title: 'Background parsing', newPage: IsolateSimple()),
            SizedBox(
              height: 45,
            )
          ],
        ),
      ),
    );
  }
}
