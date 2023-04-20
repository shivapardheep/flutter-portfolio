import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class DrawerBottomWidget extends StatelessWidget {
  const DrawerBottomWidget({
    super.key,
  });
  Future<void> launchUrlFun(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            child: FittedBox(
              child: Row(
                children: [
                  const Text(
                    "DOWNLOAD CV",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset("assets/icons/download.svg"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: secondaryColor,
            // width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        launchUrlFun(Uri.parse(linkedinUrl));
                      },
                      icon: SvgPicture.asset("assets/icons/linkedin.svg")),
                  IconButton(
                      onPressed: () {
                        launchUrlFun(Uri.parse(githubUrl));
                      },
                      icon: SvgPicture.asset("assets/icons/github.svg")),
                  IconButton(
                      onPressed: () {
                        launchUrlFun(Uri.parse(instagramUrl));
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/instagram.svg",
                        color: Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Currently not available",
                            webBgColor:
                                "linear-gradient(to right, #FF0000, #FF0000)",
                            webPosition: "right",
                            toastLength: Toast.LENGTH_SHORT,
                            // gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      icon: SvgPicture.asset("assets/icons/twitter.svg")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
