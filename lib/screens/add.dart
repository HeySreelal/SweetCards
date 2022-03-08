import 'package:flutter/material.dart';
import 'package:sweetcards/components/field.dart';
import 'package:sweetcards/models/card.dart';
import 'package:sweetcards/models/icon.dart';
import 'package:sweetcards/screens/icon_selection.dart';
import 'package:sweetcards/services/db.dart';
import 'package:sweetcards/utils/date.dart';
import 'package:sweetcards/utils/toast.dart';

class AddMemory extends StatefulWidget {
  const AddMemory({Key? key}) : super(key: key);

  @override
  State<AddMemory> createState() => _AddMemoryState();
}

class _AddMemoryState extends State<AddMemory> {
  DateTime date = DateTime.now();
  SweetIcon icon = SweetIcons.defaultIcon;

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController memoryDate = TextEditingController();
  TextEditingController memoryIcon = TextEditingController();

  FocusNode titleFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();
  FocusNode memoryDateFocus = FocusNode();
  FocusNode memoryIconFocus = FocusNode();

  bool isWorking = false;

  void _selectDate(BuildContext context) async {
    final _d = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (_d != null) {
      setState(() {
        date = _d;
        memoryDate.text = SweetDays.formatedDate(date);
      });
    }
  }

  void _selectAndSetIcon() async {
    SweetIcon? _icon = await Navigator.push<SweetIcon>(
      context,
      MaterialPageRoute(
        builder: (context) => const IconSelection(),
      ),
    );
    if (_icon != null) {
      setState(() {
        memoryIcon.text = _icon.name;
        icon = _icon;
      });
    }
  }

  void _setWorking() {
    isWorking = !isWorking;
    setState(() {});
  }

  void _save() async {
    if (title.text.trim().isEmpty) {
      showMsg("Title is required");
      titleFocus.requestFocus();
      return;
    }
    if (description.text.trim().isEmpty) {
      showMsg("Description is required");
      descriptionFocus.requestFocus();
      return;
    }
    if (memoryDate.text.trim().isEmpty) {
      showMsg("Date is required");
      memoryDateFocus.requestFocus();
      return;
    }
    _setWorking();

    final _card = SweetCard(
      title: title.text,
      description: description.text,
      date: date,
      icon: icon,
      id: '',
      user: '',
    );

    await SweetUniverse().newCard(_card);
    _clear();
    _setWorking();
    Navigator.pop(context);
  }

  void _clear() {
    title.clear();
    description.clear();
    memoryDate.clear();
    memoryIcon.clear();
    date = DateTime.now();
    icon = SweetIcons.defaultIcon;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Memory'),
        bottom: isWorking
            ? const PreferredSize(
                preferredSize: Size.fromHeight(8),
                child: LinearProgressIndicator(),
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SweetLabel("Memory Title"),
            SweetField(
              capitalization: TextCapitalization.words,
              hintText: 'Title',
              leading: const Icon(Icons.title),
              controller: title,
              focusNode: titleFocus,
            ),
            const SizedBox(
              height: 20,
            ),
            const SweetLabel("Memory Description"),
            SweetField(
              hintText: 'Description',
              leading: const Icon(Icons.description),
              controller: description,
              focusNode: descriptionFocus,
            ),
            const SizedBox(
              height: 20,
            ),
            const SweetLabel("Memory Date"),
            SweetField(
              value: memoryDate.text,
              readOnly: true,
              hintText: 'Date',
              leading: const Icon(Icons.date_range),
              trailing: const Icon(Icons.chevron_right),
              controller: memoryDate,
              focusNode: memoryDateFocus,
              onTap: () => _selectDate(context),
            ),
            const SizedBox(
              height: 20,
            ),
            const SweetLabel("Choose an Icon for your Memory"),
            SweetField(
              hintText: 'Icon',
              leading: Icon(icon.icon),
              trailing: const Icon(Icons.chevron_right),
              controller: memoryIcon,
              focusNode: memoryIconFocus,
              readOnly: true,
              value: memoryIcon.text,
              onTap: _selectAndSetIcon,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        onPressed: () => _save(),
        label: const Text("Save"),
        icon: const Icon(
          Icons.done,
        ),
      ),
    );
  }
}
