.class Lcom/android/gallery3d/app/AlbumSetPage$6$2;
.super Ljava/lang/Object;
.source "AlbumSetPage.java"

# interfaces
.implements Landroid/view/ActionMode$OnActionItemDragListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/gallery3d/app/AlbumSetPage$6;->onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;


# direct methods
.method constructor <init>(Lcom/android/gallery3d/app/AlbumSetPage$6;)V
    .locals 0
    .parameter

    .prologue
    .line 751
    iput-object p1, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrag(Landroid/view/DragEvent;Landroid/view/MenuItem;)V
    .locals 2
    .parameter "event"
    .parameter "menuItem"

    .prologue
    .line 754
    invoke-virtual {p1}, Landroid/view/DragEvent;->getAction()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 776
    :goto_0
    return-void

    .line 756
    :sswitch_0
    iget-object v0, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v0, v0, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    #getter for: Lcom/android/gallery3d/app/AlbumSetPage;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/gallery3d/app/AlbumSetPage;->access$2100(Lcom/android/gallery3d/app/AlbumSetPage;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v1, v1, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    iget-object v1, v1, Lcom/android/gallery3d/app/AlbumSetPage;->mDelayUpdate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 757
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0d0192

    if-ne v0, v1, :cond_0

    .line 758
    iget-object v0, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v0, v0, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    #getter for: Lcom/android/gallery3d/app/AlbumSetPage;->mDragBuilder:Lcom/android/gallery3d/app/AlbumSetPage$DragAlbumBuilder;
    invoke-static {v0}, Lcom/android/gallery3d/app/AlbumSetPage;->access$2200(Lcom/android/gallery3d/app/AlbumSetPage;)Lcom/android/gallery3d/app/AlbumSetPage$DragAlbumBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/app/AlbumSetPage$DragAlbumBuilder;->setDragingState(I)V

    goto :goto_0

    .line 760
    :cond_0
    iget-object v0, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v0, v0, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    #getter for: Lcom/android/gallery3d/app/AlbumSetPage;->mDragBuilder:Lcom/android/gallery3d/app/AlbumSetPage$DragAlbumBuilder;
    invoke-static {v0}, Lcom/android/gallery3d/app/AlbumSetPage;->access$2200(Lcom/android/gallery3d/app/AlbumSetPage;)Lcom/android/gallery3d/app/AlbumSetPage$DragAlbumBuilder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/app/AlbumSetPage$DragAlbumBuilder;->setDragingState(I)V

    goto :goto_0

    .line 764
    :sswitch_1
    iget-object v0, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v0, v0, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    #getter for: Lcom/android/gallery3d/app/AlbumSetPage;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/gallery3d/app/AlbumSetPage;->access$2100(Lcom/android/gallery3d/app/AlbumSetPage;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v1, v1, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    iget-object v1, v1, Lcom/android/gallery3d/app/AlbumSetPage;->mDelayUpdate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 765
    iget-object v0, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v0, v0, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    #getter for: Lcom/android/gallery3d/app/AlbumSetPage;->mDragBuilder:Lcom/android/gallery3d/app/AlbumSetPage$DragAlbumBuilder;
    invoke-static {v0}, Lcom/android/gallery3d/app/AlbumSetPage;->access$2200(Lcom/android/gallery3d/app/AlbumSetPage;)Lcom/android/gallery3d/app/AlbumSetPage$DragAlbumBuilder;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/app/AlbumSetPage$DragAlbumBuilder;->setDragingState(I)V

    goto :goto_0

    .line 769
    :sswitch_2
    iget-object v0, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v0, v0, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    #calls: Lcom/android/gallery3d/app/AlbumSetPage;->onDragEnd()V
    invoke-static {v0}, Lcom/android/gallery3d/app/AlbumSetPage;->access$1000(Lcom/android/gallery3d/app/AlbumSetPage;)V

    goto :goto_0

    .line 772
    :sswitch_3
    iget-object v0, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v0, v0, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    iget-object v0, v0, Lcom/android/gallery3d/app/ActivityState;->mSelectionManager:Lcom/android/gallery3d/ui/SelectionManager;

    iget-object v1, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v1, v1, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    #getter for: Lcom/android/gallery3d/app/AlbumSetPage;->mAlbumSetView:Lcom/android/gallery3d/ui/AlbumSetSlotRenderer;
    invoke-static {v1}, Lcom/android/gallery3d/app/AlbumSetPage;->access$400(Lcom/android/gallery3d/app/AlbumSetPage;)Lcom/android/gallery3d/ui/AlbumSetSlotRenderer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/gallery3d/ui/AlbumSetSlotRenderer;->getDragItemPath()Lcom/android/gallery3d/data/Path;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/ui/SelectionManager;->setDragItemPath(Lcom/android/gallery3d/data/Path;)V

    .line 773
    iget-object v0, p0, Lcom/android/gallery3d/app/AlbumSetPage$6$2;->this$1:Lcom/android/gallery3d/app/AlbumSetPage$6;

    iget-object v0, v0, Lcom/android/gallery3d/app/AlbumSetPage$6;->this$0:Lcom/android/gallery3d/app/AlbumSetPage;

    #getter for: Lcom/android/gallery3d/app/AlbumSetPage;->mActionModeHandler:Lcom/android/gallery3d/ui/ActionModeHandler;
    invoke-static {v0}, Lcom/android/gallery3d/app/AlbumSetPage;->access$1900(Lcom/android/gallery3d/app/AlbumSetPage;)Lcom/android/gallery3d/ui/ActionModeHandler;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Lcom/android/gallery3d/ui/ActionModeHandler;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    goto :goto_0

    .line 754
    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_3
        0x4 -> :sswitch_2
        0x5 -> :sswitch_0
        0x6 -> :sswitch_1
        0x64 -> :sswitch_2
    .end sparse-switch
.end method
