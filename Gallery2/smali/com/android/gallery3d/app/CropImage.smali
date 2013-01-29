.class public Lcom/android/gallery3d/app/CropImage;
.super Lcom/android/gallery3d/app/AbstractGalleryActivity;
.source "CropImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/gallery3d/app/CropImage$LoadBitmapDataTask;,
        Lcom/android/gallery3d/app/CropImage$LoadDataTask;,
        Lcom/android/gallery3d/app/CropImage$SaveOutput;
    }
.end annotation


# static fields
.field public static final DOWNLOAD_BUCKET:Ljava/io/File;

.field private static final EXIF_TAGS:[Ljava/lang/String;


# instance fields
.field private mAspect:Landroid/widget/TextView;

.field private mAspectLayout:Lcom/meizu/widget/GlowLinearLayout;

.field private mAspectStrArray:[Ljava/lang/String;

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapInIntent:Landroid/graphics/Bitmap;

.field private mBitmapTileProvider:Lcom/android/gallery3d/ui/BitmapTileProvider;

.field private mBrightnessObserver:Landroid/database/ContentObserver;

.field private mCompressFormat:Ljava/lang/String;

.field private mConfirmDlg:Landroid/app/AlertDialog$Builder;

.field private mConfirmOverwrite:Z

.field private mCropView:Lcom/android/gallery3d/ui/CropView;

.field private mCroppedHeight:I

.field private mCroppedWidth:I

.field private mCurrentAspect:I

.field private mCustomView:Landroid/view/View;

.field private mDestRect:Landroid/graphics/Rect;

.field private mDoFaceDetection:Z

.field private mLoadBitmapTask:Lcom/android/gallery3d/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/gallery3d/util/Future",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mLoadTask:Lcom/android/gallery3d/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/gallery3d/util/Future",
            "<",
            "Landroid/graphics/BitmapRegionDecoder;",
            ">;"
        }
    .end annotation
.end field

.field private mMainHandler:Landroid/os/Handler;

.field private mMediaItem:Lcom/android/gallery3d/data/MediaItem;

.field private mOverwrite:Z

.field private mPopupMenu:Landroid/widget/PopupMenu;

.field private mProgressDialog:Landroid/app/ProgressDialog;

.field private mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

.field private mRes:Landroid/widget/TextView;

.field private mSaveTask:Lcom/android/gallery3d/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/gallery3d/util/Future",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private mSrcRect:Landroid/graphics/Rect;

.field private mState:I

.field private mTitle:Landroid/widget/TextView;

.field private mUseRegionDecoder:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 145
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "Download"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/android/gallery3d/app/CropImage;->DOWNLOAD_BUCKET:Ljava/io/File;

    .line 1273
    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "DateTime"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Make"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Model"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Flash"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "GPSLatitude"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "GPSLongitude"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "GPSLatitudeRef"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "GPSLongitudeRef"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "GPSAltitude"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "GPSAltitudeRef"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "GPSTimeStamp"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "GPSDateStamp"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "WhiteBalance"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "FocalLength"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "GPSProcessingMethod"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/gallery3d/app/CropImage;->EXIF_TAGS:[Ljava/lang/String;

    .line 1429
    const-string v0, "jni_gallery_utils"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 1430
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 92
    invoke-direct {p0}, Lcom/android/gallery3d/app/AbstractGalleryActivity;-><init>()V

    .line 150
    iput v0, p0, Lcom/android/gallery3d/app/CropImage;->mState:I

    .line 154
    iput-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mDoFaceDetection:Z

    .line 166
    iput-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mUseRegionDecoder:Z

    .line 181
    iput-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmOverwrite:Z

    .line 185
    iput v0, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedWidth:I

    .line 186
    iput v0, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedHeight:I

    .line 187
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mSrcRect:Landroid/graphics/Rect;

    .line 188
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mDestRect:Landroid/graphics/Rect;

    .line 190
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    .line 1163
    new-instance v0, Lcom/android/gallery3d/app/CropImage$12;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/gallery3d/app/CropImage$12;-><init>(Lcom/android/gallery3d/app/CropImage;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mBrightnessObserver:Landroid/database/ContentObserver;

    .line 1260
    return-void
.end method

.method static synthetic access$000(Lcom/android/gallery3d/app/CropImage;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/gallery3d/app/CropImage;Landroid/graphics/BitmapRegionDecoder;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/android/gallery3d/app/CropImage;->onBitmapRegionDecoderAvailable(Landroid/graphics/BitmapRegionDecoder;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/gallery3d/app/CropImage;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget v0, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedWidth:I

    return v0
.end method

.method static synthetic access$1100(Lcom/android/gallery3d/app/CropImage;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget v0, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedHeight:I

    return v0
.end method

.method static synthetic access$1200(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Landroid/content/Intent;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 92
    invoke-direct {p0, p1, p2, p3}, Lcom/android/gallery3d/app/CropImage;->saveOutputByFilePath(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1300(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 92
    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/app/CropImage;->setAsWallpaper(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Landroid/net/Uri;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 92
    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/app/CropImage;->saveToMediaProvider(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1502(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/util/Future;)Lcom/android/gallery3d/util/Future;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 92
    iput-object p1, p0, Lcom/android/gallery3d/app/CropImage;->mSaveTask:Lcom/android/gallery3d/util/Future;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/android/gallery3d/app/CropImage;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1702(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/util/Future;)Lcom/android/gallery3d/util/Future;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 92
    iput-object p1, p0, Lcom/android/gallery3d/app/CropImage;->mLoadTask:Lcom/android/gallery3d/util/Future;

    return-object p1
.end method

.method static synthetic access$1802(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/util/Future;)Lcom/android/gallery3d/util/Future;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 92
    iput-object p1, p0, Lcom/android/gallery3d/app/CropImage;->mLoadBitmapTask:Lcom/android/gallery3d/util/Future;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/gallery3d/app/CropImage;Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/android/gallery3d/app/CropImage;->onBitmapAvailable(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/gallery3d/app/CropImage;)Landroid/widget/PopupMenu;
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mPopupMenu:Landroid/widget/PopupMenu;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/gallery3d/app/CropImage;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget v0, p0, Lcom/android/gallery3d/app/CropImage;->mCurrentAspect:I

    return v0
.end method

.method static synthetic access$402(Lcom/android/gallery3d/app/CropImage;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 92
    iput p1, p0, Lcom/android/gallery3d/app/CropImage;->mCurrentAspect:I

    return p1
.end method

.method static synthetic access$500(Lcom/android/gallery3d/app/CropImage;)[Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mAspectStrArray:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/gallery3d/app/CropImage;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/gallery3d/app/CropImage;)Lcom/android/gallery3d/ui/CropView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/gallery3d/app/CropImage;Landroid/graphics/Rect;Z)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 92
    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/app/CropImage;->getCroppedImage(Landroid/graphics/Rect;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Landroid/net/Uri;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 92
    invoke-direct {p0, p1, p2, p3}, Lcom/android/gallery3d/app/CropImage;->saveBitmapToUri(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Landroid/net/Uri;)Z

    move-result v0

    return v0
.end method

.method private convertExtensionToCompressFormat(Ljava/lang/String;)Landroid/graphics/Bitmap$CompressFormat;
    .locals 1
    .parameter "extension"

    .prologue
    .line 784
    const-string v0, "png"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_0
.end method

.method private static copyExif(Lcom/android/gallery3d/data/MediaItem;Ljava/lang/String;II)V
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1292
    :try_start_0
    new-instance v0, Landroid/media/ExifInterface;

    invoke-direct {v0, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 1293
    invoke-static {p0, v0}, Lcom/android/gallery3d/picasasource/PicasaSource;->extractExifValues(Lcom/android/gallery3d/data/MediaObject;Landroid/media/ExifInterface;)V

    .line 1294
    const-string v1, "ImageWidth"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 1295
    const-string v1, "ImageLength"

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 1296
    const-string v1, "Orientation"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 1297
    invoke-virtual {v0}, Landroid/media/ExifInterface;->saveAttributes()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1301
    :goto_0
    return-void

    .line 1298
    :catch_0
    move-exception v0

    .line 1299
    const-string v1, "CropImage"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot copy exif: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/gallery3d/app/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static copyExif(Ljava/lang/String;Ljava/lang/String;IIZ)V
    .locals 7
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 1305
    :try_start_0
    new-instance v1, Landroid/media/ExifInterface;

    invoke-direct {v1, p0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 1306
    new-instance v2, Landroid/media/ExifInterface;

    invoke-direct {v2, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 1308
    const-string v3, "ImageWidth"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 1309
    const-string v3, "ImageLength"

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 1310
    const-string v3, "Orientation"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 1312
    sget-object v3, Lcom/android/gallery3d/app/CropImage;->EXIF_TAGS:[Ljava/lang/String;

    array-length v4, v3

    :goto_0
    if-ge v0, v4, :cond_1

    aget-object v5, v3, v0

    .line 1313
    invoke-virtual {v1, v5}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1314
    if-eqz v6, :cond_0

    .line 1315
    invoke-virtual {v2, v5, v6}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 1312
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1319
    :cond_1
    if-nez p4, :cond_2

    .line 1320
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 1321
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy:MM:dd kk:mm:ss"

    invoke-direct {v0, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 1322
    const-string v5, "DateTime"

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v5, v0}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 1326
    :cond_2
    const-string v0, "FNumber"

    invoke-virtual {v1, v0}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 1327
    if-eqz v0, :cond_3

    .line 1329
    :try_start_1
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    .line 1330
    const-string v3, "FNumber"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/high16 v5, 0x4120

    mul-float/2addr v1, v5

    const/high16 v5, 0x3f00

    add-float/2addr v1, v5

    float-to-int v1, v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "/10"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 1359
    :cond_3
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Landroid/media/ExifInterface;->saveAttributes()V

    .line 1363
    :goto_2
    return-void

    .line 1332
    :catch_0
    move-exception v1

    .line 1333
    const-string v1, "CropImage"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cannot parse aperture: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/gallery3d/app/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 1360
    :catch_1
    move-exception v0

    .line 1361
    const-string v1, "CropImage"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot copy exif: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/gallery3d/app/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method public static determineCompressFormat(Lcom/android/gallery3d/data/MediaObject;)Ljava/lang/String;
    .locals 3
    .parameter "obj"

    .prologue
    .line 548
    const-string v0, "JPEG"

    .line 549
    .local v0, compressFormat:Ljava/lang/String;
    instance-of v2, p0, Lcom/android/gallery3d/data/MediaItem;

    if-eqz v2, :cond_1

    .line 550
    check-cast p0, Lcom/android/gallery3d/data/MediaItem;

    .end local p0
    invoke-virtual {p0}, Lcom/android/gallery3d/data/MediaItem;->getMimeType()Ljava/lang/String;

    move-result-object v1

    .line 551
    .local v1, mime:Ljava/lang/String;
    const-string v2, "png"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "gif"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 554
    :cond_0
    const-string v0, "PNG"

    .line 557
    .end local v1           #mime:Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method private drawInTiles(Landroid/graphics/Canvas;Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;Landroid/graphics/Rect;I)V
    .locals 13
    .parameter "canvas"
    .parameter "decoder"
    .parameter "rect"
    .parameter "dest"
    .parameter "sample"

    .prologue
    .line 1003
    move/from16 v0, p5

    mul-int/lit16 v5, v0, 0x200

    .line 1004
    .local v5, tileSize:I
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 1005
    .local v4, tileRect:Landroid/graphics/Rect;
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1006
    .local v2, options:Landroid/graphics/BitmapFactory$Options;
    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v10, v2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 1007
    move/from16 v0, p5

    iput v0, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 1008
    move-object/from16 v0, p4

    iget v10, v0, Landroid/graphics/Rect;->left:I

    int-to-float v10, v10

    move-object/from16 v0, p4

    iget v11, v0, Landroid/graphics/Rect;->top:I

    int-to-float v11, v11

    invoke-virtual {p1, v10, v11}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1009
    move/from16 v0, p5

    int-to-float v10, v0

    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Rect;->width()I

    move-result v11

    int-to-float v11, v11

    mul-float/2addr v10, v11

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Rect;->width()I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v10, v11

    move/from16 v0, p5

    int-to-float v11, v0

    invoke-virtual/range {p4 .. p4}, Landroid/graphics/Rect;->height()I

    move-result v12

    int-to-float v12, v12

    mul-float/2addr v11, v12

    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Rect;->height()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v11, v12

    invoke-virtual {p1, v10, v11}, Landroid/graphics/Canvas;->scale(FF)V

    .line 1011
    new-instance v3, Landroid/graphics/Paint;

    const/4 v10, 0x2

    invoke-direct {v3, v10}, Landroid/graphics/Paint;-><init>(I)V

    .line 1012
    .local v3, paint:Landroid/graphics/Paint;
    move-object/from16 v0, p3

    iget v6, v0, Landroid/graphics/Rect;->left:I

    .local v6, tx:I
    const/4 v8, 0x0

    .line 1013
    .local v8, x:I
    :goto_0
    move-object/from16 v0, p3

    iget v10, v0, Landroid/graphics/Rect;->right:I

    if-ge v6, v10, :cond_2

    .line 1014
    move-object/from16 v0, p3

    iget v7, v0, Landroid/graphics/Rect;->top:I

    .local v7, ty:I
    const/4 v9, 0x0

    .line 1015
    .local v9, y:I
    :goto_1
    move-object/from16 v0, p3

    iget v10, v0, Landroid/graphics/Rect;->bottom:I

    if-ge v7, v10, :cond_1

    .line 1016
    add-int v10, v6, v5

    add-int v11, v7, v5

    invoke-virtual {v4, v6, v7, v10, v11}, Landroid/graphics/Rect;->set(IIII)V

    .line 1017
    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1021
    monitor-enter p2

    .line 1022
    :try_start_0
    invoke-virtual {p2, v4, v2}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1023
    .local v1, bitmap:Landroid/graphics/Bitmap;
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1024
    int-to-float v10, v8

    int-to-float v11, v9

    invoke-virtual {p1, v1, v10, v11, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1025
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 1015
    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    :cond_0
    add-int/2addr v7, v5

    add-int/lit16 v9, v9, 0x200

    goto :goto_1

    .line 1023
    :catchall_0
    move-exception v10

    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v10

    .line 1013
    :cond_1
    add-int/2addr v6, v5

    add-int/lit16 v8, v8, 0x200

    goto :goto_0

    .line 1029
    .end local v7           #ty:I
    .end local v9           #y:I
    :cond_2
    return-void
.end method

.method private getAspect()I
    .locals 2

    .prologue
    .line 1438
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/CropView;->getAspectRatio()F

    move-result v0

    .line 1439
    const/high16 v1, 0x3f80

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    .line 1440
    const/4 v0, 0x1

    .line 1450
    :goto_0
    return v0

    .line 1441
    :cond_0
    const/high16 v1, 0x3fc0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_1

    const v1, 0x3f2aaaab

    cmpl-float v1, v0, v1

    if-nez v1, :cond_2

    .line 1442
    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    .line 1443
    :cond_2
    const v1, 0x3faaaaab

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_3

    const/high16 v1, 0x3f40

    cmpl-float v1, v0, v1

    if-nez v1, :cond_4

    .line 1444
    :cond_3
    const/4 v0, 0x3

    goto :goto_0

    .line 1445
    :cond_4
    const v1, 0x3fcccccd

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_5

    const/high16 v1, 0x3f20

    cmpl-float v0, v0, v1

    if-nez v0, :cond_6

    .line 1446
    :cond_5
    const/4 v0, 0x4

    goto :goto_0

    .line 1448
    :cond_6
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getCroppedImage(Landroid/graphics/Rect;Z)Landroid/graphics/Bitmap;
    .locals 12
    .parameter
    .parameter

    .prologue
    const/4 v7, 0x0

    const/4 v1, 0x1

    const/high16 v11, 0x4000

    const/4 v2, 0x0

    const/high16 v5, 0x3f80

    .line 843
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-lez v0, :cond_5

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-lez v0, :cond_5

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/common/Utils;->assertTrue(Z)V

    .line 845
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    .line 847
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v3

    .line 848
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    .line 849
    if-eqz v8, :cond_0

    .line 850
    const-string v4, "outputX"

    invoke-virtual {v8, v4, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 851
    const-string v4, "outputY"

    invoke-virtual {v8, v4, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 854
    :cond_0
    if-eqz p2, :cond_2

    mul-int v4, v3, v0

    const/16 v6, 0x7a12

    if-le v4, v6, :cond_2

    if-eqz v8, :cond_1

    const-string v4, "return-path-if-too-large"

    invoke-virtual {v8, v4, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_2

    .line 855
    :cond_1
    const v4, 0x46f42400

    int-to-float v6, v3

    div-float/2addr v4, v6

    int-to-float v6, v0

    div-float/2addr v4, v6

    invoke-static {v4}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v4

    .line 856
    const-string v6, "CropImage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "scale down the cropped image: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/android/gallery3d/app/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 857
    int-to-float v3, v3

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 858
    int-to-float v0, v0

    mul-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 865
    :cond_2
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4, v2, v2, v3, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 866
    if-eqz v8, :cond_3

    const-string v6, "scale"

    invoke-virtual {v8, v6, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 867
    :cond_3
    int-to-float v1, v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v6, v6

    div-float v6, v1, v6

    .line 868
    int-to-float v1, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v1, v9

    .line 869
    if-eqz v8, :cond_4

    const-string v9, "scaleUpIfNeeded"

    invoke-virtual {v8, v9, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_e

    .line 871
    :cond_4
    cmpl-float v2, v6, v5

    if-lez v2, :cond_d

    move v2, v5

    .line 872
    :goto_1
    cmpl-float v6, v1, v5

    if-lez v6, :cond_c

    move v1, v5

    move v5, v2

    .line 877
    :goto_2
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v5

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 878
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 879
    sub-int v8, v3, v2

    int-to-float v8, v8

    div-float/2addr v8, v11

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    sub-int v9, v0, v6

    int-to-float v9, v9

    div-float/2addr v9, v11

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    add-int/2addr v2, v3

    int-to-float v2, v2

    div-float/2addr v2, v11

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    add-int/2addr v6, v0

    int-to-float v6, v6

    div-float/2addr v6, v11

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    invoke-virtual {v4, v8, v9, v2, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 884
    iput v3, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedWidth:I

    .line 885
    iput v0, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedHeight:I

    .line 886
    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mSrcRect:Landroid/graphics/Rect;

    invoke-virtual {v2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 887
    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mDestRect:Landroid/graphics/Rect;

    invoke-virtual {v2, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 890
    :try_start_0
    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mBitmapInIntent:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_6

    .line 891
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mBitmapInIntent:Landroid/graphics/Bitmap;

    .line 892
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v0, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 894
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 895
    const/4 v3, 0x0

    invoke-virtual {v2, v1, p1, v4, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 954
    :goto_3
    return-object v0

    :cond_5
    move v0, v2

    .line 843
    goto/16 :goto_0

    .line 899
    :cond_6
    iget-boolean v2, p0, Lcom/android/gallery3d/app/CropImage;->mUseRegionDecoder:Z

    if-eqz v2, :cond_a

    .line 900
    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-virtual {v2}, Lcom/android/gallery3d/data/MediaItem;->getFullImageRotation()I

    move-result v8

    .line 901
    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v2}, Lcom/android/gallery3d/ui/CropView;->getImageWidth()I

    move-result v2

    iget-object v6, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v6}, Lcom/android/gallery3d/ui/CropView;->getImageHeight()I

    move-result v6

    rsub-int v9, v8, 0x168

    invoke-static {p1, v2, v6, v9}, Lcom/android/gallery3d/app/CropImage;->rotateRectangle(Landroid/graphics/Rect;III)V

    .line 903
    rsub-int v2, v8, 0x168

    invoke-static {v4, v3, v0, v2}, Lcom/android/gallery3d/app/CropImage;->rotateRectangle(Landroid/graphics/Rect;III)V

    .line 905
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 906
    invoke-static {v5, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v1}, Lcom/android/gallery3d/common/BitmapUtils;->computeSampleSizeLarger(F)I

    move-result v5

    .line 908
    iput v5, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 914
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    div-int/2addr v1, v5

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v6

    if-ne v1, v6, :cond_7

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    div-int/2addr v1, v5

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v6

    if-ne v1, v6, :cond_7

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-ne v3, v1, :cond_7

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-ne v0, v1, :cond_7

    if-nez v8, :cond_7

    .line 919
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 920
    :try_start_1
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0, p1, v2}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    monitor-exit v1

    goto :goto_3

    .line 921
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0

    .line 953
    :catch_0
    move-exception v0

    move-object v0, v7

    .line 954
    goto :goto_3

    .line 925
    :cond_7
    const/16 v1, 0x5a

    if-eq v8, v1, :cond_8

    const/16 v1, 0x10e

    if-ne v8, v1, :cond_9

    .line 926
    :cond_8
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v3, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 933
    :goto_4
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 936
    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/gallery3d/app/CropImage;->drawInTiles(Landroid/graphics/Canvas;Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 937
    if-eqz v8, :cond_b

    const/16 v0, 0x168

    if-eq v8, v0, :cond_b

    .line 938
    const/4 v0, 0x1

    invoke-static {v6, v8, v0}, Lcom/android/gallery3d/common/BitmapUtils;->rotateBitmap(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    goto/16 :goto_3

    .line 929
    :cond_9
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    goto :goto_4

    .line 942
    :cond_a
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-virtual {v1}, Lcom/android/gallery3d/data/MediaItem;->getRotation()I

    move-result v2

    .line 943
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v1}, Lcom/android/gallery3d/ui/CropView;->getImageWidth()I

    move-result v1

    iget-object v5, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v5}, Lcom/android/gallery3d/ui/CropView;->getImageHeight()I

    move-result v5

    rsub-int v6, v2, 0x168

    invoke-static {p1, v1, v5, v6}, Lcom/android/gallery3d/app/CropImage;->rotateRectangle(Landroid/graphics/Rect;III)V

    .line 945
    rsub-int v1, v2, 0x168

    invoke-static {v4, v3, v0, v1}, Lcom/android/gallery3d/app/CropImage;->rotateRectangle(Landroid/graphics/Rect;III)V

    .line 946
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 947
    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 948
    invoke-static {v5, v3, v0, v2}, Lcom/android/gallery3d/app/CropImage;->rotateCanvas(Landroid/graphics/Canvas;III)V

    .line 949
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    new-instance v2, Landroid/graphics/Paint;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v5, v0, p1, v4, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0

    move-object v0, v1

    .line 951
    goto/16 :goto_3

    :cond_b
    move-object v0, v6

    goto/16 :goto_3

    :cond_c
    move v5, v2

    goto/16 :goto_2

    :cond_d
    move v2, v6

    goto/16 :goto_1

    :cond_e
    move v5, v6

    goto/16 :goto_2

    :cond_f
    move v1, v5

    goto/16 :goto_2
.end method

.method private getFileExtension()Ljava/lang/String;
    .locals 2

    .prologue
    .line 794
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "outputFormat"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 795
    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-static {v0}, Lcom/android/gallery3d/app/CropImage;->determineCompressFormat(Lcom/android/gallery3d/data/MediaObject;)Ljava/lang/String;

    move-result-object v0

    .line 799
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 800
    const-string v1, "png"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "gif"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const-string v0, "png"

    :goto_0
    return-object v0

    :cond_2
    const-string v0, "jpg"

    goto :goto_0
.end method

.method private getMediaItemFromIntentData()Lcom/android/gallery3d/data/MediaItem;
    .locals 4

    .prologue
    .line 1228
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 1229
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getDataManager()Lcom/android/gallery3d/data/DataManager;

    move-result-object v1

    .line 1230
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/android/gallery3d/data/DataManager;->findPathByUri(Landroid/net/Uri;Ljava/lang/String;)Lcom/android/gallery3d/data/Path;

    move-result-object v2

    .line 1231
    if-nez v2, :cond_1

    .line 1232
    const-string v1, "CropImage"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot get path for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", or no data given"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/gallery3d/app/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1233
    const/4 v0, 0x0

    .line 1245
    :cond_0
    :goto_0
    return-object v0

    .line 1237
    :cond_1
    invoke-virtual {v1, v2}, Lcom/android/gallery3d/data/DataManager;->peekMediaObject(Lcom/android/gallery3d/data/Path;)Lcom/android/gallery3d/data/MediaObject;

    move-result-object v0

    check-cast v0, Lcom/android/gallery3d/data/MediaItem;

    .line 1238
    if-eqz v0, :cond_2

    .line 1239
    instance-of v1, v0, Lcom/android/gallery3d/data/LocalMediaItem;

    if-eqz v1, :cond_0

    move-object v1, v0

    .line 1240
    check-cast v1, Lcom/android/gallery3d/data/LocalMediaItem;

    invoke-virtual {v1}, Lcom/android/gallery3d/data/LocalMediaItem;->updateContent()V

    goto :goto_0

    .line 1243
    :cond_2
    invoke-virtual {v1, v2}, Lcom/android/gallery3d/data/DataManager;->getMediaObject(Lcom/android/gallery3d/data/Path;)Lcom/android/gallery3d/data/MediaObject;

    move-result-object v0

    check-cast v0, Lcom/android/gallery3d/data/MediaItem;

    goto :goto_0
.end method

.method private getOutputMimeType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 790
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->getFileExtension()Ljava/lang/String;

    move-result-object v0

    const-string v1, "png"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "image/png"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "image/jpeg"

    goto :goto_0
.end method

.method private initializeData()V
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1100
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 1102
    if-eqz v3, :cond_4

    .line 1103
    const-string v0, "noFaceDetection"

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1104
    const-string v0, "noFaceDetection"

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mDoFaceDetection:Z

    .line 1107
    :cond_0
    const-string v0, "data"

    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mBitmapInIntent:Landroid/graphics/Bitmap;

    .line 1109
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mBitmapInIntent:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_4

    .line 1110
    new-instance v0, Lcom/android/gallery3d/ui/BitmapTileProvider;

    iget-object v3, p0, Lcom/android/gallery3d/app/CropImage;->mBitmapInIntent:Landroid/graphics/Bitmap;

    const/16 v4, 0x140

    invoke-direct {v0, v3, v4}, Lcom/android/gallery3d/ui/BitmapTileProvider;-><init>(Landroid/graphics/Bitmap;I)V

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mBitmapTileProvider:Lcom/android/gallery3d/ui/BitmapTileProvider;

    .line 1112
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    iget-object v3, p0, Lcom/android/gallery3d/app/CropImage;->mBitmapTileProvider:Lcom/android/gallery3d/ui/BitmapTileProvider;

    invoke-virtual {v0, v3, v2}, Lcom/android/gallery3d/ui/CropView;->setDataModel(Lcom/android/gallery3d/ui/TileImageView$Model;I)V

    .line 1113
    iget-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mDoFaceDetection:Z

    if-eqz v0, :cond_3

    .line 1114
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mBitmapInIntent:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2}, Lcom/android/gallery3d/ui/CropView;->detectFaces(Landroid/graphics/Bitmap;)V

    .line 1118
    :goto_1
    iput v1, p0, Lcom/android/gallery3d/app/CropImage;->mState:I

    .line 1160
    :cond_1
    :goto_2
    return-void

    :cond_2
    move v0, v2

    .line 1104
    goto :goto_0

    .line 1116
    :cond_3
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/CropView;->initializeHighlightRectangle()V

    goto :goto_1

    .line 1123
    :cond_4
    const/4 v0, 0x0

    const v3, 0x7f0a0130

    invoke-virtual {p0, v3}, Lcom/android/gallery3d/app/CropImage;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v0, v3, v1, v2}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 1126
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->getMediaItemFromIntentData()Lcom/android/gallery3d/data/MediaItem;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    .line 1127
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    if-eqz v0, :cond_1

    .line 1129
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-virtual {v0}, Lcom/android/gallery3d/data/MediaItem;->getSupportedOperations()I

    move-result v0

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_5

    .line 1131
    :goto_3
    if-eqz v1, :cond_6

    .line 1132
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getThreadPool()Lcom/android/gallery3d/util/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/android/gallery3d/app/CropImage$LoadDataTask;

    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-direct {v1, p0, v2}, Lcom/android/gallery3d/app/CropImage$LoadDataTask;-><init>(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/data/MediaItem;)V

    new-instance v2, Lcom/android/gallery3d/app/CropImage$10;

    invoke-direct {v2, p0}, Lcom/android/gallery3d/app/CropImage$10;-><init>(Lcom/android/gallery3d/app/CropImage;)V

    invoke-virtual {v0, v1, v2}, Lcom/android/gallery3d/util/ThreadPool;->submit(Lcom/android/gallery3d/util/ThreadPool$Job;Lcom/android/gallery3d/util/FutureListener;)Lcom/android/gallery3d/util/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mLoadTask:Lcom/android/gallery3d/util/Future;

    goto :goto_2

    :cond_5
    move v1, v2

    .line 1129
    goto :goto_3

    .line 1146
    :cond_6
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getThreadPool()Lcom/android/gallery3d/util/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/android/gallery3d/app/CropImage$LoadBitmapDataTask;

    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-direct {v1, p0, v2}, Lcom/android/gallery3d/app/CropImage$LoadBitmapDataTask;-><init>(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/data/MediaItem;)V

    new-instance v2, Lcom/android/gallery3d/app/CropImage$11;

    invoke-direct {v2, p0}, Lcom/android/gallery3d/app/CropImage$11;-><init>(Lcom/android/gallery3d/app/CropImage;)V

    invoke-virtual {v0, v1, v2}, Lcom/android/gallery3d/util/ThreadPool;->submit(Lcom/android/gallery3d/util/ThreadPool$Job;Lcom/android/gallery3d/util/FutureListener;)Lcom/android/gallery3d/util/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mLoadBitmapTask:Lcom/android/gallery3d/util/Future;

    goto :goto_2
.end method

.method public static native nativeSaveFromFile(Ljava/lang/String;Landroid/graphics/Rect;IILandroid/graphics/Rect;IIILjava/io/OutputStream;[B)Z
.end method

.method private onBitmapAvailable(Landroid/graphics/Bitmap;)V
    .locals 3
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 1060
    if-nez p1, :cond_0

    .line 1061
    const v0, 0x7f0a0136

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1062
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->finish()V

    .line 1077
    :goto_0
    return-void

    .line 1065
    :cond_0
    iput-boolean v1, p0, Lcom/android/gallery3d/app/CropImage;->mUseRegionDecoder:Z

    .line 1066
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/gallery3d/app/CropImage;->mState:I

    .line 1068
    iput-object p1, p0, Lcom/android/gallery3d/app/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    .line 1069
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1070
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    new-instance v1, Lcom/android/gallery3d/ui/BitmapTileProvider;

    const/16 v2, 0x200

    invoke-direct {v1, p1, v2}, Lcom/android/gallery3d/ui/BitmapTileProvider;-><init>(Landroid/graphics/Bitmap;I)V

    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-virtual {v2}, Lcom/android/gallery3d/data/MediaItem;->getRotation()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/gallery3d/ui/CropView;->setDataModel(Lcom/android/gallery3d/ui/TileImageView$Model;I)V

    .line 1072
    iget-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mDoFaceDetection:Z

    if-eqz v0, :cond_1

    .line 1073
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v0, p1}, Lcom/android/gallery3d/ui/CropView;->detectFaces(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 1075
    :cond_1
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/CropView;->initializeHighlightRectangle()V

    goto :goto_0
.end method

.method private onBitmapRegionDecoderAvailable(Landroid/graphics/BitmapRegionDecoder;)V
    .locals 6
    .parameter

    .prologue
    const/4 v0, 0x1

    const/4 v5, 0x0

    .line 1034
    if-nez p1, :cond_0

    .line 1035
    const v0, 0x7f0a0136

    invoke-static {p0, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1036
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->finish()V

    .line 1057
    :goto_0
    return-void

    .line 1039
    :cond_0
    iput-object p1, p0, Lcom/android/gallery3d/app/CropImage;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    .line 1040
    iput-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mUseRegionDecoder:Z

    .line 1041
    iput v0, p0, Lcom/android/gallery3d/app/CropImage;->mState:I

    .line 1043
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1044
    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    move-result v1

    .line 1045
    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    move-result v2

    .line 1046
    const/4 v3, -0x1

    const v4, 0x75300

    invoke-static {v1, v2, v3, v4}, Lcom/android/gallery3d/common/BitmapUtils;->computeSampleSize(IIII)I

    move-result v3

    iput v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 1048
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, v5, v5, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v3, v0}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    .line 1050
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    new-instance v1, Lcom/android/gallery3d/ui/TileImageViewAdapter;

    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2, p1}, Lcom/android/gallery3d/ui/TileImageViewAdapter;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/BitmapRegionDecoder;)V

    iget-object v2, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-virtual {v2}, Lcom/android/gallery3d/data/MediaItem;->getFullImageRotation()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/android/gallery3d/ui/CropView;->setDataModel(Lcom/android/gallery3d/ui/TileImageView$Model;I)V

    .line 1052
    iget-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mDoFaceDetection:Z

    if-eqz v0, :cond_1

    .line 1053
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/ui/CropView;->detectFaces(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 1055
    :cond_1
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/CropView;->initializeHighlightRectangle()V

    goto :goto_0
.end method

.method private static rotateCanvas(Landroid/graphics/Canvas;III)V
    .locals 2
    .parameter "canvas"
    .parameter "width"
    .parameter "height"
    .parameter "rotation"

    .prologue
    .line 960
    div-int/lit8 v0, p1, 0x2

    int-to-float v0, v0

    div-int/lit8 v1, p2, 0x2

    int-to-float v1, v1

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 961
    int-to-float v0, p3

    invoke-virtual {p0, v0}, Landroid/graphics/Canvas;->rotate(F)V

    .line 962
    div-int/lit8 v0, p3, 0x5a

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    .line 963
    neg-int v0, p1

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    neg-int v1, p2

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 967
    :goto_0
    return-void

    .line 965
    :cond_0
    neg-int v0, p2

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    neg-int v1, p1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_0
.end method

.method private static rotateRectangle(Landroid/graphics/Rect;III)V
    .locals 3
    .parameter "rect"
    .parameter "width"
    .parameter "height"
    .parameter "rotation"

    .prologue
    .line 971
    if-eqz p3, :cond_0

    const/16 v2, 0x168

    if-ne p3, v2, :cond_1

    .line 995
    :cond_0
    :goto_0
    return-void

    .line 973
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    .line 974
    .local v1, w:I
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v0

    .line 975
    .local v0, h:I
    sparse-switch p3, :sswitch_data_0

    .line 997
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 977
    :sswitch_0
    iget v2, p0, Landroid/graphics/Rect;->left:I

    iput v2, p0, Landroid/graphics/Rect;->top:I

    .line 978
    iget v2, p0, Landroid/graphics/Rect;->bottom:I

    sub-int v2, p2, v2

    iput v2, p0, Landroid/graphics/Rect;->left:I

    .line 979
    iget v2, p0, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v0

    iput v2, p0, Landroid/graphics/Rect;->right:I

    .line 980
    iget v2, p0, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v1

    iput v2, p0, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    .line 984
    :sswitch_1
    iget v2, p0, Landroid/graphics/Rect;->right:I

    sub-int v2, p1, v2

    iput v2, p0, Landroid/graphics/Rect;->left:I

    .line 985
    iget v2, p0, Landroid/graphics/Rect;->bottom:I

    sub-int v2, p2, v2

    iput v2, p0, Landroid/graphics/Rect;->top:I

    .line 986
    iget v2, p0, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v1

    iput v2, p0, Landroid/graphics/Rect;->right:I

    .line 987
    iget v2, p0, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v0

    iput v2, p0, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    .line 991
    :sswitch_2
    iget v2, p0, Landroid/graphics/Rect;->top:I

    iput v2, p0, Landroid/graphics/Rect;->left:I

    .line 992
    iget v2, p0, Landroid/graphics/Rect;->right:I

    sub-int v2, p1, v2

    iput v2, p0, Landroid/graphics/Rect;->top:I

    .line 993
    iget v2, p0, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v0

    iput v2, p0, Landroid/graphics/Rect;->right:I

    .line 994
    iget v2, p0, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v1

    iput v2, p0, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    .line 975
    nop

    :sswitch_data_0
    .sparse-switch
        0x5a -> :sswitch_0
        0xb4 -> :sswitch_1
        0x10e -> :sswitch_2
    .end sparse-switch
.end method

.method private saveBitmapToOutputStream(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$CompressFormat;Ljava/io/OutputStream;)Z
    .locals 4
    .parameter "jc"
    .parameter "bitmap"
    .parameter "format"
    .parameter "os"

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 749
    new-instance v0, Lcom/android/gallery3d/util/InterruptableOutputStream;

    invoke-direct {v0, p4}, Lcom/android/gallery3d/util/InterruptableOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 750
    .local v0, ios:Lcom/android/gallery3d/util/InterruptableOutputStream;
    new-instance v2, Lcom/android/gallery3d/app/CropImage$8;

    invoke-direct {v2, p0, v0}, Lcom/android/gallery3d/app/CropImage$8;-><init>(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/util/InterruptableOutputStream;)V

    invoke-interface {p1, v2}, Lcom/android/gallery3d/util/ThreadPool$JobContext;->setCancelListener(Lcom/android/gallery3d/util/ThreadPool$CancelListener;)V

    .line 756
    if-eqz p2, :cond_0

    .line 757
    const/16 v2, 0x5a

    :try_start_0
    invoke-virtual {p2, p3, v2, p4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_1

    .line 767
    invoke-interface {p1, v3}, Lcom/android/gallery3d/util/ThreadPool$JobContext;->setCancelListener(Lcom/android/gallery3d/util/ThreadPool$CancelListener;)V

    .line 768
    invoke-static {p4}, Lcom/android/gallery3d/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    :goto_0
    return v1

    .line 761
    :cond_0
    const/16 v2, 0x5a

    :try_start_1
    invoke-direct {p0, p3, v2, p4}, Lcom/android/gallery3d/app/CropImage;->trySaveFromFile(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-nez v2, :cond_1

    .line 767
    invoke-interface {p1, v3}, Lcom/android/gallery3d/util/ThreadPool$JobContext;->setCancelListener(Lcom/android/gallery3d/util/ThreadPool$CancelListener;)V

    .line 768
    invoke-static {p4}, Lcom/android/gallery3d/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_0

    .line 765
    :cond_1
    :try_start_2
    invoke-interface {p1}, Lcom/android/gallery3d/util/ThreadPool$JobContext;->isCancelled()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v2

    if-nez v2, :cond_2

    const/4 v1, 0x1

    .line 767
    :cond_2
    invoke-interface {p1, v3}, Lcom/android/gallery3d/util/ThreadPool$JobContext;->setCancelListener(Lcom/android/gallery3d/util/ThreadPool$CancelListener;)V

    .line 768
    invoke-static {p4}, Lcom/android/gallery3d/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_0

    .line 767
    :catchall_0
    move-exception v1

    invoke-interface {p1, v3}, Lcom/android/gallery3d/util/ThreadPool$JobContext;->setCancelListener(Lcom/android/gallery3d/util/ThreadPool$CancelListener;)V

    .line 768
    invoke-static {p4}, Lcom/android/gallery3d/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw v1
.end method

.method private saveBitmapToUri(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Landroid/net/Uri;)Z
    .locals 3
    .parameter "jc"
    .parameter "bitmap"
    .parameter "uri"

    .prologue
    .line 774
    :try_start_0
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    :goto_0
    invoke-direct {p0, v1}, Lcom/android/gallery3d/app/CropImage;->convertExtensionToCompressFormat(Ljava/lang/String;)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p3}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {p0, p1, p2, v1, v2}, Lcom/android/gallery3d/app/CropImage;->saveBitmapToOutputStream(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$CompressFormat;Ljava/io/OutputStream;)Z

    move-result v1

    .line 780
    :goto_1
    return v1

    .line 774
    :cond_0
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->getFileExtension()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 777
    :catch_0
    move-exception v0

    .line 778
    .local v0, e:Ljava/io/FileNotFoundException;
    const-string v1, "CropImage"

    const-string v2, "cannot write output"

    invoke-static {v1, v2, v0}, Lcom/android/gallery3d/app/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 780
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private saveGenericImage(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Landroid/net/Uri;
    .locals 11
    .parameter "jc"
    .parameter "cropped"

    .prologue
    const-wide/16 v9, 0x3e8

    const/4 v8, 0x0

    .line 718
    sget-object v5, Lcom/android/gallery3d/app/CropImage;->DOWNLOAD_BUCKET:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Lcom/android/gallery3d/app/CropImage;->DOWNLOAD_BUCKET:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    move-result v5

    if-nez v5, :cond_0

    .line 719
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "cannot create download folder"

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 722
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 723
    .local v1, now:J
    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "\'IMG\'_yyyyMMdd_HHmmss"

    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v5, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 725
    .local v0, filename:Ljava/lang/String;
    iput-boolean v8, p0, Lcom/android/gallery3d/app/CropImage;->mOverwrite:Z

    .line 726
    sget-object v5, Lcom/android/gallery3d/app/CropImage;->DOWNLOAD_BUCKET:Ljava/io/File;

    invoke-direct {p0, p1, p2, v5, v0}, Lcom/android/gallery3d/app/CropImage;->saveMedia(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 727
    .local v3, output:Ljava/io/File;
    if-nez v3, :cond_1

    const/4 v5, 0x0

    .line 742
    :goto_0
    return-object v5

    .line 729
    :cond_1
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 730
    .local v4, values:Landroid/content/ContentValues;
    const-string v5, "title"

    invoke-virtual {v4, v5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    const-string v5, "_display_name"

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 732
    const-string v5, "datetaken"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 733
    const-string v5, "date_modified"

    div-long v6, v1, v9

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 734
    const-string v5, "date_added"

    div-long v6, v1, v9

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 735
    const-string v5, "mime_type"

    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->getOutputMimeType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 736
    const-string v5, "orientation"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 737
    const-string v5, "_data"

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 738
    const-string v5, "_size"

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 739
    const-string v5, "width"

    iget v6, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedWidth:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 740
    const-string v5, "height"

    iget v6, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedHeight:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 742
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v5, v6, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v5

    goto :goto_0
.end method

.method private saveLocalImage(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Landroid/net/Uri;
    .locals 18
    .parameter "jc"
    .parameter "cropped"

    .prologue
    .line 674
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    check-cast v8, Lcom/android/gallery3d/data/LocalImage;

    .line 676
    .local v8, localImage:Lcom/android/gallery3d/data/LocalImage;
    new-instance v9, Ljava/io/File;

    iget-object v13, v8, Lcom/android/gallery3d/data/LocalMediaItem;->filePath:Ljava/lang/String;

    invoke-direct {v9, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 677
    .local v9, oldPath:Ljava/io/File;
    new-instance v6, Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v6, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 679
    .local v6, directory:Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    .line 680
    .local v7, filename:Ljava/lang/String;
    const/16 v13, 0x2e

    invoke-virtual {v7, v13}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    .line 681
    .local v11, pos:I
    if-ltz v11, :cond_0

    const/4 v13, 0x0

    invoke-virtual {v7, v13, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 682
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/android/gallery3d/app/CropImage;->mOverwrite:Z

    if-eqz v13, :cond_1

    .line 683
    invoke-virtual {v8}, Lcom/android/gallery3d/data/LocalImage;->delete()V

    .line 685
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v6, v7}, Lcom/android/gallery3d/app/CropImage;->saveMedia(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 686
    .local v10, output:Ljava/io/File;
    if-nez v10, :cond_2

    const/4 v13, 0x0

    .line 713
    :goto_0
    return-object v13

    .line 688
    :cond_2
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/gallery3d/app/CropImage;->mCroppedWidth:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/gallery3d/app/CropImage;->mCroppedHeight:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/gallery3d/app/CropImage;->mOverwrite:Z

    move/from16 v17, v0

    invoke-static/range {v13 .. v17}, Lcom/android/gallery3d/app/CropImage;->copyExif(Ljava/lang/String;Ljava/lang/String;IIZ)V

    .line 691
    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 692
    .local v3, caption:Ljava/lang/String;
    const/16 v13, 0x2e

    invoke-virtual {v3, v13}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    .line 693
    if-ltz v11, :cond_3

    .line 694
    const/4 v13, 0x0

    invoke-virtual {v3, v13, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 695
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 696
    .local v4, dateTaken:J
    new-instance v12, Landroid/content/ContentValues;

    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    .line 697
    .local v12, values:Landroid/content/ContentValues;
    const-string v13, "title"

    invoke-virtual {v12, v13, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    const-string v13, "_display_name"

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 699
    const-string v13, "datetaken"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 700
    const-string v13, "date_modified"

    const-wide/16 v14, 0x3e8

    div-long v14, v4, v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 701
    const-string v13, "date_added"

    const-wide/16 v14, 0x3e8

    div-long v14, v4, v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 702
    const-string v13, "mime_type"

    invoke-direct/range {p0 .. p0}, Lcom/android/gallery3d/app/CropImage;->getOutputMimeType()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 703
    const-string v13, "orientation"

    const/4 v14, 0x0

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 704
    const-string v13, "_data"

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 705
    const-string v13, "_size"

    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 706
    const-string v13, "width"

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/gallery3d/app/CropImage;->mCroppedWidth:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 707
    const-string v13, "height"

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/gallery3d/app/CropImage;->mCroppedHeight:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 709
    iget-wide v13, v8, Lcom/android/gallery3d/data/LocalMediaItem;->latitude:D

    iget-wide v15, v8, Lcom/android/gallery3d/data/LocalMediaItem;->longitude:D

    invoke-static/range {v13 .. v16}, Lcom/android/gallery3d/util/GalleryUtils;->isValidLocation(DD)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 710
    const-string v13, "latitude"

    iget-wide v14, v8, Lcom/android/gallery3d/data/LocalMediaItem;->latitude:D

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 711
    const-string v13, "longitude"

    iget-wide v14, v8, Lcom/android/gallery3d/data/LocalMediaItem;->longitude:D

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 713
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/android/gallery3d/app/CropImage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    sget-object v14, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v13, v14, v12}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v13

    goto/16 :goto_0
.end method

.method private saveMedia(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 11
    .parameter "jc"
    .parameter "cropped"
    .parameter "directory"
    .parameter "filename"

    .prologue
    .line 573
    const/4 v0, 0x0

    .line 574
    .local v0, candidate:Ljava/io/File;
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->getFileExtension()Ljava/lang/String;

    move-result-object v3

    .line 576
    .local v3, fileExtension:Ljava/lang/String;
    :try_start_0
    iget-boolean v7, p0, Lcom/android/gallery3d/app/CropImage;->mOverwrite:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v7, :cond_2

    .line 577
    const/4 v5, 0x1

    .local v5, i:I
    move-object v1, v0

    .end local v0           #candidate:Ljava/io/File;
    .local v1, candidate:Ljava/io/File;
    :goto_0
    const/16 v7, 0x3e8

    if-ge v5, v7, :cond_3

    .line 578
    :try_start_1
    const-string v7, "-%03d."

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 579
    .local v6, num:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, p3, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 580
    .end local v1           #candidate:Ljava/io/File;
    .restart local v0       #candidate:Ljava/io/File;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result v7

    if-eqz v7, :cond_1

    .line 592
    .end local v5           #i:I
    .end local v6           #num:Ljava/lang/String;
    :goto_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v7

    if-nez v7, :cond_4

    .line 593
    :cond_0
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "cannot create file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 577
    .restart local v5       #i:I
    .restart local v6       #num:Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    move-object v1, v0

    .end local v0           #candidate:Ljava/io/File;
    .restart local v1       #candidate:Ljava/io/File;
    goto :goto_0

    .line 584
    .end local v1           #candidate:Ljava/io/File;
    .end local v5           #i:I
    .end local v6           #num:Ljava/lang/String;
    .restart local v0       #candidate:Ljava/io/File;
    :cond_2
    :try_start_3
    new-instance v1, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v1, p3, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 585
    .end local v0           #candidate:Ljava/io/File;
    .restart local v1       #candidate:Ljava/io/File;
    :try_start_4
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_3

    .line 586
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    :cond_3
    move-object v0, v1

    .end local v1           #candidate:Ljava/io/File;
    .restart local v0       #candidate:Ljava/io/File;
    goto :goto_1

    .line 588
    :catch_0
    move-exception v2

    .line 589
    .local v2, e:Ljava/io/IOException;
    :goto_2
    const-string v7, "CropImage"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "fail to create new file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v2}, Lcom/android/gallery3d/app/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 590
    const/4 v7, 0x0

    .line 622
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #fileExtension:Ljava/lang/String;
    :goto_3
    return-object v7

    .line 596
    .restart local v3       #fileExtension:Ljava/lang/String;
    :cond_4
    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Ljava/io/File;->setReadable(ZZ)Z

    .line 597
    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Ljava/io/File;->setWritable(ZZ)Z

    .line 600
    :try_start_5
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 602
    .local v4, fos:Ljava/io/FileOutputStream;
    :try_start_6
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_5

    iget-object v3, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    .end local v3           #fileExtension:Ljava/lang/String;
    :cond_5
    invoke-direct {p0, v3}, Lcom/android/gallery3d/app/CropImage;->convertExtensionToCompressFormat(Ljava/lang/String;)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v7

    invoke-direct {p0, p1, p2, v7, v4}, Lcom/android/gallery3d/app/CropImage;->saveBitmapToOutputStream(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$CompressFormat;Ljava/io/OutputStream;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 604
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 605
    const/4 v7, 0x0

    .line 608
    :try_start_7
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_3

    .line 610
    .end local v4           #fos:Ljava/io/FileOutputStream;
    :catch_1
    move-exception v2

    .line 611
    .restart local v2       #e:Ljava/io/IOException;
    const-string v7, "CropImage"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "fail to save image: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v2}, Lcom/android/gallery3d/app/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 613
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 614
    const/4 v7, 0x0

    goto :goto_3

    .line 608
    .end local v2           #e:Ljava/io/IOException;
    .restart local v4       #fos:Ljava/io/FileOutputStream;
    :cond_6
    :try_start_8
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1

    .line 617
    invoke-interface {p1}, Lcom/android/gallery3d/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 618
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 619
    const/4 v7, 0x0

    goto :goto_3

    .line 608
    :catchall_0
    move-exception v7

    :try_start_9
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    throw v7
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1

    :cond_7
    move-object v7, v0

    .line 622
    goto :goto_3

    .line 588
    .end local v0           #candidate:Ljava/io/File;
    .end local v4           #fos:Ljava/io/FileOutputStream;
    .restart local v1       #candidate:Ljava/io/File;
    .restart local v3       #fileExtension:Ljava/lang/String;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1           #candidate:Ljava/io/File;
    .restart local v0       #candidate:Ljava/io/File;
    goto/16 :goto_2
.end method

.method private saveOutputByFilePath(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Landroid/content/Intent;)Z
    .locals 5
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x0

    .line 1403
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    instance-of v0, v0, Lcom/android/gallery3d/data/LocalImage;

    if-eqz v0, :cond_3

    .line 1404
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    check-cast v0, Lcom/android/gallery3d/data/LocalImage;

    .line 1406
    new-instance v1, Ljava/io/File;

    iget-object v3, v0, Lcom/android/gallery3d/data/LocalMediaItem;->filePath:Ljava/lang/String;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1407
    new-instance v3, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1409
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1410
    const/16 v4, 0x2e

    invoke-virtual {v1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 1411
    if-ltz v4, :cond_0

    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1412
    :cond_0
    iget-boolean v4, p0, Lcom/android/gallery3d/app/CropImage;->mOverwrite:Z

    if-eqz v4, :cond_1

    .line 1413
    invoke-virtual {v0}, Lcom/android/gallery3d/data/LocalImage;->delete()V

    .line 1415
    :cond_1
    invoke-direct {p0, p1, p2, v3, v1}, Lcom/android/gallery3d/app/CropImage;->saveMedia(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 1416
    if-nez v0, :cond_2

    move v0, v2

    .line 1421
    :goto_0
    return v0

    .line 1418
    :cond_2
    const-string v1, "filePath"

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1419
    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    move v0, v2

    .line 1421
    goto :goto_0
.end method

.method private savePicasaImage(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Landroid/net/Uri;
    .locals 17
    .parameter "jc"
    .parameter "cropped"

    .prologue
    .line 636
    sget-object v13, Lcom/android/gallery3d/app/CropImage;->DOWNLOAD_BUCKET:Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->isDirectory()Z

    move-result v13

    if-nez v13, :cond_0

    sget-object v13, Lcom/android/gallery3d/app/CropImage;->DOWNLOAD_BUCKET:Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->mkdirs()Z

    move-result v13

    if-nez v13, :cond_0

    .line 637
    new-instance v13, Ljava/lang/RuntimeException;

    const-string v14, "cannot create download folder"

    invoke-direct {v13, v14}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 640
    :cond_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-static {v13}, Lcom/android/gallery3d/picasasource/PicasaSource;->getImageTitle(Lcom/android/gallery3d/data/MediaObject;)Ljava/lang/String;

    move-result-object v3

    .line 641
    .local v3, filename:Ljava/lang/String;
    const/16 v13, 0x2e

    invoke-virtual {v3, v13}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v11

    .line 642
    .local v11, pos:I
    if-ltz v11, :cond_1

    const/4 v13, 0x0

    invoke-virtual {v3, v13, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 643
    :cond_1
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/android/gallery3d/app/CropImage;->mOverwrite:Z

    .line 644
    sget-object v13, Lcom/android/gallery3d/app/CropImage;->DOWNLOAD_BUCKET:Ljava/io/File;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v13, v3}, Lcom/android/gallery3d/app/CropImage;->saveMedia(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 645
    .local v10, output:Ljava/io/File;
    if-nez v10, :cond_2

    const/4 v13, 0x0

    .line 669
    :goto_0
    return-object v13

    .line 647
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/gallery3d/app/CropImage;->mCroppedWidth:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/gallery3d/app/CropImage;->mCroppedHeight:I

    move/from16 v16, v0

    invoke-static/range {v13 .. v16}, Lcom/android/gallery3d/app/CropImage;->copyExif(Lcom/android/gallery3d/data/MediaItem;Ljava/lang/String;II)V

    .line 649
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    const-wide/16 v15, 0x3e8

    div-long v8, v13, v15

    .line 650
    .local v8, now:J
    new-instance v12, Landroid/content/ContentValues;

    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    .line 651
    .local v12, values:Landroid/content/ContentValues;
    const-string v13, "title"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-static {v14}, Lcom/android/gallery3d/picasasource/PicasaSource;->getImageTitle(Lcom/android/gallery3d/data/MediaObject;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 652
    const-string v13, "_display_name"

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 653
    const-string v13, "datetaken"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-static {v14}, Lcom/android/gallery3d/picasasource/PicasaSource;->getDateTaken(Lcom/android/gallery3d/data/MediaObject;)J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 654
    const-string v13, "date_modified"

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 655
    const-string v13, "date_added"

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 656
    const-string v13, "mime_type"

    invoke-direct/range {p0 .. p0}, Lcom/android/gallery3d/app/CropImage;->getOutputMimeType()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 657
    const-string v13, "orientation"

    const/4 v14, 0x0

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 658
    const-string v13, "_data"

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 659
    const-string v13, "_size"

    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 660
    const-string v13, "width"

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/gallery3d/app/CropImage;->mCroppedWidth:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 661
    const-string v13, "height"

    move-object/from16 v0, p0

    iget v14, v0, Lcom/android/gallery3d/app/CropImage;->mCroppedHeight:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 663
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-static {v13}, Lcom/android/gallery3d/picasasource/PicasaSource;->getLatitude(Lcom/android/gallery3d/data/MediaObject;)D

    move-result-wide v4

    .line 664
    .local v4, latitude:D
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-static {v13}, Lcom/android/gallery3d/picasasource/PicasaSource;->getLongitude(Lcom/android/gallery3d/data/MediaObject;)D

    move-result-wide v6

    .line 665
    .local v6, longitude:D
    invoke-static {v4, v5, v6, v7}, Lcom/android/gallery3d/util/GalleryUtils;->isValidLocation(DD)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 666
    const-string v13, "latitude"

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 667
    const-string v13, "longitude"

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    .line 669
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/gallery3d/app/CropImage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    sget-object v14, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v13, v14, v12}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v13

    goto/16 :goto_0
.end method

.method private saveToMediaProvider(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Landroid/net/Uri;
    .locals 1
    .parameter "jc"
    .parameter "cropped"

    .prologue
    .line 626
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    invoke-static {v0}, Lcom/android/gallery3d/picasasource/PicasaSource;->isPicasaImage(Lcom/android/gallery3d/data/MediaObject;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 627
    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/app/CropImage;->savePicasaImage(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Landroid/net/Uri;

    move-result-object v0

    .line 631
    :goto_0
    return-object v0

    .line 628
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    instance-of v0, v0, Lcom/android/gallery3d/data/LocalImage;

    if-eqz v0, :cond_1

    .line 629
    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/app/CropImage;->saveLocalImage(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0

    .line 631
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/gallery3d/app/CropImage;->saveGenericImage(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0
.end method

.method private setAsWallpaper(Lcom/android/gallery3d/util/ThreadPool$JobContext;Landroid/graphics/Bitmap;)Z
    .locals 3
    .parameter "jc"
    .parameter "wallpaper"

    .prologue
    .line 562
    :try_start_0
    invoke-static {p0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/app/WallpaperManager;->setBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 566
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 563
    :catch_0
    move-exception v0

    .line 564
    .local v0, e:Ljava/io/IOException;
    const-string v1, "CropImage"

    const-string v2, "fail to set wall paper"

    invoke-static {v1, v2, v0}, Lcom/android/gallery3d/app/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private setCropParameters()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 1080
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 1081
    if-nez v0, :cond_0

    .line 1097
    :goto_0
    return-void

    .line 1083
    :cond_0
    const-string v1, "aspectX"

    invoke-virtual {v0, v1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 1084
    const-string v2, "aspectY"

    invoke-virtual {v0, v2, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 1085
    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    .line 1086
    iget-object v3, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    int-to-float v1, v1

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {v3, v1}, Lcom/android/gallery3d/ui/CropView;->setAspectRatio(F)V

    .line 1087
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v1, v5}, Lcom/android/gallery3d/ui/CropView;->setFlippable(Z)V

    .line 1090
    :cond_1
    const-string v1, "spotlightX"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;F)F

    move-result v1

    .line 1091
    const-string v2, "spotlightY"

    invoke-virtual {v0, v2, v4}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;F)F

    move-result v2

    .line 1092
    cmpl-float v3, v1, v4

    if-eqz v3, :cond_2

    cmpl-float v3, v2, v4

    if-eqz v3, :cond_2

    .line 1093
    iget-object v3, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v3, v1, v2}, Lcom/android/gallery3d/ui/CropView;->setSpotlightRatio(FF)V

    .line 1096
    :cond_2
    const-string v1, "confirm-overwrite"

    invoke-virtual {v0, v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmOverwrite:Z

    goto :goto_0
.end method

.method private setFixedAspect()V
    .locals 3

    .prologue
    .line 1454
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    if-nez v0, :cond_0

    .line 1460
    :goto_0
    return-void

    .line 1457
    :cond_0
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->getAspect()I

    move-result v0

    iput v0, p0, Lcom/android/gallery3d/app/CropImage;->mCurrentAspect:I

    .line 1458
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mAspectStrArray:[Ljava/lang/String;

    iget v2, p0, Lcom/android/gallery3d/app/CropImage;->mCurrentAspect:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1459
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mAspectLayout:Lcom/meizu/widget/GlowLinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/meizu/widget/GlowLinearLayout;->setEnabled(Z)V

    goto :goto_0
.end method

.method private trySaveFromFile(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    .locals 11
    .parameter "format"
    .parameter "quality"
    .parameter "stream"

    .prologue
    const/4 v6, 0x0

    .line 832
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    instance-of v1, v1, Lcom/android/gallery3d/data/LocalImage;

    if-eqz v1, :cond_1

    .line 833
    iget-object v10, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    check-cast v10, Lcom/android/gallery3d/data/LocalImage;

    .line 834
    .local v10, item:Lcom/android/gallery3d/data/LocalImage;
    iget-object v0, v10, Lcom/android/gallery3d/data/LocalMediaItem;->filePath:Ljava/lang/String;

    .line 835
    .local v0, filePath:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mSrcRect:Landroid/graphics/Rect;

    iget v2, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedWidth:I

    iget v3, p0, Lcom/android/gallery3d/app/CropImage;->mCroppedHeight:I

    iget-object v4, p0, Lcom/android/gallery3d/app/CropImage;->mDestRect:Landroid/graphics/Rect;

    invoke-virtual {v10}, Lcom/android/gallery3d/data/LocalImage;->getFullImageRotation()I

    move-result v5

    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v7, p1}, Landroid/graphics/Bitmap$CompressFormat;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v6, 0x1

    :cond_0
    const/16 v7, 0x1000

    new-array v9, v7, [B

    move v7, p2

    move-object v8, p3

    invoke-static/range {v0 .. v9}, Lcom/android/gallery3d/app/CropImage;->nativeSaveFromFile(Ljava/lang/String;Landroid/graphics/Rect;IILandroid/graphics/Rect;IIILjava/io/OutputStream;[B)Z

    move-result v6

    .line 839
    .end local v0           #filePath:Ljava/lang/String;
    .end local v10           #item:Lcom/android/gallery3d/data/LocalImage;
    :cond_1
    return v6
.end method


# virtual methods
.method public getCandidateName()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v2, 0x1

    const/4 v8, 0x0

    .line 1374
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    instance-of v0, v0, Lcom/android/gallery3d/data/LocalImage;

    if-eqz v0, :cond_3

    .line 1375
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    check-cast v0, Lcom/android/gallery3d/data/LocalImage;

    .line 1376
    if-nez v0, :cond_0

    .line 1377
    const-string v0, ""

    .line 1399
    :goto_0
    return-object v0

    .line 1378
    :cond_0
    new-instance v1, Ljava/io/File;

    iget-object v0, v0, Lcom/android/gallery3d/data/LocalMediaItem;->filePath:Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1379
    new-instance v3, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1381
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1382
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 1383
    if-ltz v1, :cond_1

    .line 1384
    invoke-virtual {v0, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1387
    :cond_1
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->getFileExtension()Ljava/lang/String;

    move-result-object v4

    move v1, v2

    .line 1388
    :goto_1
    const/16 v5, 0x3e8

    if-ge v1, v5, :cond_4

    .line 1389
    const-string v5, "-%03d."

    new-array v6, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 1390
    new-instance v6, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1391
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1392
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1388
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1394
    :cond_3
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    instance-of v0, v0, Lcom/android/gallery3d/data/UriImage;

    if-eqz v0, :cond_4

    .line 1395
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMediaItem:Lcom/android/gallery3d/data/MediaItem;

    check-cast v0, Lcom/android/gallery3d/data/UriImage;

    .line 1396
    invoke-virtual {v0}, Lcom/android/gallery3d/data/UriImage;->getContentUri()Landroid/net/Uri;

    move-result-object v0

    .line 1397
    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1399
    :cond_4
    const-string v0, ""

    goto :goto_0
.end method

.method public needConfirmOverwrite()Z
    .locals 1

    .prologue
    .line 1425
    iget-boolean v0, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmOverwrite:Z

    return v0
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 489
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->finish()V

    .line 490
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 12
    .parameter "newConfig"

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 375
    invoke-super {p0, p1}, Lcom/android/gallery3d/app/AbstractGalleryActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 376
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mPopupMenu:Landroid/widget/PopupMenu;

    if-eqz v7, :cond_0

    .line 377
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v7}, Landroid/widget/PopupMenu;->dismiss()V

    .line 380
    :cond_0
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v7

    const v10, 0x7f04001f

    const/4 v11, 0x0

    invoke-virtual {v7, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mCustomView:Landroid/view/View;

    .line 382
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getActionBar()Landroid/app/ActionBar;

    move-result-object v2

    .line 383
    .local v2, bar:Landroid/app/ActionBar;
    const/16 v7, 0x10

    invoke-virtual {v2, v7}, Landroid/app/ActionBar;->setDisplayOptions(I)V

    .line 384
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mCustomView:Landroid/view/View;

    invoke-virtual {v2, v7}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 387
    const v7, 0x7f0d005f

    invoke-virtual {p0, v7}, Lcom/android/gallery3d/app/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mTitle:Landroid/widget/TextView;

    .line 388
    const v7, 0x7f0d0060

    invoke-virtual {p0, v7}, Lcom/android/gallery3d/app/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mRes:Landroid/widget/TextView;

    .line 389
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mRes:Landroid/widget/TextView;

    iget-object v10, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v10}, Lcom/android/gallery3d/ui/CropView;->getCropSizeString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 390
    const v7, 0x7f0d0063

    invoke-virtual {p0, v7}, Lcom/android/gallery3d/app/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    .line 391
    const v7, 0x7f0d0062

    invoke-virtual {p0, v7}, Lcom/android/gallery3d/app/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/meizu/widget/GlowLinearLayout;

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspectLayout:Lcom/meizu/widget/GlowLinearLayout;

    .line 392
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspectLayout:Lcom/meizu/widget/GlowLinearLayout;

    new-instance v10, Lcom/android/gallery3d/app/CropImage$6;

    invoke-direct {v10, p0}, Lcom/android/gallery3d/app/CropImage$6;-><init>(Lcom/android/gallery3d/app/CropImage;)V

    invoke-virtual {v7, v10}, Lcom/meizu/widget/GlowLinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 399
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mTitle:Landroid/widget/TextView;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mRes:Landroid/widget/TextView;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    if-eqz v7, :cond_2

    move v7, v8

    :goto_0
    invoke-static {v7}, Lcom/android/gallery3d/common/Utils;->assertTrue(Z)V

    .line 400
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mTitle:Landroid/widget/TextView;

    const v10, 0x7f0a00c8

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(I)V

    .line 401
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    iget-object v10, p0, Lcom/android/gallery3d/app/CropImage;->mAspectStrArray:[Ljava/lang/String;

    iget v11, p0, Lcom/android/gallery3d/app/CropImage;->mCurrentAspect:I

    aget-object v10, v10, v11

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 402
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 403
    .local v3, extras:Landroid/os/Bundle;
    if-eqz v3, :cond_1

    .line 404
    const-string v7, "aspectX"

    invoke-virtual {v3, v7, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 405
    .local v0, aspectX:I
    const-string v7, "aspectY"

    invoke-virtual {v3, v7, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 406
    .local v1, aspectY:I
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 407
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->setFixedAspect()V

    .line 411
    .end local v0           #aspectX:I
    .end local v1           #aspectY:I
    :cond_1
    new-instance v7, Landroid/widget/PopupMenu;

    iget-object v10, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    invoke-direct {v7, p0, v10}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 412
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v7}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v6

    .line 413
    .local v6, popMenu:Landroid/view/Menu;
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspectStrArray:[Ljava/lang/String;

    array-length v5, v7

    .line 414
    .local v5, num:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    if-ge v4, v5, :cond_3

    .line 415
    add-int/lit8 v7, v4, 0x0

    iget-object v10, p0, Lcom/android/gallery3d/app/CropImage;->mAspectStrArray:[Ljava/lang/String;

    aget-object v10, v10, v4

    invoke-interface {v6, v9, v7, v9, v10}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 414
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v3           #extras:Landroid/os/Bundle;
    .end local v4           #i:I
    .end local v5           #num:I
    .end local v6           #popMenu:Landroid/view/Menu;
    :cond_2
    move v7, v9

    .line 399
    goto :goto_0

    .line 417
    .restart local v3       #extras:Landroid/os/Bundle;
    .restart local v4       #i:I
    .restart local v5       #num:I
    .restart local v6       #popMenu:Landroid/view/Menu;
    :cond_3
    invoke-interface {v6, v9, v8, v8}, Landroid/view/Menu;->setGroupCheckable(IZZ)V

    .line 418
    iget v7, p0, Lcom/android/gallery3d/app/CropImage;->mCurrentAspect:I

    invoke-interface {v6, v7}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v7

    invoke-interface {v7, v8}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 420
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mPopupMenu:Landroid/widget/PopupMenu;

    new-instance v8, Lcom/android/gallery3d/app/CropImage$7;

    invoke-direct {v8, p0}, Lcom/android/gallery3d/app/CropImage$7;-><init>(Lcom/android/gallery3d/app/CropImage;)V

    invoke-virtual {v7, v8}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 459
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "bundle"

    .prologue
    const/4 v2, 0x0

    .line 194
    invoke-super {p0, p1}, Lcom/android/gallery3d/app/AbstractGalleryActivity;->onCreate(Landroid/os/Bundle;)V

    .line 195
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/app/CropImage;->requestWindowFeature(I)Z

    .line 199
    const v0, 0x7f04001e

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/app/CropImage;->setContentView(I)V

    .line 200
    new-instance v0, Lcom/android/gallery3d/ui/CropView;

    invoke-direct {v0, p0}, Lcom/android/gallery3d/ui/CropView;-><init>(Lcom/android/gallery3d/app/GalleryActivity;)V

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    .line 201
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getGLRoot()Lcom/android/gallery3d/ui/GLRoot;

    move-result-object v0

    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-interface {v0, v1}, Lcom/android/gallery3d/ui/GLRoot;->setContentPane(Lcom/android/gallery3d/ui/GLView;)V

    .line 211
    new-instance v0, Lcom/android/gallery3d/app/CropImage$1;

    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getGLRoot()Lcom/android/gallery3d/ui/GLRoot;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/gallery3d/app/CropImage$1;-><init>(Lcom/android/gallery3d/app/CropImage;Lcom/android/gallery3d/ui/GLRoot;)V

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mMainHandler:Landroid/os/Handler;

    .line 246
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f04001f

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCustomView:Landroid/view/View;

    .line 247
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0048

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mAspectStrArray:[Ljava/lang/String;

    .line 250
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->setCropParameters()V

    .line 251
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->getAspect()I

    move-result v0

    iput v0, p0, Lcom/android/gallery3d/app/CropImage;->mCurrentAspect:I

    .line 253
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmDlg:Landroid/app/AlertDialog$Builder;

    .line 254
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmDlg:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0a01c4

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/app/CropImage;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 255
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmDlg:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0a0148

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/app/CropImage;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 256
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmDlg:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0a01c5

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/app/CropImage;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/android/gallery3d/app/CropImage$2;

    invoke-direct {v2, p0}, Lcom/android/gallery3d/app/CropImage$2;-><init>(Lcom/android/gallery3d/app/CropImage;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 265
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmDlg:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0a01c3

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/app/CropImage;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/android/gallery3d/app/CropImage$3;

    invoke-direct {v2, p0}, Lcom/android/gallery3d/app/CropImage$3;-><init>(Lcom/android/gallery3d/app/CropImage;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 274
    iget-object v0, p0, Lcom/android/gallery3d/app/AbstractGalleryActivity;->mIntentType:Lcom/android/gallery3d/app/GalleryActivity$IntentType;

    const/4 v1, 0x2

    iput v1, v0, Lcom/android/gallery3d/app/GalleryActivity$IntentType;->mType:I

    .line 275
    iget-object v0, p0, Lcom/android/gallery3d/app/AbstractGalleryActivity;->mIntentType:Lcom/android/gallery3d/app/GalleryActivity$IntentType;

    const/4 v1, 0x1

    iput v1, v0, Lcom/android/gallery3d/app/GalleryActivity$IntentType;->mMimeType:I

    .line 277
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "compress-format"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    .line 278
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 279
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCompressFormat:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 281
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 12
    .parameter "menu"

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 290
    invoke-super {p0, p1}, Lcom/android/gallery3d/app/AbstractGalleryActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 291
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v7

    const v10, 0x7f110009

    invoke-virtual {v7, v10, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 292
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getActionBar()Landroid/app/ActionBar;

    move-result-object v2

    .line 293
    .local v2, bar:Landroid/app/ActionBar;
    const/16 v7, 0x10

    invoke-virtual {v2, v7}, Landroid/app/ActionBar;->setDisplayOptions(I)V

    .line 294
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mCustomView:Landroid/view/View;

    invoke-virtual {v2, v7}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 296
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mTitle:Landroid/widget/TextView;

    if-nez v7, :cond_3

    .line 297
    const v7, 0x7f0d005f

    invoke-virtual {p0, v7}, Lcom/android/gallery3d/app/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mTitle:Landroid/widget/TextView;

    .line 298
    const v7, 0x7f0d0060

    invoke-virtual {p0, v7}, Lcom/android/gallery3d/app/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mRes:Landroid/widget/TextView;

    .line 299
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mRes:Landroid/widget/TextView;

    iget-object v10, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v10}, Lcom/android/gallery3d/ui/CropView;->getCropSizeString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 300
    const v7, 0x7f0d0063

    invoke-virtual {p0, v7}, Lcom/android/gallery3d/app/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    .line 301
    const v7, 0x7f0d0062

    invoke-virtual {p0, v7}, Lcom/android/gallery3d/app/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/meizu/widget/GlowLinearLayout;

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspectLayout:Lcom/meizu/widget/GlowLinearLayout;

    .line 302
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspectLayout:Lcom/meizu/widget/GlowLinearLayout;

    new-instance v10, Lcom/android/gallery3d/app/CropImage$4;

    invoke-direct {v10, p0}, Lcom/android/gallery3d/app/CropImage$4;-><init>(Lcom/android/gallery3d/app/CropImage;)V

    invoke-virtual {v7, v10}, Lcom/meizu/widget/GlowLinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 309
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mTitle:Landroid/widget/TextView;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mRes:Landroid/widget/TextView;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    if-eqz v7, :cond_1

    move v7, v8

    :goto_0
    invoke-static {v7}, Lcom/android/gallery3d/common/Utils;->assertTrue(Z)V

    .line 310
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mTitle:Landroid/widget/TextView;

    const v10, 0x7f0a00c8

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(I)V

    .line 311
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    iget-object v10, p0, Lcom/android/gallery3d/app/CropImage;->mAspectStrArray:[Ljava/lang/String;

    iget v11, p0, Lcom/android/gallery3d/app/CropImage;->mCurrentAspect:I

    aget-object v10, v10, v11

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 312
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 313
    .local v3, extras:Landroid/os/Bundle;
    if-eqz v3, :cond_0

    .line 314
    const-string v7, "aspectX"

    invoke-virtual {v3, v7, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 315
    .local v0, aspectX:I
    const-string v7, "aspectY"

    invoke-virtual {v3, v7, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 316
    .local v1, aspectY:I
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 317
    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->setFixedAspect()V

    .line 321
    .end local v0           #aspectX:I
    .end local v1           #aspectY:I
    :cond_0
    new-instance v7, Landroid/widget/PopupMenu;

    iget-object v10, p0, Lcom/android/gallery3d/app/CropImage;->mAspect:Landroid/widget/TextView;

    invoke-direct {v7, p0, v10}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 322
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v7}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v6

    .line 323
    .local v6, popMenu:Landroid/view/Menu;
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mAspectStrArray:[Ljava/lang/String;

    array-length v5, v7

    .line 324
    .local v5, num:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    if-ge v4, v5, :cond_2

    .line 325
    add-int/lit8 v7, v4, 0x0

    iget-object v10, p0, Lcom/android/gallery3d/app/CropImage;->mAspectStrArray:[Ljava/lang/String;

    aget-object v10, v10, v4

    invoke-interface {v6, v9, v7, v9, v10}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 324
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v3           #extras:Landroid/os/Bundle;
    .end local v4           #i:I
    .end local v5           #num:I
    .end local v6           #popMenu:Landroid/view/Menu;
    :cond_1
    move v7, v9

    .line 309
    goto :goto_0

    .line 327
    .restart local v3       #extras:Landroid/os/Bundle;
    .restart local v4       #i:I
    .restart local v5       #num:I
    .restart local v6       #popMenu:Landroid/view/Menu;
    :cond_2
    invoke-interface {v6, v9, v8, v8}, Landroid/view/Menu;->setGroupCheckable(IZZ)V

    .line 328
    iget v7, p0, Lcom/android/gallery3d/app/CropImage;->mCurrentAspect:I

    invoke-interface {v6, v7}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v7

    invoke-interface {v7, v8}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 329
    iget-object v7, p0, Lcom/android/gallery3d/app/CropImage;->mPopupMenu:Landroid/widget/PopupMenu;

    new-instance v9, Lcom/android/gallery3d/app/CropImage$5;

    invoke-direct {v9, p0}, Lcom/android/gallery3d/app/CropImage$5;-><init>(Lcom/android/gallery3d/app/CropImage;)V

    invoke-virtual {v7, v9}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 369
    .end local v3           #extras:Landroid/os/Bundle;
    .end local v4           #i:I
    .end local v5           #num:I
    .end local v6           #popMenu:Landroid/view/Menu;
    :cond_3
    return v8
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .parameter "item"

    .prologue
    .line 463
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 484
    :goto_0
    const/4 v1, 0x1

    return v1

    .line 465
    :sswitch_0
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->finish()V

    goto :goto_0

    .line 469
    :sswitch_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/gallery3d/app/CropImage;->setResult(I)V

    .line 470
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->finish()V

    goto :goto_0

    .line 474
    :sswitch_2
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->needConfirmOverwrite()Z

    move-result v1

    if-nez v1, :cond_0

    .line 475
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->onSaveClicked()V

    goto :goto_0

    .line 477
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f0a01c3

    invoke-virtual {p0, v2}, Lcom/android/gallery3d/app/CropImage;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getCandidateName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 478
    .local v0, message:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmDlg:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 479
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mConfirmDlg:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 463
    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f0d0058 -> :sswitch_1
        0x7f0d0198 -> :sswitch_2
    .end sparse-switch
.end method

.method protected onPause()V
    .locals 6

    .prologue
    .line 1191
    invoke-super {p0}, Lcom/android/gallery3d/app/AbstractGalleryActivity;->onPause()V

    .line 1193
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    iget-object v5, p0, Lcom/android/gallery3d/app/CropImage;->mBrightnessObserver:Landroid/database/ContentObserver;

    invoke-virtual {v4, v5}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 1195
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mLoadTask:Lcom/android/gallery3d/util/Future;

    .line 1196
    .local v1, loadTask:Lcom/android/gallery3d/util/Future;,"Lcom/android/gallery3d/util/Future<Landroid/graphics/BitmapRegionDecoder;>;"
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/android/gallery3d/util/Future;->isDone()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1198
    invoke-interface {v1}, Lcom/android/gallery3d/util/Future;->cancel()V

    .line 1199
    invoke-interface {v1}, Lcom/android/gallery3d/util/Future;->waitDone()V

    .line 1200
    iget-object v4, p0, Lcom/android/gallery3d/app/CropImage;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1203
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mLoadBitmapTask:Lcom/android/gallery3d/util/Future;

    .line 1204
    .local v0, loadBitmapTask:Lcom/android/gallery3d/util/Future;,"Lcom/android/gallery3d/util/Future<Landroid/graphics/Bitmap;>;"
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/gallery3d/util/Future;->isDone()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1206
    invoke-interface {v0}, Lcom/android/gallery3d/util/Future;->cancel()V

    .line 1207
    invoke-interface {v0}, Lcom/android/gallery3d/util/Future;->waitDone()V

    .line 1208
    iget-object v4, p0, Lcom/android/gallery3d/app/CropImage;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1211
    :cond_1
    iget-object v3, p0, Lcom/android/gallery3d/app/CropImage;->mSaveTask:Lcom/android/gallery3d/util/Future;

    .line 1212
    .local v3, saveTask:Lcom/android/gallery3d/util/Future;,"Lcom/android/gallery3d/util/Future<Landroid/content/Intent;>;"
    if-eqz v3, :cond_2

    invoke-interface {v3}, Lcom/android/gallery3d/util/Future;->isDone()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1214
    invoke-interface {v3}, Lcom/android/gallery3d/util/Future;->cancel()V

    .line 1215
    invoke-interface {v3}, Lcom/android/gallery3d/util/Future;->waitDone()V

    .line 1216
    iget-object v4, p0, Lcom/android/gallery3d/app/CropImage;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1218
    :cond_2
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getGLRoot()Lcom/android/gallery3d/ui/GLRoot;

    move-result-object v2

    .line 1219
    .local v2, root:Lcom/android/gallery3d/ui/GLRoot;
    invoke-interface {v2}, Lcom/android/gallery3d/ui/GLRoot;->lockRenderThread()V

    .line 1221
    :try_start_0
    iget-object v4, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v4}, Lcom/android/gallery3d/ui/CropView;->pause()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1223
    invoke-interface {v2}, Lcom/android/gallery3d/ui/GLRoot;->unlockRenderThread()V

    .line 1225
    return-void

    .line 1223
    :catchall_0
    move-exception v4

    invoke-interface {v2}, Lcom/android/gallery3d/ui/GLRoot;->unlockRenderThread()V

    throw v4
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 1172
    invoke-super {p0}, Lcom/android/gallery3d/app/AbstractGalleryActivity;->onResume()V

    .line 1173
    iget v0, p0, Lcom/android/gallery3d/app/CropImage;->mState:I

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/gallery3d/app/CropImage;->initializeData()V

    .line 1174
    :cond_0
    iget v0, p0, Lcom/android/gallery3d/app/CropImage;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->onSaveClicked()V

    .line 1176
    :cond_1
    invoke-static {p0}, Lcom/android/gallery3d/util/GalleryUtils;->initGalleryBrightness(Landroid/content/Context;)V

    .line 1177
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "screen_brightness"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/gallery3d/app/CropImage;->mBrightnessObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 1180
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getGLRoot()Lcom/android/gallery3d/ui/GLRoot;

    move-result-object v1

    .line 1181
    invoke-interface {v1}, Lcom/android/gallery3d/ui/GLRoot;->lockRenderThread()V

    .line 1183
    :try_start_0
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v0}, Lcom/android/gallery3d/ui/CropView;->resume()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1185
    invoke-interface {v1}, Lcom/android/gallery3d/ui/GLRoot;->unlockRenderThread()V

    .line 1187
    return-void

    .line 1185
    :catchall_0
    move-exception v0

    invoke-interface {v1}, Lcom/android/gallery3d/ui/GLRoot;->unlockRenderThread()V

    throw v0
.end method

.method public onSaveClicked()V
    .locals 5

    .prologue
    .line 806
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 807
    iget-object v1, p0, Lcom/android/gallery3d/app/CropImage;->mCropView:Lcom/android/gallery3d/ui/CropView;

    invoke-virtual {v1}, Lcom/android/gallery3d/ui/CropView;->getCropRectangle()Landroid/graphics/RectF;

    move-result-object v1

    .line 808
    if-nez v1, :cond_0

    .line 829
    :goto_0
    return-void

    .line 809
    :cond_0
    const/4 v2, 0x2

    iput v2, p0, Lcom/android/gallery3d/app/CropImage;->mState:I

    .line 810
    if-eqz v0, :cond_1

    const-string v2, "set-as-wallpaper"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f0a0145

    .line 813
    :goto_1
    const/4 v2, 0x0

    invoke-virtual {p0, v0}, Lcom/android/gallery3d/app/CropImage;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {p0, v2, v0, v3, v4}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 815
    invoke-virtual {p0}, Lcom/android/gallery3d/app/CropImage;->getThreadPool()Lcom/android/gallery3d/util/ThreadPool;

    move-result-object v0

    new-instance v2, Lcom/android/gallery3d/app/CropImage$SaveOutput;

    invoke-direct {v2, p0, v1}, Lcom/android/gallery3d/app/CropImage$SaveOutput;-><init>(Lcom/android/gallery3d/app/CropImage;Landroid/graphics/RectF;)V

    new-instance v1, Lcom/android/gallery3d/app/CropImage$9;

    invoke-direct {v1, p0}, Lcom/android/gallery3d/app/CropImage$9;-><init>(Lcom/android/gallery3d/app/CropImage;)V

    invoke-virtual {v0, v2, v1}, Lcom/android/gallery3d/util/ThreadPool;->submit(Lcom/android/gallery3d/util/ThreadPool$Job;Lcom/android/gallery3d/util/FutureListener;)Lcom/android/gallery3d/util/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mSaveTask:Lcom/android/gallery3d/util/Future;

    goto :goto_0

    .line 810
    :cond_1
    const v0, 0x7f0a013c

    goto :goto_1
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "saveState"

    .prologue
    .line 285
    const-string v0, "state"

    iget v1, p0, Lcom/android/gallery3d/app/CropImage;->mState:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 286
    return-void
.end method

.method public setOverwrite(Z)V
    .locals 0
    .parameter "overwrite"

    .prologue
    .line 1370
    iput-boolean p1, p0, Lcom/android/gallery3d/app/CropImage;->mOverwrite:Z

    .line 1371
    return-void
.end method

.method public updateCropSize(Ljava/lang/String;)V
    .locals 1
    .parameter "str"

    .prologue
    .line 1463
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mRes:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 1464
    iget-object v0, p0, Lcom/android/gallery3d/app/CropImage;->mRes:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1465
    :cond_0
    return-void
.end method
