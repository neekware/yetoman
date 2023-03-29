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
    // make window fullscreen and remove title bar
    // styleMask.insert(.fullScreen)
    // styleMask.remove(.titled)
    // // make window always on top
    level = .floating
    // make window transparent
    isOpaque = false
    backgroundColor = NSColor.clear
    // set transparncy to 0.5
    alphaValue = 0.5
    // // make windown click through
    // isMovableByWindowBackground = true
    // // make window borderless
    styleMask.insert(.borderless)
    // // make window not resizable
    styleMask.remove(.resizable)
    
  }
}
