# Cocos2d-iPhone

To use Tap for Tap with Cocos2d-iPhone:

1. Download the [Tap for Tap SDK](https://github.com/tapfortap/Documentation/raw/master/downloads/TapForTap-iOS-SDK.zip)
2. [Integrate](http://tapfortap.com/documentation/iOS) the SDK into your app 

A simple example to display a TapForTapAdView:

```objc
     TapForTapAdView* adView = [[TapForTapAdView alloc] initWithFrame:CGRectMake(0, 0, 320,50)];
    [[CCDirector sharedDirector].view addSubview:adView];
```

A simple example to display an Interstital or AppWall

```objc
AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
// [TapForTapAppWall showWithRootViewController:[app navController]];
[TapForTapInterstitial showWithRootViewController:[app navController]];
```
