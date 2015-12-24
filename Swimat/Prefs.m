//
//  Prefs.m
//  Swimat
//
//  Created by Jintin on 12/24/15.
//  Copyright © 2015 jintin. All rights reserved.
//

#import "Prefs.h"

@implementation Prefs

NSString * const TAG_INDENT = @"indent";
NSString * const INDENT_TAB = @"Tab Indent";
NSString * const INDENT_SPACE2 = @"2 Space Indent";
NSString * const INDENT_SPACE4 = @"4 Space Indent";

+(void) setIndent:(NSString *)value {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	[prefs setObject:value forKey:TAG_INDENT];
	[prefs synchronize];
}

+(NSString *) getIndent {
	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
	NSString *value = [prefs stringForKey:TAG_INDENT];
	if (value == nil) {
		value = INDENT_TAB;
	}
	return value;
}

+(NSArray *) getIndentArray {
	return @[INDENT_TAB, INDENT_SPACE2, INDENT_SPACE4];
}

+(NSString *) getIndentString {
	NSString *tag = [self getIndent];
	if ([tag isEqualToString:INDENT_TAB]) {
		return @"\t";
	} else if ([tag isEqualToString:INDENT_SPACE2]) {
		return @"  ";
	} else if ([tag isEqualToString:INDENT_SPACE4]) {
		return @"    ";
	}
	return @"\t";
}

@end
