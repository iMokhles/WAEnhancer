//
//  DecFile.h
//  WAEnhancer
//
//  Created by Mokhlas Hussein on 2/22/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "./Vendors/RNGridMenu.h"
#import <Social/Social.h>
#import <substrate.h>
#import "./Vendors/AWAYImport.h"
#import "./Vendors/EGYOpenInActivity.h"
#import "./Vendors/MMProgressHUD/MMProgressHUD.h"
#import "./Vendors/MMProgressHUD/MMProgressHUDOverlayView.h"
#import "./Vendors/MMProgressHUD/MMRadialProgressView.h"
#import "./Vendors/MMProgressHUD/MMLinearProgressView.h"
#import "./Vendors/BYQuickShotView.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreGraphics/CoreGraphics.h>
#import "./Vendors/UIImage-Extensions/CustomImagePickerController.h"
#import "./Vendors/LeveyPopListView/LeveyPopListView.h"
#import "./Vendors/CFShareCircleView.h"
#import "./BFPaperButton.h"
#import "./Classes/MWPhotoBrowser.h"

#import "WAMessage.h"
#import "WAPhone.h"

#import "./Vendors/UIImage-Extensions/ImageFilterProcessViewController.h"

#import "./Vendors/ImageTools/CLImageEditor.h"

@class BBSectionInfo, BBThumbnailSizeConstraints;

@protocol BBDataProvider <NSObject>
-(NSString *)sectionIdentifier;
-(NSArray *)sortDescriptors;
-(NSArray *)bulletinsFilteredBy:(unsigned)by count:(unsigned)count lastCleared:(id)cleared;
@optional
-(NSString *)sectionDisplayName;
-(void)dataProviderDidLoad;
-(CGFloat)attachmentAspectRatioForRecordID:(NSString *)recordID;
-(NSData *)attachmentPNGDataForRecordID:(NSString *)recordID sizeConstraints:(BBThumbnailSizeConstraints *)sizeConstraints;
-(BBSectionInfo *)defaultSectionInfo;
-(id)sectionParameters;
-(id)clearedInfoForBulletins:(NSArray *)bulletins;
-(id)clearedInfoForBulletins:(NSArray *)bulletins lastClearedInfo:(id)info;
@end

@interface BBAction : NSObject <NSCopying, NSCoding> {
@private
    id _internalBlock;
    BOOL _hasCallblock;
    BOOL _canBypassPinLock;
    NSURL* _launchURL;
    NSString* _launchBundleID;
    int replyType;
}
@property(assign, nonatomic) int replyType;
@property(assign, nonatomic) BOOL hasCallblock;
@property(copy, nonatomic) id internalBlock;
@property(assign, nonatomic) BOOL canBypassPinLock;
@property(copy, nonatomic) NSString* launchBundleID;
@property(retain, nonatomic) NSURL* launchURL;
+(id)actionWithTextReplyCallblock:(id)textReplyCallblock;
+(id)actionWithLaunchBundleID:(id)launchBundleID callblock:(id)callblock;
+(id)actionWithLaunchURL:(id)launchURL callblock:(id)callblock;
+(id)actionWithCallblock:(id)callblock;
-(id)description;
-(void)encodeWithCoder:(id)coder;
-(id)initWithCoder:(id)coder;
-(id)copyWithZone:(NSZone*)zone;
-(id)partialDescription;
-(void)deliverResponse:(id)response;
-(id)bundleID;
-(id)url;
-(BOOL)isAppLaunchAction;
-(BOOL)isURLLaunchAction;
-(BOOL)wantsTextReply;
-(BOOL)hasLaunchInfo;
-(void)dealloc;
-(id)_initWithInternalCallblock:(id)internalCallblock replyType:(int)type;
-(id)initWithTextReplyCallblock:(id)textReplyCallblock;
-(id)initWithCallblock:(id)callblock;
@end

@interface BBObserver
- (void)clearSection:(NSString*)arg1;
@end
@class BBContent, BBSound, BBAttachments, BBAssertion;

