.class Lcom/android/gallery3d/photoeditor/PhotoEditor$11;
.super Ljava/lang/Object;
.source "PhotoEditor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/gallery3d/photoeditor/PhotoEditor;->createApplyRunnable()Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/gallery3d/photoeditor/PhotoEditor;


# direct methods
.method constructor <init>(Lcom/android/gallery3d/photoeditor/PhotoEditor;)V
    .locals 0
    .parameter

    .prologue
    .line 428
    iput-object p1, p0, Lcom/android/gallery3d/photoeditor/PhotoEditor$11;->this$0:Lcom/android/gallery3d/photoeditor/PhotoEditor;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 431
    iget-object v0, p0, Lcom/android/gallery3d/photoeditor/PhotoEditor$11;->this$0:Lcom/android/gallery3d/photoeditor/PhotoEditor;

    #getter for: Lcom/android/gallery3d/photoeditor/PhotoEditor;->effectsBar:Lcom/android/gallery3d/photoeditor/EffectsBar;
    invoke-static {v0}, Lcom/android/gallery3d/photoeditor/PhotoEditor;->access$100(Lcom/android/gallery3d/photoeditor/PhotoEditor;)Lcom/android/gallery3d/photoeditor/EffectsBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/gallery3d/photoeditor/EffectsBar;->showSaveOrApply(Z)V

    .line 432
    iget-object v0, p0, Lcom/android/gallery3d/photoeditor/PhotoEditor$11;->this$0:Lcom/android/gallery3d/photoeditor/PhotoEditor;

    #getter for: Lcom/android/gallery3d/photoeditor/PhotoEditor;->effectsBar:Lcom/android/gallery3d/photoeditor/EffectsBar;
    invoke-static {v0}, Lcom/android/gallery3d/photoeditor/PhotoEditor;->access$100(Lcom/android/gallery3d/photoeditor/PhotoEditor;)Lcom/android/gallery3d/photoeditor/EffectsBar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/photoeditor/EffectsBar;->clearEffectsSelected()V

    .line 433
    iget-object v0, p0, Lcom/android/gallery3d/photoeditor/PhotoEditor$11;->this$0:Lcom/android/gallery3d/photoeditor/PhotoEditor;

    #getter for: Lcom/android/gallery3d/photoeditor/PhotoEditor;->filterStack:Lcom/android/gallery3d/photoeditor/FilterStack;
    invoke-static {v0}, Lcom/android/gallery3d/photoeditor/PhotoEditor;->access$800(Lcom/android/gallery3d/photoeditor/PhotoEditor;)Lcom/android/gallery3d/photoeditor/FilterStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/gallery3d/photoeditor/FilterStack;->setTopFilterApplied()V

    .line 434
    return-void
.end method
