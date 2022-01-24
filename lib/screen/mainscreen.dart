import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:praveen_pilli/widgets/photo.dart';
import 'package:url_launcher/url_launcher.dart';

const String _url = 'https://flutter.dev';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xffffffff)));
  TextStyle textStyle(double size) => TextStyle(
      color: Colors.blue, fontSize: size, fontWeight: FontWeight.w700);

  Widget _button(String text, {Function()? onpressed, required double height}) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: ElevatedButton(
            style: buttonStyle,
            child: Text(text, style: textStyle(height)),
            onPressed: onpressed));
  }

  final items = ["LinkedIn", "Facebook", "Instagram", "Twitter"];
  final itemsUrl = [
    "https://www.linkedin.com/in/praveen-pilli-2987ab104/",
    "https://www.facebook.com/praveenjay.1432",
    "https://www.instagram.com/praveen_pilli_/",
    "https://twitter.com/PraveenPilli4"
  ];

  void _launchURL(String urlString) async {
    if (!await launch(urlString,
        forceSafariVC: true, enableJavaScript: true, forceWebView: true)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, height * 0.1),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.blue[100]!, Colors.blue[50]!, Colors.blue[100]!],
      )),
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.1),
          const Photo(assetName: "assets/images/praveenpilli.png"),
          SizedBox(height: height * 0.1),
          SizedBox(
            width: height * 0.3,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (c, ind) => _button(items[ind],
                    height: height * 0.025,
                    onpressed: () async => _launchURL(itemsUrl[ind])),
                separatorBuilder: (_, __) => SizedBox(height: height * 0.05),
                itemCount: items.length),
          )
        ],
      ),
    );
  }
}
