# Android - SDK Implementation #

##  Current Version ##
**4.0.0** - [See Changelog](/doc/android/changelog)

Supports Android 4.0 and up (API level 14)

##  General Information ##

Integrating Tap for Tap into your app is really easy! Follow the steps below to get started.

# Instructions (Android Studio) #

##  Step 1: Add Tap for Tap to Your Project.

- Download the [Tap for Tap Android SDK](https://github.com/tapfortap/Android/archive/master.zip).

- Unzip the SDK archive and add the following files to your project:
    - `TapForTap.aar`

- If your project doesn't have a libs folder create one and copy TapForTap.aar into it.

- Add the TapForTap library to your project's build:
    - Go to File -> New Module

    - Select the "Import .JAR or .AAR Package" option from the list under "More Modules", click "Next"

    - Use the file menu to select `TapForTap.aar`, Android Studio should fill in both text fields.

- In your app's build.gradle file (not the top-level project build.gradle, the application module's build.gradle), in the list of dependencies, add compile statements for the latest Android Support library, the latest Google Play Services library, and the TapForTap library. Sync Gradle files.

```
dependencies {
    compile "com.android.support:appcompat-v7:22.0.0"
    compile "com.google.android.gms:play-services:7.0.0"
    compile project(":TapForTap")
}
```

## Permissions

- **No extra permissions are necessary**, but building the .aar file into your project will automatically add the following permissions:

```xml
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />                
<uses-permission android:name="android.permission.ACCESS_COARSE_UPDATES" /> 
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.GET_TASKS" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="com.google.android.gms.permission.ACTIVITY_RECOGNITION"/>    
<uses-feature android:glEsVersion="0x00020000" android:required="true"/>
<uses-permission android:name="com.google.android.providers.gsf.permission.READ_GSERVICES"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.CALL_PHONE" />
<uses-permission android:name="android.permission.GET_ACCOUNTS" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="com.google.android.c2dm.permission.RECEIVE" />
<permission android:name="com.tapfortap.sdk.permission.C2D_MESSAGE" android:protectionLevel="signature" />
<uses-permission android:name="com.tapfortap.sdk.permission.C2D_MESSAGE" />
```

Depending on your project is set up, you may see the following compile error:

`Execution failed for task ':app:packageDebug' > Duplicate files copied in APK [some meta file]`

To resolve this, add the following to the same `build.gradle` file you modified earlier:

```
packagingOptions {
    exclude "META-INF/LICENSE.txt"
    exclude "META-INF/NOTICE.txt"
}
```

## Step 2 - Add Your API Key to Your AndroidManifest.xml

Add the following meta data tag to the `<application>` tag in your AndroidManifest.xml, replacing `MY_API_KEY` with your Tap for Tap
API key which can be found on the [account](https://tapfortap.com/manage/account) page

```xml
<meta-data
    android:name="com.tapfortap.API_KEY"
    android:value="MY_API_KEY"/>
```


## Step 3 - Initialize the SDK

In the `onCreate` method of your main Activity, add the following code, substituting your API key from the Tap for Tap web interface:

```
TapForTap.initialize(this, "YOUR_API_KEY");
```

## Step 4 - Display Ads

### Banners

Adding a banner to a `RelativeLayout`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <com.tapfortap.sdk.Banner
        android:id="@+id/banner"
        android:layout_width="320dip"
        android:layout_height="50dip"
        android:layout_alignParentTop="true"
        android:layout_centerHorizontal="true"
    />
</RelativeLayout>
```

### Break Interstitials

Showing an interstitial from an `Activity`:

- First create an InterstitialListener to receive callbacks when interstitials are loaded:

```java
import com.tapfortap.sdk.Interstitial;
import com.tapfortap.sdk.TapForTap;

public class MyActivity extends Activity {

    private Interstitial interstitial;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // Create an InterstitialListener
        Interstitial.InterstitialListener interstitialListener = new Interstitial.InterstitialListener() {
            @Override
            public void interstitialDidReceiveAd(Interstitial interstitial) {
                Log.i("MyActivity", "interstitialDidReceiveAd");
                interstitial.show();
            }

            @Override
            public void interstitialDidFail(Interstitial interstitial, String reason, Throwable throwable) {
                Log.i("MyActivity", "interstitialDidFail because: " + reason);
            }

            @Override
            public void interstitialDidShow(Interstitial interstitial) {
                Log.i("MyActivity", "interstitialDidShow");
            }

            @Override
            public void interstitialWasTapped(Interstitial interstitial) {
                Log.i("MyActivity", "interstitialWasTapped");
            }

            @Override
            public void interstitialWasDismissed(Interstitial interstitial) {
                Log.i("MyActivity", "interstitialWasDismissed");
            }

            @Override
            public void interstitialAdWasRewarded(Interstitial interstitial) {
                Log.i("MyActivity", "interstitialAdWasRewarded");
            }
        };
    }
}
```

- Then call `loadBreakInterstitial` to start loading:

```java
// Start loading a break interstitial
Interstitial.loadBreakInterstitial(this, interstitialListener);
```

Then later you can show the interstitial with `interstitial.show()`. You can make sure the interstitial is loaded with `interstitial.isReadyToShow()` if you want to be certain it's ready before showing it (recommended).


### Achievement and Rescue Interstitials

Achievement and Rescue interstitials work similarly to Break interstitials. You should use these at points in your application where you'd like to reward the user, or to allow them to continue playing by watching an advertisement.

- Create an InterstitialListener (as above)

- Call `loadAchievementInterstitial` or `loadRescueInterstitial`:

```java
// Start loading an achievement interstitial
// The extra arguments (achievementDescription, achievementRewardDescription, achievementRewardIconUrl) can be used for customizing the copy in the ads shown
Interstitial.loadAchievementInterstitial(this, "You beat the level!", "a free gift!", "http://yourdomain.com/app_logo.png", interstitialListener);
```

```java
// Start loading a rescue interstitial
// The extra arguments (rescueTitle, rescueBranding, rescueEnticement, rescueRewardDescription, rescueRewardIconUrl, rescueOptInText) can be used for customizing the copy in the ads shown
Interstitial.loadRescueInterstitial(this, "Need a Boost?", "My App", "Watch a short message", "Free boost", "http://yourdomain.com/app_logo.png", "Tap for your free boost!", interstitialListener); 
```

## Step 7 - Send Optional Information About Your Users
If you have information about your users that your privacy policy allows you to share with us,
you can improve performance and revenue by passing it along. Just set the info on `com.tapfortap.sdk.TapForTap`.
We accept year of birth, gender, location, and the account ID of user's on your system.

```java
TapForTap.setGender(<MALE or FEMALE>);
TapForTap.setYearOfBirth(<year>);
TapForTap.setLocation(<location>);
TapForTap.setUserAccountId(<accountId>);
```
Where gender is `either` `MALE` or `FEMALE`, `age` is a positive integer, `location` is an `android.location.Location` object, and user `account ID`s are strings.

**Note:** If you are using Tap for Tap's [monetization](/doc/monetization) program passing this information can greatly increase your revenue.
