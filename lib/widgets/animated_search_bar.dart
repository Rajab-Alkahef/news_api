import 'package:flutter/material.dart';

import 'package:news_app_ui_setup/widgets/custom_search_bar.dart';

//Animated Search bar
class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({super.key, required this.searching});
  final bool searching;
  @override
  // ignore: library_private_types_in_public_api
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with TickerProviderStateMixin {
  String? searchValue;

  AnimationController? _slideController;
  Animation<Offset>? _slideAnimation;
  AnimationController? _opacityController;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 250), // Adjust the duration as needed
    )..addListener(() {
        setState(() {});
      });

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
    )..addListener(() {
        setState(() {});
      });

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _opacityController!,
      curve: Curves.easeInSine, // Use ease-in-out for smooth opacity transition
    ));

    // Start both animations when the widget is first built

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    debugPrint(_opacityAnimation?.status.toString());
    if (_opacityAnimation?.status != AnimationStatus.completed) {
      _opacityController?.forward();
    } else {
      _opacityController?.animateBack(0, duration: const Duration(seconds: 1));
    }
    debugPrint(_slideAnimation?.status.toString());
    if (_slideAnimation?.status != AnimationStatus.completed) {
      _slideController?.forward();
    } else {
      _slideController?.animateBack(0, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _opacityAnimation!,
        child: SlideTransition(
            position: _slideAnimation!, child: const CustomSearchbar()),
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


//transition test
/*
class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void _toggleContainer() {
    debugPrint(_animation.status.toString());
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => _toggleContainer(),
          child: const Text("Toggle container visibility"),
        ),
        SizeTransition(
          axis: Axis.vertical,
          axisAlignment: 1,
          sizeFactor: _animation,
          child: const CustomSearchbar(),
        ),
      ],
    );
  }
}
*/


//non animated search bar
/*
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
*/