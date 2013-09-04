# iOS 2.x -> 3.x Migration Guide

## Class Name Changes

- TapForTap -> TFTTapForTap
- TapForTapAdView -> TFTBanner
- TapForTapInterstitial -> TFTInterstitial
- TaForTapAppWall -> TFTAppWall

## Initialization

There is a new way to initialize your app with TapForTap. Simply add the following key value pair to your 
info.plist while replacing `MY_API_KEY` with your account's API key. There is no need to explicitly call
initialize anymore, the SDK will handle that itself the first time you request an ad.

```xml
key = TapForTapApiKey
type = String
value = "YOUR_API_KEY"
```

## TFTBanner

Two new factory methods were introduced. These will create a new intance of TFTBanner and start showing ads.

```obj-c
- (TFTBanner *) banner;
- (TFTBanner *) bannerWithDelegate(id<TFTBannerDelegate>)delegate;
```

The name of the delegate has also been changed to TFTBannerDelegate, and the delegate methods are now:

```obj-c
- (void)tftBannerDidReceiveAd:(TFTBanner *)banner;
- (void)tftBanner:(tftBanner *)banner didFail:(NSString *)reason;
- (void)tftBannerWasTapped:(TFTBanner *)banner;
``` 

## Interstitial/App Wall (ie FullScreenAds)

Interstitials and App Walls share the same interface. The only difference betweeen the two is the names.

FullScreen ads are no longer interacted with using class methods. You must get a new full screen ad instance by
using one of the respective factory methods.

```objc
- (TFTInterstitial *) interstitial
- (TFTInterstitial *) interstitialWithDelegate:(id<TFTInterstitialDelegate>)delegate;

- (TFTInterstitial *) appWall
- (TFTInterstitial *) appWallWithDelegate:(id<TFTAppWallDelegate>)delegate;
```

The delegates have also been update and are now called TFTInterstitialDelegate and TFTAppWallDelegate. They have the
same callbacks as in 2.x with more consistent naming and an wasTapped callback was added.

```obj-c
- (void)tftInterstitialDidReceiveAd:(TFTInterstitial *)interstitial;
- (void)tftInterstitial:(TFTInterstitial *)interstitial didFail:(NSString *)reason;
- (void)tftInterstitialDidShow:(TFTInterstitial *)interstitial;
- (void)tftInterstitialWasTapped:(TFTInterstitial *)interstitial;
- (void)tftInterstitialWasDismissed:(TFTInterstitial *)interstitial;

- (void)tftAppWallDidReceiveAd:(TFTAppWall *)appWall;
- (void)tftAppWall:(TFTAppWall *)appWall didFail:(NSString *)reason;
- (void)tftAppWallDidShow:(TFTAppWall *)appWall;
- (void)tftAppWallWasTapped:(TFTAppWall *)appWall;
- (void)tftAppWallWasDismissed:(TFTAppWall *)appWall;
```


