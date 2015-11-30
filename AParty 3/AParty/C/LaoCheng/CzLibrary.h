

#import <UIKit/UIKit.h>
#include <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h> 
#import <AddressBook/AddressBook.h>
#import <MapKit/MapKit.h>
//#import "CRSA.h"
//#import "UploadFile.h"
//#import "CzDB_Service.h"
//#import "CzConst.h"
#import <AVFoundation/AVFoundation.h>

extern BOOL isAnimation;

@interface CzLibrary : UIViewController <UIAlertViewDelegate>
+(NSString *) getMoneyStringFromFloat:(float) floatMoney;
+(NSString *) getMoneyStringFromInt:(int) intMoney;
+(NSString *)getUTF8String:(NSString *) originalStr;
+(NSString *) getStarString:(NSString *) originalStr;
+(NSString *) getStringAfterLastSplash:(NSString *)originalStr;
+(CGSize) getUILabelBonudsWithText:(NSString *)text inLimitSize:(CGSize)limitSize withFont:(UIFont *)font;
+(UILabel*) getUILabelWithText:(NSString *)text atPositionX:(float)startX postionY:(float)startY inLimitSize:(CGSize)limitSize withFont:(UIFont *)font;

+(NSString *) getCurrentTimeStamp;
+(NSString *) getCurrentTimeString;
+(NSString *) getCurrentTimeStringForFile;
+(NSString *) getTimeStampFromTimeString:(NSString *)timeString;

+(NSString *) getTimeStampFromNSDate:(NSDate *) nsDate;

+(NSString *) getTimeStringFromTimeStamp:(NSString *)timeStamp;

+(NSString *) getTimeStringFromNSDate:(NSDate *) date;
+(NSDate *) getNSDateFromTimeStamp:(NSString *) timeStamp;
+(NSDate *) getNSDateFromTimeString:(NSString *) timeString;
+(NSString *) getTimeStampAfterDay:(int) days withStartDayString:(NSString *)startDayString;
+(NSString *) getTimeStampAfterDay:(int) days withStartDayStamp:(NSString *)startDayStamp;
+(NSString *) getTimeStringAfterDay:(int) days withStartDayString:(NSString *) startDayString;
+(NSString *) getTimeStringAfterDay:(int) days withStartDayStamp:(NSString *) startDayStamp;
+(int) getIntervalInStringStartDay:(NSString *) dayStr1 andEndDay:(NSString *) dayStr2;
+(int) getIntervalInStampStartDay:(NSString *) dayStmp1 andEndDay:(NSString *) dayStmp2;
+(void) sendPageMessage:(int) pageId direct:(NSString *) direct;
+(void) sendPageMessage:(int) pageId withdirect:(NSString *)direction withExtraData:(NSMutableDictionary*)extraData;
//+(void) sendNavigatorPageMessage:(int) pageId direct:(NSString *) direct;
+(void) sendNavigatorPageMessage:(int) pageId withdirect:(NSString *)direction withExtraData:(NSMutableDictionary*)extraData;
+(void) sendUpperPageMessage:(int) pageId direct:(NSString *) direct;
+(void) sendUpperPageMessage:(int) pageId withdirect:(NSString *)direction withExtraData:(NSDictionary *)extraData;
+(void) sendFloatPageMessage:(UIView *) floatPage direct:(NSString *) direct;
+(void) sendFloatPageMessage:(UIView *) floatPage withdirect:(NSString *)direction withExtraData:(NSDictionary *)extraData;
+(void) closeEmojiPad;
+(UIView*) addFrameLayoutToViewGroup:(UIView*) rootContainer
                              startX:(float)startX
                              startY:(float) startY
                               width:(float) width
                              height:(float) height;
+(UILabel*) addTextLabelToViewGroup:(UIView*) rootContainer
                             startX:(float)startX
                             startY:(float) startY
                              width:(float) width
                             height:(float) height;
+(UITextView*) addEditTextToViewGroup:(UIView*) rootContainer
                               startX:(float)startX
                               startY:(float) startY
                                width:(float) width
                               height:(float) height;
