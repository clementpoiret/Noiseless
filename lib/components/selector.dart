import 'package:flutter/material.dart';

enum SourceType { ai, explore, recent }

class SourceChoice extends StatefulWidget {
  const SourceChoice({super.key});

  @override
  State<SourceChoice> createState() => _SourceChoiceState();
}

class _SourceChoiceState extends State<SourceChoice> {
  SourceType selectedSourceType = SourceType.ai;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<SourceType>(
      segments: const <ButtonSegment<SourceType>>[
        ButtonSegment<SourceType>(
            value: SourceType.ai,
            label: Text('AI'),
            icon: Icon(Icons.auto_awesome)),
        ButtonSegment<SourceType>(
            value: SourceType.explore,
            label: Text('Explore'),
            icon: Icon(Icons.explore)),
        ButtonSegment<SourceType>(
            value: SourceType.recent,
            label: Text('Recent'),
            icon: Icon(Icons.trending_up)),
      ],
      selected: <SourceType>{selectedSourceType},
      onSelectionChanged: (Set<SourceType> newSelection) {
        setState(() {
          selectedSourceType = newSelection.first;
        });
      },
    );
  }
}
