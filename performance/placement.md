# Tap for Tap - Ad Placement Guidelines

You can improve the performance of your ad placements by following these tips.

## Performance

Whether on the tap exchange or monetization, the placement of your ad units play a key role in the success of your app. If you are on the tap exchange your will receive ads that have a higher likelihood of generating your tap credits, and your ads will be places on better apps. On the monetization side, you will stand a better chance of converting users and making money.  The interstitial ad unit has the highest eCPM and we recommend that all app developers use them.

## Ad Units

To learn more about what kind of banners you can make and how the banners are displayed, check out our [ad units](/doc/ad-units) documentation.


## Full Size Banner

![Example  Full Size Banner](https://raw.github.com/tapfortap/Documentation/master/images/banner.png)

We recommend you place the full size banner where it will not draw accidental taps.  Our match system watches for this and it will result in showing your ads on other apps doing the same thing. Generally either at the very bottom or top of the screen is ideal. If your app uses the landscape orientation, the full size banner might not be as ideal since it will use up extra space.

Generally it best to avoid placing the banner near a tab bar or toolbar. If you have a tab bar at the bottom, like many typical iOS apps, then it may be wise to place the banner at the top of the screen. If you have a toolbar across the top, like many typical Android apps, then it may be wise to place the banner at the bottom of the screen. Use your discretion, every app is different and the best solution for each app will differ accordingly.

Banners aren’t necessarily the best ads for your app. If you’re having trouble fitting a banner into your UI you should consider using an interstitial in between full-screen changes (pushing an activity on Android, pushing a view controller on iOS) or adding a button that displays an app wall. These can be very effective when used correctly.

## Interstitial

![Example Interstitial](https://raw.github.com/tapfortap/Documentation/master/images/interstitial.png)

Tap for Tap interstitial ads are a chance to immerse users in an ad without adding anything to your interface. You can load one between page changes, or game levels, you can experiment with ways to display it. We recommend not spamming your users as an angry user is not likely to pursue it any further. When interstitials are used sparingly they really capture people’s attention without being annoying, and we see great tap-through and conversion rates on them.

## App Wall

![Example App Wall](https://raw.github.com/tapfortap/Documentation/master/images/appwall.png)

You have the option to show the app wall in the same way as an interstitial, though it is not really ideal.  The best success our developers have had is adding buttons throughout their interface for the user to opt into seeing more apps. Placing a button in your main navigation that says “more apps” tends to work the best. Users that tap it tend to give the app wall their full attention. The fact that the button (or tab bar item) is part of your UI also makes it less abrasive and more inviting.

## Creative Guidelines

If you have questions about how to best create your banners see our [creative guidelines](/doc/performance/creatives).
