import 'package:flutter/material.dart';

class ShoppingScreen extends StatefulWidget {
  ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  var _controller = TextEditingController();

  List<String> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[00],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple[700],
        leading: Icon(
          Icons.check_circle_outline_rounded,
          size: 34,
        ),
        title: Text('Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        label: Text('Input here'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          data.add(_controller.text);
                        });
                      },
                      child: Text(
                        'ADD',
                        style: TextStyle(color: Colors.deepPurpleAccent[700]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            data.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
