import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetcards/models/card.dart';
import 'package:sweetcards/screens/add.dart';
import 'package:sweetcards/utils/slide.dart';

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
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget _buildCards(List<SweetCard> cards) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        SweetCard card = cards[index];
        return Card(
          child: ListTile(
            title: Text(card.title),
            subtitle: Text(card.description ?? ""),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Provider.of<List<SweetCard>>(context).removeAt(index);
              },
            ),
          ),
        );
      },
    );
  }
}
