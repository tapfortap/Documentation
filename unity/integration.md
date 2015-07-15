# Unity - SDK Implementation #

##  General Information ##

Integrating Tap for Tap into your Unity Project is really easy! Follow the steps below to get started.

# Instructions (Unity) #

##  Step 1: Add Tap for Tap to Your Project.

- Download the [Tap for Tap Unity Plugin](https://github.com/tapfortap/Unity/archive/master.zip).

- Unzip the archive.

- Import the TapForTapUnity.unitypackage:
    - Go to Assets -> Import Package -> Custom Package...

    - Leave all files selected and click `Import`


## Step 2 - Initialize the SDK

To initialize TapForTap, call the following code and replace `YOUR_API_KEY` with your personal API Key.

```c#
TapForTap.API.TapForTap.initialize("YOUR_API_KEY");
```

## Step 3 - Display Ads

To use any of the following classes, you need to import the TapForTap API namespace.
Simply add ```using TapForTap.API;``` at the top of your script.

### Banners

To place a banner, just call `Banner.create (AdSize adSize, AdPosition position)`. The following call creates a banner at the bottom center of the screen, with the default device independent dimensions of 320x50.

```c#
Banner.create(AdSize.Banner, AdPosition.BottomCenter);
```

### Break Interstitials

Showing an break interstitial is easy.

- First make sure you have initialized the TapForTap SDK as described in step 3.

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

Achievement and Rescue interstitials work similarly to break interstitials. You should use these at points in your application where you'd like to reward the user, or to allow them to continue playing by watching an advertisement.


Calling `loadRescueInterstitial`:

```c#
    var interstitial = Interstitial.loadRescueInterstitial ("Need a Boost?", "My App", "Watch a short message", "Free boost", "http://yourdomain.com/app_logo.png", "Tap for your free boost!");

```

The "WasRewarded" event will fire when the user has interacted with the ad and should now receive his rescue (e.g. extra lives).

```c#
interstitial.WasRewarded += (s,e) => {
  //Give the player an extra live
  lives++;
};
```

Calling 'loadAchievementInterstitial':

```c#
    var interstitial = Interstitial.loadAchievementInterstitial ("You beat the level!", "a free gift!", "http://yourdomain.com/app_logo.png");
```

## Step 4 - Send Optional Information About Your Users
If you have information about your users that your privacy policy allows you to share with us,
you can improve performance and revenue by passing it along.
We accept year of birth, gender, location, and the account ID of users on your system.

```c#
TapForTap.setGender(<MALE or FEMALE>);
TapForTap.setYearOfBirth(<year>);
TapForTap.setLocation(<location>);
TapForTap.setUserAccountId(<accountId>);
```
Where gender is either `Gender.male` or `Gender.female`, `age` is a positive integer, `location` is two doubles (double latitude, double longitude), and user `account ID`s are strings.

**Note:** If you are using Tap for Tap's [monetization](/doc/monetization) program passing this information can greatly increase your revenue.


## Step 5 - Building the Project for Android and iOS

### Android

Android doesn't require any extra setup, just click Build & Run and connect your android device, Unity will do the rest.

### iOS

iOS Integration is a bit more difficult and requires a couple steps. But don't worry, just follow the steps and you will be up and running in no time!
Build & Run for iOS is currently broken (Unity 5.1.0p2 and XCode 6.3.2).

#### Step 1

Open the Build Settings, switch to the iOS Platform and click Build. After the build has succeeded, Unity will point you to the XCode project folder in Finder.
Open the Project by clicking on `Unity-iPhone.xcodeproj`.

#### Step 2

Follow the instructions up to step 4 [here](/doc/ios/integration). After that should should be able to build and run!

#### Remarks

Unity currently doesn't work with the iOS Simulator, you have to debug the game on an actual device (which requires an Apple Developer Account).
