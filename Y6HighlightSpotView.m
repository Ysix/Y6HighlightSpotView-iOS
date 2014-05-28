//
//  Y6HighlightSpotView.m
//
//
//  Created by Ysix on 27/05/2014.
//
//

#import "Y6HighlightSpotView.h"

#import <QuartzCore/QuartzCore.h>

@implementation Y6HighlightSpotView

@synthesize maskColor, defaultAnimationDuration;

- (instancetype)init
{
	self = [super init];
    if (self) {
        // Initialization code

		topView = [[UIView alloc] init];
		[self addSubview:topView];

		rightView = [[UIView alloc] init];
		[self addSubview:rightView];

		bottomView = [[UIView alloc] init];
		[self addSubview:bottomView];

		leftView = [[UIView alloc] init];
		[self addSubview:leftView];

		centerIV = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"Y6HighlightImage"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
		[self addSubview:centerIV];

		self.maskColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
		defaultAnimationDuration = 0.7;
    }
    return self;
}

- (void)setMaskColor:(UIColor *)color
{
	maskColor = color;

	[topView setBackgroundColor:maskColor];
	[rightView setBackgroundColor:maskColor];
	[bottomView setBackgroundColor:maskColor];
	[leftView setBackgroundColor:maskColor];
	[centerIV setTintColor:maskColor];
}

- (void)highlightPoint:(CGPoint)highlightedPoint withCirleRadius:(CGFloat)radius coveringRect:(CGRect)frame
{
	[self highlightPoint:highlightedPoint withCirleRadius:radius coveringRect:frame animated:NO];
}

- (void)highlightPoint:(CGPoint)highlightedPoint withCirleRadius:(CGFloat)radius coveringRect:(CGRect)frame animated:(BOOL)animated
{
	[self highlightPoint:highlightedPoint withCirleRadius:radius coveringRect:frame animatedWithDuration:(animated ? defaultAnimationDuration : 0) option:kNilOptions delay:0 completion:nil];
}

- (void)highlightPoint:(CGPoint)highlightedPoint withCirleRadius:(CGFloat)radius coveringRect:(CGRect)frame animatedWithDuration:(NSTimeInterval)duration option:(UIViewAnimationOptions)option delay:(NSTimeInterval)delay completion:(void (^)(BOOL finished))completion
{
	void (^drawingBlock)() = ^void ()
	{
		[super setFrame:frame];

		[topView setFrame:CGRectMake(0, 0, frame.size.width, highlightedPoint.y - radius)];

		[rightView setFrame:CGRectMake(highlightedPoint.x + radius,  highlightedPoint.y - radius, frame.size.width - (highlightedPoint.x + radius), radius * 2)];

		[bottomView setFrame:CGRectMake(0, highlightedPoint.y + radius, frame.size.width, frame.size.height - (highlightedPoint.y + radius))];
		[leftView setFrame:CGRectMake(0,  highlightedPoint.y - radius, highlightedPoint.x - radius, radius * 2)];

		[centerIV setFrame:CGRectMake(highlightedPoint.x - radius,  highlightedPoint.y - radius, radius * 2, radius * 2)];
	};

	if (duration)
		[UIView animateWithDuration:duration delay:delay options:option animations:drawingBlock completion:completion];
	else
		drawingBlock();
}

@end
