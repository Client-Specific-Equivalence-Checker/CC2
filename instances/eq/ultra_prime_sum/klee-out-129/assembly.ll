; ModuleID = 'client_merged_g_1.cil.bc'
source_filename = "client_merged_g_1.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_new\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_old\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"sum\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"delta_CLEVER_ret_0_old\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"delta_CLEVER_ret_0_new\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @client() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = bitcast i32* %5 to i8*
  call void @klee_make_symbolic(i8* %6, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0))
  %7 = bitcast i32* %4 to i8*
  call void @klee_make_symbolic(i8* %7, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0))
  %8 = bitcast i32* %3 to i8*
  call void @klee_make_symbolic(i8* %8, i32 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0))
  call void @klee_assume(i32 1)
  store i32 0, i32* %5, align 4
  store i32 0, i32* %4, align 4
  %9 = load i32, i32* %3, align 4
  %10 = call i32 @lib_old(i32 %9)
  store i32 %10, i32* %1, align 4
  %11 = bitcast i32* %1 to i8*
  call void @klee_make_symbolic(i8* %11, i32 4, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0))
  %12 = load i32, i32* %1, align 4
  %13 = icmp eq i32 %12, 0
  %14 = zext i1 %13 to i32
  store i32 %14, i32* %4, align 4
  %15 = load i32, i32* %3, align 4
  %16 = call i32 @lib_new(i32 %15)
  store i32 %16, i32* %2, align 4
  %17 = bitcast i32* %2 to i8*
  call void @klee_make_symbolic(i8* %17, i32 4, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0))
  %18 = load i32, i32* %2, align 4
  %19 = icmp eq i32 %18, 0
  %20 = zext i1 %19 to i32
  store i32 %20, i32* %5, align 4
  ret i32 0
}

declare void @klee_make_symbolic(i8*, i32, i8*) #1

declare void @klee_assume(i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_old(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp slt i32 2, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 4, %7
  %9 = zext i1 %8 to i32
  %10 = icmp eq i32 0, %9
  %11 = zext i1 %10 to i32
  %12 = and i32 %6, %11
  %13 = load i32, i32* %3, align 4
  %14 = icmp slt i32 3, %13
  %15 = zext i1 %14 to i32
  %16 = and i32 %12, %15
  %17 = load i32, i32* %3, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 0, %18
  %20 = zext i1 %19 to i32
  %21 = and i32 %16, %20
  %22 = and i32 %21, 1
  %23 = load i32, i32* %3, align 4
  %24 = srem i32 %23, 3
  %25 = icmp eq i32 0, %24
  %26 = zext i1 %25 to i32
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %22, %28
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %1
  store i32 1, i32* %2, align 4
  br label %33

; <label>:32:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %33

; <label>:33:                                     ; preds = %32, %31
  %34 = load i32, i32* %2, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_new(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp slt i32 2, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 4, %7
  %9 = zext i1 %8 to i32
  %10 = icmp eq i32 0, %9
  %11 = zext i1 %10 to i32
  %12 = and i32 %6, %11
  %13 = load i32, i32* %3, align 4
  %14 = icmp slt i32 3, %13
  %15 = zext i1 %14 to i32
  %16 = and i32 %12, %15
  %17 = load i32, i32* %3, align 4
  %18 = srem i32 %17, 2
  %19 = icmp eq i32 0, %18
  %20 = zext i1 %19 to i32
  %21 = and i32 %16, %20
  %22 = and i32 %21, 1
  %23 = load i32, i32* %3, align 4
  %24 = srem i32 %23, 3
  %25 = icmp eq i32 0, %24
  %26 = zext i1 %25 to i32
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %22, %28
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %1
  store i32 1, i32* %2, align 4
  br label %33

; <label>:32:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %33

; <label>:33:                                     ; preds = %32, %31
  %34 = load i32, i32* %2, align 4
  ret i32 %34
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
