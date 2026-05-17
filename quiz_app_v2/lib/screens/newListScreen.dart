import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewListScreen extends ConsumerStatefulWidget {
  const NewListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NewListScreenState();
  }
}

class _NewListScreenState extends ConsumerState<NewListScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('CREAR UN QUIZ'),
    );
  }
}
