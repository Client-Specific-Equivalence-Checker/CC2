; ModuleID = 'client_merged_g_0.cil.bc'
source_filename = "client_merged_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"i\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"sum\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"delta_ret_0_old\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"delta_ret_0_new\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @client() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = bitcast i32* %11 to i8*
  call void @klee_make_symbolic(i8* %12, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %13 = bitcast i32* %10 to i8*
  call void @klee_make_symbolic(i8* %13, i32 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0))
  %14 = bitcast i32* %9 to i8*
  call void @klee_make_symbolic(i8* %14, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  call void @klee_assume(i32 1)
  %15 = load i32, i32* %10, align 4
  store i32 %15, i32* %1, align 4
  %16 = load i32, i32* %10, align 4
  store i32 %16, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  %17 = load i32, i32* %11, align 4
  %18 = load i32, i32* %9, align 4
  %19 = icmp sle i32 %17, %18
  br i1 %19, label %20, label %43

; <label>:20:                                     ; preds = %0
  %21 = load i32, i32* %11, align 4
  %22 = call i32 @lib_old(i32 %21)
  store i32 %22, i32* %7, align 4
  %23 = bitcast i32* %7 to i8*
  call void @klee_make_symbolic(i8* %23, i32 4, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0))
  %24 = load i32, i32* %7, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %20
  %27 = load i32, i32* %11, align 4
  %28 = load i32, i32* %2, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, i32* %2, align 4
  br label %30

; <label>:30:                                     ; preds = %26, %20
  %31 = load i32, i32* %11, align 4
  %32 = call i32 @lib_new(i32 %31)
  store i32 %32, i32* %8, align 4
  %33 = bitcast i32* %8 to i8*
  call void @klee_make_symbolic(i8* %33, i32 4, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0))
  %34 = load i32, i32* %8, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %40

; <label>:36:                                     ; preds = %30
  %37 = load i32, i32* %11, align 4
  %38 = load i32, i32* %1, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, i32* %1, align 4
  br label %40

; <label>:40:                                     ; preds = %36, %30
  %41 = load i32, i32* %11, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %11, align 4
  br label %43

; <label>:43:                                     ; preds = %40, %0
  %44 = load i32, i32* %2, align 4
  store i32 %44, i32* %5, align 4
  %45 = load i32, i32* %1, align 4
  store i32 %45, i32* %6, align 4
  %46 = load i32, i32* %11, align 4
  store i32 %46, i32* %3, align 4
  %47 = load i32, i32* %11, align 4
  store i32 %47, i32* %4, align 4
  ret i32 0
}

declare void @klee_make_symbolic(i8*, i32, i8*) #1

declare void @klee_assume(i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_old(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  ret i32 99999
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_new(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  ret i32 99999
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
