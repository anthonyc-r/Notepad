#import <Foundation/Foundation.h>
#import "Document.h"

@implementation Document

-(id) initWithFilename: (NSString*)aFilename
{
	self = [super init];
	self->filename = aFilename;
	return self;
}


-(NSString*) getFileName
{
	return filename;
}

-(void) save
{
	[content writeToFile: filename atomically: true];
}

-(void) setContent: (NSString*)newContent
{
	[newContent retain];
	self->content = newContent;
}

-(NSString*) getContent
{
	return self->content;
}

@end
