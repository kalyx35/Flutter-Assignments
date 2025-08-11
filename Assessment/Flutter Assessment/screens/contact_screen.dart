import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  Future<void> _sendMail() async {
    if (!_formKey.currentState!.validate()) return;
    final subject = Uri.encodeComponent('Student Connect: ${_name.text}');
    final body = Uri.encodeComponent('Name: ${_name.text}%0AEmail: ${_email.text}%0A%0AMessage:%0A${_message.text}');
    final uri = Uri.parse('mailto:admin@college.edu?subject=$subject&body=$body');
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not open mail app.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Admin')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: InputDecoration(labelText: 'Your Name'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter your name' : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(labelText: 'Your Email'),
                validator: (v) => (v == null || !v.contains('@')) ? 'Enter a valid email' : null,
              ),
              SizedBox(height: 12),
              Expanded(
                child: TextFormField(
                  controller: _message,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(labelText: 'Message'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Message cannot be empty' : null,
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _sendMail,
                      icon: Icon(Icons.send),
                      label: Text('Send via Mail App'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}