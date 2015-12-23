# Android - SDK Integration

[![Watch our Android integration video](/images/doc/android-integration-video.jpg)](https://www.youtube.com/watch?v=jBfO1_pUKb8)

##  Step 1: Add Tap for Tap to Your Project in Android Studio

**Make sure your JDK is at least version 7 before continuing**

- Download the [Tap for Tap Android SDK](https://github.com/tapfortap/Android/archive/master.zip).

- Unzip the SDK archive

- If your project doesn't have a libs folder create one and copy TapForTap.aar into it.

- Add the TapForTap library to your project's build:
    - Go to File -> New Module

    - Select the "Import .JAR or .AAR Package" option from the list under "More Modules", click "Next"

    - Use the file menu to select `TapForTap.aar`, Android Studio should fill in both text fields.

- In your app's build.gradle file (not the top-level project build.gradle, the application module's build.gradle), in the list of dependencies, add compile statements for the latest Android Support library, OkHttp and the TapForTap library. Sync Gradle files.

```
dependencies {
    [...]
    compile 'com.android.support:appcompat-v7:23.0.0'
    compile 'com.google.android.gms:play-services:8.1.0'
    compile 'com.squareup.okhttp:okhttp:2.4.0'
    compile project(":TapForTap")
}
```

- If you want to use any of our plugins, refer to the guide [here](https://tapfortap.com/doc/android/plugins) on how to use integrate those plugins.

### Permissions

- Building the .aar file into your project will automatically add the following permissions:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/> <!-- Required for identifying purposes  -->
```

### First build

- Depending on how your project is set up, you may see the following compile errors on your first build:

`Execution failed for task ':app:packageDebug' > Duplicate files copied in APK [some meta file]`

To resolve this, add the following to the same `build.gradle` file you modified earlier:

```
packagingOptions {
    exclude "META-INF/LICENSE.txt"
    exclude "META-INF/NOTICE.txt"
}
```

## Step 2 - Initialize the SDK

In the `onCreate` method of your main Activity, add the following code, substituting your API key from the Tap for Tap web interface if you don't want to use any plugins:

```java
TapForTap.initialize(this, "YOUR_API_KEY");
```

## Step 3 - Display Ads

For the best performance with display ads, take a look at our [placement do's and don'ts](/doc/make-money/dos-donts)

### Achievement Interstitials

![Example Achievement Unit](/images/doc/user-flow-achievement.jpg)

[View more info on the achievement moment, and best practices on placement](/doc/make-money/achievement-moment)

You should use Achievement Interstitials at points in your application where you'd like to reward the user.

Showing an interstitial from an `Activity`:

- First create an InterstitialListener to receive callbacks when interstitials are loaded:

```java
import com.tapfortap.sdk.Interstitial;
import com.tapfortap.sdk.TapForTap;

public class MyActivity extends Activity {

    private Interstitial interstitial;
    private Interstitial.InterstitialListener interstitialListener;

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

- Call `loadAchievementInterstitial`:

```java
// Start loading an achievement interstitial
// The extra arguments (achievementDescription, achievementRewardDescription, achievementRewardIconUrl) can be used for customizing the copy in the ads shown
interstitial = Interstitial.loadAchievementInterstitial(this, "You beat the level!", "a free gift!", "http://yourdomain.com/app_logo.png", interstitialListener);
```

*To find more information on how to use Break and Rescue interstitials, please contact us at: <chris.lefebvre@tapfortap.com>*

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


## Step 4 - Send Information About Your Users (Optional)
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
