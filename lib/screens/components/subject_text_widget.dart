import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:science/providers/subject_provider.dart';

class SubjectTextContainer extends StatelessWidget {
  const SubjectTextContainer(
      {Key? key,
      this.isSelected = false,
      required this.subjectName,
      this.onTap})
      : super(key: key);

  final bool isSelected;
  final String subjectName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    String currentSubject =
        Provider.of<SubjectProvider>(context).getCurrentSubject;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: currentSubject == subjectName.toLowerCase()
              ? Colors.black
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Center(
          child: Text(
            subjectName,
            style: TextStyle(
              fontSize: 15,
              color: currentSubject == subjectName.toLowerCase()
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
