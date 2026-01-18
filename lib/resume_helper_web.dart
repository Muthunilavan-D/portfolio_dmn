// Web-only implementation for resume download
import 'dart:html' as html;

Future<bool> downloadResumeWeb(String resumeUrl) async {
  try {
    // Try the asset path first
    final anchor = html.AnchorElement(href: resumeUrl);
    anchor.download = 'Resume_dmn.pdf';
    anchor.style.display = 'none';
    html.document.body?.append(anchor);
    anchor.click();
    
    // Remove anchor after a short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      anchor.remove();
    });
    
    return true;
  } catch (e) {
    return false;
  }
}