@interface BBBulletin : NSObject <NSCopying, NSCoding> {
@private
    NSString* _sectionID;
    NSString* _publisherRecordID;
    NSString* _publisherBulletinID;
    int _addressBookRecordID;
    int _sectionSubtype;
    BBContent* _content;
    BBContent* _modalAlertContent;
    NSDate* _date;
    NSDate* _endDate;
    NSDate* _recencyDate;
    int _dateFormatStyle;
    BOOL _dateIsAllDay;
    NSTimeZone* _timeZone;
    int _accessoryStyle;
    BOOL _clearable;
    BBSound* _sound;
    BBAttachments* _attachments;
    NSString* _unlockActionLabelOverride;
    NSMutableDictionary* _actions;
    NSArray* _buttons;
    BOOL _expiresOnPublisherDeath;
    NSDictionary* _context;
    NSDate* _expirationDate;
    NSString* _bulletinID;
    NSDate* _lastInterruptDate;
    BBAssertion* _lifeAssertion;
    BBObserver* _observer;
    unsigned realertCount_deprecated;
    NSSet* alertSuppressionAppIDs_deprecated;
}/*
@property(copy, nonatomic) NSSet* alertSuppressionAppIDs_deprecated;
@property(assign, nonatomic) unsigned realertCount_deprecated;
@property(retain, nonatomic) BBObserver* observer;
@property(retain, nonatomic) BBAssertion* lifeAssertion;
@property(copy, nonatomic) BBAction* expireAction;
@property(retain, nonatomic) NSDate* expirationDate;
@property(retain, nonatomic) NSMutableDictionary* actions;
@property(copy, nonatomic) NSString* unlockActionLabelOverride;
@property(retain, nonatomic) BBAttachments* attachments;
@property(retain, nonatomic) BBContent* content;
@property(retain, nonatomic) NSDate* lastInterruptDate;
@property(retain, nonatomic) NSDictionary* context;
@property(assign, nonatomic) BOOL expiresOnPublisherDeath;
@property(copy, nonatomic) NSArray* buttons;
@property(copy, nonatomic) BBAction* replyAction;
@property(copy, nonatomic) BBAction* acknowledgeAction;
@property(copy, nonatomic) BBAction* defaultAction;
@property(readonly, assign, nonatomic) int primaryAttachmentType;
@property(retain, nonatomic) BBSound* sound;
@property(assign, nonatomic) BOOL clearable;
@property(assign, nonatomic) int accessoryStyle;
@property(retain, nonatomic) NSTimeZone* timeZone;
@property(assign, nonatomic) BOOL dateIsAllDay;
@property(assign, nonatomic) int dateFormatStyle;
@property(retain, nonatomic) NSDate* recencyDate;
@property(retain, nonatomic) NSDate* endDate;
@property(retain, nonatomic) NSDate* date;
@property(retain, nonatomic) BBContent* modalAlertContent;
@property(copy, nonatomic) NSString* message;
@property(copy, nonatomic) NSString* subtitle;
@property(copy, nonatomic) NSString* title;
@property(assign, nonatomic) int sectionSubtype;
@property(assign, nonatomic) int addressBookRecordID;
@property(copy, nonatomic) NSString* publisherBulletinID;
@property(copy, nonatomic) NSString* recordID;
@property(copy, nonatomic) NSString* sectionID;
@property(copy, nonatomic) NSString* section;
@property(copy, nonatomic) NSString* bulletinID;*/
+(id)bulletinWithBulletin:(BBBulletin *)bulletin;
-(id)description;
-(void)encodeWithCoder:(id)coder;
-(id)initWithCoder:(id)coder;
-(id)copyWithZone:(NSZone*)zone;
-(void)_fillOutCopy:(id)copy withZone:(NSZone*)zone;
-(void)deliverResponse:(id)response;
-(id)responseSendBlock;
-(id)responseForExpireAction;
-(id)responseForButtonActionAtIndex:(unsigned)index;
-(id)responseForAcknowledgeAction;
-(id)responseForReplyAction;
-(id)responseForDefaultAction;
-(id)_responseForActionKey:(id)actionKey;
-(id)_actionKeyForButtonIndex:(unsigned)buttonIndex;
-(id)attachmentsCreatingIfNecessary:(BOOL)necessary;
-(unsigned)numberOfAdditionalAttachmentsOfType:(int)type;
-(unsigned)numberOfAdditionalAttachments;
-(id)init;
-(void)dealloc;
- (id)publisherMatchID;
@end

@interface BBBulletinRequest : BBBulletin {
}
@property unsigned int accessoryStyle;
@property(copy) BBAction * acknowledgeAction;
@property int addressBookRecordID;
@property(copy) NSSet * alertSuppressionContexts;
@property(copy) BBAction * alternateAction;
@property(copy) NSString * bulletinID;
@property(copy) NSArray * buttons;
@property BOOL clearable;
@property(retain) NSDate * date;
@property int dateFormatStyle;
@property BOOL dateIsAllDay;
@property(copy) BBAction * defaultAction;
@property(copy) NSString * dismissalID;
@property(retain) NSDate * endDate;
@property(retain) NSDate * expirationDate;
@property unsigned int expirationEvents;
@property(copy) BBAction * expireAction;
@property BOOL expiresOnPublisherDeath;
@property BOOL hasEventDate;
@property(copy) NSString * message;
@property(retain) BBContent * modalAlertContent;
@property int primaryAttachmentType;
@property(copy) NSString * publisherBulletinID;
@property unsigned int realertCount;
@property(retain) NSDate * recencyDate;
@property(copy) NSString * recordID;
@property(copy) NSString * section;
@property(copy) NSString * sectionID;
@property int sectionSubtype;
@property BOOL showsUnreadIndicator;
@property(copy) BBAction * snoozeAction;
@property(retain) BBSound * sound;
@property(retain) BBContent * starkBannerContent;
@property(copy) NSSet * subsectionIDs;
@property(copy) NSString * subtitle;
@property BOOL tentative;
@property(retain) NSTimeZone * timeZone;
@property(copy) NSString * title;
@property BOOL usesExternalSync;
@property BOOL wantsFullscreenPresentation;
-(void)generateBulletinID;
-(void)addAlertSuppressionAppID:(id)anId;
-(void)setUnlockActionLabel:(id)label;
-(void)withdraw;
-(void)publish;
-(void)publish:(BOOL)publish;
-(void)addButton:(id)button;
-(void)addAttachmentOfType:(int)type;
-(void)setContextValue:(id)value forKey:(id)key;
- (id)publisherMatchID;
@end

@interface BBSectionInfo : NSObject <NSCopying, NSCoding> {
    NSString* _sectionID;
    unsigned _sectionType;
    BOOL _showsInNotificationCenter;
    unsigned _pushSettings;
    unsigned _alertType;
    unsigned _notificationCenterLimit;
    BOOL _showsInLockScreen;
    NSString* _pathToWeeAppPluginBundle;
}
@property(assign, nonatomic) unsigned bulletinCount;
@property(assign, nonatomic) BOOL enabled;
@property(copy, nonatomic) NSString* pathToWeeAppPluginBundle;
@property(assign, nonatomic) unsigned alertType;
@property(assign, nonatomic) unsigned pushSettings;
@property(assign, nonatomic) unsigned notificationCenterLimit;
@property(assign, nonatomic) BOOL showsInLockScreen;
@property(assign, nonatomic) BOOL showsInNotificationCenter;
@property(assign, nonatomic) unsigned sectionType;
@property(copy, nonatomic) NSString* sectionID;
+(id)defaultSectionInfoForType:(unsigned)type;
-(void)encodeWithCoder:(id)coder;
-(id)initWithCoder:(id)coder;
-(id)copyWithZone:(NSZone*)zone;
-(id)description;
-(id)_pushSettingsDescription;
-(void)dealloc;
@end

@protocol BBPushDataProviderFactory;

