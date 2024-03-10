import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final themeValue = ValueNotifier(ThemeData.light());
final count = ValueNotifier(0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeValue,
      builder: (context, theme, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              count.value++;
              if (count.value % 2 == 0) {
                themeValue.value = themeValue.value == ThemeData.light()
                    ? ThemeData.dark()
                    : ThemeData.light();
              }
            },
            child: const Icon(Icons.dark_mode),
          ),
          body: SafeArea(
            child: Column(
              children: [
                const Expanded(child: StatelessDemo()),
                Expanded(
                    child: ValueListenableBuilder(
                        valueListenable: count,
                        builder: (context, value, child) {
                          return StatefulDemo(count: value);
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatelessDemo extends StatelessWidget {
  const StatelessDemo({super.key});

  @override
  Widget build(BuildContext context) {
    print('StatelessDemo build');
    return const Center(child: Text('Some text'));
  }
}

class StatefulDemo extends StatefulWidget {
  final int count;
  const StatefulDemo({super.key, required this.count});

  @override
  State<StatefulDemo> createState() => _StatefulDemoState();
}

class _StatefulDemoState extends State<StatefulDemo> {
  @override
  void initState() {
    print('StatefulDemo initState');
    super.initState();
  }

  @override
  void dispose() {
    print('StatefulDemo dispose');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print('StatefulDemo didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefulDemo oldWidget) {
    print('StatefulDemo didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('StatefulDemo build');
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Stateful text ${widget.count}'),
          TextButton(
            onPressed: () => setState(() {}),
            child: const Text('setState'),
          ),
        ],
      ),
    );
  }
}
