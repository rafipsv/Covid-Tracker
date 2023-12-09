// ignore_for_file: file_names
import 'package:covid_tracker/Pages/Blog%20Page/Widgets/BlogCard.dart';
import 'package:covid_tracker/Provider/BlogProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogList extends StatelessWidget {
  const BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BlogProvider>(
      builder: (context, value, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: value.blogs.blogs!.length,
            itemBuilder: (BuildContext context, int index) {
              return BlogCard(index: index);
            },
          ),
        );
      },
    );
  }
}
