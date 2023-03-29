import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ aNotification: Notification) {
    createCustomMenu()
  }

  private func createCustomMenu() {
    let mainMenu = NSMenu()

    let appName = ProcessInfo.processInfo.processName
    let appMenuItem = NSMenuItem()
    let appMenu = NSMenu()

    let closeAppItem = NSMenuItem(title: "Close \(appName)", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
    appMenu.addItem(closeAppItem)
    appMenuItem.submenu = appMenu
    mainMenu.addItem(appMenuItem)

    NSApp.mainMenu = mainMenu
  }
}
