import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:science/models/contents_model.dart';
import 'package:science/providers/subject_provider.dart';
import 'package:science/utils/constants.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  List<Widget> contentList = [];
  loadContent() {
    var initializeProvider =
        Provider.of<SubjectProvider>(context, listen: false);
    var content = ContentModel().contents[initializeProvider.getCurrentSubject]
        [initializeProvider.getCurrentHeading.toLowerCase()];
    for (var contentItems in content) {
      String text = contentItems['text'];
      String? imageUrl = contentItems['image'];
      var textWidget = text.isNotEmpty? Text(text): const SizedBox();
      var image =
          imageUrl!.isNotEmpty ? Image.asset(imageUrl) : const SizedBox();
      contentList.add(textWidget);
      contentList.add(image);
    }
  }

  @override
  void initState() {
    super.initState();
    loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Science'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              Provider.of<SubjectProvider>(context)
                  .getCurrentHeading
                  .toUpperCase(),
              style: kTitleTextStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...contentList
        ],
      ),
    );
  }
}
