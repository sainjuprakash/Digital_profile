import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart'; // Import this for Clipboard

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://csds.com.np/');
    Future<void> _launchURL() async {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }

    void _copyText() {
      Clipboard.setData(const ClipboardData(text: 'https://csds.com.np'));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blueAccent.withOpacity(0.5),
          content: const Text('Copied to clipboard'),
          duration: const Duration(milliseconds: 300),
        ),
      );
    }

    return Scaffold(
      body: Container(
        color: Colors.blueAccent.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 1, // Border width
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, right: 10, top: 30),
                        child: Center(
                          child: Text(
                            'CSDS PVT. LTD.',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, right: 10, top: 30),
                        child: Text(
                          'Centre for Sustainable Development Studies (CSDS) Pvt. Ltd., led by a team of dynamic, highly experienced and energetic research professionals, is established in 2018 to be an instrumental in managing development and local governance. We have been imparting our professionalism in establishing baseline and evaluating the development process. We believe on quality work and committed for quality services to meet the needs of clients. We will be working with innovative ideas to bring change in development management system and governance. Hope, we will able to support our valued clients for their sustainable performance.',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: _launchURL,
                    onLongPress: _copyText,
                    child: const Text(
                      'https://csds.com.np',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                        color: Colors.blue, // Add color to indicate it's a link
                        decoration: TextDecoration
                            .underline, // Underline to indicate it's a link
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
