# Android 2.x -> 3.x Migration Guide

## Initialization

There is a new way to initialize your app with TapForTap. Simply add the following meta-data tag to your 
AndroidManifest.xml, replacing the `MY_API_KEY` with your accounts API key. There is no need to call explicitly call
initialize anymore, the SDK will handle that itself the first time you request an ad.

```xml
<meta-data
    android:name="com.tapfortap.API_KEY"
    android:value="MY_API_KEY"/>
```

## BannerAd

The AdView class has been change to BannerAd to better reflect what the class is. A BannerAd can still be
declared in a layout file using `com.tapfortap.BannerAd'. 

## Interstitial/App Wall (ie FullScreenAds)

FullScreen ads are no longer interacted with using static methods. You must get a new full screen ad instance by
using their respective factory methods.
