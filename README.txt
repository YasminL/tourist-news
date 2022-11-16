Thank you for this opportunity	to look at this News App!

Some general comments:
- I noticed that the urls are http which is not recommended by Apple. I would recommend to use https urls throughout the app and disable arbitrary loads for App Transport Security
- The data fromt the endpoint http://restapi.adequateshop.com/api/Feed/GetNewsFeed is incomplete, some items in the list does not have titles/descriptions etc. Instead of fixing this in the app, I would ask backend to make sure to always send us this data and make it non-optional in our app. 