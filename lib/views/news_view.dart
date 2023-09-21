import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key, required this.url});
  final String url;

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(right: 48.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News",
                style: TextStyle(
                  color: Color(0xff000000),
                ),
              ),
              Text(
                "Cloud",
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}


// Column(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(6),
//             child: news.image != null
//                 ? CachedNetworkImage(
//                     fit: BoxFit.fill,
//                     height: 200,
//                     width: double.infinity,
//                     imageUrl: news.image!,
//                     placeholder: (context, url) => const SizedBox(
//                       height: 50,
//                       width: 50,
//                       child: Center(child: CircularProgressIndicator()),
//                     ),
//                     errorWidget: (context, url, error) =>
//                         const Icon(Icons.error),
//                   )
//                 : const SizedBox(
//                     height: 200,
//                     width: double.infinity,
//                     child: Center(
//                       child: Text('image not found'),
//                     ),
//                   ),
//             // Image.network(
//             //     news.image!,
//             //     scale: 1.0,
//             //     height: 200,
//             //     width: double.infinity,
//             //     fit: BoxFit.cover,
//             //   )
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           Text(
//             news.title,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Text(
//             news.subtitle ?? '',
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
