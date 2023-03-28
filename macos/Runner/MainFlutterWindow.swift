import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
     // Make window transparent
    alphaValue = 0.5
    isOpaque = false
    backgroundColor = NSColor.clear

    // Make window clickable through
    // ignoresMouseEvents = true
    level = NSWindow.Level.screenSaver
  }
}
