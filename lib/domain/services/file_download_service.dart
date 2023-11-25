import 'dart:typed_data';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

class FileDownloader {
  Future<void> downloadFile(String url, String fileName) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Uint8List bytes = response.bodyBytes;

        final html.Blob blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final html.AnchorElement anchor = html.AnchorElement(href: url)
          ..target = 'webbrowser'
          ..download = fileName;
        html.document.body?.children.add(anchor);
        anchor.click();
        html.document.body?.children.remove(anchor);
        html.Url.revokeObjectUrl(url);

        print('Download successful. File saved as: $fileName');
      } else {
        print('Failed to download file. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error downloading file: $error');
    }
  }
}
