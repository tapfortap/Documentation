# TapForTap Plugins
Plugins add functionality to the TapForTap SDK on demand.
This gives you *full control* over the desired feature set, required permissions, required libraries and total file size of the SDK.

When you download the newest [SDK](https://github.com/tapfortap/iOS/archive/master.zip) you will find a `/plugins` directory which includes the following plugins.

## MediaBrix
`Class: MediaBrixAdProvider`

The MediaBrix plugin provides video and branded interstitials for the *Rescue* and *Achievement* moment.
(More Description)


## Tutela Analytics
`Class: TutelaAnalytics`

The Tutela plugin provides two fundamental uses for better ad targeting:
1. More reliable geolocation data
2. Connection quality data, which enables us to serve the best ad for the users connection

## Kiip
`Class: KiipAdProvider`

(Description for Keep)

# How to add a plugin

- Import the desired plugin by following these steps:
  - Go to File -> New Module
  - Select the "Import .JAR or .AAR Package" option from the list under "More Modules", click "Next"
  - Use the file menu to select the desired plugin (e.g. `mediabrix-plugin.aar`), Android Studio should fill in both text fields
- Add it to the dependencies of your app's build.gradle file
 ```java
    dependencies {
    ...
    compile project(":mediabrix-plugin")
    ...
    }
 ```

- Add the appropriate class file (e.g. `MediaBrixAdProvier`) to the with the TapForTap.initialize call.

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
