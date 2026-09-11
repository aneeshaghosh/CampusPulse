import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusPulse());
}

class CampusPulse extends StatelessWidget {
  const CampusPulse({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusPulse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> places = const [
    {
      'name': 'Central Library',
      'score': 86,
      'status': 'Quiet',
      'icon': '📚',
    },
    {
      'name': 'Food Court',
      'score': 42,
      'status': 'Busy',
      'icon': '🍔',
    },
    {
      'name': 'Tech Block',
      'score': 71,
      'status': 'Moderate',
      'icon': '💻',
    },
    {
      'name': 'Student Park',
      'score': 91,
      'status': 'Relaxed',
      'icon': '🌳',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CampusPulse',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: FutureBuilder(
        future: getCampusData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                'Where should you go?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Find a place that suits you right now.',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '✨ Best right now',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Central Library',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Quiet • Good for studying • 86% pulse',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Campus spots',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              ...places.map(
                (place) => PlaceCard(place: place),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReportPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Report'),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LivePage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.waves),
                      label: const Text('Live Pulse'),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

Future<String> getCampusData() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Campus data loaded';
}

class PlaceCard extends StatelessWidget {
  final Map<String, dynamic> place;

  const PlaceCard({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            place['icon'],
            style: const TextStyle(fontSize: 20),
          ),
        ),

        title: Text(
          place['name'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          '${place['status']} • Pulse ${place['score']}',
        ),

        trailing: const Icon(Icons.arrow_forward_ios),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(place: place),
            ),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> place;

  const DetailsPage({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place['name']),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  place['icon'],
                  style: const TextStyle(fontSize: 55),
                ),

                const SizedBox(height: 10),

                Text(
                  '${place['score']}%',
                  style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text('Campus Pulse Score'),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const InfoRow(
            icon: Icons.volume_down,
            name: 'Noise',
            value: 'Low',
          ),

          const InfoRow(
            icon: Icons.people,
            name: 'Crowd',
            value: 'Moderate',
          ),

          const InfoRow(
            icon: Icons.menu_book,
            name: 'Study friendly',
            value: 'Yes',
          ),

          const InfoRow(
            icon: Icons.power,
            name: 'Charging',
            value: 'Available',
          ),

          const SizedBox(height: 20),

          const Text(
            'Why this place?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Recent student reports show that this place is comfortable and suitable for focused work.',
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String name;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(name),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String selected = 'Quiet';

  final options = [
    'Quiet',
    'Moderate',
    'Crowded',
    'Event happening',
    'Issue reported',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report campus pulse'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is happening here?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Help other students by reporting the current situation.',
            ),

            const SizedBox(height: 20),

            ...options.map(
              (option) => RadioListTile(
                title: Text(option),
                value: option,
                groupValue: selected,
                onChanged: (value) {
                  setState(() {
                    selected = value.toString();
                  });
                },
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Report submitted: $selected',
                      ),
                    ),
                  );
                },
                child: const Text('Submit report'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  late Stream<int> pulseStream;

  @override
  void initState() {
    super.initState();

    pulseStream = Stream.periodic(
      const Duration(seconds: 2),
      (number) => 80 + (number % 5) - 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Campus Pulse'),
      ),

      body: Center(
        child: StreamBuilder<int>(
          stream: pulseStream,
          builder: (context, snapshot) {
            int pulse = snapshot.data ?? 80;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.waves,
                  size: 70,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Central Library',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  '$pulse%',
                  style: const TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text('Live pulse score'),

                const SizedBox(height: 15),

                const Text(
                  'Updating every few seconds...',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}