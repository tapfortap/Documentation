# Unity API Reference

## TapForTap

### Overview

This is the SDK's main class. It provides methods to:

  - Initialize Tap For Tap so ads can begin to be served
  - Set meta data about users to better ads can be served


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

Allows Tap for Tap to download and show ads.

---

#### public static void setYearOfBirth(int yearOfBirth)

Sets the user's year of birth to be passed along when requesting an ad. This helps Tap for Tap to provide
the best ad for this user.

---

#### public static void setGender(Gender gender)

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


### Methods

#### 	public static Banner create (AdSize adSize, AdPosition position)


Creates and places a new banner and begins downloading and showing ads.

**Parameters**

  - _adSize_ - An instance of AdSize specifying the size of the Banner.
  - _adPosition_ - An AdPosition enum specifying the position of the Banner on the screen.

**Return Value**

  - _Banner_ - A new instance of a Banner.

---


#### public void startShowingAds()

Causes ads to start being downloaded and shown.

---

#### public void stopShowingAds()

Stops showing *new* ads.
This can be used with showNewAd() to manually show new ads at a different interval.

---

#### public void hide()

This hides the banner, and stops it from loading any new ads.

---

#### public void show()

Shows the banner again, and starts downloading and showing ads every 60 seconds.

---
#### public void showNewAd()

This can be used to manually show a new ad.

### Events

There are a number of events you can subscribe to.

#### ReceivedAd(Banner, EventArgs.Empty)

This event is raised when the Banner received an ad.

---

#### FailedToLoad(Banner, AdFailedToLoadEventArgs)

This even is raised when the Banner failed to load an ad.

---

#### WasTapped(Banner, EventArgs.Empty)

This event is raised when the Banner was tapped.

---


## Interstitial

### Overview

This class is responsible for downloading and showing interstitials.

### Special Considerations

Always be sure that an interstitial is ready to be shown by either using the events or by using the
isReadyToShow method. Failure to do so may cause an ad to be shown at unexpected or undesirable times
due to network connectivity.

### Methods

#### public static Interstitial loadBreakInterstitial()

Creates and starts loading a Break interstitial.

**Return Value**

  - _Interstitial_ - A new instance of Interstitial.

---

#### public static Interstitial loadRescueInterstitial(string rescueTitle, string rescueBranding, string rescueEnticement, string rescueRewardDescription, string rescueRewardIconUrl, string rescueOptInText)


Creates and starts loading a Rescue interstitial.

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


Creates and starts loading an Achievement interstitial.

**Parameters**

  - _achievementDescription_ - The description.
  - _achievementRewardDescription_ - The reward description.
  - _achievementRewardIconUrl_ - The Reward Icon Url.

**Return Value**

  - _Interstitial_ - A new instance of Interstitial.

---

#### public void show()

Causes an interstitial ad to be shown. This will launch a new FullScreenAdActivity.

---

#### public boolean isReadyToShow()

Returns whether or not an interstitial is ready to show.

**Return Value**

  - _boolean_ - `true` if an interstitial is ready to show. `false` if an interstitial ad is not ready to show.

### Events

The Interstitial class provides a couple of events that are necessary for the lifecycle of the Interstitial.

#### Loaded(Interstitial, EventArgs.Empty)

This event is raised when the Interstitial has loaded.

---

#### FailedToLoad(Interstitial, AdFailedToLoadEventArgs)

This event is raised when the interstitial failed to load.

---

#### WasShown(Interstitial, EventArgs.Empty)

This event is raised when the Interstitial was shown.

---

#### WasTapped(Interstitial, EventArgs.Empty)

This event is raised when the Interstitial was tapped.

---

#### WasDismissed(Interstitial, EventArgs.Empty)

This event is raised when the Interstitial was dismissed.

---

#### WasRewarded(Interstitial, EventArgs.Empty)

This event is raised when the Interstitial was rewarded.
