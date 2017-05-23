import UIKit
import TradeItIosTicketSDK2

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func launchTapped(_ sender: Any) {
        TradeItSDK.launcher.launchPortfolio(fromViewController: self)
    }
}
