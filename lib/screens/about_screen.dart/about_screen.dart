import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:rcp/screens/question_screen/round_logo.widgtet.dart';

import 'about_app.dart';
import 'about_me_widget.dart';

const List<Widget> tabs = [
  Text('About app'),
  Text('Faq'),
  Text('About dev'),
];

const List<Widget> about = [
  AboutApp(),
  FaqWidget(),
  AboutMe(),
];

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: tabs),
        ),
        body: TabBarView(children: about),
      ),
    );
  }
}

class Question {
  String headerValue;
  String expandetValue;
  bool isExpanded;
  Question(
      {required this.headerValue,
      required this.expandetValue,
      this.isExpanded = false});
}

class FaqWidget extends StatefulWidget {
  const FaqWidget({super.key});

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  List<Question> questionList = [
    Question(
        headerValue: 'Why i can\'t pay in app',
        expandetValue:
            'All our products we make for special order with custom modification special for you, sometimes we need more information about created parts for you'),
    Question(
        headerValue: 'My money are save?',
        expandetValue:
            'All of our products can be ordered and paid via the Paypal and Ebay. \n You have Paypal and Ebay Guarantee, write to us for more information.'),
    Question(
        headerValue: 'Where are you shipping?',
        expandetValue:
            'We work with customer all over the word, write to us. '),
    Question(
        headerValue: 'What is the quality of the product?',
        expandetValue:
            'We make highest quelity product. Our component are tested among others  in dragster Tsunami 2200hp'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
      child: Container(
        child: Column(children: [
          Text(
            'Popular Question:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          ExpansionPanelList(
            children: questionList
                .map<ExpansionPanel>((e) => ExpansionPanel(
                    isExpanded: e.isExpanded,
                    headerBuilder: (context, isExpanded) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e.headerValue),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        e.expandetValue,
                        textAlign: TextAlign.justify,
                        softWrap: true,
                      )),
                    )))
                .toList(),
            expansionCallback: (index, isExpanded) {
              setState(() {
                questionList[index].isExpanded = !isExpanded;
              });
            },
          )
        ]),
      ),
    );
  }
}
