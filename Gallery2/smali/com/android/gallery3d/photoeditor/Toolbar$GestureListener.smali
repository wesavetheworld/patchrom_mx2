.class Lcom/android/gallery3d/photoeditor/Toolbar$GestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "Toolbar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/gallery3d/photoeditor/Toolbar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/gallery3d/photoeditor/Toolbar;


# direct methods
.method private constructor <init>(Lcom/android/gallery3d/photoeditor/Toolbar;)V
    .locals 0
    .parameter

    .prologue
    .line 77
    iput-object p1, p0, Lcom/android/gallery3d/photoeditor/Toolbar$GestureListener;->this$0:Lcom/android/gallery3d/photoeditor/Toolbar;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/gallery3d/photoeditor/Toolbar;Lcom/android/gallery3d/photoeditor/Toolbar$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/android/gallery3d/photoeditor/Toolbar$GestureListener;-><init>(Lcom/android/gallery3d/photoeditor/Toolbar;)V

    return-void
.end method


# virtual methods
.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/gallery3d/photoeditor/Toolbar$GestureListener;->this$0:Lcom/android/gallery3d/photoeditor/Toolbar;

    #getter for: Lcom/android/gallery3d/photoeditor/Toolbar;->photoView:Lcom/android/gallery3d/photoeditor/PhotoView;
    invoke-static {v0}, Lcom/android/gallery3d/photoeditor/Toolbar;->access$300(Lcom/android/gallery3d/photoeditor/Toolbar;)Lcom/android/gallery3d/photoeditor/PhotoView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/android/gallery3d/photoeditor/Toolbar$GestureListener;->this$0:Lcom/android/gallery3d/photoeditor/Toolbar;

    const/4 v1, 0x1

    #setter for: Lcom/android/gallery3d/photoeditor/Toolbar;->isLongClick:Z
    invoke-static {v0, v1}, Lcom/android/gallery3d/photoeditor/Toolbar;->access$402(Lcom/android/gallery3d/photoeditor/Toolbar;Z)Z

    .line 92
    iget-object v0, p0, Lcom/android/gallery3d/photoeditor/Toolbar$GestureListener;->this$0:Lcom/android/gallery3d/photoeditor/Toolbar;

    #getter for: Lcom/android/gallery3d/photoeditor/Toolbar;->photoView:Lcom/android/gallery3d/photoeditor/PhotoView;
    invoke-static {v0}, Lcom/android/gallery3d/photoeditor/Toolbar;->access$300(Lcom/android/gallery3d/photoeditor/Toolbar;)Lcom/android/gallery3d/photoeditor/PhotoView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/photoeditor/PhotoView;->showSourcePhoto()V

    .line 94
    :cond_0
    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "e"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/gallery3d/photoeditor/Toolbar$GestureListener;->this$0:Lcom/android/gallery3d/photoeditor/Toolbar;

    #getter for: Lcom/android/gallery3d/photoeditor/Toolbar;->idleHandler:Lcom/android/gallery3d/photoeditor/Toolbar$ToolbarIdleHandler;
    invoke-static {v0}, Lcom/android/gallery3d/photoeditor/Toolbar;->access$200(Lcom/android/gallery3d/photoeditor/Toolbar;)Lcom/android/gallery3d/photoeditor/Toolbar$ToolbarIdleHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/photoeditor/Toolbar$ToolbarIdleHandler;->getIdleState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/android/gallery3d/photoeditor/Toolbar$GestureListener;->this$0:Lcom/android/gallery3d/photoeditor/Toolbar;

    #getter for: Lcom/android/gallery3d/photoeditor/Toolbar;->idleHandler:Lcom/android/gallery3d/photoeditor/Toolbar$ToolbarIdleHandler;
    invoke-static {v0}, Lcom/android/gallery3d/photoeditor/Toolbar;->access$200(Lcom/android/gallery3d/photoeditor/Toolbar;)Lcom/android/gallery3d/photoeditor/Toolbar$ToolbarIdleHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/photoeditor/Toolbar$ToolbarIdleHandler;->killIdle()V

    .line 85
    :goto_0
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/photoeditor/Toolbar$GestureListener;->this$0:Lcom/android/gallery3d/photoeditor/Toolbar;

    #getter for: Lcom/android/gallery3d/photoeditor/Toolbar;->idleHandler:Lcom/android/gallery3d/photoeditor/Toolbar$ToolbarIdleHandler;
    invoke-static {v0}, Lcom/android/gallery3d/photoeditor/Toolbar;->access$200(Lcom/android/gallery3d/photoeditor/Toolbar;)Lcom/android/gallery3d/photoeditor/Toolbar$ToolbarIdleHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/photoeditor/Toolbar$ToolbarIdleHandler;->makeIdle()V

    goto :goto_0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "e"

    .prologue
    .line 98
    const/4 v0, 0x0

    return v0
.end method
