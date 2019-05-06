ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif
ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif

include $(GNUSTEP_MAKEFILES)/common.make

APP_NAME = Notepad
Notepad_HEADERS = AppController.h AppDelegate.h Document.h UnsavedChangesPanel.h
Notepad_OBJC_FILES = main.m AppController.m AppDelegate.m Document.m UnsavedChangesPanel.m
Notepad_RESOURCE_FILES = Window.gorm UnsavedChangesPanel.gorm

include $(GNUSTEP_MAKEFILES)/aggregate.make
include $(GNUSTEP_MAKEFILES)/application.make
