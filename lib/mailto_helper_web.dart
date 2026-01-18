// Web-only implementation for mailto links
import 'dart:html' as html;

Future<bool> launchMailtoWeb(String mailtoUrl) async {
  try {
    // Create anchor element and append to body temporarily
    final anchor = html.AnchorElement(href: mailtoUrl);
    anchor.style.display = 'none';
    html.document.body?.append(anchor);
    
    // Trigger click
    anchor.click();
    
    // Remove anchor after a short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      anchor.remove();
    });
    
    // On web, we assume it worked since the browser handles mailto
    return true;
  } catch (e) {
    // Even if there's an error, try to open it anyway
    try {
      html.window.location.href = mailtoUrl;
      return true;
    } catch (e2) {
      return false;
    }
  }
}
