# AdMob Mediation

Not ready to give up your current advertising entirely? It's easy to integrate Tap for Tap into AdMob Medation, which will let you split your traffic across a number of ad networks. After [setting up AdMob mediation](https://support.google.com/admob/bin/answer.py?hl=en&answer=2413211&topic=2403413&ctx=topic) you just need to set up a [custom event](https://support.google.com/admob/bin/answer.py?hl=en&answer=2576174)
for Tap for Tap using the class name `com.tapfortap.AdMobBanner` on Android and `TapForTapAdMobBanner` on iOS.
On iOS you need to add the `AdMob` folder to your project and on Android add TapForTapAdMob.jar to your project
(included in the SDK package).

We have code examples for AdMob mediation on [Android](https://gist.github.com/3889996) and [iOS](https://gist.github.com/3889998).
