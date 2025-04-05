import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final List<String> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedList(
              key: _listKey,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: ListTile(
                    title: Text(_list[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _removeItem(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _insertItem,
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () => _removeItem(),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _insertItem() {
    setState(() {
      _list.insert(0, 'New Item ${_list.length}');
      _listKey.currentState?.insertItem(0);
    });
  }

  void _removeItem([int index = 0]) {
    setState(
      () {
        String removedItem = _list[index];
        _list.removeAt(index);
        _listKey.currentState?.removeItem(
          index,
          duration: const Duration(milliseconds: 500),
          (BuildContext context, Animation<double> animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: ListTile(
                title: Text(
                  removedItem,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
