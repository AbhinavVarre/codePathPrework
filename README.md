# Pre-work - *Tip Calculator*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Abhinav Varre**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Added the option to change tip options
- [x] Added a color scheme
- [x] Added a settings page
- [x] Added an option to set the default highlighted tip

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://imgur.com/a/BYPjtEZ' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
- Consistency across actions
   - It was a challenge to make sure that all the right information was loaded and used at the right time - for instance, switching from settings should load the default tip instead of the previously entered tip, meaning that the view will contain different information based on whether the view is appearing or loading. 
- Plugging into and understanding the diffence between the methods that concern the lifecycle of the application as well as the scene.
- Understanding how to manipulate UI objects through the code, such as resetting the tip control values when setting new defaults.
- Understanding what the simplest solution to a problem is in Swift 4+, as opposed to previous approaches that have been used.
- Understanding how UserDefaults works and implementing it correctly

## License

    Copyright [2022] [Abhinav Varre]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
