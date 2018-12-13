#import <Foundation/Foundation.h>
#import "Document.h"

@implementation Document

-(id)init
{
	self = [super init];
	self->saved = YES;
	return self;
}

-(id)initWithFilename: (NSString*)aFilename
{
	self = [super init];
	filename = aFilename;
	[filename retain];
	saved = YES;
	content = [NSString stringWithContentsOfFile: filename];
	[content retain];
	return self;
}


-(NSString*)getFilename
{
	return filename;
}

-(void)setFilename: (NSString*)aFilename
{
	[filename release];
	filename = aFilename;
	[filename retain];
}

-(void)save
{
	[content writeToFile: filename atomically: true];
	saved = YES;
}

-(void)setContent: (NSString*)newContent
{
	[newContent retain];
	[content release];
	content = newContent;
	saved = NO;
}

-(NSString*)getContent
{
	return content;
}

-(BOOL)hasUnsavedChanges
{
	return saved == NO;
}

@end
