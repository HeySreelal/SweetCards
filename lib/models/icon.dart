import 'package:flutter/material.dart';

class SweetIcon {
  String name;
  IconData icon;

  SweetIcon(this.name, this.icon);

  factory SweetIcon.fromCloud(String name) {
    if (name == "default") return SweetIcons.defaultIcon;

    return SweetIcons.list.singleWhere(
      (element) => element.name == name,
      orElse: () => SweetIcons.defaultIcon,
    );
  }

  String toCloud() {
    return name;
  }
}

class SweetIcons {
  static SweetIcon get defaultIcon => favourite;

  static final favourite = SweetIcon('Favourite', Icons.favorite);
  static final birthday = SweetIcon('Birthday', Icons.cake);
  static final diamond = SweetIcon("Diamond", Icons.diamond);
  static final gift = SweetIcon("Gift", Icons.card_giftcard);
  static final emoji = SweetIcon("Emoji", Icons.emoji_emotions);
  static final home = SweetIcon("Home", Icons.home);
  static final lock = SweetIcon("Lock", Icons.lock);
  static final shoppingCart = SweetIcon("Shopping Cart", Icons.shopping_cart);
  static final smile = SweetIcon("Smile", Icons.sentiment_satisfied);
  static final star = SweetIcon("Star", Icons.star);
  static final tick = SweetIcon("Tick", Icons.check);
  static final tickBox = SweetIcon("Tick Box", Icons.check_box);
  static final questionAnswer = SweetIcon(
    "Question Answer",
    Icons.question_answer,
  );
  static final savings = SweetIcon("Savings", Icons.savings);
  static final pets = SweetIcon("Pets", Icons.pets);
  static final work = SweetIcon("Work", Icons.work);
  static final code = SweetIcon("Code", Icons.code);
  static final medication = SweetIcon("Medication", Icons.medical_services);

  static List<SweetIcon> get list => [
        favourite,
        birthday,
        diamond,
        gift,
        emoji,
        home,
        lock,
        shoppingCart,
        smile,
        star,
        tick,
        tickBox,
        questionAnswer,
        savings,
        pets,
        work,
        code,
        medication
      ];
}
