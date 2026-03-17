import 'package:flutter/material.dart';

import '../../../../core/utils/url_launcher.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/model/book_model/book_model.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {
                // Handle book purchase or download
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Purchase functionality coming soon!'),
                  ),
                );
              },
              text: bookModel.isFree ? 'Free' : '19.99 €',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                if (bookModel.previewLink != null) {
                  try {
                    await UrlLauncher.launchBookUrl(context,bookModel.previewLink!);
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not open book preview'),
                        ),
                      );
                    }
                  }
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No preview available for this book'),
                      ),
                    );
                  }
                }
              },
              text: 'Free Preview',
              backgroundColor: Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
