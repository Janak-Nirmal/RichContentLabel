Rich Content Label
=============

It's a small browser render engine for browser, using Core-Text without leverage the UIWebView. 
 
Features
-------

The following markups are supported.  The dependencies listed are required if
you wish to run the library.

* `It has its own smart HTML parser, who can handle all invalid cases, such as unclosed tags and overlapping tags.`
* `Fully supports image layout as well as text formatted layout.`
* `Useful callback function for link tapping event and image tapping event.`


Usage
------------


### Commands

    RCLabel *tempLabel = [[RCLabel alloc] initWithFrame:CGRectMake(10,0,300,100)];
    RTLabelComponentsStructure *componentsDS = [RCLabel extractTextStyle:@"<a href='http://example.com'>Link</a>"];
    tempLabel.componentsAndPlainText = componentsDS;

