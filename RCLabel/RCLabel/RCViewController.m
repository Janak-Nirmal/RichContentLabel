//
//  RCViewController.m
//  RCLabel
//
//  Created by Hang Chen on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RCViewController.h"
#import "RCViewCell.h"

@interface RCViewController ()

@end

@implementation RCViewController

@synthesize dataArray;

#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style 
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        
		UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,150,30)];
		[titleLabel setBackgroundColor:[UIColor clearColor]];
		[titleLabel setTextColor:[UIColor whiteColor]];
		[titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:20]];
        [titleLabel setFont:[UIFont systemFontOfSize:20]];
		[titleLabel setText:@"RTLabel"];
		[self.navigationItem setTitleView:titleLabel];
		[titleLabel release];
		[titleLabel setTextAlignment:UITextAlignmentCenter];
		
		self.dataArray = [NSMutableArray array];
        
        NSMutableDictionary *row21 = [NSMutableDictionary dictionary];
		[row21 setObject:@"<font size = 20>Which browser is the best?</font>\n<a href='http://www.firefox.com'><img src='firefox.jpg'>Firefox</a><a href='http://windows.microsoft.com/en-US/internet-explorer/products/ie/home'><img src='ie.jpg'>IE</a><a href='http://www.chrome.com'><img src='chrome.jpg'>Chrome</a><a href='http://www.apple.com/safari'><img src='safari.png'>Safari</a>" forKey:@"text"];
		[self.dataArray addObject:row21]; 
        
        NSMutableDictionary *row22 = [NSMutableDictionary dictionary];
		[row22 setObject:@"<font size = 20>Images with different sizes</font>\n<img src='wine.jpeg'><img src='tokyo.gif'><img src='ThumbNail.ashx.jpeg'>" forKey:@"text"];
		[self.dataArray addObject:row22]; 
        
        
		NSMutableDictionary *row1 = [NSMutableDictionary dictionary];
		[row1 setObject:@"<b>bold</b> and <i>italic</i> style" forKey:@"text"];
		[self.dataArray addObject:row1];
        
		NSMutableDictionary *row2 = [NSMutableDictionary dictionary];
		[row2 setObject:@"<font size=20><u color=blue>underlined</u> <uu color=red>text</uu></font>" forKey:@"text"];
		[self.dataArray addObject:row2];
        
	
        
        NSMutableDictionary *row4 = [NSMutableDictionary dictionary];
		[row4 setObject:@"<font size=20 color='#CCFF00'>Text with</font> <font size=16 color=purple>different colours</font> <font size=32 color='#dd1100'>and sizes</font>" forKey:@"text"];
		[self.dataArray addObject:row4];
        
        NSMutableDictionary *row5 = [NSMutableDictionary dictionary];
		[row5 setObject:@"<font size=20 stroke=1>Text with strokes</font> " forKey:@"text"];
		[self.dataArray addObject:row5];
        
        NSMutableDictionary *row6 = [NSMutableDictionary dictionary];
		[row6 setObject:@"<font size=20 kern=35>KERN</font> " forKey:@"text"];
		[self.dataArray addObject:row6];
        
        NSMutableDictionary *row7 = [NSMutableDictionary dictionary];
		[row7 setObject:@"<font size=14><p align=justify><font color=red>JUSTIFY</font> It’s been almost a decade since the publication of “Moneyball,”</p>\n <p align=left><font color=red>LEFT ALIGNED</font>  Michael Lewis’s famous book-turned-movie about how the small-market Oakland Athletics used statistical artistry to compete against their (much) richer rivals. </p>\n<p align=right><font color=red>RIGHT ALIGNED</font> Billy Beane is still the A’s general manager, but here’s a modest proposal for his next act.</p>\n<p align=center><font color=red>CENTER ALIGNED</font> He could become the head of another budget-strapped sports organization like, say, the Olympic Committee of Kyrgyzstan — or another small-market country with limited resources. Bishkek is nice this time of year!</p></font> " forKey:@"text"];
		[self.dataArray addObject:row7];
        
		NSMutableDictionary *row20 = [NSMutableDictionary dictionary];
		[row20 setObject:@"<p indent=20>Indented bla bla bla bla bla bla bla bla bla bla bla bla bla</p>" forKey:@"text"];
		[self.dataArray addObject:row20]; 
        
        
        
        
    }
    return self;
}



#pragma mark -
#pragma mark View lifecycle

/*
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 }
 */

/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
	NSMutableDictionary *rowInfo = [self.dataArray objectAtIndex:indexPath.row];
	if ([rowInfo objectForKey:@"cell_height"])
	{
		return [[rowInfo objectForKey:@"cell_height"] floatValue];
	}
	else 
	{
        
        //NSString *plainData = [RTLabel getParsedPlainText:[rowInfo objectForKey:@"text"]];
        
        
        RCLabel *tempLabel = [[RCLabel alloc] initWithFrame:CGRectMake(10,0,300,100)];
        //tempLabel.lineBreakMode = kCTLineBreakByTruncatingTail;
        RTLabelComponentsStructure *componentsDS = [RCLabel extractTextStyle:[rowInfo objectForKey:@"text"]];
        tempLabel.componentsAndPlainText = componentsDS;
        
        
        CGSize optimalSize = [tempLabel optimumSize];
        [tempLabel release];
        [rowInfo setObject:[NSNumber numberWithFloat:optimalSize.height + 5] forKey:@"cell_height"];
		return [[rowInfo objectForKey:@"cell_height"] floatValue];
	}
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    // Return the number of rows in the section.
    return [self.dataArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"DemoTableViewCell";
    NSMutableDictionary *rowInfo = [self.dataArray objectAtIndex:indexPath.row];
    
    RCViewCell *cell = (RCViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        cell = [[[RCViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    RTLabelComponentsStructure *componentsDS = [RCLabel extractTextStyle:[rowInfo objectForKey:@"text"]];
    cell.rtLabel.componentsAndPlainText = componentsDS;   
    
    
    
    
    
    
    
    return cell;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	self.dataArray = nil;
    [super dealloc];
}



@end