@interface BBServer : NSObject /*<XPCProxyTarget>*/ {
@private
    NSMutableSet* _observers;
    NSMutableSet* _listObservers;
    NSMutableSet* _modalAlertObservers;
    NSMutableSet* _bannerObservers;
    NSMutableSet* _lockscreenObservers;
    NSMutableSet* _soundObservers;
    NSMutableSet* _settingsObservers;
    NSMutableSet* _settingsGateways;
    NSMutableArray* _sortedSectionIDs;
    unsigned _sectionOrderRule;
    NSMutableDictionary* _sectionInfoByID;
    NSMutableDictionary* _sectionParametersByID;
    NSMutableDictionary* _sectionSortDescriptorsByID;
    NSMutableDictionary* _bulletinsByID;
    NSMutableDictionary* _bulletinIDsBySectionID;
    NSMutableDictionary* _transactionsByObserver;
    NSMutableDictionary* _listBulletinIDsBySectionID;
    NSMutableArray* _interruptingBulletinIDs;
    NSMutableArray* _expiringBulletinIDs;
//  dispatch_source_t _timer;
    NSDate* _nextScheduledFireDate;
    NSMutableDictionary* _dataProvidersBySection;
    NSMutableSet* _pushDataProviders;
    NSMutableDictionary* _clearedSections;
    id<BBPushDataProviderFactory> _pushDataProviderFactory;
    int _demo_lockscreen_token;
@protected
    NSMutableDictionary* _bulletinRequestsByID;
}
+(void)initialize;
-(void)demo_lockscreen:(unsigned long long)lockscreen;
-(id)_defaultSectionInfoForDataProvider:(id)dataProvider;
-(void)_writeSectionInfo;
-(void)_writeSectionOrder;
-(void)_loadSavedSectionInfo;
-(void)_readSavedSectionOrder:(id*)order andRule:(unsigned*)rule;
-(id)_sectionInfoPath;
-(id)_sectionOrderPath;
-(void)_writeClearedSections;
-(void)_loadClearedSections;
-(id)_clearedSectionsPath;
-(void)_ensureDataDirectoryExists;
-(id)_dataDirectoryPath;
-(void)_loadAllWeeAppSections;
-(id)_copyDefaultEnabledWeeAppIDs;
-(void)_removePushDataProvider:(id)provider;
-(void)_updatePushSettingsForPushDataProvider:(id)pushDataProvider;
-(void)_noteUserEnabledPushDeliveryForDataProvider:(id)dataProvider;
-(void)_addPushDataProvider:(id)provider sortNowAndNotifyObservers:(BOOL)observers;
-(void)_addDataProvider:(id)provider sortSectionsNow:(BOOL)now;
-(void)_loadDataProviderPluginBundle:(id)bundle;
-(void)_loadAllDataProviderPluginBundles;
-(void)_setClearedInfo:(id)info forSectionID:(id)sectionID;
-(id)_clearedInfoForSectionID:(id)sectionID;
-(unsigned)_countForSectionID:(id)sectionID;
-(unsigned)_filtersForSectionID:(id)sectionID;
-(void)_publishBulletinRequest:(id)request forDataProvider:(id)dataProvider forDestinations:(int)destinations;
-(void)_updateSectionParametersForDataProvider:(id)dataProvider;
-(void)_updateBulletinsForDataProvider:(id)dataProvider;
-(void)_updateBulletinsForDataProviderIfSectionIsEnabled:(id)dataProviderIfSectionIsEnabled;
-(BOOL)_verifyBulletinRequest:(id)request forDataProvider:(id)dataProvider;
-(void)_publishBulletinsForAllDataProviders;
-(void)_loadDataProvidersAndSettings;
-(void)settingsGateway:(id)gateway setSectionInfo:(id)info forSectionID:(id)sectionID;
-(void)settingsGateway:(id)gateway setOrderedSectionIDs:(id)ids;
-(void)settingsGateway:(id)gateway setSectionOrderRule:(unsigned)rule;
-(void)settingsGateway:(id)gateway getSectionInfoWithHandler:(id)handler;
-(void)observer:(id)observer getRecentUnacknowledgedBulletinsForFeeds:(unsigned)feeds withHandler:(id)handler;
-(void)observer:(id)observer requestListBulletinsForSectionID:(id)sectionID;
-(id)_updatesForObserver:(id)observer bulletinIDs:(id)ids;
-(void)observer:(id)observer getSectionInfoWithHandler:(id)handler;
-(void)observer:(id)observer clearSection:(id)section;
-(void)observer:(id)observer finishedWithBulletinID:(id)bulletinID transactionID:(unsigned)anId;
-(void)observer:(id)observer handleResponse:(id)response;
-(void)observer:(id)observer setObserverFeed:(unsigned)feed;
-(void)getAttachmentAspectRatioForBulletinID:(NSString *)bulletinID withHandler:(id)handler;
-(void)getAttachmentPNGDataForBulletinID:(NSString *)bulletinID sizeConstraints:(id)constraints withHandler:(id)handler;
-(void)getSectionParametersForSectionID:(NSString *)sectionID withHandler:(id)handler;
-(void)getSortDescriptorsForSectionID:(NSString *)sectionID withHandler:(id)handler;
-(void)getSectionOrderRuleWithHandler:(id)handler;
-(id)_interruptingBulletinIDsForFeeds:(unsigned)feeds;
-(void)_expireInterruptions;
-(void)_addInterruptingBulletin:(id)bulletin;
-(void)_scheduleExpirationForBulletin:(id)bulletin;
-(void)_expireBulletins;
-(unsigned)_indexForNewDate:(id)newDate inBulletinIDArray:(id)bulletinIDArray sortedAscendingByDateForKey:(id)key;
-(id)_bulletinIDsInSortedArray:(id)sortedArray withDateForKey:(id)key beforeCutoff:(id)cutoff;
-(void)_expireBulletinsAndInterruptionsAndRescheduleTimerIfNecessary;
-(id)_nextExpireInterruptionsDate;
-(id)_nextExpireBulletinsDate;
-(void)_scheduleTimerForDate:(id)date;
-(void)_clearTimer;
-(void)_handleSignificantTimeChange;
-(void)_handleSystemWake;
-(void)_handleSystemSleep;
-(void)_setSectionInfo:(id)info forSectionID:(id)sectionID;
-(void)_clearBulletinIDIfPossible:(id)possible rescheduleExpirationTimer:(BOOL)timer;
-(id)_sectionInfoArray:(BOOL)array;
-(void)_sortSectionIDsUsingGuideArray:(id)array;
-(void)_sortSectionIDsUsingDefaultOrder;
-(id)_allBulletinsForSectionID:(id)sectionID;
-(id)_listBulletinsForSectionID:(id)sectionID;
-(id)_bulletinsForIDs:(id)ids;
-(unsigned)_incrementedTransactionIDForObserver:(id)observer bulletinID:(id)anId;
-(id)_currentTransactionForObserver:(id)observer bulletinID:(id)anId;
-(unsigned)_feedsForBulletin:(id)bulletin destinations:(int)destinations;
-(void)_removeSection:(id)section;
-(void)_clearSection:(id)section;
-(void)_removeBulletin:(id)bulletin;
-(void)_removeBulletin:(id)bulletin rescheduleTimerIfAffected:(BOOL)affected;
-(void)_modifyBulletin:(id)bulletin;
-(void)_addBulletin:(id)bulletin;
-(void)_sendRemoveBulletin:(id)bulletin toFeeds:(unsigned)feeds;
-(void)_sendModifyBulletin:(id)bulletin toFeeds:(unsigned)feeds;
-(void)_sendAddBulletin:(id)bulletin toFeeds:(unsigned)feeds;
-(id)_observersForFeeds:(unsigned)feeds;
-(void)_sendUpdateSectionOrderRule;
-(void)_sendUpdateSectionOrder;
-(void)_sendUpdateSectionInfo:(id)info;
-(void)_removeSettingsGateway:(id)gateway;
//-(void)_addSettingsGatewayWithConnection:(xpc_connection_s*)connection;
-(void)_removeObserver:(id)observer;
//-(void)_addObserverWithConnection:(xpc_connection_s*)connection;
-(id)sortDescriptorsForSectionID:(id)sectionID;
-(unsigned)listBulletinCapForSectionID:(id)sectionID;
-(id)allBulletinIDsForSectionID:(id)sectionID;
-(id)listBulletinIDsForSectionID:(id)sectionID;
-(void)removeBulletinID:(id)anId fromListSection:(id)listSection;
-(void)withdrawBulletinID:(id)anId;
-(void)publishBulletin:(id)bulletin destinations:(int)destinations;
-(id)proxy:(id)proxy detailedSignatureForSelector:(SEL)selector;
-(void)dealloc;
-(id)init;
@end

