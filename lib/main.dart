import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GroupMatchmaker(),
    );
  }
}

class Participant {
  String name;
  List<String> skills;

  Participant(this.name, this.skills);
}

class GroupMatchmaker extends StatefulWidget {
  const GroupMatchmaker({super.key});

  @override
  State<GroupMatchmaker> createState() => _GroupMatchmakerState();
}

class _GroupMatchmakerState extends State<GroupMatchmaker> {
  final List<String> skillsList = [
    "3d-modelling",
    "coding skills",
    "good at art",
    "strong in physics",
    "strong in maths",
    "organisation and project management"
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController groupSizeController = TextEditingController();

  List<String> selectedSkills = [];
  List<Participant> participants = [];
  List<List<Participant>> groups = [];
  String warningMessage = "";

  void addParticipant() {
    if (nameController.text.isEmpty || selectedSkills.isEmpty) return;

    setState(() {
      participants.add(
          Participant(nameController.text.trim(), List.from(selectedSkills)));
      nameController.clear();
      selectedSkills.clear();
    });
  }

  void generateGroups() {
    if (groupSizeController.text.isEmpty) return;

    int groupSize = int.parse(groupSizeController.text);

    if (participants.length < groupSize) {
      setState(() {
        warningMessage =
            "Not enough people to form even one group.";
      });
      return;
    }

    List<Participant> shuffled = List.from(participants);
    shuffled.shuffle(Random());

    List<List<Participant>> tempGroups = [];

    for (int i = 0; i < shuffled.length; i += groupSize) {
      tempGroups.add(
          shuffled.sublist(i, min(i + groupSize, shuffled.length)));
    }

    bool overallSkillCoverage = checkOverallSkills();
    bool groupSkillIssues = checkGroupSkills(tempGroups);

    setState(() {
      groups = tempGroups;
      if (!overallSkillCoverage) {
        warningMessage =
            "Overall participants do not cover all required skills.";
      } else if (groupSkillIssues) {
        warningMessage =
            "Some groups lack full skill diversity. Groups formed as best as possible.";
      } else {
        warningMessage = "Groups generated successfully!";
      }
    });
  }

  bool checkOverallSkills() {
    Set<String> allSkills = {};
    for (var p in participants) {
      allSkills.addAll(p.skills);
    }
    return allSkills.length == skillsList.length;
  }

  bool checkGroupSkills(List<List<Participant>> tempGroups) {
    for (var group in tempGroups) {
      Set<String> groupSkills = {};
      for (var member in group) {
        groupSkills.addAll(member.skills);
      }
      if (groupSkills.length < skillsList.length) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MatchUp!", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, decoration: TextDecoration.underline))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("ADD PARTICIPANT", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              children: skillsList.map((skill) {
                return FilterChip( label: Text(skill),
                  selected: selectedSkills.contains(skill),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        selectedSkills.add(skill);
                      } else {
                        selectedSkills.remove(skill);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: addParticipant,
              child: const Text("ADD PARTICIPANT", style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            const Divider(height: 100),

            const Text("GROUP SETTINGS", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            TextField(
              controller: groupSizeController,
              decoration:
                  const InputDecoration(labelText: "People per group"),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: generateGroups,
              child: const Text("GENERATE GROUPINGS", style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 20),

            if (warningMessage.isNotEmpty)
              Text(
                warningMessage,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 20),

            ...groups.asMap().entries.map((entry) {
              int index = entry.key;
              List<Participant> group = entry.value;

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Group ${index + 1}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      ...group.map((member) => Text(
                          "${member.name} (${member.skills.join(", ")})")),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}