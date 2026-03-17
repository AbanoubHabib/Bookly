import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class UrlLauncher {
  static Future<void> launchBookUrl(BuildContext context, String? url) async {
    if (url == null || url.isEmpty) {
      _showSnackBar(context, 'الرابط غير متوفر لهذا الكتاب');
      return;
    }

    final Uri uri = Uri.parse(url);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          // لضمان فتح الرابط في متصفح خارجي بعيداً عن التطبيق
          mode: LaunchMode.externalApplication,
        );
      } else {
        _showSnackBar(context, 'لا يمكن فتح هذا الرابط حالياً');
      }
    } catch (e) {
      _showSnackBar(context, 'حدث خطأ غير متوقع');
    }
  }

  static void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
