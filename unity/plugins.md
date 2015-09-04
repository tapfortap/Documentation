# TapForTap Plugins
Plugins add functionality to the TapForTap SDK on demand.
This gives you **full control** over the desired feature set, required permissions, required libraries and total file size of the SDK.

The following plugins are currently included in the SDK:

## MediaBrix
`Class: Plugin.MediaBrixAdProvier` `Required Files on iOS: MediaBrix.bundle`

**The MediaBrix plugin is not supported on Android M at the moment**

The MediaBrix plugin provides video and branded interstitials for the *Rescue* and *Achievement* moment.

**Important**: By default, you will only see a sample rescue interstitial.

Please [contact our support](mailto:support@tapfortap.com) and request credentials to use MediaBrix with Tap for Tap. The integration will be enabled automatically once you've added the following two elements to your AndroidManifest.xml and we approve your account.


### Instructions for Android
1) Set the value for `mediabrixAppID` in your AndroidManifest.xml to the MediaBrix app ID that was provided to you:

```xml
<meta-data android:name="mediabrixAppID" android:value="YOUR_APP_ID_HERE"/>
```

2) Set `mediabrixProperty` in your AndroidManifest.xml to the MediaBrix property that was provided to you

```xml
<meta-data android:name="mediabrixProperty" android:value="YOUR_PROPERTY_HERE"/>
```
### Instructions for iOS
1. Set `mediabrixAppID` in your Info.plist to the MediaBrix app ID that was provided to you:

```
mediabrixAppID = qXDpTFlISq
```

2. Set `mediabrixProperty` in your Info.plist to the MediaBrix property that was provided to you

```
mediabrixProperty = pretio_pretioqa_mobile
```


## Tutela Analytics
`Class: Plugin.TutelaAnalytics` `Extra Permissions required on Android: ACCESS_NETWORK_STATE, ACCESS_COARSE_LOCATION, ACCESS_FINE_LOCATION`


The Tutela plugin provides two fundamental uses for better ad targeting:
1. More reliable geolocation data
2. Connection quality data, which enables us to serve the best ad for the users connection


# How to add a plugin
Simply add the desired Plugins to the the TapForTap.initialize call like this:
```java
  	TapForTap.API.TapForTap.initialize ("YOUR_API_KEY", Plugin.MediaBrixAdProvider, Plugin.TutelaAnalytics);
```

## Extra Instructions for Android
- Import the desired .unitypackage from the /android-plugins folder:
    - Go to Assets -> Import Package -> Custom Package...

    - Leave all files selected and click `Import`

## Extra Instructions for iOS

iOS Integration requires a couple more steps than Android.
Build & Run for iOS is currently broken (Unity 5.1.0p2 and XCode 6.3.2).

### Step 1

Open the Build Settings, switch to the iOS Platform and click Build. After the build has succeeded, Unity will point you to the XCode project folder in Finder.
Open the Project by clicking on `Unity-iPhone.xcodeproj`.

### Step 2

Follow the instructions up to step 4 [here](/doc/ios/integration).

### Step 3

Import the plugin framework and bundles for each plugin found in the `/ios-plugins` folder.
### Step 4

Import the plugins you want to use by uncommenting them at the top of TFTTapForTapUnity.mm located at /Libraries/Plugins/iOS/ in your XCode Project. Example:
```objc
//Import your plugins here!
//for example: #import <sample_plugin/SampleAdProvider.h>

#import <mediabrix_plugin/MediaBrixAdProvider.h>
#import <tutela_plugin/TutelaAnalytics.h>
```
