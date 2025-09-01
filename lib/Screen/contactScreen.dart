import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contactscreen extends StatefulWidget {
  const Contactscreen({super.key});

  @override
  State<Contactscreen> createState() => _ContactscreenState();
}

class _ContactscreenState extends State<Contactscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _topSlide; // heading ke liye
  late Animation<Offset> _leftSlide; // small cards ke liye
  late Animation<Offset> _bottomSlide; // send message form ke liye

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

    _topSlide = Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _leftSlide = Tween<Offset>(begin: const Offset(-0.5, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _bottomSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start animation jab screen open ho
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCard({required Widget child, required Animation<Offset> animation}) {
    return SlideTransition(
      position: animation,
      child: FadeTransition(
        opacity: _controller,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 👇 Heading from Top
                SlideTransition(
                  position: _topSlide,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get In Touch',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Let's discuss your next project or just say hello!",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // 👇 Email Card (from left)
                _buildCard(
                  animation: _leftSlide,
                  child: _contactCard(
                    context,
                    icon: Icons.email_outlined,
                    text: "mehreensiddique50@gmail.com",
                  ),
                ),
                const SizedBox(height: 20),

                // 👇 Phone Card (from left)
                _buildCard(
                  animation: _leftSlide,
                  child: _contactCard(
                    context,
                    icon: Icons.phone,
                    text: "+92134567890",
                  ),
                ),

                const SizedBox(height: 20),

                // 👇 Send Message Form (from bottom)
                _buildCard(
                  animation: _bottomSlide,
                  child: _messageForm(context),
                ),

                const SizedBox(height: 20),

                // 👇 Socials (from left)
                _buildCard(
                  animation: _leftSlide,
                  child: _socials(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Helper Widgets 🔹
  Widget _contactCard(BuildContext context,
      {required IconData icon, required String text}) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 1,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: Icon(icon, size: 20, color: Theme.of(context).iconTheme.color),
            ),
            const SizedBox(width: 10),
            Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _messageForm(BuildContext context) {
    return Container(
      height: 430,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Send A Message",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextFormField(decoration: const InputDecoration(hintText: " Your name")),
            const SizedBox(height: 10),
            TextFormField(decoration: const InputDecoration(hintText: " Your email")),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(hintText: " Your message"),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.send_outlined, size: 20),
                    SizedBox(width: 10),
                    Text("Send"),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _socials(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 1,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Follow Me",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _socialCard(
                    context,
                    FontAwesomeIcons.github,
                    "Github",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _socialCard(
                    context,
                    FontAwesomeIcons.linkedin,
                    "LinkedIn",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _socialCard(BuildContext context, IconData icon, String label) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 1,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            FaIcon(icon, size: 20, color: Theme.of(context).iconTheme.color),
            const SizedBox(width: 10),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
