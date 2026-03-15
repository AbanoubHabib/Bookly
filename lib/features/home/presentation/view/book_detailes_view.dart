import 'package:bookly/features/home/presentation/widgets/booK_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView  extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BookDetailsViewBody(),
    )),
    );
  }
}
