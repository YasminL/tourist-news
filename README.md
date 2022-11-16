<!-- ABOUT THE PROJECT -->
# About The Project

This is an app that displays a list of News (written by tourists) along with a list of Tourists.

### News 
<img src="demo/News%20-%20iPhone%2014%20Pro%20Max.png" width=50% height=50%>


### Tourists 
<img src="demo/Tourists%20-%20iPhone%2014%20Pro%20Max.png" width=50% height=50%>

<!-- Requirements -->
## Requirements

The app is written with the following requirements:
- shows two tabs: News and Tourists
- uses MVVM
- uses caching for image fetching
- UI is written programmatically 
- no external libraries used

## Limitations

* In the Tourists tab, a tap on a Tourist does not show a more detailed view. Looking at the tourist detail page request (example: http://restapi.adequateshop.com/api/Tourist/170030), the same fields as in the tourists list request (example: http://restapi.adequateshop.com/api/Tourist?page=2) are returned. Since it doesn't give the user any extra information about the tourist, the tap functionality is disabled for now. 
* In the News tab, we only show the first image present. In the future, a nice-to-have would be to show all images returned from the request. There is also an option to show the tourist information here. 
* Data is not cached offline
* Data is not fetched in batches/"pages". The APIClient is set up to receive pages in the future
* The app uses SwiftUI

## Some General Comments

* I noticed that the urls are http which is not recommended by Apple. I know this is just a mock API but for the real app I would recommend to use https urls throughout the app and disable arbitrary loads for App Transport Security
* The data from the endpoint http://restapi.adequateshop.com/api/Feed/GetNewsFeed is incomplete, some items in the list does not have titles/descriptions etc. Instead of giving views default values in the app, I would rather make changes in the backend to make sure to always get complete data (and make it non-optional in the app). For now, default values such as "Default Title" or default images are added if the response is nil.
