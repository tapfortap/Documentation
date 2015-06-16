# Unity API Reference

## TapForTap

### Overview

This is the SDK's main class. It provides methods to:

  - Initialize Tap For Tap so ads can begin to be served
  - Set meta data about users to better ads can be served

### Special Considerations

If the Tap for Tap API key is set in the `AndroidManifest.xml` there is no need to call any of the initialize
methods as Tap for Tap will initialize itself.

### Methods

#### public static void initialize(String apiKey)

Initializes Tap for Tap with the provided API key.

**Parameters**

  - _apiKey_ - Your Tap for Tap API key. This can be found on your [account](https://tapfortap.com/manage/account) page.

---

#### public static void disableTapForTap()

Stops Tap for Tap from being able to download and show ads. This can be useful if you offer a
paid version of your app that removes ads.

---

#### public static void enableTapForTap()

Allows Tap for Tap to download and show ads. See [disableTapForTap](#public-static-void-disabletapfortap) for more details.

---

#### public static void setYearOfBirth(int yearOfBirth)

Sets the user's year of birth to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### public static void setGender(TapForTapGender gender)

Sets the user's gender to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### public static void setLocation(double latitude, double longitude)

Sets the user's location to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### public static void setUserAccountId(String userAccountId)

Sets the user's user account ID to be passed along when requesting an ad. This is an ID that you the
developer can assign to your users. This helps Tap for Tap to provide the best ad for this user.

---

## Banner

### Overview

This class is responsible for showing banners.

### Special Considerations

Do not use any of the public constructors as doing so may cause crashes. They are only available in order to allow the banners to be declared inside layout files. Only use the provided constructor methods when instantiating a banner programmatically.

The banner will stop downloading and showing new ads if the view is not visible or the screen is off.

### Methods

#### 	public static Banner create(BannerHorizontalAlignment horizontalAlignment, BannerVerticalAlignment verticalAlignment, int desiredWidth, int desiredHeight)


Creates and places a new banner and begins downloading and showing ads.
By combining a vertical and horizontal alignment you can place an advertisement in
one of 9 places. A `*` denotes a location where an ad can be placed on the screen.

<pre>
-----------
|*   *   *|
|         |
|*   *   *|
|         |
|*   *   *|
-----------
</pre>

**Parameters**

  - _horizontalAlignment_ - An BannerHorizontalAlignment enum.
  - _verticalAlignment_ - An BannerVerticalAlignment enum.
  - _desiredWidth_ - The desired width in device independent pixels.
  - _desiredHeight_ - The desired height in device independent pixels.

**Return Value**

  - _Banner_ - A new instance of a Banner.

---


#### public void startShowingAds()

Causes ads to start being downloaded and shown.

---

#### public void stopShowingAds()

Causes ads to stop being downloaded and shown.

---

#### public void enableAutoRollover()

Causes a new ad to be downloaded and shown aproximately every 60 seconds.

---

#### public void disableAutoRollover()

Stops a new ad from being downloaded and show approximately every 60 seconds. Only a call to [startShowinAds](public-void-startShowingAds) will cause a new ad to be downloaded and show.

---

#### public static InterstitialListener getInterstitialListener()

This is the default InterstitialListener, which has events that you can subscribe to.

**Return Value**

  - _InterstitialListener_ - A reference to the InterstitialListener.
  
---

#### public static BannerListener getBannerListener()

This is the default BannerListener, which has events that you can subscribe to.

**Return Value**

  - _InterstitialListener_ - A reference to the BannerListener.

## BannerListener

### Overview

This class provides events for the lifecycle of all banners in the application. The one default BannerListener can accessed by calling `TapForTap.getBannerListener()`.

### Events

#### bannerOnReceive

Raised when the banner receives a new ad.

---

#### bannerOnFail(string reason)

Raised when the banner fails to download or show a new ad.

**Parameters**

  - _reason_ - The reason for the failure.

---

#### bannerOnTap

Raised when a user taps on a banner.


## Interstitial

### Overview

This class is responsible for downloading and showing interstitials.

### Special Considerations

Always be sure that an interstitial is ready to be shown by either using the events or by using the
isReadyToShow method. Failure to do so may cause an ad to be shown at unexpected or undersireable times
due to network connectivity.

### Methods

#### public static Interstitial loadBreakInterstitial()

Creates and starts loading a Break interstitial.

**Return Value**

  - _Interstitial_ - A new instance of Interstitial.

---

#### public static Interstitial loadRescueInterstitial(string rescueTitle, string rescueBranding, string rescueEnticement, string rescueRewardDescription, string rescueRewardIconUrl, string rescueOptInText)


Creates and starts loading a Rescue interstitial..

**Parameters**

  - _rescueTitle_ - The title.
  - _rescueBranding_ - The branding.
  - _rescueEnticement_ - The enticement.
  - _rescueRewardIconUrl_ - The Reward Icon Url.
  - _rescueOptInText_ - The OptInText.

**Return Value**

  - _Interstitial_ - A new instance of Interstitial.

---

#### public static Interstitial loadAchievementInterstitial(string achievementDescription, string achievementRewardDescription, string achievementRewardIconUrl)


Creates and starts loading an Achievement interstitial with the provided listener.

**Parameters**

  - _achievementDescription_ - The description.
  - _achievementRewardDescription_ - The reward description.
  - _achievementRewardIconUrl_ - The Reward Icon Url.

**Return Value**

  - _Interstitial_ - A new instance of Interstitial.

---

#### public void show()

Causes an interstitial ad to be shown. This will launch a new [FullScreenAdActivity]().

---

#### public void load()

Causes a new interstitial to be loaded.

---

#### public boolean isReadyToShow()

Returns whether or not an interstitial is ready to show.

**Return Value**

  - _boolean_ - `true` if an interstitial is ready to show. `false` if an interstitial ad is not ready to show.

## InterstitialListener

### Overview

This class provides events for the lifecycle of all Interstitials in the application. The one default InterstitialListener can accessed by calling `TapForTap.getInterstitialListener()`.

### Events

#### interstitialDidReceiveAd

Called when a new ad is received and is ready to be shown.

---

#### interstitialDidFail(string reason)

Called when an interstitial fails to load or show an ad. An explicit call to load is required to get the next ad.

**Parameters**

  - _reason_ - The reason for the failure.

---

#### interstitialDidShow

Called when the interstitial was shown to the user.


---

#### interstitialWasTapped

Called when the user taps on the interstitial.


---

#### interstitialWasDismissed

Called when the user dismisses the interstitial.

---

#### interstitialAdWasRewarded

Called when the Ad was rewarded.
