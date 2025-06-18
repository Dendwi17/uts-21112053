import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'My Tasks',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Filter buttons
              Row(
                children: [
                  FilterChip(
                    label: Text("Today"),
                    selected: true,
                    onSelected: (_) {},
                    selectedColor: Colors.white24,
                  ),
                  const SizedBox(width: 10),
                  FilterChip(
                    label: Text("Tomorrow"),
                    selected: false,
                    onSelected: (_) {},
                    selectedColor: Colors.white24,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Dropdown Task Type
              Row(
                children: const [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white24,
                    child: Text(
                      "12",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "On Going Tasks",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
              const SizedBox(height: 20),

              // Task Cards
              Expanded(
                child: ListView(
                  children: const [
                    TaskCard(
                      icon: Icons.web,
                      iconColor: Colors.deepOrange,
                      title: "BrightBridge - Website Design",
                      subtitle: "Design a framer website with modern templates",
                      bgColor: Color(0xFF2A2A2A),
                    ),
                    TaskCard(
                      icon: Icons.cloud_upload,
                      iconColor: Colors.blue,
                      title: "Github - Upload Dev Files & Images",
                      subtitle:
                          "Collaborate with Developers to handle the SaaS Project.",
                      bgColor: Color(0xFF1E1E1E),
                    ),
                    TaskCard(
                      icon: Icons.mobile_friendly,
                      iconColor: Colors.pinkAccent,
                      title: "9TDesign - Mobile App Prototype",
                      subtitle:
                          "Ready prototype for testing user in this week.",
                      bgColor: Color(0xFF2B223D),
                    ),
                    TaskCard(
                      icon: Icons.dashboard,
                      iconColor: Colors.lightBlueAccent,
                      title: "Horizon - Dashboard Design",
                      subtitle:
                          "UI dashboard for project overview and reports.",
                      bgColor: Color(0xFF1B2B2E),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Color bgColor;

  const TaskCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.bgColor,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: _isHovered ? widget.bgColor.withOpacity(0.9) : widget.bgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: widget.iconColor.withOpacity(_isHovered ? 0.5 : 0.2),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: CircleAvatar(
            backgroundColor: widget.iconColor.withOpacity(0.2),
            child: Icon(widget.icon, color: widget.iconColor),
          ),
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              widget.subtitle,
              style: const TextStyle(fontSize: 13, color: Colors.white70),
            ),
          ),
          trailing: const Icon(
            Icons.check_circle_outline,
            color: Colors.white38,
          ),
        ),
      ),
    );
  }
}
