# Android - SDK Integration

##  Step 1: Add Tap for Tap to Your Project in Android Studio

- Download the [Tap for Tap Android SDK](https://github.com/tapfortap/Android/archive/master.zip).

- Unzip the SDK archive and add the following files to your project:
    - `TapForTap.aar`

- If your project doesn't have a libs folder create one and copy TapForTap.aar into it.

- Add the TapForTap library to your project's build:
    - Go to File -> New Module

    - Select the "Import .JAR or .AAR Package" option from the list under "More Modules", click "Next"

    - Use the file menu to select `TapForTap.aar`, Android Studio should fill in both text fields.

- In your app's build.gradle file (not the top-level project build.gradle, the application module's build.gradle), in the list of dependencies, add compile statements for the latest Android Support library and the TapForTap library. Sync Gradle files.

```
dependencies {
    [...]
    compile 'com.android.support:appcompat-v7:22.2.0'
    compile project(":TapForTap")
}
```

### Permissions

- **No extra permissions are necessary**, but building the .aar file into your project will automatically add the following permissions:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_UPDATES" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-feature android:glEsVersion="0x00020000" android:required="true"/>
<uses-permission android:name="com.google.android.providers.gsf.permission.READ_GSERVICES"/>
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

For the best performance with display ads, take a look at our [placement do's and don'ts](/doc/make-money/dos-donts)

### Banners

![Example banner](/images/doc/banner.png)

Banners are the most basic type of ad. They are sized 640x100 and can be placed at either the top or bottom of any screen within your application. If you have the real estate on your app, show banners to earn maximum tap credits. Tap for Tap banners are MRAID compliant, and can show static or dynamic images.

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

![Example Break Unit](/images/doc/user-flow-break.jpg)

[View more info on the achievement moment, and best practices on placement](/doc/make-money/achievement-moment)

Showing an interstitial from an `Activity`:

- First create an InterstitialListener to receive callbacks when interstitials are loaded:

```java
import com.tapfortap.sdk.Interstitial;
import com.tapfortap.sdk.TapForTap;

public class MyActivity extends Activity {

    private Interstitial interstitial;
    private Interstitial.interstitialListener interstitialListener;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // Create an InterstitialListener
        interstitialListener = new Interstitial.InterstitialListener() {
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
interstitial = Interstitial.loadBreakInterstitial(this, interstitialListener);
```

Then later you can show the interstitial with `interstitial.show()`. You can make sure the interstitial is loaded with `interstitial.isReadyToShow()` if you want to be certain it's ready before showing it (recommended).


### Achievement and Rescue Interstitials
**Important**: MediaBrix must be integrated to enable these two ad types. View Step 5 below for instructions.

#### Achievement
![Example Achievement Unit](/images/doc/user-flow-achievement.jpg)

[View more info on the achievement moment, and best practices on placement](/doc/make-money/achievement-moment)

#### Rescue
![Example Achievement Unit](/images/doc/user-flow-rescue.jpg)

[View more info on the rescue moment, and best practices on placement](/doc/make-money/rescue-moment)

Achievement and Rescue interstitials work similarly to Break interstitials. For Achievement, you should use it at points in your application where you'd like to reward the user, and for Rescue, points where you'd allow them to continue playing by watching an advertisement.

- Create an InterstitialListener (as above with the Break interstitial)

- Call `loadAchievementInterstitial` or `loadRescueInterstitial`:

```java
// Start loading an achievement interstitial
// The extra arguments (achievementDescription, achievementRewardDescription, achievementRewardIconUrl) can be used for customizing the copy in the ads shown
interstitial = Interstitial.loadAchievementInterstitial(this, "You beat the level!", "a free gift!", "http://yourdomain.com/app_logo.png", interstitialListener);
```

```java
// Start loading a rescue interstitial
// The extra arguments (rescueTitle, rescueBranding, rescueEnticement, rescueRewardDescription, rescueRewardIconUrl, rescueOptInText) can be used for customizing the copy in the ads shown
interstitial = Interstitial.loadRescueInterstitial(this, "Need a Boost?", "My App", "Watch a short message", "Free boost", "http://yourdomain.com/app_logo.png", "Tap for your free boost!", interstitialListener);
```

## Step 5 - MediaBrix Integration (Optional)

Please [contact our support](mailto:support@tapfortap.com) and request credentials to use MediaBrix with Tap for Tap. The integration will be enabled automatically once you've added the following two elements to your AndroidManifest.xml and we approve your account.

1) Set the value for `mediabrixAppID` in your AndroidManifest.xml to the MediaBrix app ID that was provided to you:
```xml
<meta-data android:name="mediabrixAppID" android:value="YOUR_APP_ID_HERE"/>
```

2) Set `mediabrixProperty` in your AndroidManifest.xml to the MediaBrix property that was provided to you

```xml
<meta-data android:name="mediabrixProperty" android:value="YOUR_PROPERTY_HERE"/>
```

## Step 6 - Send Information About Your Users (Optional)
If you have information about your users that your privacy policy allows you to share with us,
you can improve performance and revenue by passing it along. Just set the info on `com.tapfortap.sdk.TapForTap`.
We accept year of birth, gender, location, and the account ID of user's on your system.

```java
TapForTap.setGender(<MALE or FEMALE>);
TapForTap.setYearOfBirth(<year>);
TapForTap.setLocation(<location>);
TapForTap.setUserAccountId(<accountId>);
```
Where gender is `either` `MALE` or `FEMALE`, `age` is a positive integer, `location` is an `android.location.Location` object, and user `account ID` is a string.

**Note:** If you are using Tap for Tap's [monetization network](/doc/make-money/monetization-network), passing this information can greatly increase your revenue.

## Now [return to the Getting Started Guide](/doc/getting-started) to finish integrating
