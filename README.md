# Pre-work - Tip Calculator

Tip Calculator is a tip calculator application for iOS.

Submitted by: Yiyun Liang

Time spent: 10 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Able to exclude taxes from bill

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/liokumo/tippy/blob/master/tippy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** 
Never use story board this much even I’m in mobile game industry. It is pretty easy to build an app with people who only have limited coding experience even. I would describe outlets as a reference to the interface object, which provide a way of manipulate the object. An action is answering the event that performed by user. After user perform an action, app will response by run the actions.
Wow, after checking the source code of a storyboard, it is actually XML? 

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:**
Strong reference cycle means two classes has strong reference to each other. In this case these 2 instances memory never get release because the reference count never will be 0. The way to solve this is to: 
Use weak reference to the instance can be dealloc first, weak reference won’t add reference count, so instance can be dealloc even when weak reference exist. Use unowned reference when the instance will exist longer or same lifetime. It also count add reference count.


## License

    Copyright [Yiyun Liang] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.