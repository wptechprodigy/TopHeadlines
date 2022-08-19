[![IDE](https://img.shields.io/badge/Xcode-13.4.1-blue.svg)](https://developer.apple.com/xcode/)
[![Platform](https://img.shields.io/badge/iOS-15.2-green.svg)](https://developer.apple.com/ios/)
[![Build Status](https://github.com/wptechprodigy/TopHeadlines/actions/workflows/TopHeadlines.yml/badge.svg)](https://github.com/wptechprodigy/TopHeadlines/actions/workflows/CryptoList.yml)

# TopHeadlines 

## An iOS app that displays news top headlines with ability to read the entire news.

### Story: User request to see the list of top headlines and when the user clicks on an headline, it shows the full news article in a `Webview`

### Narrative

```
As an online user
I want the app to automatically load list of headlines so I can see them
And decide which news I will like to read in full when I tap on its headline

When offline
I want to be able to see the last viewed top headlines
```

#### Scenarios (Acceptance criteria)

```
- Given the user has connectivity 
    When the user launches the app to see the list of top headlines
    Then the app should display the list of the most recent top healines
    The app should also save the most recent list for viewing when offline
    
- Given the user has no connectivity
    When the user has no connectivity and has previously used the app
    Then the app should present the recently saved list of top headlines
    Otherwise (the case it's the first time the user is using the app), and no internet connectivity what should happen?
```

#### Requirements:

- [X] Display a list of top headlines
- [X] Each list should display the headline title, author and with a background of headline image

#### Solution:
 