@interface BBThumbnailSizeConstraints : NSObject <NSCoding> {
@private
    int _constraintType;
    CGFloat _fixedWidth;
    CGFloat _fixedHeight;
    CGFloat _fixedDimension;
    CGFloat _minAspectRatio;
    CGFloat _maxAspectRatio;
    CGFloat _thumbnailScale;
}
@property (assign, nonatomic) CGFloat thumbnailScale;
@property (assign, nonatomic) CGFloat maxAspectRatio;
@property (assign, nonatomic) CGFloat minAspectRatio;
@property (assign, nonatomic) CGFloat fixedDimension;
@property (assign, nonatomic) CGFloat fixedHeight;
@property (assign, nonatomic) CGFloat fixedWidth;
@property (assign, nonatomic) int constraintType;
- (BOOL)areReasonable;
- (void)encodeWithCoder:(NSCoder *)encoder;
- (id)initWithCoder:(NSCoder *)decoder;
@end

extern void BBDataProviderAddBulletin(id <BBDataProvider> dataProvider, BBBulletin *bulletin);
extern void BBDataProviderInvalidateBulletins(id <BBDataProvider> dataProvider, NSArray *bulletins);
extern void BBDataProviderWithdrawBulletinsWithRecordID(id <BBDataProvider> dataProvider, NSString *recordID);

