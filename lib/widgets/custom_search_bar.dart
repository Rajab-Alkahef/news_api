import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/search_view.dart';

class CustomSearchbar extends StatefulWidget {
  const CustomSearchbar({super.key});

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  String? searchValue;
  Color color = Colors.black.withOpacity(0.3);
  Color tcolor = Colors.transparent;
  Color filterColor = Colors.grey;
  String filterValue = '';
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.only(right: 3, top: 5, bottom: 5, left: 16),
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
              print("search filter ====== $filterValue");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchResultView(
                      searchValue: value,
                      filterValue: filterValue.isEmpty ? "T" : filterValue,
                    );
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
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  padding: const EdgeInsets.only(bottom: 3),
                  onPressed: () {
                    if (searchValue != null) {
                      print("search filter ====== $filterValue");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SearchResultView(
                                filterValue:
                                    filterValue.isEmpty ? "T" : filterValue,
                                searchValue: searchValue);
                          },
                        ),
                      );
                    } else {
                      tcolor = Colors.red.withOpacity(0.5);
                      color = Colors.red;
                      setState(() {});
                    }
                  },
                  icon: Icon(
                    Icons.search,
                    color: color,
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Top',
                      child: CustomPopItem(
                        filterColor: filterValue.contains('Top')
                            ? Colors.orange
                            : Colors.grey,
                        itemIcon: Icons.trending_up,
                        itemName: "Top",
                      ),
                    ),
                    PopupMenuItem(
                      value: "Business",
                      child: CustomPopItem(
                        filterColor: filterValue.contains('Business')
                            ? Colors.orange
                            : Colors.grey,
                        itemIcon: Icons.business_center,
                        itemName: "Business",
                      ),
                    ),
                    PopupMenuItem(
                      value: "Sports",
                      child: CustomPopItem(
                        filterColor: filterValue.contains('Sports')
                            ? Colors.orange
                            : Colors.grey,
                        itemIcon: Icons.sports_soccer,
                        itemName: "Sports",
                      ),
                    ),
                    PopupMenuItem(
                      value: "Entertainment",
                      child: CustomPopItem(
                        filterColor: filterValue.contains('Entertainment')
                            ? Colors.orange
                            : Colors.grey,
                        itemIcon: Icons.live_tv,
                        itemName: "Entertainment",
                      ),
                    ),
                    PopupMenuItem(
                      value: "Health",
                      child: CustomPopItem(
                        filterColor: filterValue.contains('Health')
                            ? Colors.orange
                            : Colors.grey,
                        itemIcon: Icons.health_and_safety,
                        itemName: "Health",
                      ),
                    ),
                    PopupMenuItem(
                      value: "Science",
                      child: CustomPopItem(
                        filterColor: filterValue.contains('Science')
                            ? Colors.orange
                            : Colors.grey,
                        itemIcon: Icons.science,
                        itemName: "Science",
                      ),
                    ),
                    PopupMenuItem(
                      value: "Technology",
                      child: CustomPopItem(
                        filterColor: filterValue.contains('Technology')
                            ? Colors.orange
                            : Colors.grey,
                        itemIcon: Icons.phone_android,
                        itemName: "Technology",
                      ),
                    ),
                  ],
                  onSelected: (valueSelected) {
                    setState(() {
                      // filterColor = Colors.orange;
                      filterValue = valueSelected;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Icon(
                      Icons.filter_list,
                      color: color,
                    ),
                  ),
                )
              ],
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
    );
  }
}

class CustomPopItem extends StatelessWidget {
  const CustomPopItem({
    super.key,
    required this.itemName,
    required this.itemIcon,
    required this.filterColor,
  });
  final String itemName;
  final IconData itemIcon;
  final Color filterColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(itemIcon, color: filterColor),
        const SizedBox(
          width: 12,
        ),
        Text(
          itemName,
          style: TextStyle(color: filterColor),
        ),
      ],
    );
  }
}
