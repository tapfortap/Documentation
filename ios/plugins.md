# TapForTap Plugins
Plugins add functionality to the TapForTap SDK on demand.
This gives you *full control* over the desired feature set, required permissions, required libraries and total file size of the SDK.

When you download the newest [SDK](https://github.com/tapfortap/iOS/archive/master.zip) you will find a `/plugins` directory which includes the following plugins.

## MediaBrix
`Class: MediaBrixAdProvider` `Required Files: mediabrix_plugin.framework, MediaBrix.bundle`

The MediaBrix plugin provides video and branded interstitials for the *Rescue* and *Achievement* moment.

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
`Class: TutelaAnalytics` `Required Files: tutela_plugin.framework, iOS_Tutela_SDK.framework`

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

- Add and link the required frameworks and bundles for each plugin to your XCode app project.

- Import and add the appropriate class file (e.g. `MediaBrixAdProvier`) to the the TapForTap.initialize call.

```objective-c
[...]
#import <mediabrix_plugin/MediaBrixAdProvider.h>
#import <tutela_plugin/TutelaAnalytics.h>
[...]

//Create an array with the Plugins you want to use
NSMutableArray *pluginArray = [NSMutableArray arrayWithObjects:[[MediaBrixAdProvider alloc]init], [[TutelaAnalytics alloc] init], nil];

[TFTTapForTap initializeWithAPIKey: @"API-KEY" andPlugins:pluginArray];
```
<!---
# How to build your own plugin
[TBD]
--->
