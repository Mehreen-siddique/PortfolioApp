import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Projectscreen extends StatefulWidget {
  const Projectscreen({super.key});

  @override
  State<Projectscreen> createState() => _ProjectscreenState();
}

class _ProjectscreenState extends State<Projectscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  // 🔹 Dummy project list (yeh baad me backend/Firebase se load hoga)
  List<Map<String, dynamic>> projects = [
    {
      "title": "Weather App",
      "description": "A simple weather app built with Flutter & OpenWeather API.",
      "imageUrl": "https://via.placeholder.com/400x200",
      "technologies": ["Flutter", "Dart", "REST API"],
      "github": "https://github.com/",
      "demo": "https://demo-link.com"
    },
    {
      "title": "Portfolio Website",
      "description": "My personal portfolio built using Flutter Web.",
      "imageUrl": "https://via.placeholder.com/400x200",
      "technologies": ["Flutter", "Firebase", "Hosting"],
      "github": "https://github.com/",
      "demo": "https://demo-link.com"
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildProjectBox() {
    return ListView.builder(
      itemCount: projects.length, // 🔹 Dynamic count
      itemBuilder: (context, index) {
        final project = projects[index];

        return SlideTransition(
          position: _slideAnimation,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: 1,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      project["imageUrl"],
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Project Name
                  Text(
                    project["title"],
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Project Description
                  Text(
                    project["description"],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 12),

                  // Technologies
                  Wrap(
                    spacing: 8,
                    children: (project["technologies"] as List<String>)
                        .map((tech) => _buildTechChip(tech))
                        .toList(),
                  ),

                  const SizedBox(height: 16),

                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // TODO: open GitHub link
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            size: 18,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          label: Text("GitHub",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: open Demo link
                          },
                          icon: const Icon(Icons.fullscreen, size: 18),
                          label: const Text("Demo"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTechChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      child: Text(
        tech,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 🔹 Navigate to Add Project Screen
            // Navigator.push(
            //   context,
            //   // MaterialPageRoute(builder: (context) => const AddProjectScreen()),
            // );
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Projects",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Here are some of my recent working and personal projects.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              Expanded(child: buildProjectBox()),
            ],
          ),
        ),
      ),
    );
  }
}


