# iOS 2.x -> 3.x Migration Guide

## Initialization

There is a new way to initialize your app with TapForTap. Simply add the following key value pair to your 
info.plist, the `MY_API_KEY` with your accounts API key. There is no need to call explicitly call
initialize anymore, the SDK will handle that itself the first time you request an ad.

```xml
key = TapForTapApiKey
type = String
value = "YOUR_API_KEY"
```

## BannerAd

The TapForTapAdView class has been change to TapForTapBannerAd to better reflect what the class is. A BannerAd can still be
declared in a layout file using `com.tapfortap.BannerAd'. 

The name of the delegate has also been changed to TapForTapBannerAdDelegate, and the delegate methods are now:

  * - (void)tapForTapBannerAdDidReceiveAd:(TapForTapBannerAd *)bannerAd;
  * - (void)tapForTapBannerAd:(TapForTapBannerAd *)bannerAd didFail:(NSString *)reason;
  * - (void)tapForTapBannerAdWasTapped:(TapForTapBannerAd *)bannerAd;

## Interstitial/App Wall (ie FullScreenAds)

FullScreen ads are no longer interacted with using static methods. You must get a new full screen ad instance by
using their respective factory methods.