+(UITextField*) addTextFieldToViewGroup:(UIView*) rootContainer
                                 startX:(float)startX
                                 startY:(float) startY
                                  width:(float) width
                                 height:(float) height;
+(UIImageView*) addImageViewToViewGroup:(UIView*) rootContainer
                                 startX:(float)startX
                                 startY:(float) startY
                                  width:(float) width
                                 height:(float) height;
+(UIScrollView *)addScrollToViewGroup:(UIView*) rootContainer
                               startX:(float)startX
                               startY:(float) startY
                                width:(float) width
                               height:(float) height;

+(UIButton*) addButtonToViewGroup:(UIView*) rootContainer
                           startX:(float)startX
                           startY:(float) startY
                            width:(float) width
                           height:(float) height;
+(UIView *) getDatePickerPadWithUIDatePicker:(UIDatePicker *) datePicker inParentView:(UIView*) parentView withDatePickerMode:(int)datePickerMode   setY:(float) pointY byIsStart:(BOOL) isStart tag:(int)tag target:(id)target action:(SEL) selector;
+(UIView *) getPickerPadWithUIPickerView:(UIPickerView *) pickerView withViewTag:(int)tag inParentView:(UIView*) parentView   setY:(float) pointY byIsStart:(BOOL) isStart target:(id)target;
+(UISwitch *) getSwitchViewInParentView:(UIView *)parentView startX:(float)startX startY:(float)startY width:(float)width height:(float)height alignment:(NSString *)alignment;
+(UIView*) getPickerPadTitle:(NSString *)titleText inParentPickerPad:(UIView *)parentPickerPad withHeightScale:(float)heightScale buttonWidthScale:(float)buttonWidthScale leftButtonText:(NSString *) leftButtonText leftAction:(SEL)leftSelector rightButtonText:(NSString *) rightButtonText rightAction:(SEL)rightSelector withTarget:(id)target textSize:(int)textSize textColor:(int)argbColo;
+(void) setFrameParams:(UIView*) frame color:(int) argbInt;
+(void) setTextLabelParams:(UILabel *)label text:(NSString*) text gravity:(int) gravity textSize:(int) textSize textColor:(int) textARGB  backColor:(int)backARGB;

+(void) setEditTextParams:(UITextView*) editText gravity:(int) gravity textSize:(int) textSize textColor:(int) textARGB  backColor:(int)backARGB;

+(void) setTextFieldParams:(UITextField*) textField gravity:(int) gravity textSize:(int) textSize textColor:(int) textARGB  backColor:(int)backARGB;

+(void) setImageViewParams:(UIImageView*) imageView image:(UIImage*) uiImage withMargin:(float[])margin isCenterInside:(BOOL)isCenterInside;

+(void) setButtonParams:(UIButton*) button text:(NSString*)text gravity:(int) gravity textSize:(int) textSize textColor:(int) textARGB  backColor:(int)backARGB;

+(void) setScrollViewParams:(UIScrollView*) scrollView color:(int) argbInt;
+(void) setView:(UIView *)view action:(SEL) selector withTarget:(id)target;
+(void) startTranslateRoundAnimation:(UIView*) animView
                               fromX:(float) fromX  toX:(float) toX
                               fromY:(float) fromY toY:(float) toY duration:(float)duration;
+(void) startScaleAnimation:(UIView*) animView scaleX:(float)scaleX scaleY:(float)scaleY withDuration:(float)duration delegate:(id)delegate;
+(UIImageView *) getImageViewFromFileName:(NSString *)imageFileName;

+(UIImageView *) getImageViewFromFileName:(NSString *)imageFileName withSize:(CGSize) imageSize;
+(UIImage*)getUIImageFromResource:(NSString *) resourceName extName:(NSString *)extName;

