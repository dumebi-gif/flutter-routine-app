// ...existing imports...
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Ezeanyanaso Chidumebi";
  String bio =
      "I’m building strong habits one day at a time. Staying consistent is the goal!";

  void editName() async {
    final controller = TextEditingController(text: name);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Edit Name"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: "Name"),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: Text("Cancel")),
          ElevatedButton(
              onPressed: () => Navigator.pop(ctx, controller.text),
              child: Text("Save")),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() => name = result.trim());
    }
  }

  void editBio() async {
    final controller = TextEditingController(text: bio);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Edit Bio"),
        content: TextField(
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(labelText: "Bio"),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: Text("Cancel")),
          ElevatedButton(
              onPressed: () => Navigator.pop(ctx, controller.text),
              child: Text("Save")),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() => bio = result.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              color: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/profile.jpg"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.edit,
                                size: 18, color: Colors.deepPurple),
                            onPressed: () {
                              // TODO: edit profile pic
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: editName,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.edit, size: 18, color: Colors.white70),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Keep up with your routines 💪",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Quick stats
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard("Completed", "42"),
                  _buildStatCard("Streak", "7 days"),
                  _buildStatCard("Goals", "5"),
                ],
              ),
            ),

            // Bio / Notes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: InkWell(
                  onTap: editBio,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            bio,
                            style: const TextStyle(fontSize: 14, height: 1.4),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.edit,
                            size: 16, color: Colors.deepPurple),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Settings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    leading:
                        const Icon(Icons.settings, color: Colors.deepPurple),
                    title: const Text("App Settings"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.notifications,
                        color: Colors.deepPurple),
                    title: const Text("Reminders"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.redAccent),
                    title: const Text("Logout"),
                    onTap: () {
                      // TODO: handle logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for stats
  Widget _buildStatCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
