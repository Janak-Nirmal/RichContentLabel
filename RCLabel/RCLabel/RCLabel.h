//
//  RCLabel.m
//  RCLabelProject
//
/**
 * Copyright (c) 2012 Hang Chen
 * Created by hangchen on 21/7/12.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining 
 * a copy of this software and associated documentation files (the 
 * "Software"), to deal in the Software without restriction, including 
 * without limitation the rights to use, copy, modify, merge, publish, 
 * distribute, sublicense, and/or sell copies of the Software, and to 
 * permit persons to whom the Software is furnished to do so, subject 
 * to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be 
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT 
 * WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR 
 * PURPOSE AND NONINFRINGEMENT. IN NO EVENT 
 * SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE 
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
 * IN CONNECTION WITH THE SOFTWARE OR 
 * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * @author 		Hang Chen <cyndibaby905@yahoo.com.cn>
 * @copyright	2012	Hang Chen
 * @version
 * 
 */


#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
typedef enum
{
	RTTextAlignmentRight = kCTRightTextAlignment,
	RTTextAlignmentLeft = kCTLeftTextAlignment,
	RTTextAlignmentCenter = kCTCenterTextAlignment,
	RTTextAlignmentJustify = kCTJustifiedTextAlignment
} RTTextAlignment;

typedef enum
{
	RTTextLineBreakModeWordWrapping = kCTLineBreakByWordWrapping,
	RTTextLineBreakModeCharWrapping = kCTLineBreakByCharWrapping,
	RTTextLineBreakModeClip = kCTLineBreakByClipping,
}RTTextLineBreakMode;


@class RTLabelComponentsStructure;


@class RTLabelComponent;
@protocol RTLabelDelegate <NSObject>

- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSString*)url;

@end

@protocol RTLabelSizeDelegate <NSObject>

- (void)rtLabel:(id)rtLabel didChangedSize:(CGSize)size;

@end



@interface RCLabel : UIView  {
	//NSString *_text;
	UIFont *_font;
	UIColor *_textColor;
    UIColor *_originalColor;
	RTTextAlignment _textAlignment;
	RTTextLineBreakMode _lineBreakMode;
	
	CGSize _optimumSize;
   
	id<RTLabelDelegate> _delegate;
    id<RTLabelSizeDelegate> _sizeDelegate;
    CTFramesetterRef _framesetter;
    CTFrameRef _ctFrame;
    CFRange _visibleRange;
    NSString *_paragraphReplacement;
    CTFontRef _thisFont;
    CFMutableAttributedStringRef _attrString;
    RTLabelComponent * _currentLinkComponent;
    RTLabelComponent * _currentImgComponent;
    RTLabelComponentsStructure *componentsAndPlainText_;
}


@property (nonatomic, assign) id<RTLabelDelegate> delegate;
@property (nonatomic, assign) id<RTLabelSizeDelegate> sizeDelegate;
@property (nonatomic, copy) NSString *paragraphReplacement;
@property (nonatomic,retain)RTLabelComponent * currentLinkComponent;
@property (nonatomic,retain)RTLabelComponent * currentImgComponent;

+ (RTLabelComponentsStructure*)extractTextStyle:(NSString*)data;
+ (NSString*)stripURL:(NSString*)url;
- (void)setTextAlignment:(RTTextAlignment)textAlignment;
- (RTTextAlignment)textAlignment;

- (void)setLineBreakMode:(RTTextLineBreakMode)lineBreakMode;
- (RTTextLineBreakMode)lineBreakMode;

- (void)setTextColor:(UIColor*)textColor;
- (UIColor*)textColor;

- (void)setFont:(UIFont*)font;
- (UIFont*)font;

- (void)setComponentsAndPlainText:(RTLabelComponentsStructure*)componnetsDS;
- (RTLabelComponentsStructure*)componentsAndPlainText;

- (CGSize)optimumSize;
//- (void)setLineSpacing:(CGFloat)lineSpacing;
- (NSString*)visibleText;


@end




@interface RTLabelComponent : NSObject
{
	NSString *_text;
	NSString *_tagLabel;
	NSMutableDictionary *_attributes;
	int _position;
	int _componentIndex;
    BOOL _isClosure;
    UIImage *img_;    
}

@property (nonatomic, assign) int componentIndex;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *tagLabel;
@property (nonatomic, retain) NSMutableDictionary *attributes;
@property (nonatomic, assign) int position;
@property (nonatomic, assign) BOOL isClosure;
@property (nonatomic, retain) UIImage *img;



- (id)initWithString:(NSString*)aText tag:(NSString*)aTagLabel attributes:(NSMutableDictionary*)theAttributes;
+ (id)componentWithString:(NSString*)aText tag:(NSString*)aTagLabel attributes:(NSMutableDictionary*)theAttributes;
- (id)initWithTag:(NSString*)aTagLabel position:(int)_position attributes:(NSMutableDictionary*)_attributes;
+ (id)componentWithTag:(NSString*)aTagLabel position:(int)aPosition attributes:(NSMutableDictionary*)theAttributes;

@end


@interface RTLabelComponentsStructure :NSObject {
    NSArray *components_;
    NSString *plainTextData_;
    NSArray *linkComponents_;
    NSArray *imgComponents_;
}
@property(nonatomic,retain) NSArray *components;
@property(nonatomic,retain) NSArray *linkComponents;
@property(nonatomic,retain) NSArray *imgComponents;
@property(nonatomic, copy) NSString *plainTextData;
@end
