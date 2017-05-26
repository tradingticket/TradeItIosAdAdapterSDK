import UIKit
import TradeItIosTicketSDK2
import TradeItIosAdAdapterSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        TradeItSDK.configure(
            apiKey: "tradeit-test-api-key",
            oAuthCallbackUrl: URL(string: "tradeItAdExampleScheme://completeOAuth")!
        )
        TradeItSDK.theme = TradeItTheme.dark()

        TradeItSDK.adService = TradeItAdService(adUnitId: "/24074087/StocksLive")
        return true
    }

    func application(_ application: UIApplication,
                     open url: URL,
                     sourceApplication: String?,
                     annotation: Any) -> Bool {
        // Make sure to verify the deep link URL is the one you specified for the TradeItSDK before proceeding with launching handleOAuthCallback

        // Get the top view controller to pass to the launcher. The below example works in the general case, but your app may need to implement custom logic to get the top-most presented view controller.
        if var topViewController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }

            if let navController = topViewController as? UINavigationController,
                let navTopViewController = navController.topViewController {
                topViewController = navTopViewController
            }

            TradeItSDK.launcher.handleOAuthCallback(onTopmostViewController: topViewController, oAuthCallbackUrl: url)
        }
        return true
    }
}

