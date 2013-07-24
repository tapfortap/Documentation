# Cocos2d-iPhone

To use Tap for Tap with Cocos2d-iPhone:

1. Download the [Tap for Tap SDK](https://github.com/tapfortap/Documentation/raw/master/downloads/TapForTap-iOS-SDK.zip)
2. [Integrate](http://tapfortap.com/doc/iOS) the SDK into your app

## For Cocos2d-iPhone 2.x:

### Display a TapForTapAdView:

```objc
  #import "TapForTap.h"
  ...
  TapForTapAdView* adView = [[TapForTapAdView alloc] initWithFrame:CGRectMake(0, 0, 320,50)];
  [[CCDirector sharedDirector].view addSubview:adView];
```

### Display an Interstital or AppWall

```objc
  #import "AppDelegate.h"
  #import "TapForTap.h"
  ...
  AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
  // [TapForTapAppWall showWithRootViewController:[app navController]];
  [TapForTapInterstitial showWithRootViewController:[app navController]];
```

## For Cocos2d-iPhone 1.x:

### Display a TapForTapAdView:

```objc
  #import "TapForTap.h"
  ...
  TapForTapAdView* adView = [[TapForTapAdView alloc] initWithFrame:CGRectMake(0, 25, 320,50)];
  [[[CCDirector sharedDirector] openGLView] addSubview:adView];
```

### To display an Interstital or AppWall:

1) Add a view controller property the the AppDelegate.h

```objc
  @property (nonatomic, retain) RootViewController *viewController;
```

2) Synthesize the property in AppDelegate.m

```objc
  @synthesize viewController;
```

```objc
  #import "AppDelegate.h"
  #import "TapForTap.h"
  ...
  UIViewController *rootViewController = (UIViewController*)[(AppDelegate*)[[UIApplication sharedApplication] delegate] viewController];
  // [TapForTapAppWall showWithRootViewController:rootViewController];
  [TapForTapInterstitial showWithRootViewController:rootViewController];
```
