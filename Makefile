GO_EASY_ON_ME = 1
export SDKVERSION=8.0
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 6.0
ADDITIONAL_CFLAGS = -fobjc-arc
include theos/makefiles/common.mk

TWEAK_NAME = WAEnhancer
WAEnhancer_FILES = $(wildcard *.xm) $(wildcard *.m) $(wildcard Classes/*.m) $(wildcard Vendors/*.m) $(wildcard Vendors/*/*.m)
WAEnhancer_FRAMEWORKS = Foundation UIKit CoreGraphics Social Accelerate MobileCoreServices QuartzCore AVFoundation MediaPlayer AssetsLibrary CoreData ImageIO CoreImage MessageUI
WAEnhancer_PRIVATE_FRAMEWORKS = GraphicsServices
WAEnhancer_LIBRARIES = MobileGestalt
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += waenhancerprefs
include $(THEOS_MAKE_PATH)/aggregate.mk