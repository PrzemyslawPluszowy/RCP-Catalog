// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/product_modal/product_modal.dart';
import 'package:rcp/providers/setting_app_data_provider.dart';

import 'package:url_launcher/url_launcher.dart';
import 'input_widget.dart';

class QuestionFormScreen extends StatefulWidget {
  const QuestionFormScreen({super.key, required this.singleProductDetail});
  final Product singleProductDetail;

  @override
  State<QuestionFormScreen> createState() => _QuestionFormScreenState();
}

class _QuestionFormScreenState extends State<QuestionFormScreen> {
  final snackBar = const SnackBar(content: Text('Question Submitted'));

  final formKey = GlobalKey<FormState>();
  late Uri _permalink;
  late String _name;
  late String _email;
  late String _subject;
  late String _bodyEmail;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _subjectController;
  late TextEditingController _bodyController;
  late SettingAppProvider settingProvider;
  @override
  void initState() {
    super.initState();
    settingProvider = Provider.of<SettingAppProvider>(context, listen: false);
    _permalink = Uri.parse('${widget.singleProductDetail.permalink}');
    _nameController = TextEditingController(text: settingProvider.getName());
    _emailController = TextEditingController(text: settingProvider.getEmail());
    _subjectController =
        TextEditingController(text: widget.singleProductDetail.name.toString());
    _bodyController = TextEditingController();
    _name = widget.singleProductDetail.name;
    _nameController.addListener(_updateText);
    _emailController.addListener(_updateText);
    _subjectController.addListener(_updateText);
    _bodyController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _name = _nameController.text;
      _email = _emailController.text;
      _bodyEmail = _bodyController.text;
      _subject = _subjectController.text;
    });
  }

  String? _nameValidator(String? value) {
    if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return 'Enter Correct Name';
    } else {
      return null;
    }
  }

  String? _emailValidator(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
      return 'Enter Correct Email';
    } else {
      return null;
    }
  }

  String? _subcjetValidator(String? value) {
    if (value!.isEmpty) {
      _subjectController.text = widget.singleProductDetail.name;
      return null;
    } else {
      return null;
    }
  }

  String? _messegeValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please write your question';
    } else if (value.length <= 10) {
      return 'Answer is to short';
    } else {
      return null;
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'racingcustompartsinfo@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': _subject,
          'body':
              'name: $_name\n\n  email: $_email\n\n product name: ${widget.singleProductDetail.name}\n\nlink to product: ${widget.singleProductDetail.permalink}\n\n Question: $_bodyEmail\n\n Racing Custom Parts thank you for your time, we respond as soon as possible '
        }));

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      _showErrorDialog();
    }
  }

  Future<void> sendUrlToBroswer(Uri url) async {
    await launchUrl(_permalink);
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Something went wrong :('),
        content: const Text('Cant launch the default email client.'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok')),
          TextButton(
              onPressed: () async {
                sendUrlToBroswer(_permalink);
                Navigator.pop(context);
              },
              child: const Text('Try via  our web'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ask about',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.singleProductDetail.name,
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          minRadius: 40,
                          maxRadius: 50,
                          backgroundColor: Color.fromARGB(255, 255, 17, 0),
                          child: CircleAvatar(
                              minRadius: 30,
                              maxRadius: 40,
                              backgroundImage: AssetImage(
                                'assets/images/logo.png',
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InputWidget(
                    nameController: _nameController,
                    labelText: 'Name',
                    validator: _nameValidator,
                    prefixIcon: Icons.person,
                    minimalLine: null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputWidget(
                    nameController: _emailController,
                    labelText: 'Email',
                    validator: _emailValidator,
                    prefixIcon: Icons.email,
                    minimalLine: null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputWidget(
                    nameController: _subjectController,
                    labelText: 'Subject',
                    validator: _subcjetValidator,
                    prefixIcon: Icons.topic,
                    minimalLine: null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputWidget(
                    nameController: _bodyController,
                    labelText: 'Messege',
                    validator: _messegeValidator,
                    prefixIcon: Icons.message,
                    minimalLine: 4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize:
                          const Size(double.maxFinite, double.minPositive),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        settingProvider.addPersonToDb(
                            email: _email, name: _name);
                        _sendEmail();
                      }
                    },
                    child: const Text('Send Question as email'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
