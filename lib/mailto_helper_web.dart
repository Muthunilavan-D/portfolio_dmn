// Web-only implementation for mailto links
import 'dart:html' as html;

Future<bool> launchMailtoWeb(String mailtoUrl) async {
  try {
    // Validate the mailto URL
    if (mailtoUrl.isEmpty || !mailtoUrl.startsWith('mailto:')) {
      return false;
    }
    
    // Ensure body exists
    if (html.document.body == null) {
      return false;
    }
    
    // Method 1: Try using anchor element with click
    try {
      final anchor = html.AnchorElement(href: mailtoUrl);
      anchor.target = '_self';
      anchor.style.display = 'none';
      anchor.style.position = 'absolute';
      anchor.style.left = '-9999px';
      
      html.document.body!.append(anchor);
      
      // Use a small delay to ensure DOM is ready
      await Future.delayed(const Duration(milliseconds: 10));
      
      // Trigger click - this should open the default email client
      anchor.click();
      
      // Remove anchor after a delay
      Future.delayed(const Duration(milliseconds: 300), () {
        try {
          anchor.remove();
        } catch (e) {
          // Ignore removal errors
        }
      });
      
      return true;
    } catch (e) {
      // If anchor click fails, try window.location
      try {
        html.window.location.href = mailtoUrl;
        return true;
      } catch (e2) {
        // Both methods failed
        return false;
      }
    }
  } catch (e) {
    return false;
  }
}
