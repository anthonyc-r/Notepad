/* All Rights reserved */

#include <AppKit/AppKit.h>
#include "UnsavedChangesPanel.h"

@implementation UnsavedChangesPanel

-(id)init
{
	self = [super init];
	_shouldSave = NO;
	return self;
}


-(void)discardChanges: (id)sender
{
	_shouldSave = NO;
	[self close];
	[NSApp abortModal];
}


-(void)saveChanges: (id)sender
{
	_shouldSave = YES;
	[self close];
	[NSApp abortModal];
}

-(BOOL)shouldSave
{
	return _shouldSave;
}

@end
