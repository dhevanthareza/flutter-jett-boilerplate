# Route
we are using getx and you can read documentation on https://github.com/jonataslaw/getx/blob/master/documentation/id_ID/route_management.md

# State Management
we are using getx and you can read documentation on https://github.com/jonataslaw/getx/blob/master/documentation/id_ID/state_management.md

# Api Client
for api client we using configured dio, you can see the configuration on lib/utils/rest_client.dart. There are several configuration like base url, timeout, Authorization Header, and logger interceptor (so you can see network log on debug console easily)

# Flow Call
Basicly the flow call is go from view/page -> controller -> service -> repository -> external data (api, graphql), but you can skip service layer. There is responsibility of each layer : 
- View/Pages Layer, just for showing the page
- Controller, for control the View/Pages Layer
- Service, use it if you need some business logic
- Repository, use it for getting data from external data
- External Data, use it for connecting to external resource data

# Logging
for easy reading please use Logger().v, Logger().d or anything else you can see on https://pub.dev/packages/logger

# How to build
1. To build dev app use `flutter build apk`
2. To Build prod app use `flutter build appbundle`
3. for play store deploymen maybe you need to read flutter documentation, for keying purpose

# Navigation

You can read https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md for navigating on this app