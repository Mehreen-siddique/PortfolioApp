import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Skillsscreen extends StatefulWidget {
  const Skillsscreen({super.key});

  @override
  State<Skillsscreen> createState() => _SkillsscreenState();
}

class _SkillsscreenState extends State<Skillsscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildSkillCard() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Theme.of(context).canvasColor,
                      child: Icon(Icons.palette_outlined,
                          size: 26, color: Theme.of(context).iconTheme.color),
                    ),
                    const SizedBox(width: 10),
                    Text(" Design & Tools",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSkillRow("Git/GitHub", 0.5),
                _buildSkillRow("Figma", 0.7),
                _buildSkillRow("Canva", 0.6),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillRow(String skill, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(skill, style: Theme.of(context).textTheme.bodyLarge),
              Text("${(progress * 100).toInt()}%",
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            minHeight: 8,
            value: _animation.value * progress,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }

  Widget buildOtherSkills() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Other Skills",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
            children: [
              _buildCircularSkill("Web Optimization", 0.85, Icons.language),
              _buildCircularSkill("Mobile Design", 0.80, Icons.phone_iphone),
              _buildCircularSkill("Performance", 0.88, Icons.flash_on),
              _buildCircularSkill("APIs", 0.85, Icons.storage),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularSkill(String title, double percent, IconData icon) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      CircularPercentIndicator(
      radius: 40,
      lineWidth: 8,
      percent: 0.85,
      animation: true,
      animationDuration: 2000, // 2 seconds
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Theme.of(context).progressIndicatorTheme.color,
      backgroundColor: Theme.of(context).progressIndicatorTheme.linearTrackColor!,
      center: Text(
        "85%",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      ),
        const SizedBox(height: 8),
        Icon(icon, size: 20, color: theme.iconTheme.color),
        const SizedBox(height: 4),
        Text(title, style: theme.textTheme.bodyMedium, textAlign: TextAlign.center),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FadeTransition(
            opacity: _animation,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(" Skills & Expertise",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text("Technologies and tools | work with",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 20),
                  buildSkillCard(),
                  const SizedBox(height: 20),
                  buildOtherSkills(), // Circular indicators section
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
