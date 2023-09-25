import 'package:flutter/material.dart';

import 'package:news_app_ui_setup/model/news_model.dart';
import 'package:news_app_ui_setup/services/news_services.dart';
import 'package:news_app_ui_setup/views/search_view.dart';

//non animated search bar

// class CustomSearchBar extends StatefulWidget {
//   const CustomSearchBar({super.key});

//   @override
//   State<CustomSearchBar> createState() => _CustomSearchBarState();
// }

// class _CustomSearchBarState extends State<CustomSearchBar> {
//   String? searchValue;
//   NewsService? newsService;
//   List<NewsModel>? data;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 18),
//         decoration: const BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(1.8, 3.3),
//               color: Colors.black38,
//               blurRadius: 4,
//               spreadRadius: 0.1,
//             ),
//           ],
//           borderRadius: BorderRadius.all(Radius.circular(14)),
//           color: Colors.white,
//         ),
//         width: MediaQuery.of(context).size.width,
//         height: 50,
//         child: TextField(
//           onTapOutside: (event) {
//             FocusScope.of(context).unfocus();
//           },
//           onSubmitted: (value) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return SearchResultView(searchValue: value);
//                 },
//               ),
//             );
//           },
//           onChanged: (value) {
//             searchValue = value;
//           },
//           decoration: InputDecoration(
//             suffixIcon: IconButton(
//               padding: const EdgeInsets.only(left: 16),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return SearchResultView(searchValue: searchValue!);
//                     },
//                   ),
//                 );
//               },
//               icon: const Icon(
//                 Icons.search,
//               ),
//             ),
//             border: InputBorder.none,
//             hintText: "Search..",
//             hintStyle: const TextStyle(
//               color: Colors.black45,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//Animated Search bar
class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.searching});
  final bool searching;
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar>
    with TickerProviderStateMixin {
  bool visible = false;
  String? searchValue;
  NewsService? newsService;
  List<NewsModel>? data;
  AnimationController? _slideController;
  Animation<Offset>? _slideAnimation;
  AnimationController? _opacityController;
  Animation<double>? _opacityAnimation;
  Color color = Colors.black.withOpacity(0.3);
  Color tcolor = Colors.transparent;

  @override
  void initState() {
    super.initState();

    visible = widget.searching;

    _slideController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 250), // Adjust the duration as needed
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.1), // Start from the right
      end: const Offset(0.0, 0.0), // End at the original position
    ).animate(CurvedAnimation(
      parent: _slideController!,
      curve: Curves.easeInSine, // Use ease-in-out for smooth movement
    ));

    _opacityController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 250), // Adjust the duration as needed
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _opacityController!,
      curve: Curves.easeInSine, // Use ease-in-out for smooth opacity transition
    ));

    // Start both animations when the widget is first built

    setState(() {
      _startAnimations();
    });
  }

  Future<void> _endAnimations() async {
    // Delay the start of the animations (if needed)
    await Future.delayed(const Duration(milliseconds: 0));

    // Start the slide-in animation
    _slideController?.reverse();

    // Start the opacity transition
    _opacityController?.reverse();
  }

  Future<void> _startAnimations() async {
    // Delay the start of the animations (if needed)
    await Future.delayed(const Duration(milliseconds: 0));

    // Start the slide-in animation
    _slideController?.forward();

    // Start the opacity transition
    _opacityController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _opacityAnimation!,
        child: SlideTransition(
          position: _slideAnimation!,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: tcolor, width: 1.5),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1.8, 3.3),
                    color: Colors.black38,
                    blurRadius: 4,
                    spreadRadius: 0.1,
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: TextField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                onSubmitted: (value) {
                  if (value != '') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchResultView(searchValue: value);
                        },
                      ),
                    );
                  } else {
                    tcolor = Colors.red.withOpacity(0.5);
                    color = Colors.red;
                    setState(() {});
                    print('field is required');
                  }
                },
                onTap: () {
                  tcolor = Colors.blue.withOpacity(0.5);
                  setState(() {});
                },
                onChanged: (value) {
                  tcolor = Colors.blue.withOpacity(0.5);
                  color = Colors.black;
                  setState(() {});
                  searchValue = value;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.only(left: 16, bottom: 3),
                    onPressed: () {
                      if (searchValue != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SearchResultView(searchValue: searchValue);
                            },
                          ),
                        );
                      } else {
                        tcolor = Colors.red.withOpacity(0.5);
                        color = Colors.red;
                        setState(() {});
                        print('object');
                      }
                    },
                    icon: Icon(
                      Icons.search,
                      color: color,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: "Search..",
                  hintStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _slideController?.dispose();
    _opacityController?.dispose();
    super.dispose();
  }
}
