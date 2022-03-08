import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetcards/components/card.dart';
import 'package:sweetcards/components/dismiss_bg.dart';
import 'package:sweetcards/models/card.dart';
import 'package:sweetcards/screens/add.dart';
import 'package:sweetcards/screens/archived.dart';
import 'package:sweetcards/utils/slide.dart';
import 'package:sweetcards/utils/theme.dart';

class SweetHome extends StatefulWidget {
  const SweetHome({Key? key}) : super(key: key);

  @override
  State<SweetHome> createState() => _SweetHomeState();
}

class _SweetHomeState extends State<SweetHome> {
  @override
  Widget build(BuildContext context) {
    List<SweetCard> cards = Provider.of<List<SweetCard>>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sweet Cards"),
      ),
      body: cards.isEmpty ? _buildEmptyState() : _buildCards(cards),
      drawer: sweetDrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          slidingRoute(
            const AddMemory(),
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Drawer sweetDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: <Widget>[
                DrawerHeader(
                  child: const Text(
                    "Sweet Cards",
                    style: TextStyle(fontSize: 24),
                  ),
                  decoration: BoxDecoration(
                    color: SweetTheme.primaryColor,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: Text(
                    "Add Card",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, slidingRoute(const AddMemory()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.archive),
                  title: Text(
                    "Archived",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, slidingRoute(const ArchivedCards()));
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text(
              "Logout",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, slidingRoute(const Scaffold()));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                "Sweet Cards v1.0.0",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "images/memory.png",
            width: 300,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Add Memories To Get Started",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  Widget _buildCards(List<SweetCard> cards) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        SweetCard card = cards[index];
        return Dismissible(
          key: Key(card.id),
          child: SweetCardView(card: card),
          onDismissed: (dir) {
            if (dir == DismissDirection.endToStart) {
              card.delete();
            }

            if (dir == DismissDirection.startToEnd) {
              card.archive();
            }
          },
          background: const DismissBackgroundWidget(
            image: "images/folders.png",
            text: "Archive",
          ),
          secondaryBackground: const DismissBackgroundWidget(
            image: "images/trash.png",
            text: "Delete",
            alignment: MainAxisAlignment.end,
          ),
          confirmDismiss: (dir) async {
            final action =
                dir == DismissDirection.startToEnd ? "Archive" : "Delete";
            return await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("$action Card"),
                  content: Text(
                    "Are you sure you want to ${action.toLowerCase()} this card?",
                  ),
                  actions: [
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context, false),
                    ),
                    TextButton(
                      child: Text(action),
                      onPressed: () => Navigator.pop(context, true),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
