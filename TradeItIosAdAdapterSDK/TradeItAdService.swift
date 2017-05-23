import TradeItIosTicketSDK2
import GoogleMobileAds

@objc public class TradeItAdAdapterSDK: NSObject {
    public static var adUnitId: String?
}

// TODO: Default implementation of AdService that just collapses AdContainers
@objc public class TradeItAdService: NSObject, TradeItAdServiceProtocol {
    public override init() {

    }

    public func configure(adContainer: UIView, rootViewController: UIViewController, pageType: TradeItAdPageType, position: TradeItAdPosition) {
        guard let adUnitId = TradeItAdAdapterSDK.adUnitId else { return }

        let size = kGADAdSizeLargeBanner

        let adView = DFPBannerView(adSize: size)
        adContainer.addSubview(adView)
        adView.adUnitID = adUnitId
        adView.rootViewController = rootViewController
        let request = DFPRequest()
        request.testDevices = [kGADSimulatorID]
        request.customTargeting = [
            "pgtype": TradeItAdPageType.labelFor(pageType),
            "pos": TradeItAdPosition.labelFor(position)
        ]
        adView.load(request)
    }
}
