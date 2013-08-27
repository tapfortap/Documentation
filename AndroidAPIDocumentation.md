# Android API Reference

## TapForTap

### public static initializeWithApiKey(String apiKey)

Initializes Tap for Tap with the provided API key.

**Parameters**

  - _apiKey_ - Your Tap for Tap API key. This can be found on your [account](https://tapfortap.com/manage/account) page.

---

### public static initializeWithApiKey(String apiKey, TapForTap.InitializationListener listener)

Initializes Tap for Tap with the provided API key and listener.

**Parameters**

  - _apiKey_ - Your Tap for Tap API key. This can be found on your [account](https://tapfortap.com/manage/account) page.
  - _listener_ - A listener for handling the callbacks.

***

### public static void enableTestMode()

Enables test mode. Test mode causes Tap for Tap to disable spending and earning for your app. This is useful for when you are developing your app and want to test with the SDK integrated without wasting impressions and clicks for your app. **Don't forget** to disable test mode before you release your app to the play store.

---

### public static void disableTestMode()

Disables test mode. See [enableTestMode](public-static-void-enableTestMode()) for more details.

---

### public static void disableTapForTap()

Stops Tap for Tap from being able to download and show ads. This can be useful if you offer a paid version of your app that removes ads.

---

### public static void enableTapForTap()

Allows Tap for Tap to download and show ads. See [disableTapForTap](public-static-void-disableTapForTap()) for more details.

---

### public static void setYearOfBirth(int yearOfBirth)

Sets the user's year of birth to be passed along when requesting an ad. This helps Tap for Tap to provide the best ad for this user.

---

### public static void setGender(TapForTapGender gender)

Sets the user's gender to be passed along when requesting an ad. This helps Tap for Tap to provide the best ad for this user.

---

### public static void setLocation(android.location.Location location)

Sets the user's location to be passed along when requesting an ad. This helps Tap for Tap to provide the best ad for this user.

---

### public static void setUserAccountId(String userAccountId)

Sets the user's user account ID to be passed along when requesting an ad. This is an ID that you the developer can assign to your users. This helps Tap for Tap to provide the best ad for this user.


## BannerAd

### public static BannerAd createAndShow(Context context)

Creates a new BannerAd and begins downloading and showing ads.

**Parameters**

  - _context_ - An Android context (application context is acceptable)

**Return Value**

  - _BannerAd_ - a new instance of a BannerAd

---

### public static BannerAd createAndShow(Context context, BannerAdListener bannerAdListener)

Creates a new BannerAd and begins downloading and showing ads.

**Parameters**

  - _context_ - An Android context (application context is acceptable)
  - _bannerAdListener_ - A listener

**Return Value**

  - _BannerAd_ - a new instance of a BannerAd

## Instance Method

### public void setBannerAdListener(BannerAdListener bannerAdListener)

Sets a listener on the BannerAds. This should only be used if the BannerAd is decalared in a layout it is retrieved using Android's `findViewBytId(int id)` method. Otherwise use the factory methods [createAndShow(context, bannerAdListener)](public-static-BannerAd-createAndShowContext-context-BannerAdListener-bannerAdListener)  

**Parameters**

  - _bannerAdListener_ - An listener

---

### public void startShowingAds()

Causes ads to begin being downloaded and shown.

---

### public void stopShowingAds()

Causes ads to stop being downloaded and shown.

---

#### public void enableAutoRollover()

Causes a new ad to be downloaded and shown aproximately every 60 seconds.

---

#### public void disbleAutoRollover()

Stops ads a new ad from being downloaded and show approximately every 60 seconds. Only a call to [startShowinAds](public-void-startShowingAds) will cause a new ad to be downloaded and show.

## BannerAdListener

### public void bannerAdOnReceive(BannerAd bannerAd)

Called when the BannerAds receives a new ad.

**Parameters**

  - _bannerAd_ - The banner ad which received a new ad.

---

### public void bannerAdOnFail(BannerAd bannerAd, String message, Throwable throwable)

Called when the BannerAd fails to download or show a new ad.

**Parameters**

  - _bannerAd_ - The banner ad which failed
  - _message_ - The summary of the reason for the failure
  - _throwable_ - The exception that caused the failure.

---

###public void bannerAdOnTap(BannerAd bannerAd)

Called when a user taps on an ad.

**Parameters**

  - _bannerAd_ - The banner ad which was tapped.
  
## InterstitialAd

# Interstitial Ad

**Name** InterstitialAd

**Available Starting In**   3.0.0

**Declared In**    com.TapForTap.InterstitialAd

**Related Classes**  [InterstitialAd.InterstitialAdListener](interstitial_ad_listener.md)

**Companion Guide** 

**Sample Code**      

## Overview

This class is responsible for downloading and showing interstitial ads.

### Special Considerations

Always be sure that an interstitial is ready to be shown by either using the callbacks or by using the isReadyToShow method. Failure to do so may cause an ad to be shown at unexpected or undersireable times due to network connectivity.

## Tasks

### Creation
[public static InterstitialAd createAndLoad(Context context)](public-static-InterstitialAd-createAndLoad-Context-context)
[public static InterstitialAd createAndLoad(Context context, final InterstitialAdListener interstitialAdListener)](public-static-InterstitialAd-createAndLoadContext-context-final-InterstitialAdListener-interstitialAdListener)

### Life Cycle
[public void show()](public-void-show)
[public void load()](public-void-load)
[public boolean isReadyToShow()](public-boolean-isReadyToShow)

## Class Methods
### public static InterstitialAd createAndLoad(Context context)

Creates and starts loading an interstitial

**Parameters**

  - _context_ - An Android context.

**Return Value**

  - _InterstitialAd_ - A new instance of InterstitialAd.

---

### public static InterstitialAd createAndLoad(Context context, final InterstitialAdListener interstitialAdListener)

Creates and starts loading an interstitial with the provided listener.

**Parameters**

  - _context_ - An Android context.
  - listener_ - A listener.

**Return Value**

  - _InterstitialAd_ - A new instance of InterstitialAd.

---

## Instance Methods
### public void show()

Causes an interstitial ad to be shown, a new interstitial to be loaded. This will launch a new [FullScreenAdActivity]()

---

### public void load()

Causes a new interstitial to be loaded.

---

### public boolean isReadyToShow()

Returns whether or not an interstitial is ready to show.

**Return Value**

  - _boolean_ - `true` if an interstitial is ready to show. `false` if an interstitial ad is not ready to show.

## InterstitialAdListener

### public void interstitialAdOnReceive(InterstitialAd ad)

Called when a new ad is received and is ready to be shown.

**Parameters**

  - _ad_ - The InterstitialAd which received a new ad.

---

### public void interstitialAdOnFail(InterstitialAd ad, String message, Throwable throwable)

Called when an ad fails to load. An explicit call to load is required to get the next ad.

**Parameters**

  - _ad_ - The InterstitialAd which received a new ad.

---

### public void interstitialAdOnShow(InterstitialAd ad)

The interstitial ad was shown to the user.

**Parameters**

  - _ad_ - The InterstitialAd which received a new ad.

---

### public void interstitialAdOnTap(InterstitialAd ad)

The user tapped on the interstitial ad.

The user dismissed the interstitial ad.

**Parameters**

  - _ad_ - The InterstitialAd which received a new ad.

---

### public void interstitialAdOnDismiss(InterstitialAd ad)

## AppWallAd

### public static AppWallAd createAndLoad(Context context)

Creates and starts loading an appWall

**Parameters**

  - _context_ - An Android context.

**Return Value**

  - _AppWallAd_ - A new instance of AppWallAd.

---

### public static AppWallAd createAndLoad(Context context, final AppWallAdListener appWallAdListener)

Creates and starts loading an appWall with the provided listener.

**Parameters**

  - _context_ - An Android context.
  - listener_ - A listener.

**Return Value**

  - _AppWallAd_ - A new instance of AppWallAd.

---

## Instance Methods
### public void show()

Causes an appWall ad to be shown, a new appWall to be loaded. This will launch a new [FullScreenAdActivity]()

---

### public void load()

Causes a new appWall to be loaded.

---

### public boolean isReadyToShow()

Returns whether or not an appWall is ready to show.

**Return Value**

  - _boolean_ - `true` if an appWall is ready to show. `false` if an appWall ad is not ready to show.

## AppWallAdListener


### public void appWallAdOnReceive(AppWallAd ad)

Called when a new ad is received and is ready to be shown.

**Parameters**

  - _ad_ - The AppWallAd which received a new ad.

---

### public void appWallAdOnFail(AppWallAd ad, String message, Throwable throwable)

Called when an ad fails to load. An explicit call to load is required to get the next ad.

**Parameters**

  - _ad_ - The AppWallAd which received a new ad.
  - _message_ - A summary of the error.
  - _throwable_ - The exception that caused the error.

---

### public void appWallAdOnShow(AppWallAd ad)

The appWall ad was shown to the user.

**Parameters**

  - _ad_ - The AppWallAd which received a new ad.

---

### public void appWallAdOnTap(AppWallAd ad)

The user tapped on the appWall ad.

The user dismissed the appWall ad.

**Parameters**

  - _ad_ - The AppWallAd which received a new ad.

---

### public void appWallAdOnDismiss(AppWallAd ad)
