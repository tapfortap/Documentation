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
