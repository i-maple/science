import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:science/models/chapters_model.dart';
import 'package:science/providers/subject_provider.dart';
import 'package:science/screens/about_page.dart';
import 'package:science/screens/topics_page.dart';
import 'package:science/utils/constants.dart';
import 'components/chapter_card.dart';
import 'components/subject_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get getSelectedSubject =>
      Provider.of<SubjectProvider>(context).getCurrentSubject;

  List<Widget> loadChapterList() {
    List chaptersList = Chapters().chapters[getSelectedSubject];
    List<Widget> widgetsList = [];
    int index = 1;
    for (var chapters in chaptersList) {
      widgetsList.add(ChapterCard(
        chapterText: chapters,
        serialNo: index.toString(),
        onTap: () {
          Provider.of<SubjectProvider>(context, listen: false)
              .setTopic(chapters);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const TopicsPage()));
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
              height: 15,
            ),
            Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SubjectTextContainer(
                    isSelected: true,
                    subjectName: 'Physics',
                    onTap: () {
                      initializeProvider.setSubject('physics');
                    },
                  ),
                  SubjectTextContainer(
                    subjectName: 'Chemistry',
                    onTap: () {
                      initializeProvider.setSubject('chemistry');
                    },
                  ),
                  SubjectTextContainer(
                    subjectName: 'Biology',
                    onTap: () {
                      initializeProvider.setSubject('biology');
                    },
                  ),
                  SubjectTextContainer(
                    subjectName: 'Geology And Astronomy',
                    onTap: () {
                      initializeProvider.setSubject('geology and astronomy');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Text(
                    initializeProvider.getCurrentSubject.toUpperCase(),
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView(children: loadChapterList()),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Card(
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/science.jpg'),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Text(
                        'Science Notes',
                        style: kAppbarTitleTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ChapterCard(
              chapterText: 'Home',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ChapterCard(
              chapterText: 'About Us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AboutPage(),
                  ),
                );
              },
            ),
            ChapterCard(
              chapterText: 'Contact Us',
              onTap: () {},
            ),
            ChapterCard(
              chapterText: 'Our Apps',
              onTap: () {},
            ),
            ChapterCard(
              chapterText: 'community',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
