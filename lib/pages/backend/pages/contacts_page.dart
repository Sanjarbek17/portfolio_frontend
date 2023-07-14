// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/providers/contact_provider.dart';
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
                        Consumer<ContactProvider>(
                          builder: (context, provider, child) {
                            if (provider.status == ContactStatus.initial) {
                              provider.getContacts();
                              return const CircularProgressIndicator();
                            } else if (provider.status == ContactStatus.loaded) {
                              return SizedBox(
                                width: 100,
                                height: 100,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: provider.contacts.length,
                                  itemBuilder: (context, index) {
                                    return messageButton(
                                      context,
                                      provider.contacts[index].name,
                                      provider.contacts[index].icon,
                                      provider.contacts[index].link,
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const Text('Error');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 135),
        ],
      ),
    );
  }

  InkWell messageButton(BuildContext context, String text, String icon, String url) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(url));
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.network(icon, width: 24, height: 24, color: Colors.white),
          const SizedBox(width: 8),
          Text(text, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
