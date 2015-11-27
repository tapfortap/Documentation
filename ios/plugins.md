# TapForTap Plugins
Plugins add functionality to the TapForTap SDK on demand.
This gives you *full control* over the desired feature set, required permissions, required libraries and total file size of the SDK.

When you download the newest [SDK](https://github.com/tapfortap/iOS/archive/master.zip) you will find a `/plugins` directory which includes the following plugins.

## MediaBrix
`Class: MediaBrixAdProvider` `Required Files: MediaBrix.bundle`

**MediaBrix is not yet supported on iOS 9**
The MediaBrix plugin provides video and branded interstitials for the *Rescue* and *Achievement* moment.

**Important**: By default, you will only see a sample rescue interstitial.

Please ask us for credentials to use MediaBrix with Tap for Tap. The integration will be enabled automatically once you've added the following two elements to your Info.plist and we approve your account.

1. Set `mediabrixAppID` in your Info.plist to the MediaBrix app ID that was provided to you:

```
mediabrixAppID = qXDpTFlISq
```

2. Set `mediabrixProperty` in your Info.plist to the MediaBrix property that was provided to you

```
mediabrixProperty = pretio_pretioqa_mobile
```


## Tutela Analytics
`Class: TutelaAnalytics`

The Tutela plugin provides two fundamental uses for better ad targeting:
1. More reliable geolocation data
2. Connection quality data, which enables us to serve the best ad for the users connection

You'll need to add the following keys to the `Info.plist`:

- `NSLocationWhenInUseUsageDescription`: Text describing the reason for accessing the user's location information. Recommended to improve targeting of location-based advertising.

How to add a key to `Info.plist`:

- Open `Info.plist` from the Project Navigator, under `<Project Name>/<App Name>/Supporting Files/`.
- Add a new key by clicking on the "+" at the top
- Enter the key name (e.g. `NSLocationWhenInUseUsageDescription`)
- Press tab and enter the value name (e.g. "We'd like to use your location to give you targeted offers.")

<!---
## Kiip
`Class: KiipAdProvider`
--->

# How to add a plugin

- If required, add and link the required framework and files for each plugin to your XCode app project.

- Import the appropriate header file (e.g. `MediaBrixAdProvider.h`) and call TapForTap.initialize with the desired plugin classes.

```objective-c
[...]
#import <mediabrix_plugin/MediaBrixAdProvider.h>
#import <tutela_plugin/TutelaAnalytics.h>
[...]

[TFTTapForTap initializeWithAPIKey: @"YOUR_API_KEY" andPlugins:[MediaBrixAdProvider class], [TutelaAnalytics class], nil];

```
<!---
# How to build your own plugin
[TBD]
--->
