import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'enums.dart';

class EnumsToWidgets {
  //
  static Widget reactionValue(ReactionsTypes value) {
    Widget converted;
    switch (value) {
      case ReactionsTypes.Happy:
        converted = const Icon(TablerIcons.mood_happy);
        break;
      case ReactionsTypes.Laugh:
        converted = const Icon(TablerIcons.mood_crazy_happy);
        break;
      case ReactionsTypes.Tongue:
        converted = const Icon(TablerIcons.mood_tongue);
        break;
      case ReactionsTypes.Confuzed:
        converted = const Icon(TablerIcons.mood_confuzed);
        break;
      case ReactionsTypes.Question:
        converted = const Icon(Icons.question_mark);
        break;
      case ReactionsTypes.Love:
        converted = const Icon(Icons.favorite);
        break;
      case ReactionsTypes.Cry:
        converted = const Icon(TablerIcons.mood_cry);
        break;
      case ReactionsTypes.Amazement:
        converted = const Icon(TablerIcons.mood_neutral);
        break;
      case ReactionsTypes.Okay:
        converted = const Icon(Icons.check_circle);
        break;
      case ReactionsTypes.Please:
        converted = const Icon(TablerIcons.pray);
        break;
      case ReactionsTypes.Sad:
        converted = const Icon(Icons.mood_bad);
        break;
      case ReactionsTypes.Smile:
        converted = const Icon(TablerIcons.mood_smile);
        break;
      default:
        converted = const Icon(Icons.favorite);
    }
    return converted;
  }
}
