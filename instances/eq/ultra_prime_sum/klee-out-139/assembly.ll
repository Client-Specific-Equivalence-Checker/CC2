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
  %5 = icmp slt i32 6, %4
  %6 = zext i1 %5 to i32
  %7 = icmp eq i32 0, %6
  %8 = zext i1 %7 to i32
  %9 = load i32, i32* %3, align 4
  %10 = srem i32 %9, 3
  %11 = icmp eq i32 0, %10
  %12 = zext i1 %11 to i32
  %13 = and i32 %8, %12
  %14 = load i32, i32* %3, align 4
  %15 = srem i32 %14, 4
  %16 = icmp eq i32 0, %15
  %17 = zext i1 %16 to i32
  %18 = icmp eq i32 0, %17
  %19 = zext i1 %18 to i32
  %20 = and i32 %13, %19
  %21 = load i32, i32* %3, align 4
  %22 = icmp slt i32 2, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %20, %23
  %25 = load i32, i32* %3, align 4
  %26 = icmp slt i32 5, %25
  %27 = zext i1 %26 to i32
  %28 = and i32 %24, %27
  %29 = load i32, i32* %3, align 4
  %30 = icmp slt i32 3, %29
  %31 = zext i1 %30 to i32
  %32 = and i32 %28, %31
  %33 = load i32, i32* %3, align 4
  %34 = srem i32 %33, 2
  %35 = icmp eq i32 0, %34
  %36 = zext i1 %35 to i32
  %37 = and i32 %32, %36
  %38 = and i32 %37, 1
  %39 = load i32, i32* %3, align 4
  %40 = icmp slt i32 4, %39
  %41 = zext i1 %40 to i32
  %42 = and i32 %38, %41
  %43 = load i32, i32* %3, align 4
  %44 = srem i32 %43, 5
  %45 = icmp eq i32 0, %44
  %46 = zext i1 %45 to i32
  %47 = icmp eq i32 0, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %42, %48
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %52

; <label>:51:                                     ; preds = %1
  store i32 2, i32* %2, align 4
  br label %53

; <label>:52:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %53

; <label>:53:                                     ; preds = %52, %51
  %54 = load i32, i32* %2, align 4
  ret i32 %54
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_new(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp slt i32 6, %4
  %6 = zext i1 %5 to i32
  %7 = icmp eq i32 0, %6
  %8 = zext i1 %7 to i32
  %9 = load i32, i32* %3, align 4
  %10 = srem i32 %9, 3
  %11 = icmp eq i32 0, %10
  %12 = zext i1 %11 to i32
  %13 = and i32 %8, %12
  %14 = load i32, i32* %3, align 4
  %15 = srem i32 %14, 4
  %16 = icmp eq i32 0, %15
  %17 = zext i1 %16 to i32
  %18 = icmp eq i32 0, %17
  %19 = zext i1 %18 to i32
  %20 = and i32 %13, %19
  %21 = load i32, i32* %3, align 4
  %22 = icmp slt i32 2, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %20, %23
  %25 = load i32, i32* %3, align 4
  %26 = icmp slt i32 5, %25
  %27 = zext i1 %26 to i32
  %28 = and i32 %24, %27
  %29 = load i32, i32* %3, align 4
  %30 = icmp slt i32 3, %29
  %31 = zext i1 %30 to i32
  %32 = and i32 %28, %31
  %33 = load i32, i32* %3, align 4
  %34 = srem i32 %33, 2
  %35 = icmp eq i32 0, %34
  %36 = zext i1 %35 to i32
  %37 = and i32 %32, %36
  %38 = and i32 %37, 1
  %39 = load i32, i32* %3, align 4
  %40 = icmp slt i32 4, %39
  %41 = zext i1 %40 to i32
  %42 = and i32 %38, %41
  %43 = load i32, i32* %3, align 4
  %44 = srem i32 %43, 5
  %45 = icmp eq i32 0, %44
  %46 = zext i1 %45 to i32
  %47 = icmp eq i32 0, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %42, %48
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %52

; <label>:51:                                     ; preds = %1
  store i32 1, i32* %2, align 4
  br label %53

; <label>:52:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %53

; <label>:53:                                     ; preds = %52, %51
  %54 = load i32, i32* %2, align 4
  ret i32 %54
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
