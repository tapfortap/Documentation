# Unity - SDK Implementation

[![Watch our Unity integration video](/images/doc/unity-integration-video.jpg)](https://www.youtube.com/watch?v=sf1w2YTbXq4)

##  Step 1: Add Tap for Tap to Your Project

- Make sure Unity is updated to the latest version and is running at least version 5.0
- Download the [Tap for Tap Unity Plugin](https://github.com/tapfortap/Unity/archive/master.zip).

- Unzip the archive.

- Import the TapForTapUnity.unitypackage:
    - Go to Assets -> Import Package -> Custom Package...

    - Leave all files selected and click `Import`

### Permissions

- Importing the Tap for Tap Plugin into your project will automatically add the following permissions:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" /> <!-- Required for caching image-based ads -->
<uses-permission android:name="android.permission.READ_PHONE_STATE" /> <!-- Required for identifying purposes -->
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" /> <!-- Required for identifying purposes  -->
```

- **Although optional - to ensure the TapForTap SDK functions optimally we highly recommend adding these extra permissions**
To add these permissions, modify the 'AndroidManifest.xml' found in '/Assets/Android/AndroidManifest.xml'.

```xml
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```


## Step 2 - Initialize the SDK

To initialize TapForTap, call the following code and replace `YOUR_API_KEY` with your personal API Key, which can be found on the [account](https://tapfortap.com/manage/account) page.

```c#
TapForTap.API.TapForTap.initialize("YOUR_API_KEY");
```

## Step 3 - Display Ads

To use any of the following classes, you need to import the TapForTap API namespace.
Simply add ```using TapForTap.API;``` at the top of your script.

For the best performance with display ads, take a look at our [placement do's and don'ts](/doc/make-money/dos-donts)

### Banners

![Example banner](/images/doc/banner.png)

Banners are the most basic type of ad. They are sized 640x100 and can be placed at either the top or bottom of any screen within your application. If you have the real estate on your app, show banners to earn maximum tap credits. Tap for Tap banners are MRAID compliant, and can show static or dynamic images.

To place a banner, just call `Banner.create (AdSize adSize, AdPosition position)`. The following call creates a banner at the bottom center of the screen, with the default device independent dimensions of 320x50.

```c#
Banner.create(AdSize.Banner, AdPosition.BottomCenter);
```

### Break Interstitials

![Example Break Unit](/images/doc/user-flow-break.jpg)

[View more info on the achievement moment, and best practices on placement](/doc/make-money/achievement-moment)

- First make sure you have initialized the TapForTap SDK as described in step 2.

- Call `Interstitial.loadBreakInterstitial()` to create a new Break Interstitial. The method returns an Interstitial - make sure to store it! You will need it later to show the Interstitial once it has loaded.

```c#
    var interstitial = Interstitial.loadBreakInterstitial();
```

- Subscribe to the `Loaded` event.

```c#
    interstitial.Loaded += (s,e) => {
      interstitial.show();
    };
```

### Achievement and Rescue Interstitials

#### Achievement
![Example Achievement Unit](/images/doc/user-flow-achievement.jpg)

[View more info on the achievement moment, and best practices on placement](/doc/make-money/achievement-moment)

#### Rescue
![Example Achievement Unit](/images/doc/user-flow-rescue.jpg)

[View more info on the rescue moment, and best practices on placement](/doc/make-money/rescue-moment)

**Important**: By default, you will only see a sample rescue interstitial. MediaBrix must be integrated to properly use rescue interstitials. View Step 5 below for instructions.

Achievement and Rescue interstitials work similarly to Break interstitials. For Achievement, you should use it at points in your application where you'd like to reward the user, and for Rescue, points where you'd allow them to continue playing by watching an advertisement.

Calling `loadRescueInterstitial`:

```c#
    var interstitial = Interstitial.loadRescueInterstitial ("Need a Boost?", "My App", "Watch a short message", "Free boost", "http://yourdomain.com/app_logo.png", "Tap for your free boost!");

```

The "WasRewarded" event will fire when the user has interacted with the ad and should now receive his rescue (e.g. extra lives).

```c#
interstitial.WasRewarded += (s,e) => {
  //Give the player a couple of extra lives
  lives = lives + 5;
};
```

Calling 'loadAchievementInterstitial':

```c#
    var interstitial = Interstitial.loadAchievementInterstitial ("You beat the level!", "a free gift!", "http://yourdomain.com/app_logo.png");
```

## Step 4 - Send Information About Your Users (Optional)

If you have information about your users that your privacy policy allows you to share with us, you can improve performance and revenue by passing it along.
We accept year of birth, gender, location, and the account ID of users on your system.

```c#
TapForTap.setGender(<MALE or FEMALE>);
TapForTap.setYearOfBirth(<year>);
TapForTap.setLocation(<location>);
TapForTap.setUserAccountId(<accountId>);
```
Where gender is either `Gender.male` or `Gender.female`, `age` is a positive integer, `location` is two doubles (double latitude, double longitude), and user `account ID`s are strings.

**Note:** If you are using Tap for Tap's [monetization network](/doc/make-money/monetization-network), passing this information can greatly increase your revenue.


## Step 5 - Building the Project for Android and iOS

### Android

Android doesn't require any extra setup, just click Build & Run and connect your android device, Unity will do the rest.

### iOS

iOS Integration requires a couple more steps than Android. Build & Run for iOS is currently broken (Unity 5.1.0p2 and XCode 6.3.2).

#### Step 1

Open the Build Settings, switch to the iOS Platform and click Build. After the build has succeeded, Unity will point you to the XCode project folder in Finder.
Open the Project by clicking on `Unity-iPhone.xcodeproj`.

#### Step 2

Follow the instructions up to step 4 [here](/doc/ios/integration). After that you should be able to build and run!

#### Remarks

Unity currently doesn't work with the iOS Simulator, you have to debug the game on an actual device (which requires an Apple Developer Account).
