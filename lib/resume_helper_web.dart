// Web-only implementation for resume download
import 'dart:html' as html;

Future<bool> downloadResumeWeb(String resumeUrl) async {
  try {
    // Fetch the asset as a blob
    final response = await html.HttpRequest.request(
      resumeUrl,
      method: 'GET',
      responseType: 'blob',
    );
    
    if (response.status == 200) {
      final blob = response.response as html.Blob;
      final url = html.Url.createObjectUrlFromBlob(blob);
      
      // Create anchor element with blob URL
      final anchor = html.AnchorElement(href: url);
      anchor.download = 'Resume_dmn.pdf';
      anchor.style.display = 'none';
      html.document.body?.append(anchor);
      anchor.click();
      
      // Clean up
      Future.delayed(const Duration(milliseconds: 100), () {
        anchor.remove();
        html.Url.revokeObjectUrl(url);
      });
      
      return true;
    }
    return false;
  } catch (e) {
    // If fetch fails, try direct link approach
    try {
      final anchor = html.AnchorElement(href: resumeUrl);
      anchor.download = 'Resume_dmn.pdf';
      anchor.target = '_blank';
      anchor.style.display = 'none';
      html.document.body?.append(anchor);
      anchor.click();
      
      Future.delayed(const Duration(milliseconds: 100), () {
        anchor.remove();
      });
      
      return true;
    } catch (e2) {
      return false;
    }
  }
}
