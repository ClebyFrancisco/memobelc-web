import 'package:flutter/material.dart';

class CardTask extends StatefulWidget {
  final String title;
  const CardTask({super.key, required this.title});

  @override
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton(
                    child: const Icon(Icons.edit),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 5),
                  TextButton(
                    child: const Icon(Icons.delete),
                    onPressed: () {/* ... */},
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
