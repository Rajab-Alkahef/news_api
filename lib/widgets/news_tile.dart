import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            'https://images.unsplash.com/photo-1613842683240-19b2880f1e9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'This is title of news This is title of news This is title of news This is title of news This is title of news This is title of news This is title of news This is title of news ',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'This is subtitle of news This is title of news This is title of news This is title of news This is title of news This is title of news This is title of news This is title of news This is title of news This is title of news This is title of newsThis is title of news This is title of news This is title of news ',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
