import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;
  Contact({
    required this.name,
  }) : this.id = Uuid().v4();
}

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([Contact(name: 'jtTrinh')]);

  static final ContactBook _shared = ContactBook._sharedInstance();

  factory ContactBook() => _shared;

  final List<Contact> _contacts = [];

  int get length => _contacts.length;

  void add({required Contact contact}) {
    _contacts.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    _contacts.remove(contact);
    notifyListeners();
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? null : value[atIndex];
}

class ChappterOneStateManagement extends StatelessWidget {
  const ChappterOneStateManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: ContactBook._shared,
        builder: (context, value, child) {
          final listContactBook = value;
          return ListView.builder(
            itemCount: listContactBook.length,
            itemBuilder: (context, index) {
              final contact = listContactBook[index];
              return Dismissible(
                onDismissed: (derection) {
                  ContactBook().remove(contact: listContactBook[index]);
                },
                key: ValueKey(contact.id),
                child: Material(
                  elevation: 6.0,
                  child: ListTile(
                    title: Text(contact.name),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewContactView(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new contact'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'Enter new text right here...',
            ),
          ),
          TextButton(
              onPressed: () {
                final Contact contact =
                    Contact(name: textEditingController.text);
                ContactBook().add(contact: contact);
                Navigator.of(context).pop();
              },
              child: Text('Add Contact'))
        ],
      ),
    );
  }
}
