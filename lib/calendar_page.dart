// lib/calendar_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'utils/image_loader.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Mockup events for demonstration
  final Map<DateTime, List<String>> _mockEvents = {
    DateTime(2025, 3, 5): ['Meeting with Team', 'Lunch with Client'],
    DateTime(2025, 3, 10): ['Project Deadline', 'Team Outing'],
    DateTime(2025, 3, 15): ['Doctor Appointment', 'Gym Session'],
  };

  // Store images loaded from JSON
  List<String> _galleryImages = [];

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });

    // Check if the selected day has events
    final eventsForDay = _mockEvents[selectedDay] ?? [];

    // Show bottom sheet with a grid of 6 buttons
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // Load local images
        final images = ImageLoader.loadCloudLevelLocalImages();

        return SizedBox(
          height: 300,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            padding: EdgeInsets.all(10),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () async {
                  // Handle button press (e.g., show another bottom sheet)
                  print('Button pressed for image: ${images[index]}');

                  // Load network images
                  final imageGalleries = await ImageLoader.loadNetworkImages();

                  // Show another bottom sheet to display the gallery
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 300,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: imageGalleries.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Handle image selection
                                print('Selected image: ${imageGalleries[index]}');
                              },
                              child: Image.network(
                                imageGalleries[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, // Remove default padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _addEvent() {
    String? eventName; // To store the event name entered by the user

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Event'),
          content: TextField(
            decoration: InputDecoration(
              labelText: 'Event Name',
            ),
            onChanged: (value) {
              eventName = value; // Capture the user's input
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (eventName != null && eventName!.isNotEmpty) {
                  setState(() {
                    // Add the event to the selected day in _mockEvents
                    if (_selectedDay != null) {
                      if (_mockEvents[_selectedDay] == null) {
                        _mockEvents[_selectedDay!] = [];
                      }
                      _mockEvents[_selectedDay!]!.add(eventName!);
                    }
                  });
                  Navigator.pop(context); // Close the dialog
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Calendar'),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2101, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: _onDaySelected,
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
              ),
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  // Check if the current day has mock events
                  if (_mockEvents[day] != null && _mockEvents[day]!.isNotEmpty) {
                    return Positioned(
                      bottom: 0,
                      child: Icon(
                        Icons.cloud, // Replace with your custom icon
                        color: Colors.blue,
                        size: 16,
                      ),
                    );
                  }
                  return null; // No marker if no events
                },
              ),
            ),
            if (_selectedDay != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Date: ${DateFormat.yMMMd().format(_selectedDay!)}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Events:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ...(_mockEvents[_selectedDay] ?? []).map((event) {
                      return Text('- $event');
                    }),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}