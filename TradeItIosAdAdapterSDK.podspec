Pod::Spec.new do |s|
  s.name             = 'TradeItIosAdAdapterSDK'
  s.version          = '0.0.1'
  s.summary          = 'Trade It iOS Ad Adapter SDK'

  s.description      = <<-DESC
  Add support for TradeIt Ads in the TradeIt Ticket SDK.
  DESC

  s.homepage         = 'https://github.com/tradingticket/TradeItIosAdAdapterSDK'
  s.license          = { :type => 'Apache License 2.0', :file => 'LICENSE' }
  s.author           = { 'Trading Ticket Inc.' => 'support@trade.it' }
  s.source           = { :git => 'https://github.com/tradingticket/TradeItIosAdAdapterSDK.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tradingticket'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TradeItIosAdAdapterSDK/**/*.{swift,h}'

  s.frameworks = 'UIKit'
  s.dependency 'TradeItIosTicketSDK2', '~> 1.1.4'
  s.dependency 'Google-Mobile-Ads-SDK', '~> 7.8'
end
