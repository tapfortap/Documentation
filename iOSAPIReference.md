# iOS API Reference

## TFTTapForTap

### Overview

This is the SDK's main class. It provides methods to:

  - initialize Tap For Tap so ads can begin to be served
  - set meta data about users to better ads can be served

### Special Considerations

If the Tap for Tap API key is set in the `info.plist` there is no need to call any of the initialize methods as Tap for Tap will initialize itself.

### Methods

#### + (void)initializeWithApiKey:(NSString *) *)apiKey

Initializes Tap for Tap with the provided API key.

**Parameters**

  - _apiKey_ - Your Tap for Tap API key. This can be found on your [account](https://tapfortap.com/manage/account) page.

---

### + (void)initializeWithAPIKey:(NSString *)apiKey completion:(TFTInitializationRequestHandler)handler;

Initializes Tap for Tap with the provided API key and listener.

**Parameters**

  - _apiKey_ - Your Tap for Tap API key. This can be found on your [account](https://tapfortap.com/manage/account) page.
  - handler - A block for handling the callback.

---

#### + (void)enableTestMode

Enables test mode. Test mode causes Tap for Tap to disable spending and earning for your app. This is useful for when you are developing your app and want to test with the SDK integrated without wasting impressions and clicks for your app. **Don't forget** to disable test mode before you release your app to the play store.

---

#### + (void)disableTestMode

Disables test mode. See enableTestMode for more details.

---

#### + (void)disableTapForTap

Stops Tap for Tap from being able to download and show ads. This can be useful if you offer a paid version of your app that removes ads.

---

#### + (void)enableTapForTap

Allows Tap for Tap to download and show ads. See disableTapForTap for more details.

---

#### + (void)setYearOfBirth:(NSUInteger)yearOfBirth;

Sets the user's year of birth to be passed along when requesting an ad. This helps Tap for Tap to provide the best ad for this user.

---

#### + (void)setGender:(TFTGender)gender;

Sets the user's gender to be passed along when requesting an ad. This helps Tap for Tap to provide the best ad for this user.

---

#### + (void)setLocation:(CLLocation *)location;

Sets the user's location to be passed along when requesting an ad. This helps Tap for Tap to provide the best ad for this user.

---

#### + (void)setUserAccountId:(NSString *)userAccountId;

Sets the user's user account ID to be passed along when requesting an ad. This is an ID that you the developer can assign to your users. This helps Tap for Tap to provide the best ad for this user.

## TFTBanner

### Overview

This class is responsible for showing banner ads.

The Banner will stop downloading and showing new ads if the view is not visible or the screen is off.

### Methods

#### + (TFTBanner *)bannerWithFrame:(CGRect)frame;

Creates a new Banner and begins downloading and showing ads.

**Parameters**

  - frame - The frame for the view

**Return Value**

  - _TFTBanner_ - a new instance of a TFTBanner

---

#### + (TFTBanner *)bannerWithFrame:(CGRect)frame delegate:(id<TFTBannerDelegate>)delegate;

Creates a new Banner and begins downloading and showing ads.

**Parameters**

  - frame - The frame for the view
  - delegate - A delegate to handle the callbacks

**Return Value**

  - _TFTBanner_ - a new instance of a Banner

#### - (void)startShowingAds

Causes ads to start being downloaded and shown.

---

#### - (void)stopShowingAds

Causes ads to stop being downloaded and shown.

---

#### @propert autoRollover

If set to YES, causes a new ad to be downloaded and shown aproximately every 60 seconds. If set to NO only a call to startShowinAds will cause a new ad to be downloaded and show.

---

## TFTBannerDelegate

### Overview

This interface provides callback methods into the current status of the TFTBanner.

### Methods

#### - (void)tapForTapBannerDidReceive:(TFTBanner *)banne;

Called when the Banner receives a new ad.

**Parameters**

  - _banner_ - The Banner that received a new ad.

---

#### - (void)tapForTapBanner:(TFTBanner *)banner didFail:(NSString *)reason;

Called when the Banner fails to download or show a new ad.

**Parameters**

  - _banner_ - The Banner that failed.
  - reason_ - A summary of the reason for the failure.

---

#### - (void)tapForTapBannerWasTapped:(TFTBanner *)banner;

Called when a user taps on an ad.

**Parameters**

  - _banner_ - The Banner that was tapped.
  
## TFTInterstitial

### Overview

This class is responsible for downloading and showing interstitial ads.

### Special Considerations

Always be sure that an interstitial is ready to be shown by either using the callbacks or by using the isReadyToShow method. Failure to do so may cause an ad to be shown at unexpected or undersireable times due to network connectivity.

### Methods

#### + (TFTInterstitial *)interstitial;

Creates and starts loading an interstitial

**Return Value**

  - TFTInterstitial - A new instance of Interstitial.

---

#### + (TFTInterstitial *)interstialWithDelegate:(id<TFTInterstitialDelegate>) delegate;

Creates and starts loading an interstitial with the provided listener.

**Parameters**

  - _delegate_ - A delegate.

**Return Value**

  - _TFTInterstitial_ - A new instance of Interstitial.

---

#### - (void)show

Causes an interstitial ad to be shown and a new interstitial to be loaded. This will push a new view controller.

---

#### - (void)load

Causes a new interstitial to be loaded.

---

#### BOOL readyToShow

`true` if an interstitial is ready to show. `false` if an interstitial ad is not ready to show.

## TFTInterstitialDelegate

### Overview

This interface provides callback methods into the lifecycle of the interstitial ad.

### Methods

#### - (void)tapForTapInterstitialDidReceiv:(TFTInterstitial *)interstitial;

Called when a new ad is received and is ready to be shown.

**Parameters**

  - _interstitial_ - The Interstitial which received a new ad.

---

#### - (void)tapForTapInterstitial:(TFTInterstitial *)interstitial didFail:(NSString *)reason;

Called when an ad fails to load. An explicit call to load is required to get the next ad.

**Parameters**

  - _interstitial_ - The Interstitial which received a new ad.
  - _reason_ - The reason why the ad failed.

---

#### - (void)tapForTapInterstitialDidShow:(TFTInterstitial *)interstitial;

The interstitial ad was shown to the user.

**Parameters**

  - _interstitial_ - The TapForTApInterstitial which received a new ad.

---

#### - (void)tapForTapInterstitialWasTapped:(TFTInterstitial *)interstitial;

The user tapped on the interstitial ad.

**Parameters**

  - _interstitial_ - The TFTInterstitial which received a new ad.

---

#### - (void)tapForTapInterstitialWasDismissed:(TFTInterstitial *)interstitial;

The user dismissed the interstitial ad.

**Parameters**

  - _interstitial_ - The TFTInterstitial which received a new ad.

## TFTAppWall

### Overview

This class is responsible for downloading and showing appWall ads.

### Special Considerations

Always be sure that an appWall is ready to be shown by either using the callbacks or by using the isReadyToShow method. Failure to do so may cause an ad to be shown at unexpected or undersireable times due to network connectivity.

### Methods

#### + (TFTAppWall *)appWall;

Creates and starts loading an appWall

**Return Value**

  - TFTAppWall - A new instance of AppWall.

---

#### + (TFTAppWall *)appWallWithDelegate:(id<TFTAppWallDelegate>) delegate;

Creates and starts loading an appWall with the provided listener.

**Parameters**

  - _delegate_ - A delegate.

**Return Value**

  - _TFTAppWall_ - A new instance of AppWall.

---

#### - (void)show

Causes an appWall ad to be shown and a new appWall to be loaded. This will push a new view controller.

---

#### - (void)load

Causes a new appWall to be loaded.

---

#### BOOL readyToShow

`true` if an appWall is ready to show. `false` if an appWall ad is not ready to show.

## TFTAppWallDelegate

### Overview

This interface provides callback methods into the lifecycle of the appWall ad.

### Methods

#### - (void)tapForTapAppWallDidReceive:(TFTAppWall *)appWall;

Called when a new ad is received and is ready to be shown.

**Parameters**

  - _appWall_ - The AppWall which received a new ad.

---

#### - (void)tapForTapAppWall:(TFTAppWall *)appWall didFail:(NSString *)reason;

Called when an ad fails to load. An explicit call to load is required to get the next ad.

**Parameters**

  - _appWall_ - The AppWall which received a new ad.
  - _reason_ - The reason why the ad failed.

---

#### - (void)tapForTapAppWallDidShow:(TFTAppWall *)appWall;

The appWall ad was shown to the user.

**Parameters**

  - _appWall_ - The TapForTApAppWall which received a new ad.

---

#### - (void)tapForTapAppWallWasTapped:(TFTAppWall *)appWall;

The user tapped on the appWall ad.

**Parameters**

  - _appWall_ - The TFTAppWall which received a new ad.

---

#### - (void)tapForTapAppWallWasDismissed:(TFTAppWall *)appWall;

The user dismissed the appWall ad.

**Parameters**

  - _appWall_ - The TFTAppWall which received a new ad.