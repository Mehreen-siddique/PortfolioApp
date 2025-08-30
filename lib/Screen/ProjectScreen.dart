import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Projectscreen extends StatefulWidget {
  const Projectscreen({super.key});

  @override
  State<Projectscreen> createState() => _ProjectscreenState();
}

class _ProjectscreenState extends State<Projectscreen> {

  Widget buildCard(){
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index){
          return Card(
            color: Colors.white,
            elevation: 6, // gives shadow
            shadowColor: Colors.grey[400],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://via.placeholder.com/400x200",
                      height: 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Project Name
                  const Text(
                    "Weather App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Project Description
                  const SizedBox(height: 6),
                  const Text(
                    "A simple weather app built with Flutter & OpenWeather API.",
                    style: TextStyle(color: Colors.black54),
                  ),

                  const SizedBox(height: 12),

                  // Technologies (Chips with grey border)
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildTechChip("Flutter"),
                      _buildTechChip("Dart"),
                      _buildTechChip("REST API"),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // GitHub Button
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            side: BorderSide(color: Colors.grey.shade400),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.github, size: 18,
                          color: Colors.black,
                          ),
                          label: const Text("GitHub",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),

                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Demo Button
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.fullscreen,
                              size: 18,
                              color: Colors.white),
                          label: const Text("Demo", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  Widget _buildTechChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tech,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Projects", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10,),

              Text("Here are some of my recent working and personal projects. ", style: TextStyle(
                fontSize: 15,
              ),),
              SizedBox(height: 10,),
              Expanded(child: buildCard()),

            ],
          ),
        ),
        ),
      )
    );
  }
}
