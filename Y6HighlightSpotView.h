//
//  Y6HighlightSpotView.h
//
//
//  Created by Ysix on 27/05/2014.
//  
//

#import <UIKit/UIKit.h>

@interface Y6HighlightSpotView : UIView
{
	UIColor	*maskColor;

	UIView	*topView;
	UIView	*rightView;
	UIView	*bottomView;
	UIView	*leftView;

	UIImageView	*centerIV;

	NSTimeInterval defaultAnimationDuration;
}

@property (nonatomic, strong) 	UIColor	*maskColor;

@property (nonatomic) NSTimeInterval defaultAnimationDuration;


- (void)highlightPoint:(CGPoint)highlightedPoint withCirleRadius:(CGFloat)radius coveringRect:(CGRect)frame;

- (void)highlightPoint:(CGPoint)highlightedPoint withCirleRadius:(CGFloat)radius coveringRect:(CGRect)frame animated:(BOOL)animated;

- (void)highlightPoint:(CGPoint)highlightedPoint withCirleRadius:(CGFloat)radius coveringRect:(CGRect)frame animatedWithDuration:(NSTimeInterval)duration option:(UIViewAnimationOptions)option delay:(NSTimeInterval)delay completion:(void (^)(BOOL finished))completion;

@end
