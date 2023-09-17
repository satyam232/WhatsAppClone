import 'package:flutter/material.dart';
import 'package:srchat1/common/extension/custom_theme_extension.dart';
import 'package:srchat1/common/widgets/custom_icon_button.dart';
import 'package:srchat1/common/widgets/short_h_bar.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../common/utils/coloors.dart';

class StatusHomePage extends StatefulWidget {
  const StatusHomePage({super.key});

  @override
  State<StatusHomePage> createState() => _StatusHomePageState();
}

class _StatusHomePageState extends State<StatusHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                leading: Icon(
                  Icons.add_outlined,
                  color: context.theme.greyColor,
                ),
                title: Text("My Status"),
                subtitle: Text("tap to add status"),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ShortHBar(),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                CustomIconButton(
                                  iconColor: context.theme.greyColor,
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icons.close,
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                            Divider(
                              color: context.theme.greyColor!.withOpacity(0.3),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                iconWithText(
                                    icon: Icons.photo_outlined,
                                    text: "gallery"),
                                iconWithText(
                                    icon: Icons.camera_outlined, text: "Camera")
                              ],
                            )
                          ],
                        );
                      });
                },
              ),
              Divider(),
              Text(
                "Recent updates",
                style: TextStyle(
                    color: context.theme.greyColor,
                    fontWeight: FontWeight.w500),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/splash.png"),
                ),
                title: Text("Satyam Rana"),
                subtitle: Text("time and Date"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StatusView()));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }

  iconWithText({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: Coloors.greenDark,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(color: Coloors.greenDark),
          ),
        ],
      ),
    );
  }
}

class StatusView extends StatefulWidget {
  const StatusView({super.key});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  final StoryController storycontroller = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: StoryView(
                controller: storycontroller,
                storyItems: [
                  StoryItem.text(title: "satyam", backgroundColor: Colors.pink),
                  StoryItem.text(
                      title: "rana",
                      backgroundColor: Colors.blue,
                      duration: Duration(seconds: 30))
                ],
                onComplete: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
