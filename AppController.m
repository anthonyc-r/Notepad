/*
Notepad.gnustep

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#import <AppKit/AppKit.h>
#import "AppController.h"
#import "Document.h"
#import "UnsavedChangesPanel.h"

@implementation AppController


-(void)awakeFromNib
{
	NSLog(@"Awoke from nib.");
	[window makeKeyAndOrderFront: self];
	[window setDelegate: self];
	activeDocument = [[Document alloc] init];
}

-(void)windowDidResize: (id)sender
{
	NSLog(@"Resized window");
}

-(void) windowWillClose: (id)sender
{
	NSLog(@"%@", [activeDocument getContent]);
	[NSApp terminate: self];
}


// MARK: - First Responder
-(void)openDocument: (id)sender
{
	NSLog(@"openDoc");
	NSLog(@"%d", activeDocument == nil);
	NSLog(@"Unsaved changes: %d", YES == [activeDocument hasUnsavedChanges]);
	if ([activeDocument hasUnsavedChanges])
	{
		[self promptSave];	
	}
	NSOpenPanel* openPanel = [NSOpenPanel openPanel];
	[openPanel setCanChooseDirectories: NO];
	NSInteger selectedButton = [openPanel runModal];
	
	if (selectedButton == NSOKButton)
	{
		[activeDocument release];
		activeDocument = [[Document alloc] initWithFilename: [openPanel filename]];
		[textField setText: [activeDocument getContent]];
	}
}

-(void) saveDocument: (id)sender
{
	if ([activeDocument getFilename])
	{
		[activeDocument save];
		return;
	}
	NSLog(@"Did tap save");
	NSSavePanel* savePanel = [NSSavePanel savePanel];
	[savePanel runModal];
	[activeDocument setFilename: [savePanel filename]];
	NSLog(@"Got save file %@", [savePanel filename]);
	[activeDocument save];	
}

-(void)newDocument: (id)sender
{
	NSLog(@"New Document");
	if ([activeDocument hasUnsavedChanges])
	{
		[self promptSave];		
	}
	activeDocument = [[Document alloc] init];
	[textField setText: [activeDocument getContent]];
}

-(void)promptSave
{
	NSLog(@"init");
	[NSBundle loadNibNamed: @"UnsavedChangesPanel" owner: self];
	[NSApp runModalForWindow: unsavedChangesPanel]; 
	if ([unsavedChangesPanel shouldSave])
	{
		[self saveDocument: self];
	}
}

// MARK: - NSTextViewDelegate

-(void)textDidChange: (NSNotification*)not
{
	NSString* content = [textField text];
	[activeDocument setContent: content];
}

@end
