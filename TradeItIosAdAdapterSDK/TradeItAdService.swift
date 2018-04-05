import TradeItIosTicketSDK2
import GoogleMobileAds

@objc public class TradeItAdService: NSObject, AdService {
    private let adUnitId: String
    private let theme: TradeItAdTheme

    public convenience init(adUnitId: String) {
        self.init(adUnitId: adUnitId, theme: TradeItAdTheme.light)
    }

    public init(adUnitId: String, theme: TradeItAdTheme = TradeItAdTheme.light) {
        self.adUnitId = adUnitId
        self.theme = theme
    }

    public func populate(
        adContainer: UIView,
        rootViewController: UIViewController,
        pageType: TradeItAdPageType,
        position: TradeItAdPosition,
        broker: String?,
        symbol: String?,
        instrumentType: String?,
        trackPageViewAsPageType: Bool
    ) {
        let adView = DFPBannerView(adSize: sizeFor(adContainer: adContainer))
        adContainer.addSubview(adView)
        adView.adUnitID = adUnitId
        adView.rootViewController = rootViewController
        let request = DFPRequest()
        request.testDevices = [kGADSimulatorID]

        var customTargeting = [
            "pgtype": TradeItAdPageType.labelFor(pageType),
            "pos": TradeItAdPosition.labelFor(position)
        ]
        if let ticker = symbol {
            customTargeting["ticker"] = ticker
        }
        if theme == .dark {
            customTargeting["theme"] = "dark"
        }

        request.customTargeting = customTargeting
        adView.load(request)
    }

    private func sizeFor(adContainer: UIView) -> GADAdSize {
        if adContainer.frame.height == 100 {
            return kGADAdSizeLargeBanner
        } else {
            return kGADAdSizeBanner
        }
    }
}

@objc public enum TradeItAdTheme: Int {
    case light
    case dark
}
