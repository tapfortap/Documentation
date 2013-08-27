# TapForTap Class Reference

**Name**            `TapForTap.java`

**Available In**    3.0.0

**Declared In**     `com.tapfortap.TapForTap.java`

**Related Classes** [InitializationListener](tapfortap_initialization_listener.md), [TapForTapGender](tapfortap_gender.md)

**Companion Guide**

**Sample Code**

## Overview

This is the SDK's main class. It provides methods to:

  - initialize Tap For Tap so ads can begin to be served
  - set meta data about users to better ads can be served

### Special Considerations

If the Tap for Tap API key is set in the `AndroidManifest.xml` there is no need to call any of the initialize methods as Tap for Tap will initialize itself.

## Tasks

### Initialize Tap For Tap
[public static initializeWithApiKey(String apiKey)](public-static-initializeWithApiKey-String-apiKey)  
[public static initializeWithApiKey(String apiKey2, TapForTap.InitializationListener listener)](public-static-initializeWithApiKeyString-apiKey-TapfortapInitializationListener-listener)  

### Set Mode
[public static void enableTestMode()](public-static-void-enableTestMode)  
[public static void disableTestMode()](public-static-void-disableTestMode)  
[public static void disableTapForTap()](public-static-void-disableTapForTap)  
[public static void enableTapForTap()](public-static-void-enableTapForTap)  

### Set User Meta Data
[public static void setYearOfBirth(int yearOfBirth)](public-static-void-setYearOfBirthint-yearOfBirth)  
[public static void setGender(TapForTapGender gender)](public-static-void-setGenderTapForTapGender-gender)  
[public static void setLocation(android.location.Location location)](public-static-void-setLocationandroidlocationLocation-location)  
[public static void setUserAccountId(String userAccountId)](public-static-void-setUserAccountIdString-userAccountId)  

## Class Methods

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

