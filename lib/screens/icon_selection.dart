import 'package:flutter/material.dart';
import 'package:sweetcards/components/field.dart';
import 'package:sweetcards/models/icon.dart';

class IconSelection extends StatefulWidget {
  const IconSelection({Key? key}) : super(key: key);

  @override
  State<IconSelection> createState() => _IconSelectionState();
}

class _IconSelectionState extends State<IconSelection> {
  String query = "";

  set setQuery(String q) {
    setState(() {
      query = q;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<SweetIcon> icons = query.isEmpty
        ? SweetIcons.list
        : SweetIcons.list
            .where(
                (icon) => icon.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose an Icon"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SweetField(
                shouldCurve: true,
                borderRadius: BorderRadius.circular(30),
                leading: const Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: "Search...",
                onChanged: (str) {
                  setQuery = str;
                },
              ),
            ),
            Expanded(
              child: ListView.custom(
                childrenDelegate: SliverChildBuilderDelegate(
                  ((context, index) {
                    final icon = icons[index];
                    return ListTile(
                      title: Text(icon.name),
                      leading: Icon(icon.icon),
                      onTap: () {
                        Navigator.pop(context, icon);
                      },
                    );
                  }),
                  childCount: icons.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
