BLKFlexibleHeightBar
====================
Create condensing header bars like those seen in the Facebook, Square Cash, and Safari iOS apps.
-------------------------------------------------------------

<img src="http://foxweb.marist.edu/users/stbk/Square_Cash.gif" alt="Square Cash Style Bar" width="300"/> 
<img src="http://foxweb.marist.edu/users/stbk/Facebook.gif" alt="Square Cash Style Bar" width="300"/>

`BLKFlexibleHeightBar` allows you to create header bars with dynamic height. Often, this sort of UI paradigm is used to hide chrome and make room for more content as a user is scrolling. This is seen in third party apps like Facebook and Square Cash, as well as first party apps like Safari.

`BLKFlexibleHeightBar` can create bars that look and act any way you want:
* Immediate subviews of a flexible height bar define how they want to look and where they want to be depending on the height of the bar. Properties like frame, transform, and alpha can all vary depending on the current height of the bar.
* A bar's behavior can be defined using a behavior definer instance. A behavior definer can be created to emulate Safari's header behavior, Facebook's header behavior, or something entirely new. Behaviors are completely modular and aren't coupled with the appearence of the bar.
