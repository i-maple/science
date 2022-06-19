import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:science/models/topics_model.dart';
import 'package:science/providers/subject_provider.dart';
import 'package:science/screens/components/chapter_card.dart';
import 'package:science/screens/read_screen.dart';
import 'package:science/utils/constants.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({Key? key}) : super(key: key);

  @override
  _TopicsPageState createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  List<Widget> loadTopics() {
    var initializeProvider =
        Provider.of<SubjectProvider>(context, listen: false);
    List chaptersList =
        TopicsModel().topics[initializeProvider.getCurrentSubject]
            [initializeProvider.getCurrentTopic];
    List<Widget> widgetsList = [];
    int index = 1;
    for (var chapters in chaptersList) {
      widgetsList.add(ChapterCard(
        chapterText: chapters,
        serialNo: index.toString(),
        onTap: () {
          Provider.of<SubjectProvider>(context, listen: false)
              .setHeading(chapters);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReadScreen(),
            ),
          );
        },
      ));
      index++;
    }
    return widgetsList;
  }

  @override
  Widget build(BuildContext context) {
    var initializeProvider =
        Provider.of<SubjectProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Science - Class Ten'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    initializeProvider.getCurrentTopic.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView(
                      children: loadTopics(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
