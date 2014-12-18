GO_EASY_ON_ME = 1
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

BUNDLE_NAME = WAEnhancerPrefs
WAEnhancerPrefs_FILES = WAEnhancerPrefs.mm $(wildcard *.mm) $(wildcard ColorPicker/*.m)
WAEnhancerPrefs_INSTALL_PATH = /Library/PreferenceBundles
WAEnhancerPrefs_FRAMEWORKS = UIKit Social Twitter Foundation CoreGraphics QuartzCore
WAEnhancerPrefs_LIBRARIES = substrate
WAEnhancerPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/WAEnhancerPrefs.plist$(ECHO_END)
