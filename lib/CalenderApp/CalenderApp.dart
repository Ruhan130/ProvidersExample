import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarApp extends StatefulWidget {
  const CalendarApp({super.key});

  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  DateTime today = DateTime.now();
  DateTime? rangeEnd;

  // Function to handle date selection and range selection
  void onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      // Lock current date from changing
      if (isSameDay(day, today)) return;

      // Always set the rangeStart to today's date
      rangeEnd = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text("Calendar App"),
      ),
      body: Column(
        children: [
          Text(
            "Selected Date Range: ${today.toLocal().toString().split(' ')[0]} to ${rangeEnd != null ? rangeEnd!.toLocal().toString().split(' ')[0] : ""}",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            focusedDay: today,
            selectedDayPredicate: (day) => isSameDay(day, today) || isSameDay(day, rangeEnd) || (rangeEnd != null && day.isAfter(today) && day.isBefore(rangeEnd!)),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: onDaySelected,
            // Disable past dates and make them visually distinct
            enabledDayPredicate: (day) {
              return !day.isBefore(DateTime.now()) || isSameDay(day, today);
            },
            // Custom styling
            calendarBuilders: CalendarBuilders(
              // Styling for today (current date)
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Highlight today's date in blue
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              // Styling for selected range of dates
              selectedBuilder: (context, day, focusedDay) {
                if (isSameDay(day, today)) {
                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.blue, // Highlight start date in blue
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                } else if (isSameDay(day, rangeEnd)) {
                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.blue, // Highlight end date in blue
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                } else if (rangeEnd != null && day.isAfter(today) && day.isBefore(rangeEnd!)) {
                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.green, // Highlight intermediate dates in green
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
                return null;
              },
              // Styling for disabled past dates
              defaultBuilder: (context, day, focusedDay) {
                if (day.isBefore(DateTime.now()) && !isSameDay(day, today)) {
                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension DateComparison on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
