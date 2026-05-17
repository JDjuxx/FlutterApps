import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Helpscreen extends ConsumerWidget {
  const Helpscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Text(
      'PAGINA DE AYUDA',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black,
            fontSize: 34,
          ),
    ));
  }
}
