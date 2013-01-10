# Cocos2d-iPhone

To use Tap for Tap with Cocos2d-iPhone:

1. Download the [Tap for Tap SDK](https://github.com/tapfortap/Documentation/raw/master/downloads/TapForTap-iOS-SDK.zip)
2. Integrate our SDK into your app [iOS](http://tapfortap.github.com/iOS) - You just need to follow the steps required to get your app to build with Tap for Tap

To display a TapForTapAdView:

```objc
     TapForTapAdView* adView = [[TapForTapAdView alloc] initWithFrame:CGRectMake(0, 0, 320,50)];
    [[CCDirector sharedDirector].view addSubview:adView];
```

To display an Interstital or AppWall

```objc
AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
// [TapForTapAppWall showWithRootViewController:[app navController]];
[TapForTapInterstitial showWithRootViewController:[app navController]];
```
