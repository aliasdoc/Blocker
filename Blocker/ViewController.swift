import UIKit
import SafariServices

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let identifier = "com.peteogrady.Blocker.Extension"
        SFContentBlockerManager.reloadContentBlockerWithIdentifier(identifier) { (error) -> Void in
            print(error)
        }
    }

    @IBAction func openSettings(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
    }
}
