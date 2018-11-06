# Weather App

Weather App is a weather forecast application that uses Open Weather Map API(http://openweathermap.org/api). Main features include fetching location and showing the 5 day forecast with 3 hours interval to user. If location is not fetched at that moment, application uses last saved location instead.

● Developed in XCode 10, Swift 4.2.

● Project is using Pods. Only Alamofire is used as an external library. This framework is also included to repository. Just running the project should do the trick. 

● Project applies MVVM with a little reactive touch. Lifecycle goes like this. View controller tells the view model what to do, view model does its work and updates it's state, then sends a change to view controller via change block. With this change view controller updates what needs to be updated. 