+(UIImage*)getUIImageFromFilePath:(NSString *) filePath;
+(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size;

+(CGRect) getCenterInsideRect:(CGSize)innerSize OutRect:(CGSize)outSize withMargin:(float[])marginArray;
+(UIImage *)changeUIImage:(UIImage*)image WithColor:(UIColor *)color;
+(UIImage *) scaleImage:(UIImage *) originalImage withMaxSideLength:(float) length;
+(void) putImageFile:(NSString *)imageFileName intoView:(UIView *)superView withMargin:(float[])marginArray isCenterInside:(BOOL) isCenterInside;
+(void) showImage:(UIImage *)image inView:(UIView *) superView withMargin:(float[])marginArray isCenterInside:(BOOL) isCenterInside;
+(void) showImageURL:(NSString *)urlString inView:(UIView *)superView withMargin:(float [])marginArray isCenterInside:(BOOL)isCenterInside;
+(void) setBackgroud:(UIView *) view withResourceImageName:(NSString *) resourceImageName extName:(NSString *) extName;
+ (UIImage *)thumbImageWithImage:(UIImage *)scImg limitSize:(CGSize)limitSize;
+(void) clearView:(UIView *) view;


+(UIImage *)getScreenShot;
+ (UIImage*) blur:(UIImage*)theImage;
+(UIView *) getBlurFloatView:(CGRect) frame withBlackAlpha:(float) blackAlpha;
+(UIColor *) colorWithARGB:(int) argbValue;
+(UIImage*)getUIImageFromSandBox:(NSString *) fileName;
+(void) saveImage:(UIImage *)currentImage withPath:(NSString *)path withName:(NSString *)imageName withAccuracy:(float) accuracy;
+ (void) saveUIImageToSandBox:(UIImage *)currentImage withName:(NSString *)imageName;

//+(void) showAndSaveImageLocalPathWithWebUrl:(NSString*)webUrl inDataBase:(CzDB_Service*)db tableName:(NSString*)tableName fieldKey:(NSString*)fieldKey byID:(int)ID inView:(UIView*)view withMargin:(float[])margin isCenterInside:(BOOL)isCenterInside;
+(void) saveUserDataWithKey:(NSString *)key object:(NSObject *)data;

+(NSString *) getUserStringWithKey:(NSString *)key;
+(void) deleteUserDataWithKey:(NSString *)key;


+(NSObject *) getUserObjectWithKey:(NSString *)key;

+(int) getIntFromString:(NSString *)string;

+(float) getFloatFromString:(NSString *)string;



+(void) alert:(NSString *)message;
+(int) getArraySize:(NSArray *)nsarray;
+(UIView *) getCircleButton:(CGPoint) startPoint Radius:(int)radius color:(UIColor *) color text:(NSString *)text;

+(UIView *) getCircleImage:(CGPoint) startPoint Radius:(int)radius color:(UIColor *) color image:(UIImage *)image;
+(UIView *) getCircleImageFromOriginalImage:(UIImage *)image;
+(UIImage*)getCircleUIImage:(UIImage *)originalUIImage;
+ (UIImage *)fixOrientation:(UIImage *)aImage ;
+(void) setBorderView:(UIView *) view withColor:(UIColor *)color withWidth:(float) lineWidth;
+(void) setRadiusCornerView:(UIView *)view radius:(int) radius;
+(void) setLeftRadiusCornerView:(UIView *)view radius:(int)radius;
+(void) setRightRadiusCornerView:(UIView *)view radius:(int)radius;
+(void) setTopLeftRadiusCornerView:(UIView *)view radius:(int) radius;
+(void) setTopRightRadiusCornerView:(UIView *)view radius:(int) radius;
+(void) setTopRadiusCornerView:(UIView *)view radius:(int) radius;
+(void) setBottomLeftRadiusCornerView:(UIView *)view radius:(int) radius;
+(void) setBottomRightRadiusCornerView:(UIView *)view radius:(int) radius;
+(void) setBottomRadiusCornerView:(UIView *)view radius:(int) radius;
+(void) setLayoutShadow:(UIView*)viewLayout shadowCGSizeOffset:(CGSize)cgSize shadowRadius:(float)shadowRadius
            shadowColor:(int)argbColor shadowOpacity:(float) shadowOpacity;
+(BOOL) isNull:(id)object;
+(BOOL) isValidArray:(NSArray*)array;
+(BOOL) isValidMutableArray:(NSArray*)array;
+(BOOL) isValidPhone:(NSString *) phone;
+(NSString *) removeSlashSign:(NSString *)orgString;
+(BOOL) isValidMoney:(NSString*) money numberBeforeDot:(int) numberSize;
+(BOOL) isValidHundrandMoney:(NSString*)str_money;
+(BOOL) isValidMail:(NSString *) mail;
+(BOOL) isValidPersonIdNumber:(NSString *)personIdNumberValid;
+(BOOL) isNumber:(NSString *)str;
+(BOOL) isNumberOrX:(NSString *)str;
+(BOOL) isValidBank:(NSString*) bank;
+(BOOL) isValidEducation:(NSString *) education;
+(void) debugAlert:(NSString*)message;
+ (void)exitApplication;
+(void) setCornerNumber:(int)number;
+(UIView*) showAndGetWaitingCircleInView:(UIView*) parentView;
+(UIView*) showAndGetWaitingCircleInView:(UIView*) parentView withText:(NSString*)alertText;
+ (NSString *)getUniqueStrByUUID;
+(int) getRandomNoMax:(int) maxValue;
+(int) getRandomHaveMax:(int) maxValue;
+(int) getRandomFromMinValue:(int) minValue toMaxValue:(int) maxValue;
+(AVAudioPlayer*) getAudioPlayerByFileName:(NSString*)fileName;
+ (void)threadPlayResourceAudioFile:(NSArray *)paramArray;
+ (void)playResourceAudioFile:(NSString *)fileName extText:(NSString*)extText byAudioSession:(AVAudioSession *)audioSession;
+ (void)playResourceAudioFile:(NSString *)fileName extText:(NSString*)extText;
+(void) playResourceSoundByFileName:(NSString*)systemSoundFileName ofType:(NSString*)extText isVibra:(BOOL) isVibra;
+(void) playSystemSoundByFileName:(NSString*)systemSoundFileName isVibra:(BOOL)isVibra;

+(void) playControllAbleSoundFile:(NSString*)audioFileFullPath byAVAudioSession:(AVAudioSession*)audioSession audioplayer:(AVAudioPlayer*)audioPlayer delegateTarget:(id)target;
+(void)getSandBoxFilePath;
+(void) getMedia;
+(BOOL) isExistsFile:(NSString *) fileName;
+(BOOL) isExistsFileWithFullPath:(NSString *) fileFullPath;
+(long long) fileSizeAtPath:(NSString*) filePath;
+(int) getDistanceFromA:(CLLocation *)locationA   toB:(CLLocation *)locationB;
+(void) setRegionInMapView:(MKMapView *)mapView withCenterLatitude:(float) latitude centerLongitude:(float)longitude byRangeWidth:(int)rangeWidth andRangeHeight:(int)rangeHeight;
+(MKPointAnnotation *) getPositionLatitude:(float)latitude andLongitude:(float)longitude withTitle:(NSString *)title andSubtitle:(NSString *) subtitle;
+(NSMutableArray *)getContactArrayWithDefaultHeadImage:(UIImage *)defaultHeadImage;

+(NSString *) getEncryptCurrentStamp;
+(NSString *) getEncryptCurrentStampforGET;
+(BOOL) checkConnectToWebAddress:(NSString*) webAddress byPostData:(NSString*)postData;
+(NSString *) makePostDataWithKeyArray:(NSArray *)keyArray valueArray:(NSArray *) valueArray;
+(NSDictionary *) httpGetSync:(NSString *)webAddress;
+(NSString *) httpPostSync:(NSString *)webAddress data:(NSString *)strData;
+(NSDictionary *) getDictionaryHttpPostSync:(NSString *)webAddress data:(NSString *)strData;

+(UIImage *) getImageFromURL:(NSString *)fileURL ;
+(NSString *) uploadImageWithFileFullPath:(NSString *)fileFullPath toURL:(NSString *)urlString withFileName:(NSString *)fileName withScale:(float)scale withJPEGRepresentation:(float) representation;
+(NSDictionary *)uploadImageFileWithWebAddress:(NSString *)webAddress extraParameters:(NSMutableDictionary *)extraParameters filePath:(NSString *)inFilePath;
+ (NSString*)encodeURL:(NSString *)string;
+(NSDictionary *) getWebApiSyncPost:(NSString *)webAddress postData:(NSString *)postData;
+(NSDictionary *) getWebApiSyncPost:(NSString *)webAddress postData:(NSString *)postData timeInterval:(int)timeInterval;
+(NSString *) threadSaveAndGetWebImageToSandBoxByImageUrl:(NSString *)imageUrl withName:(NSString *)imageName;
+(void) threadPostServiceWithWebAddress:(NSString*) webAddress
                         fieldsKeyArray:(NSArray*)keyArray
                       fieldsValueArray:(NSArray*)valueArray
                 interfaceFailFieldName:(NSString*)interfaceFailFieldName
                        successFieldKey:(NSString*) successFiledkey
                      successFieldValue:(NSString*)successGieldValue
                successBackgroundAction:(SEL)successSelector
                                 target:(id)target
                               failText:(NSString*)failText
                          exceptionText:(NSString*)exceptionText
                                isDebug:(BOOL) isDebug;

+(void) threadPostServiceWithWebAddress:(NSString*) webAddress
                         fieldsKeyArray:(NSArray*)keyArray
                       fieldsValueArray:(NSArray*)valueArray
                          timeOutSecond:(int) timeOut
                 interfaceFailFieldName:(NSString*)interfaceFailFieldName
                        successFieldKey:(NSString*) successFiledkey
                      successFieldValue:(NSString*)successFieldValue
                successBackgroundAction:(SEL)successSelector
                   failBackgroundAction:(SEL)failSelector
                                 target:(id)target
                               failText:(NSString*)failText
                          exceptionText:(NSString*)exceptionText
                                isDebug:(BOOL) isDebug;

+(void) threadPostServiceWithWebAddress:(NSString*) webAddress
                         fieldsKeyArray:(NSArray*)keyArray
                       fieldsValueArray:(NSArray*)valueArray
                          timeOutSecond:(int) timeOut
                 interfaceFailFieldName:(NSString*)interfaceFailFieldName
                        successFieldKey:(NSString*) successFiledkey
                      successFieldValue:(NSString*)successFieldValue
                successBackgroundAction:(SEL)successSelector
                   failBackgroundAction:(SEL)failSelector
                                 target:(id)target
                               failText:(NSString*)failText
                          exceptionText:(NSString*)exceptionText
                                isDebug:(BOOL) isDebug
                            waitingView:(UIView*)waitingView;

+(NSString*) getSafeStringInDictionary:(NSDictionary*)dictionary withKey:(NSString*)key defaultValue:(NSString*)defaultValue;
+ (UIImage*)imageBlackToTransparent:(NSString*)qrString withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;
+(NSString *)getNSStringFromNSData:(NSData*)nsData;
+(NSData *)getNSDataFromNSString:(NSString*)nsString;
+(Byte *) getByteArrayFromNSString:(NSString *) nsString;
+(NSString *)serialPassword:(NSString *)str;
+(NSMutableArray*) getDictionaryArrayFromSourceDictionaryArray:(NSMutableArray*)sourceArray byKeyArray:(NSArray*)keyArray valueArray:(NSArray*)valueArray;
+(NSString*) findStringValueInDictionary:(NSMutableDictionary*)dictionary WithKey:(NSString*)key;
+(NSMutableArray*) sortDictionaryArray:(NSArray*)sourceArray ByTimeField:(NSString*)timeFieldName timeType:(NSString*)timeType isIncrease:(BOOL)isInCrease;
+(NSMutableArray *) sortDictionaryArray:(NSArray*)sourceArray ByNumberField:(NSString*)numberFieldName isIncrease:(BOOL)isInCrease;
+(NSMutableArray *) sortNumberAndIdArray:(NSMutableArray*)sourceArray isIncrease:(BOOL)isInCrease;
+(void) registerLocalNotificationMessage:(NSString*)alertBody
                            afterSeconds:(int)second
                          repeatInterval:(NSCalendarUnit)unit
                               soundName:(NSString *)soundName
                                infoDict:(NSMutableDictionary*)infoDict;
+(void) clearAllLocalNotification;
@end
