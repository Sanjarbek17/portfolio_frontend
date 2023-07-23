// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../widgets/message_input.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

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
                    MesageInput(name: 'Name', controller: nameController),
                    const SizedBox(height: 20),
                    MesageInput(name: 'Email', controller: emailController),
                    const SizedBox(height: 20),
                    MesageInput(name: 'Message', maxLines: 5, controller: messageController),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        // TODO: Add your own email address
                        onPressed: sendMail,
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

  void sendMail() async {
    if (!validate()) return;
    String? token = dotenv.env['TOKEN'];
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.telegram.org/bot$token',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    Dio dio = Dio(options);

    try {
      await dio.post(
        '/sendMessage',
        data: {
          'chat_id': '555351863',
          'text': """
Name: ${nameController.text}
Email: ${emailController.text}
Message: ${messageController.text}
""",
        },
      );
      nameController.clear();
      emailController.clear();
      messageController.clear();
      showsnackBar('Message sent successfully');
    } catch (e) {
      showsnackBar('Message sending failed');
    }
  }

  void showsnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool validate() {
    // show snackbar if any of the fields are empty

    if (nameController.text.isEmpty) {
      showsnackBar('Name cannot be empty');
      return false;
    } else if (emailController.text.isEmpty) {
      showsnackBar('Email cannot be empty');
      return false;
    } else if (messageController.text.isEmpty) {
      showsnackBar('Message cannot be empty');
      return false;
    } else {
      return true;
    }
  }
}
