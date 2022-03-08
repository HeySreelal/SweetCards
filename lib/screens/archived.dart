import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetcards/components/card.dart';
import 'package:sweetcards/components/dismiss_bg.dart';
import 'package:sweetcards/models/card.dart';
import 'package:sweetcards/services/db.dart';

class ArchivedCards extends StatefulWidget {
  const ArchivedCards({Key? key}) : super(key: key);

  @override
  State<ArchivedCards> createState() => _ArchivedCardsState();
}

class _ArchivedCardsState extends State<ArchivedCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archived Cards"),
      ),
      body: StreamProvider<List<SweetCard>>.value(
        value: SweetUniverse().cards(isArchived: true),
        initialData: const [],
        builder: (context, _) {
          final cards = Provider.of<List<SweetCard>>(context);

          if (cards.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/invitation.png",
                  width: 200,
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text('No archived cards'),
                ),
              ],
            );
          }

          return ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return Dismissible(
                key: Key(card.id),
                child: SweetCardView(card: card),
                onDismissed: (dir) {
                  if (dir == DismissDirection.endToStart) {
                    card.delete();
                  }

                  if (dir == DismissDirection.startToEnd) {
                    card.unarchive();
                  }
                },
                background: const DismissBackgroundWidget(
                  image: "images/unarchive.png",
                  text: "Unarchive",
                ),
                secondaryBackground: const DismissBackgroundWidget(
                  image: "images/trash.png",
                  text: "Delete",
                  alignment: MainAxisAlignment.end,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
