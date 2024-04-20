import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Text convertUserStatusToCustomText(BuildContext context, String? statusString) {
  switch (statusString) {
    case 'absent':
      return Text(
        'nieobecny',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.red),
      );
    case 'entrance':
      return Text(
        'w pracy',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.green),
      );
    case 'working':
      return Text(
        'pracuje',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.blue),
      );
    case 'startBreak':
      return Text(
        'na przerwie',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.orange),
      );
    case 'endedBreak':
      return Text(
        'po przerwie (w pracy)',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.green),
      );
    default:
      return const Text('');
  }
}

Icon convertUserStatusToCustomIcon(BuildContext context, String? statusString) {
  switch (statusString) {
    case 'absent':
      return const Icon(
        FontAwesomeIcons.personCircleXmark,
        size: 64,
        color: Colors.red,
      );
    case 'entrance':
      return const Icon(
        FontAwesomeIcons.personCircleCheck,
        size: 64,
        color: Colors.green,
      );
    case 'working':
      return const Icon(
        FontAwesomeIcons.personDigging,
        size: 64,
        color: Colors.blue,
      );
    case 'startBreak':
      return const Icon(
        FontAwesomeIcons.userClock,
        size: 64,
        color: Colors.orange,
      );
    case 'endedBreak':
      return const Icon(
        FontAwesomeIcons.personCircleCheck,
        size: 64,
        color: Colors.green,
      );
    default:
      return const Icon(null);
  }
}
