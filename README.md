Rich Content Label
============

![Screenshot: Launch image](https://github.com/cyndibaby905/RichContentLabel/raw/master/RichContentLabel.png)

About
-----

It's a small browser render engine for browser, using Core-Text without leverage the UIWebView.

* It has its own smart HTML parser, who can handle all invalid cases, such as unclosed tags and overlapping tags.
* Fully supports image layout as well as text formatted layout.
* Useful callback function for link tapping event and image tapping event. 

Usage
-----

    RCLabel *tempLabel = [[RCLabel alloc] initWithFrame:CGRectMake(10,0,300,100)];
    RTLabelComponentsStructure *componentsDS = [RCLabel extractTextStyle:@"<a href='http://example.com'>Link</a>"];
    tempLabel.componentsAndPlainText = componentsDS;
    

License
-------

Copyright (c) 2012 Hang Chen
Created by hangchen on 21/7/12.

Permission is hereby granted, free of charge, to any person obtaining 
a copy of this software and associated documentation files (the 
"Software"), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, 
distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject 
to the following conditions:

The above copyright notice and this permission notice shall be 
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT 
WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
IN CONNECTION WITH THE SOFTWARE OR 
THE USE OR OTHER DEALINGS IN THE SOFTWARE.

@author 		Hang Chen <cyndibaby905@yahoo.com.cn>
@copyright	2012	Hang Chen
@version
