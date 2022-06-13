import 'package:flutter/material.dart';
class ChapterCard extends StatelessWidget {
  const ChapterCard(
      {Key? key, required this.chapterText, this.serialNo = '', required this.onTap})
      : super(key: key);

  final String serialNo;
  final String chapterText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: Text(
            serialNo,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          title: Text(
            chapterText.toUpperCase(),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
        ),
      ),
    );
  }
}
