import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es'),
      ],
      locale: const Locale('es'),
      title: 'Calendar Localization',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calendar'),
        ),
        body: SfCalendar(
          view: CalendarView.month,
        ),
      ),
    );
  }
}
