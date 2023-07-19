import 'package:flutter/material.dart';

import '../widgets/message_input.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 150),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        // width: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let’s talk business',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Now that you know a lot about me, let me know if you are interested to work with me.',
                    style: TextStyle(
                      color: Color(0xFF8491A0),
                      fontSize: 18,
                      fontFamily: 'Sen',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    const MesageInput(name: 'Name'),
                    const SizedBox(height: 20),
                    const MesageInput(name: 'Email'),
                    const SizedBox(height: 20),
                    const MesageInput(name: 'Message', maxLines: 5),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        // TODO: Add your own email address
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF5221E6),
                          textStyle: const TextStyle(fontSize: 16, fontFamily: 'Sen', fontWeight: FontWeight.w400),
                          padding: const EdgeInsets.symmetric(vertical: 34),
                        ),
                        child: const Text("LET’S GET STARTED"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
