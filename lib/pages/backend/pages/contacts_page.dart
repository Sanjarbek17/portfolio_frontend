import 'package:flutter/material.dart';

import '../widgets/headline_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        children: [
          const HeadlineWidget(text: 'contacts'),
          const SizedBox(height: 16),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('I’m interested in freelance opportunities. However, if you have other request or question, don’t hesitate to contact me', style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Message me here', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        ...List.generate(
                          3,
                          (index) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.email, color: Colors.white),
                              const SizedBox(width: 8),
                              Text('Sanjarbek@gmail.com', style: Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
