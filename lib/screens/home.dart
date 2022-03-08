import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetcards/components/card.dart';
import 'package:sweetcards/models/card.dart';
import 'package:sweetcards/screens/add.dart';
import 'package:sweetcards/utils/date.dart';
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
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    "images/folders.png",
                    height: 60,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Archive",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
          secondaryBackground: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Delete",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "images/trash.png",
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
