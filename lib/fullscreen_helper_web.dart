// Web-only implementation
import 'dart:html' as html;

bool get isFullscreen => html.document.fullscreenElement != null;

void initFullscreenListener(void Function(bool) onFullscreenChange) {
  html.document.onFullscreenChange.listen((event) {
    onFullscreenChange(html.document.fullscreenElement != null);
  });
}

void toggleFullscreen() {
  if (isFullscreen) {
    html.document.exitFullscreen();
  } else {
    html.document.documentElement?.requestFullscreen();
  }
}
