import TradeItIosTicketSDK2
import GoogleMobileAds

@objc public class TradeItAdService: NSObject, AdService {
    private let adUnitId: String

    public init(adUnitId: String) {
        self.adUnitId = adUnitId
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
        var customTargeting = [
            "pgtype": TradeItAdPageType.labelFor(pageType),
            "pos": TradeItAdPosition.labelFor(position)
        ]
        if let ticker = symbol {
            customTargeting["ticker"] = ticker
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
