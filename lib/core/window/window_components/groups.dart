import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Group Chat App',
    home: GroupSection(),
  ));
}

class Message {
  String text;
  DateTime timestamp;

  Message({required this.text, required this.timestamp});
}

class Group {
  String name;
  String description;
  String type;
  List<Message> messages;

  Group(
      {required this.name,
      required this.description,
      required this.type,
      required this.messages});
}

class GroupSection extends StatefulWidget {
  const GroupSection({Key? key}) : super(key: key);

  @override
  State<GroupSection> createState() => _GroupSectionState();
}

class _GroupSectionState extends State<GroupSection> {
  bool isCreatingGroup = false;
  String groupName = '';
  String groupDescription = '';
  String groupType = '';
  List<Group> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Groups',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(isCreatingGroup ? Icons.check : Icons.add,
                color: Colors.black),
            onPressed: () {
              if (isCreatingGroup) {
                setState(() {
                  groups.add(Group(
                      name: groupName,
                      description: groupDescription,
                      type: groupType,
                      messages: []));
                  isCreatingGroup = false;
                  groupName = '';
                  groupDescription = '';
                  groupType = '';
                });
              } else {
                setState(() {
                  isCreatingGroup = true;
                });
              }
            },
          ),
        ],
        titleSpacing: 0,
      ),
      body: isCreatingGroup ? buildGroupForm() : buildGroupList(),
    );
  }

  Widget buildGroupForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Group name'),
            onChanged: (value) => groupName = value,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Group description'),
            onChanged: (value) => groupDescription = value,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Group type'),
            value: groupType.isEmpty ? null : groupType,
            onChanged: (newValue) {
              setState(() {
                groupType = newValue!;
              });
            },
            items: <String>['Private', 'Public']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildGroupList() {
    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];
        return ListTile(
          title: Text(group.name),
          subtitle: Text(group.description),
          trailing: Text(group.type),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatScreen(group: group)));
          },
        );
      },
    );
  }
}

class ChatScreen extends StatefulWidget {
  final Group group;

  ChatScreen({required this.group});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        widget.group.messages
            .add(Message(text: _controller.text, timestamp: DateTime.now()));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.group.name),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.group.messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.group.messages[index].text),
                  subtitle:
                      Text(widget.group.messages[index].timestamp.toString()),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Send a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
