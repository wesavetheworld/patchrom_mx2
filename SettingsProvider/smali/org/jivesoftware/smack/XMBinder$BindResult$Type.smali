.class public Lorg/jivesoftware/smack/XMBinder$BindResult$Type;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/XMBinder$BindResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Type"
.end annotation


# static fields
.field public static final a:Lorg/jivesoftware/smack/XMBinder$BindResult$Type;

.field public static final b:Lorg/jivesoftware/smack/XMBinder$BindResult$Type;


# instance fields
.field private c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;

    const-string v1, "result"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->a:Lorg/jivesoftware/smack/XMBinder$BindResult$Type;

    new-instance v0, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;

    const-string v1, "error"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->b:Lorg/jivesoftware/smack/XMBinder$BindResult$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->c:Ljava/lang/String;

    return-void
.end method

.method public static a(Ljava/lang/String;)Lorg/jivesoftware/smack/XMBinder$BindResult$Type;
    .locals 2

    if-nez p0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->b:Lorg/jivesoftware/smack/XMBinder$BindResult$Type;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v0, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->b:Lorg/jivesoftware/smack/XMBinder$BindResult$Type;

    goto :goto_0

    :cond_2
    sget-object v1, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->a:Lorg/jivesoftware/smack/XMBinder$BindResult$Type;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->a:Lorg/jivesoftware/smack/XMBinder$BindResult$Type;

    goto :goto_0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/jivesoftware/smack/XMBinder$BindResult$Type;->c:Ljava/lang/String;

    return-object v0
.end method