@interface UIImage (UIApplicationIconPrivate)
+ (UIImage *)_iconForResourceProxy:(id)resourceProxy format:(int)format;
+ (UIImage *)_iconForResourceProxy:(id)resourceProxy variant:(int)variant variantsScale:(CGFloat)scale;
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier roleIdentifier:(NSString *)roleIdentifier format:(int)format scale:(CGFloat)scale;
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier roleIdentifier:(NSString *)roleIdentifier format:(int)format;
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format scale:(float)scale;
+ (UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format;
+ (int)_iconVariantForUIApplicationIconFormat:(int)uiapplicationIconFormat scale:(CGFloat *)scale;
- (UIImage *)_applicationIconImageForFormat:(int)format precomposed:(BOOL)precomposed scale:(CGFloat)scale;
- (UIImage *)_applicationIconImageForFormat:(int)format precomposed:(BOOL)precomposed;
@end
/*
@interface SBMediaController (iOS5)
- (NSDictionary *)_nowPlayingInfo;
@end
*/

@interface SBUIBannerItem : NSObject
-(BBBulletin *)pullDownNotification;
- (id)sortDate;
@end

@interface SBUIBannerContext : NSObject
@property (nonatomic,readonly) SBUIBannerItem *item;
- (id)description;
- (id)initWithItem:(id)arg1 source:(id)arg2 target:(id)arg3;
- (id)item;
- (id)source;
- (id)target;
@end

@interface SBDefaultBannerView : UIView
-(id)initWithFrame:(CGRect)frame;
-(id)initWithContext:(SBUIBannerContext *)context;
-(SBUIBannerContext *)bannerContext;
-(void)nma_initTweak; //new
-(BBBulletin *)nma_bulletin; //new
-(void)notifyMeAgain:(BBBulletin *)bulletin afterDelay:(NSTimeInterval)delay; //new
@end

@interface WAMessageCell : UITableViewCell
@end

@interface SBControlCenterController : UIViewController
- (BOOL)isVisible;
- (void)loadView;
@end

// @interface SBApplicationIcon : NSObject <UITextFieldDelegate>
// - (id)displayName;
// - (id)leafIdentifier;
// - (void)launch;
// @end

@interface SBApplication : NSObject
- (id)bundleIdentifier;
- (BOOL)icon:(id)arg1 launchFromLocation:(int)arg2;
@end

@interface WAGroupMember : NSManagedObject
@property(retain, nonatomic) NSString *statusMessage; // @synthesize statusMessage=_statusMessage;
// Remaining properties
@property(retain, nonatomic) NSNumber *contactABID; // @dynamic contactABID;
@property(retain, nonatomic) NSString *contactName; // @dynamic contactName;
@property(retain, nonatomic) NSString *firstName; // @dynamic firstName;
@property(retain, nonatomic) NSNumber *isActive; // @dynamic isActive;
@property(retain, nonatomic) NSString *memberJID; // @dynamic memberJID;
@property(retain, nonatomic) NSSet *messages; // @dynamic messages;
@end

@interface WAGroupInfo : NSManagedObject
// Remaining properties
@property(retain, nonatomic) NSDate *creationDate; // @dynamic creationDate;
@property(retain, nonatomic) WAGroupMember *lastMessageOwner; // @dynamic lastMessageOwner;
@property(retain, nonatomic) NSString *ownerJID; // @dynamic ownerJID;
@property(retain, nonatomic) NSString *pictureID; // @dynamic pictureID;
@property(retain, nonatomic) NSString *picturePath; // @dynamic picturePath;
@property(retain, nonatomic) NSNumber *state; // @dynamic state;
@property(retain, nonatomic) NSString *subjectOwnerJID; // @dynamic subjectOwnerJID;
@property(retain, nonatomic) NSDate *subjectTimestamp; // @dynamic subjectTimestamp;
@end

@interface WAChatProperties : NSManagedObject
// Remaining properties
@property(retain, nonatomic) NSNumber *alerts; // @dynamic alerts;
@property(retain, nonatomic) NSNumber *enabled; // @dynamic enabled;
@property(retain, nonatomic) NSDate *muteDate; // @dynamic muteDate;
@property(retain, nonatomic) NSString *soundName; // @dynamic soundName;
@end

@interface WAChatSession : NSManagedObject
@property(retain, nonatomic) NSString *contactJID; // @dynamic contactJID;
- (void)deleteSession;
// Remaining properties
@property(retain, nonatomic) NSNumber *contactABID; // @dynamic contactABID;
@property(retain, nonatomic) NSNumber *flags; // @dynamic flags;
@property(retain, nonatomic) WAGroupInfo *groupInfo; // @dynamic groupInfo;
@property(retain, nonatomic) NSSet *groupMembers; // @dynamic groupMembers;
@property(retain, nonatomic) NSNumber *hidden; // @dynamic hidden;
@property(retain, nonatomic) WAMessage *lastMessage; // @dynamic lastMessage;
@property(retain, nonatomic) NSDate *lastMessageDate; // @dynamic lastMessageDate;
@property(retain, nonatomic) NSString *lastMessageText; // @dynamic lastMessageText;
@property(retain, nonatomic) NSNumber *messageCounter; // @dynamic messageCounter;
@property(retain, nonatomic) NSSet *messages; // @dynamic messages;
@property(retain, nonatomic) NSString *partnerName; // @dynamic partnerName;
@property(retain, nonatomic) WAChatProperties *properties; // @dynamic properties;
@property(retain, nonatomic) NSNumber *removed; // @dynamic removed;
@property(retain, nonatomic) NSString *savedInput; // @dynamic savedInput;
@property(retain, nonatomic) NSNumber *sessionType; // @dynamic sessionType;
@property(retain, nonatomic) NSNumber *unreadCount; // @dynamic unreadCount;
@end

@interface WAContact : NSObject
@property(retain, nonatomic) NSString *fullName;
@end

@interface WAContactsStorage : NSObject
- (NSArray *)favorites;
- (WAFavorite *)favoriteWithObjectID:(NSManagedObjectID *)objectID;
- (WAContact *)contactForJID:(NSString *)jid;
- (WAPhone *)phoneWithObjectID:(NSManagedObjectID *)objectID;
- (UIImage *)profilePictureForJID:(NSString *)jid;
@end

@interface WAChatStorage : NSObject
- (int)numberOfUnreadChatSessions;
- (NSArray *)chatSessionsWithBroadcast:(BOOL)broadcast;
- (WAChatSession *)existingChatSessionForJID:(NSString *)jid;
- (WAChatSession *)createChatSessionForContact:(WAContact *)contact JID:(NSString *)jid;
- (NSArray *)messagesForSession:(WAChatSession *)session startOffset:(NSUInteger)offset limit:(NSUInteger)limit;
- (void)storeModifiedChatSession:(WAChatSession *)session;
- (WAMessage *)messageWithText:(NSString *)text inChatSession:(WAChatSession *)chatSession isBroadcast:(BOOL)broadcast;
- (void)sendMessageWithImage:(UIImage *)image ofIndex:(NSInteger)index totalCount:(NSUInteger)count inChatSession:(WAChatSession *)chatSession completion:(id)completion;
- (void)sendVideoAtURL:(NSURL *)movieURL inChatSession:(WAChatSession *)chatSession completion:(id)completion;
@end

@interface WAServerProperties : NSObject
+ (BOOL)isGroupsV2Enabled;
+ (BOOL)isWhatsAppIDEnabledForVOIP:(id)arg1;
+ (BOOL)isVOIPEnabled;
+ (int)maxListSize;
+ (BOOL)isLocationSharingEnabled;
+ (BOOL)isReadReseiptsEnabledForDate:(id)arg1;
+ (BOOL)isReadReseiptsEnabled;
+ (BOOL)isAudioSharingEnabled;
+ (float)imageQuality;
+ (int)imageMaxEdge;
+ (int)imageMaxKBytes;
+ (int)maxGroupSubjectLength;
+ (int)maxBroadcastSize;
+ (int)maxGroupParticipants;
+ (unsigned long long)maxMediaSize;
+ (BOOL)shouldQueryVersion:(id)arg1;
+ (void)setProperties:(id)arg1 version:(id)arg2;
+ (void)resetToDefaults;
+ (void)reloadServerPropertiesFromPreferences;
+ (id)prefBundleKey;
+ (void)initialize;

@end

@interface WAServerProperties (WAEnhancer) <UIAlertViewDelegate>
@end

@interface StatusEditController : UIViewController
@end

@interface StatusEditController (WAEnhancer) <UIAlertViewDelegate>
@end

@interface ChatManager : NSObject
@property(readonly, assign, nonatomic) WAContactsStorage *contactsStorage;
@property(readonly, assign, nonatomic) WAChatStorage *storage;
+ (ChatManager *)sharedManager;
@end

@interface ChatManager (WAEnhancer) <UIAlertViewDelegate>
@end


@interface XMPPConnection : NSObject
@end

@interface XMPPConnection (WAEnhancer) <UIAlertViewDelegate>
@end

@interface XMPPClient : NSObject
@end

@interface XMPPClient (WAEnhancer) <UIAlertViewDelegate>
@end

@interface WAPhotoMoveAndScaleViewController : UIViewController
@end

@interface WAPhotoMoveAndScaleViewController (WAEnhancer) <UIAlertViewDelegate>
@end

@interface WAMediaPickerController : UINavigationController
@end

@interface WAMediaPickerController (WAEnhancer) <UIAlertViewDelegate>
@end

@interface WATheme : NSObject
- (void)contentSizeCategoryDidChange:(id)arg1;
- (void)reloadDynamicTypeFontSize;
- (void)setFontSize:(float)arg1;
- (int)defaultFontSize;
- (int)fontSize;
@end

@interface WATheme (WAEnhancer) <UIAlertViewDelegate>
-(int)grabPrefColor:(NSInteger)fontNumber;
@end

@interface TextMessage : NSObject
@end

@interface TextMessage (WAEnhancer) <UIAlertViewDelegate>
@end

@interface WAViewController : UIViewController
@end

@interface WAMediaObject : NSObject
@property(readonly, nonatomic) unsigned int type;
@property(readonly, nonatomic) NSString *path;
@property(retain, nonatomic) NSString *fromName;
@property(retain, nonatomic) UIImage *thumbnail;
@end

@interface WAMediaViewController : UIViewController
- (WAMediaObject *)currentMedia;
- (void)assignImageToContact;
- (void)saveCurrentVideo;
- (void)saveCurrentImage;
- (void)forwardMediaViaEmail;
- (void)showPersonPickerForMediaForwardViaWhatsApp;
- (void)setProfilePhoto;
- (void)assignCurrentImageToGroup;
@end

@interface WAMediaViewController (WAEnhancer) <UIActionSheetDelegate, UIAlertViewDelegate>
- (void)saveToMusicLibrary;
- (void)sharePhotosTo;
- (void)shareVideosTo;
@end

@interface WAListsViewController : WAViewController
- (void)tableView:(id)arg1 commitEditingStyle:(int)arg2 forRowAtIndexPath:(id)arg3;
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2;
- (void)deleteListDidFailWithError:(id)arg1 userData:(id)arg2;
- (void)deleteListDidSucceedWithUserData:(id)arg1;
- (void)deleteExistingList:(id)arg1;
@end

@interface SettingsViewController : UITableViewController
@property(retain, nonatomic) UILabel *labelConnectionStatus; // @synthesize labelConnectionStatus=_labelConnectionStatus;
@property(retain, nonatomic) UIView *viewConnectionStatus; // @synthesize viewConnectionStatus=_viewConnectionStatus;
@property(retain, nonatomic) UIActivityIndicatorView *aiConnectionStatus; // @synthesize aiConnectionStatus=_aiConnectionStatus;
@end

@interface WAConnectionStatusView : UIView
@end

@interface WASettingsViewController : UITableViewController
@end

@class ProfileViewController;

@protocol ProfileViewControllerDelegate <NSObject>
- (void)profileViewControllerDidFinish:(ProfileViewController *)arg1;
@end

@interface ProfileViewController : UIViewController
- (id)initWithProfileContollerDelegate:(id)arg1;
@property(retain, nonatomic) UIImageView *imageProfilePhoto; // @synthesize imageProfilePhoto=_imageProfilePhoto;
@end

@interface WAUserProfileInfo : NSObject
@end

@interface WAListsViewController (WAEnhancer) <UIActionSheetDelegate, NSFetchedResultsControllerDelegate>
- (void)deleteLists;
@end

@interface WAMultiSendMediaPickerController : NSObject
+ (BOOL)useNativePicker;
+ (void)initialize;
- (void)multiSendPreviewViewController:(id)arg1 didConfirmImages:(id)arg2;
- (void)cleanUp;
@end

@interface WAMultiSendPreviewViewController : WAViewController
- (void)sendImages:(id)arg1;
@end

@interface WAChatBackgroundViewController : WAViewController
@end

@interface WAChatBaseViewController : WAChatBackgroundViewController
- (void)showSingleMediaForwardPicker;
- (void)emailSingleMediaFromMessage:(id)arg1;
@end

@interface ChatViewController : WAChatBaseViewController
- (void)sendFileAction:(id)fp8;
- (void)presentShareLocationController;
- (void)showVCardPersonPicker;
- (void)showImagePicker;
- (void)showVideoPicker;
- (void)showCamera;
- (void)showAudioMediaPicker;
- (void)hideKeyboard;
- (void)viewDidAppear:(BOOL)fp8;
@property(nonatomic) BOOL showKeyboardOnAppear;

- (void)sendImage:(id)arg1;
- (void)sendImage:(id)arg1 caption:(id)arg2;
@end

@class ImageFilterProcessViewController;

@interface ChatViewController (WAEnhancer) <RNGridMenuDelegate, UIDocumentInteractionControllerDelegate, UIAlertViewDelegate, CustomImagePickerControllerDelegate, ImageFitlerProcessDelegate, CFShareCircleViewDelegate, LeveyPopListViewDelegate, UIActionSheetDelegate, CLImageEditorDelegate>

- (void)showList;
- (void)showAudio;
- (void)filterImage;
- (void)sendLastImage;
- (void)sendDoodle;
- (void)exportAssetAtURL:(NSURL*)assetURL withTitle:(NSString*)title;
-(void)grabOption:(NSInteger)optionNM;
-(void)openLeveyPop;
-(void)openCFShare;
-(void)openRNGridMenu;
- (void)shareVideosTo;
@end

@interface NotificationsViewController : UITableViewController
+ (id)controller;
- (void)resetNotificationSettings;
- (void)askToResetNotificationSettigs;
- (void)settingUpdateFinished;
- (void)messageAlertsAction:(id)arg1;
- (id)init;
@end

@interface WATextBubbleView : UIView
- (id)bubbleText;
- (void)openUrl;
- (void)showActionSheet;
- (void)highlightUrl:(BOOL)arg1;
@end

@interface WAChatBarManager : NSObject
- (void)keyboardDidHide:(id)arg1;
- (void)keyboardWillHide:(id)arg1;
- (void)keyboardDidShow:(id)arg1;
- (void)keyboardWillShow:(id)arg1;
- (void)reenableUserInteractionIfNeeded;
- (void)disableUserInteractionIfNeeded;
- (void)preloadKeyboard;
- (void)removeKeyboardAnimationsHidingKeyboard:(BOOL)arg1;
- (id)keyboardView;
- (id)keyboardWindow;
- (void)hideKeyboard;
- (BOOL)showKeyboard;
@end

@interface SinglePersonPicker : UIViewController
@end

@interface SinglePersonPicker (WAEnhancer) <UIAlertViewDelegate>
@end

// @interface WhatsAppAppDelegate : UIResponder <UIApplicationDelegate>
// - (void)updateUnreadBadge;
// @end

@interface SBUIController : NSObject
@end

@interface BroadcastViewController : UIViewController
@end

@interface BroadcastViewController (WAEnhancer)
@end

@interface SBUIController (WAEnhancer) <UIAlertViewDelegate>
@end

@interface WADimmableImageView : UIImageView
@end

@interface WAChatCellData : NSObject
@end

@interface WallpaperSourceViewController (WAEnhancer) <MWPhotoBrowserDelegate>
@end

static NSMutableArray *wallpapers;
static NSMutableArray *thumbs;
static NSString *imagePath;
static MWPhotoBrowser *browser;

/*@interface readMarkSwitch : NSObject <FSSwitchDataSource>
@end*/

typedef NS_ENUM(NSInteger, MMProgressHUDDemoAnimationType) {
    MMProgressHUDDemoAnimationTypeExpand = 0,
    MMProgressHUDDemoAnimationTypeShrink,
    MMProgressHUDDemoAnimationTypeSwingRight,
    MMProgressHUDDemoAnimationTypeSwingLeft,
    MMProgressHUDDemoAnimationTypeBalloon,
    MMProgressHUDDemoAnimationTypeDrop,
    MMProgressHUDDemoAnimationTypeFade,
    
    MMProgressHUDDemoNumberOfAnimationTypes
};

typedef NS_ENUM(NSInteger, MMProgressHUDDemoFeatureType) {
    MMProgressHUDDemoTypeStylePlain = 0,
    MMProgressHUDDemoTypeStyleBordered,
    MMProgressHUDDemoTypeStaticImage,
    MMProgressHUDDemoTypeAnimatedImage,
    MMProgressHUDDemoTypeAutosizing,
    MMProgressHUDDemoTypeConfirmation,
    MMProgressHUDDemoTypeRadialProgress,
    MMProgressHUDDemoTypeLinearProgress,
    MMProgressHUDDemoTypeOverlayColor,
    MMProgressHUDDemoTypeImageRemove,
    
    MMProgressHUDDemoNumberOfFeatureTypes
};

#define kUrl_BUYIT @"cydia://package/com.imokhles.WAEnhancer"

#define PREFERENCES_PATH @"/var/mobile/Library/Preferences/com.imokhles.WAEnhancerPrefs.plist"
#define PREFERENCES_CHANGED_NOTIFICATION "com.imokhles.WAEnhancerPrefs.preferences-changed"

#define PREFERENCES_ENABLED_UnlimitedList_KEY @"unlimLists"
#define PREFERENCES_ENABLED_UnlimitedGroup_KEY @"unlimGroups"
#define PREFERENCES_ENABLED_UnlimitedMedia_KEY @"unlimMedias"
#define PREFERENCES_ENABLED_UnlimitedListStatus_KEY @"unlimStatus"

#define PREFERENCES_ENABLED_UnlimitedSubjects_KEY @"unlimSubjects"
#define PREFERENCES_ENABLED_UnlimitedPhotos_KEY @"unlimPhotos"
#define PREFERENCES_ENABLED_ShareStyle_KEY @"shaStyle"
#define PREFERENCES_ENABLED_SelectALL_KEY @"seAll"
#define PREFERENCES_ENABLED_ProfilePIC_KEY @"proPic"
#define PREFERENCES_FONT_KEY @"foPrefs"
#define PREFERENCES_FONTCOLOR_KEY @"focoPrefs"
#define PREFERENCES_URLCOLOR_KEY @"urcoPrefs"
#define PREFERENCES_ENABLED_READ_KEY @"readMark"
#define PREFERENCES_ENABLED_LASTSEEN_KEY @"lSeenPrefs"
#define PREFERENCES_ENABLED_MediaOPTIONS_KEY @"medOptions"
#define PREFERENCES_ENABLED_TEXTWALK_KEY @"twPrefs"
#define PREFERENCES_ENABLED_OLINK_KEY @"opLinPrefs"
#define PREFERENCES_ENABLED_ActiveWallpaper_KEY @"activeWallpaper"

#define PREFERENCES_ENABLED_WHATSAPP_KEY @"WHATSAPP"
#define PREFERENCES_ENABLED_WHATSAPP1_KEY @"WHATSAPP1"
#define PREFERENCES_ENABLED_WHATSAPP2_KEY @"WHATSAPP2"
#define PREFERENCES_ENABLED_WHATSAPP3_KEY @"WHATSAPP3"
#define PREFERENCES_ENABLED_WHATSAPP4_KEY @"WHATSAPP4"
#define PREFERENCES_ENABLED_WHATSAPP5_KEY @"WHATSAPP5"


//#define PREFERENCES_ENABLED_WALKColor_KEY @"walkColorPrefs"
#define UserIDKey @"UserID"

#define NAVBAR_KEY @"NavigationBar"
#define NAVBARITEM_KEY @"NavigationBar-Items"

#define TABBAR_KEY @"TabBar"
#define TABBARITEM_KEY @"TabBar-Items"


#define PREFERENCES_ENABLECOLORS_KEY @"enableColors"
#define PREFERENCES_SHOWKEYBOARD_KEY @"Show-Keyboard"
#define PREFERENCES_HIDECAMERA_KEY @"Hide-Camera"
static UIColor* NAV;
static UIColor* NAV_ITEM;
static UIColor* TAB;
static UIColor* TAB_ITEM;

static NSMutableDictionary *plist;
static NSInteger optionAB;

// options
static CFShareCircleView *shareCircleView;
static NSArray *options;

static BOOL unlimitedMedia;
static BOOL unlimitedStatus;
static BOOL unlimitedSubjects;
static BOOL unlimitedPhotos;
static BOOL mediaOptions;
static BOOL shareStyle;
static BOOL profilePic;
static BOOL lastSeen;
static BOOL readMark;
static BOOL bcSelectAll;
static BOOL textWALK;
static BOOL openLink;
static id disAll = nil;
static BOOL showKeyboard;
static BOOL hideCamera;
static BOOL newSettings;
static BOOL activeWallapaperBOOL;

static NSInteger fontPrefs;
static NSInteger colorPrefs;
static NSInteger urlColor;
static NSInteger chatbgColor;

static UIBarButtonItem *newListButton = nil;
static UIBarButtonItem *flexibleSpace = nil;
static UIBarButtonItem *buttonSelectDelete = nil;

static BOOL listsDeleted = YES;
static UIBarButtonItem *deleteButton = nil;
static UIBarButtonItem *editButton = nil;

static UIView *settingsView = nil;
static BFPaperButton *netStatusButton = nil;
static BFPaperButton *aboutButton = nil;
static BFPaperButton *tellButton = nil;
static BFPaperButton *profileButton = nil;
static BFPaperButton *chSettingsButton = nil;
static BFPaperButton *accountButton = nil;
static BFPaperButton *notifiButton = nil;
static BFPaperButton *sysStatusButton = nil;
static BFPaperButton *clearChatsButton = nil;
static BFPaperButton *archiveChatsButton = nil;
static UIImageView *myImage = nil;

static BOOL enableColors;

#define TABCOLORS [UIColor colorWithRed:redTAB green:greenTAB blue:blueTAB alpha:1.0f]
#define NAVICOLORS [UIColor colorWithRed:redNAVI green:greenNAVI blue:blueNAVI alpha:1.0f]

#define TABITEMCOLORS [UIColor colorWithRed:redTABItem green:greenTABItem blue:blueTABItem alpha:1.0f]
#define NAVIITEMCOLORS [UIColor colorWithRed:redNAVIItem green:greenNAVIItem blue:blueNAVIItem alpha:1.0f]

@interface WATabBarController : UITabBarController
@end

static NSString* textToSpeak;
UIWindow *containerWindow;
static NSString *subString;
static NSMutableArray *a;
static NSData *dataToWrite;
static NSString *docsDirectory;
static NSString *path;
static NSString *content;
static BOOL isWAReadMarkEnabled = NO;

// iOS 7 stuff
typedef enum {
    SBIconLocationHomeScreen = 0,
    SBIconLocationDock       = 1,
    SBIconLocationSwitcher   = 2
} SBIconLocation;

@interface SBIconModel
+ (id)sharedInstance; //iOS 4&5
- (id)applicationIconForDisplayIdentifier:(id)displayIdentifier; //iOS 4&5&6
- (id)applicationIconForBundleIdentifier:(id)arg1; //iOS8
- (id)visibleIconIdentifiers; //iOS 4&5&6
-(id)expectedIconForDisplayIdentifier:(id)arg1;
@end

@interface SBIconViewMap
+ (id)homescreenMap; //iOS 5&6
- (id)iconModel; //iOS 6
@end

@interface SBIcon
- (void)setBadge:(id)badge; //iOS 5&6
- (id)badgeNumberOrString; //iOS 5&6
- (int)badgeValue; //iOS 5&6
- (id)displayName; //iOS 5&6
- (id)applicationBundleID;
@end

@interface SBIconController
-(id)sharedInstance;
-(SBIconModel *)model;
@end

@interface SBApplicationIcon
- (int)badgeValue;
- (void)setBadge:(id)badge;
- (NSString *)applicationBundleID;
- (NSString *)displayName;
- (void)launch; // <=iOS 6
- (void)launchFromLocation:(SBIconLocation)location; // >=iOS 7
@end

@interface SBBulletinBannerController
+ (instancetype)sharedInstance;
- (void)observer:(id)observer addBulletin:(BBBulletinRequest *)bulletin forFeed:(int)feed;
-(void)_queueBulletin:(BBBulletin *)bulletin;
@end

@interface SBNotificationsSectionInfo
- (id)identifier;
@end

@interface SBBulletinObserverViewController
- (void)clearSection:(id)arg1;
@end

//#import <Foundation/NSObject.h>
//#import <GraphicsServices/GSFont.h>
//#import <Availability2.h>
//
//@class NSString;
//
//@interface UIFont ()
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
//+(id)__newDummy;
//#else
//+(id)__dummy;
//#endif
//+(UIFont*)fontWithFamilyName:(NSString*)familyName traits:(GSFontTraitMask)traits size:(CGFloat)fontSize;
//+(UIFont*)fontWithMarkupDescription:(NSString*)markupDescription;
//+(float)labelFontSize;
//+(float)buttonFontSize;
//+(float)smallSystemFontSize;
//+(float)systemFontSize;
//-(id)initWithName:(id)name size:(float)size;
//-(id)initWithFamilyName:(id)familyName traits:(int)traits size:(float)size;
//-(id)initWithMarkupDescription:(id)markupDescription;
//-(id)initWithCoder:(id)coder;
//-(void)encodeWithCoder:(id)coder;
//-(Class)classForCoder;
//-(GSFontTraitMask)traits;
//-(BOOL)isFixedPitch;
//-(NSString*)markupDescription;
//@end

#define MAXLENGTH 300
#define MAXLENGTHBIG 9999
#define MAXLENGTHMEDIA 2006777216
#define MAXLENGTHIMAGE 1000000
#define MAXLENGTHIMAGEEDGE 40000

#define ImageQua image_quality
#define ImageEdg image_max_edge
#define ImageKb image_max_kbytes
#define MAXPart max_participants
#define MAXGro max_groups
#define MAXSub max_subject
#define Bcst broadcast
#define Media media
#define MAXList max_list_recipients
