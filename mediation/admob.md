# AdMob Mediation

It's easy to integrate Tap for Tap into AdMob Medation, which will let you split your traffic across a number of ad networks. 
After [setting up AdMob mediation](https://support.google.com/admob/bin/answer.py?hl=en&answer=2413211&topic=2403413&ctx=topic) 
you just need to set up a [custom event](https://support.google.com/admob/bin/answer.py?hl=en&answer=2576174)

## Android
- Download the TapForTap SDK.
- Follow the [Android Integration Guide](/doc/AndroidIntegrationGuide) but add the `TapForTapAdMob.jar` instead of `TapForTap.jar` to your project.
- Add the `GoogleAdMobAdsSdk-x.x.x.jar` to your project.
- Use the class name `com.tapfortap.AdMobBanner` for banner custom events.
- Use the class name `com.tapfortap.AdMobInterstitial` for interstitial custom events.
- For an example app visit https://github.com/tapfortap/Android .

## iOS
- Downlaod the TapForTap SDK
- Follow the [iOS Integration Guide](/doc/iOSIntegrationGuide) but add the `TapForTapAdMob` folder to your project instead of the `TapForTap` folder.
- Add the files/frameworks necessary for `GoogleAdMobAdsSdkiOS-x-x-x`
- Use the class name `TFTAdMobBanner` for custom banner events. (`TapForTapAdMobBanner` is also supported for those 
of you who already have custom events setup)
- Use the class name `TFTAdMobInterstitial` for custom intersitial events. (`TapForTapAdMobInterstitial` is also supported 
for those of you who already have custom events setup)
- For an example app visit https://github.com/tapfortap/iOS .
