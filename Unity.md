# Tap for Tap Unity Plugin

Want to use Tap for Tap with Unity? We got you covered on Android and iOS.

##  Preamble
This Unity plugin was built and tested against Unity 3.5 and tested againts 4.0.

### Minimum Requirements

#### Android
- 2.2.0 and up

#### iPhone
- An OS X machine running Lion (10.7)
- iOS 6.0 SDK to build as we use the AdSupport framework
- Support iOS target platform 4.3 and up

##  Integration
If you don't have the plugin yet then [download the Unity plugin here](https://github.com/tapfortap/Unity/raw/master/release/TapForTap-Unity-1.2.0.unitypackage).

Installing the Tap for Tap Unity Plugin is easy. This isn't a Unity tutorial so we
assume that you have a Unity project already set up and working. The first thing you
need to do is import the TapForTap.unitypackage into your app 
Then follow the steps below for configuring iOS and Android.

### Configuring Tap for Tap for iOS
When Xcode loads you will need to add the AdSupport framework to your build target.
In the project explorer on the left side of Xcode 4:

- Select your project from the very top.
- Select your app's target.
- Select the Build Phases tab.
- Expand Link Binaries With Libraries.
- Click the + button.
- Select the AdSupport.framework
- Click add

### Configuring Tap for Tap for Android
A few additions need to be made to Unity's AndroidManifest.xml. If you do not
have a custom manifest Unity recommends to create your own under the `Assets/Plugins/Android `folder ([Unity docs](http://docs.unity3d.com/Documentation/Manual/PluginsForAndroid.html)).
Or you can edit the default manifest at:
Mac OSX: `/Applications/Unity/Unity.app/Contents/PlaybackEngines/AndroidPlayer` 
Windows: `C:\Program Files\Unity\Editor\Data\PlaybackEngines\AndroidPlayer\AndroidManifest.xml`  

1. Add the following permissions to the AndroidManifest.xml  
  `<uses-permission android:name="android.permission.INTERNET" />`  
  `<uses-permission android:name="android.permission.READ_PHONE_STATE" />`  
  `<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />`  
  `<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />`  
  `<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />`  
2. Include the TapForTap activity in the AndroidManifest.xml  
  `<activity android:name="com.tapfortap.TapForTapActivity"/>`
3. Change the following line in the AndroidManifest.xml, setting the value to true. This makes it
   so that you can click on the banner ads (otherwise Unity swallows the click event)  
   `<meta-data android:name="unityplayer.ForwardNativeEventsToDalvik" android:value="true" />`

Congratulations, you are done. You should now be able to call into the Tap for Tap library
and begin displaying ads.

##  API Documentation
The C# API lets you create, place, and remove Tap for Tap ad views,
show interstitals and app walls, and set various optional information about your users
to help with targetting. Please make sure your privacy policy allows this
before providing any personal information. All the API calls are static methods
found in the TapForTap class.

### Tap for Tap API

#### public static void initialize(string apiKey)
This initializes Tap for Tap must be called once at the start of the app before
any other TapForTap calls can be made. It requires a Tap for Tap account API key
which can be found by logging into Tap for Tap and clicking the account button.

Usage:

```c#
  // Initialize Tap for Tap with my API key
  TapForTap.initialize("MY API KEY");
```

#### public static void CreateAdView(TapForTapVerticalAlignment vertical, TapForTapHorizontalAlignment horizontal)
Create a banner ad view of width 320dp and height 50dp at the desired screen location.

- **[TapForTapVerticalAlignment](#TapForTapVerticalAlignment)** is an enum that has the following values : TOP, CENTER, BOTTOM.
- **[TapForTapHorizontalAlignment](#TapForTapHorizontalAlignment)** is an enum that has the following values : LEFT, CENTER, RIGHT.

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

Usage:

```c#
  // Create an AdView at the bottom center of the screen
  TapForTap.CreateAdView(TapForTapVerticalAlignment.BOTTOM, TapForTapHorizontalAlignment.CENTER)
```

#### public static void RemoveAdView()
Remove any AdView that is currently being displayed.

Usage:

```c#
  // Remove the currently displayed AdView
  TapForTap.RemoveAdView();
```

#### public static void PrepareInterstitial()
Prepare an interstital ad by prefetching the ad. This method only needs to be called once.
After the interstitial is shown we automatically prepare another one.

Usage:

```c#
  // Prepare an interstitial
  TapForTap.PrepareInterstitial();
```

#### public static void ShowInterstitial()
Shows an interstitial ad.

Usage:

```c#
  // Show an insterstitial
  TapForTap.ShowInterstitial();
```

#### public static void PrepareAppWall()
Prepare an app wall ad by prefetching the ad. This method only needs to be called once.
After the app wall is shown we automatically prepare another one.

Usage:

```c#
  // Prepare an app wall
  TapForTap.PrepareAppWall();
```

#### public static void ShowAppWall()
Show an app wall ad.

Usage:

```c#
  // Show an app wal
  TapForTap.ShowAppWall();
```

#### public static void SetYearOfBirth(int yearOfBirth)
Sets the user's year of birth. This is sent along with
ad requests and helps with matching.

Usage:

```c#
  // Set the birth year to 1990
  TapForTap.SetYearOfBirth(1990);
```

#### public static void SetGender(TapForTapGender gender)
Sets the gender of the user. This is sent along with ad requests and helps with matching.

- [TapForTapGender](#TapForTapGender) is an enume that has the following values: MALE, FEMALE, NONE.

Usage:

```c#
  // Set the Gender to male
  TapForTap.SetGender(TapForTapGender.MALE);
```

#### public static void SetLocation(double latitude, double longitude)
Sets the user's location This is sent along with ad requests.

- **latitide** The latitude of the user
- **longitude** The longitude of the user

Usage:

```c#
  // Set the location (Around Brentwood Bay Vancouver Island)
  TapForTap.SetLocation(48.571155273059546, -123.45268249511719);
```

#### public static void SetUserAccountId(string userAccountId)
Sets a custom account id that you can use for your app. This is sent along with
ad requests and helps with matching.

Usage:

```c#
  TapForTap.SetUserAccountId("My custom user account ID that I use");
```

#### public static void setAdViewListener(ITapForTapAdView listener)
Sets the listener that will receive the AdView callbacks. See [IAdViewListener](#IAdViewListener)
for more details and available callback methods.

Usage:

```c#
  // MyAdViewListener.cs
  public class MyAdViewListener : ITapForTapAdView
  {
    public void OnTapAd()
	  {
		  Debug.Log("Called my OnTapAd);
	  }

	  public void OnReceiveAd()
	  {
		  Debug.Log("Called my OnReceiveAd");
	  }

	  public void OnFailToReceiveAd(string reason)
	  {
		  Debug.Log("Called my OnFailToReceiveAd because of " + reason);
	  }
  }

  // MyTapForTap.cs
  MyAdViewListener myAdViewListener = new MyAdViewListener();
  TapForTap.setAdViewListener(MyAdViewListener);
```

#### public static void setAppWallListener(ITapForTapAppWall listener)
Sets the listener that will receive the AppWall callbacks. See [IAppWallListener](#IAppWallListener)
for more details and available callback methods.

Usage:

```c#
  // MyAppWallListener.cs
  public class MyAppWallListener : ITapForTapAppWall
  {
    public void onDismiss()
    {
      Debug.Log("Called my app wall listener OnDismiss");
    }
  }

  // MyTapForTap.cs
  MyAppWallListener myAppWallListener = new MyAppWallListener();
  TapForTap.setAppWallListener(myAppWallListener);
```

#### public static void setInterstitiallListener(ITapForTapInterstitial listener)
Sets the listener that will receive the Interstitial callbacks. See [IInterstitialListener](#IInterstitialListener)
for more details and available callback methods.

Usage:

```c#
  // MyInterstitialListener.cs
  public class MyInterstitialListener : ITapForTapInterstitial
  {
    public void onDismiss()
    {
      Debug.Log("Called my interstitial listener OnDismiss");
    }
  }

  // MyTapForTap.cs
  MyInterstitialListener myInterstitialListener = new MyInterstitialListener();
  TapForTap.setInterstitiallListener(myInterstitialListener);
```

### <a name="IAdViewListener">IAdViewListener</a>
An interface used to receive callbacks when the status of an AdView has changed.

- **void OnTapAd(void)**
  - called when a user taps on an ad
- **void OnReceiveAd(void)**
  - called when a ad is received
- **OnFailedToReceiveAd(string reason)**
 - called when a request to get an ad failed with a reason

### <a name="IAppWallListener">IAppWallListener</a>
An interface used to receive callbacks when the status of an app wall has changed.

- **void OnDismiss(void)**
  - Called when the app wall is dismissed

### <a name="IInterstitialListener">IInterstitialListener</a>
An interface used to receive callbacks when the status of an interstitial has changed.

- **void OnDismiss(void)**
  - Called when the interstitial is dismissed

### <a name="TapForTapGender">TapForTapGender</a>
An enum used for setting the user's gender. Available value:

- MALE
- FEMALE
- NONE

### <a name="TapForTapHorizontalAlignment">TapForTapHorizontalAlignment</a>
An enum used for determining the horizontal placement of an ad view. Available value:

- LEFT
- CENTER
- RIGHT

### <a name="TapForTapVerticalAlignment">TapForTapVerticalAlignment</a>
An enum used for determining the vertical placement of an ad view. Available value:

- TOP
- CENTER
- BOTTOM
