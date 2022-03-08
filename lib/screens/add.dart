import 'package:flutter/material.dart';
import 'package:sweetcards/components/field.dart';

class AddMemory extends StatefulWidget {
  const AddMemory({Key? key}) : super(key: key);

  @override
  State<AddMemory> createState() => _AddMemoryState();
}

class _AddMemoryState extends State<AddMemory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Memory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SweetLabel("Memory Title"),
            SweetField(
              hintText: 'Title',
              leading: Icon(Icons.title),
            ),
            SizedBox(
              height: 20,
            ),
            SweetLabel("Memory Description"),
            SweetField(
              hintText: 'Description',
              leading: Icon(Icons.description),
            ),
            SizedBox(
              height: 20,
            ),
            SweetLabel("Memory Date"),
            SweetField(
              hintText: 'Date',
              leading: Icon(Icons.date_range),
              trailing: Icon(Icons.chevron_right),
            ),
            SizedBox(
              height: 20,
            ),
            SweetLabel("Choose an Icon for your Memory"),
            SweetField(
              hintText: 'Icon',
              leading: Icon(Icons.image),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        onPressed: () {},
        label: const Text("Save"),
        icon: const Icon(
          Icons.done,
        ),
      ),
    );
  }
}
