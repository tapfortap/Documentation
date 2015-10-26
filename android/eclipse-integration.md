# Android - SDK Eclipse Integration



##  Step 1: Add Tap for Tap to Your Project in Eclipse

- Download the [Tap for Tap Android SDK](https://github.com/tapfortap/Android/archive/master.zip) for eclipse.

- Unzip the SDK archive and go to `eclipsesdk` directory.

- If your project doesn't have a `libs` folder create one and copy `TapForTap.jar, Okio-1.6.0.jar, and Okhttp-2.5.0.jar` from the `eclipsesdk` directory into your project's `libs` folder.

- Add the libraries to your project's build:
    - Go to Project -> Properties -> Java Build Path

    - In the Libraries tab, click on Add JARs -> select the downloaded JARs -> OK -> OK.

- In your app's AndroidManifest.xml file add the following lines for showing Interstitial Ads.

```xml
<activity android:name="com.tapfortap.sdk.FreeformFullScreenAdActivity"
            android:label="FreeFormFullScreenAd"
            android:screenOrientation="portrait" >
        </activity>
        <activity
            android:name="com.tapfortap.sdk.FullScreenAdActivity"
            android:label="FullScreenAd"
            android:screenOrientation="portrait" >
        </activity>
        <activity
            android:name="com.tapfortap.sdk.TemplatedFullScreenAdActivity"
            android:label="TemplatedFullScreenAd"
            android:screenOrientation="portrait" >
        </activity>
         <activity
            android:name="com.tapfortap.sdk.VideoAdActivity"
            android:label="VideoAd"
            android:screenOrientation="portrait" >
        </activity>
```


### Permissions

- You need to add the following permissions in your project's AndroidManifest.xml file :

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/> 
```



## Step 1 - Initialize the SDK

In the `onCreate` method of your main Activity, add the following code, substituting your API key from the Tap for Tap web interface.

```java
TapForTap.initialize(this, "YOUR_API_KEY");
```

## Step 2 - Display Ads

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

[View more info on the break moment, and best practices on placement](/doc/make-money/break-moment)

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

- Then call `loadBreakInterstitial` to start loading:

```java
// Start loading a break interstitial
interstitial = Interstitial.loadBreakInterstitial(this, interstitialListener);
```

Depending on your application you can show the interstitial as soon as `interstitialDidReceiveAd` gets called with `interstitial.show()` or
if you don't want to show the interstitial as soon as it's loaded, you can always check if the interstitial is loaded with `interstitial.isReadyToShow()` and then show it.

For best experience it's always recommended to call the `TapForTap.initialize(this, "YOUR_API_KEY")` right when your App starts in the OnCreate method. Then having the call for Interstitial behind a button or some other trigger so that the SDK has enough time to initialize before it can load the Ads for you.


### Achievement and Rescue Interstitials

#### Achievement
![Example Achievement Unit](/images/doc/user-flow-achievement.jpg)

[View more info on the achievement moment, and best practices on placement](/doc/make-money/achievement-moment)

Achievement interstitials work similarly to Break interstitials. For Achievement, you should use it at points in your application where you'd like to reward the user.

- Create an InterstitialListener (as above with the Break interstitial)

- Call `loadAchievementInterstitial`

```java
// Start loading an achievement interstitial
// The extra arguments (achievementDescription, achievementRewardDescription, achievementRewardIconUrl) can be used for customizing the copy in the ads shown
interstitial = Interstitial.loadAchievementInterstitial(this, "You beat the level!", "a free gift!", "http://yourdomain.com/app_logo.png", interstitialListener);
```

## Step 3 - Send Information About Your Users (Optional)
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
