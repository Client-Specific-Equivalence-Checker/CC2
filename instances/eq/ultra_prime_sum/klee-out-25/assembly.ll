; ModuleID = 'client_merged_pre_cond_g_0.cil.bc'
source_filename = "client_merged_pre_cond_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"n__CLEVER_EXT\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"i__CLEVER_EXT\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"sum__CLEVER_EXT\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"input_a_old\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"input_a_new\00", align 1

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
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = bitcast i32* %12 to i8*
  call void @klee_make_symbolic(i8* %15, i32 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0))
  %16 = bitcast i32* %11 to i8*
  call void @klee_make_symbolic(i8* %16, i32 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0))
  %17 = bitcast i32* %10 to i8*
  call void @klee_make_symbolic(i8* %17, i32 4, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  call void @klee_assume(i32 1)
  %18 = load i32, i32* %10, align 4
  store i32 %18, i32* %2, align 4
  %19 = load i32, i32* %10, align 4
  store i32 %19, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  %20 = load i32, i32* %11, align 4
  %21 = load i32, i32* %12, align 4
  %22 = icmp sle i32 %20, %21
  br i1 %22, label %23, label %42

; <label>:23:                                     ; preds = %0
  %24 = bitcast i32* %13 to i8*
  call void @klee_make_symbolic(i8* %24, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0))
  %25 = load i32, i32* %11, align 4
  store i32 %25, i32* %13, align 4
  %26 = load i32, i32* %8, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %23
  %29 = load i32, i32* %11, align 4
  %30 = load i32, i32* %3, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, i32* %3, align 4
  br label %32

; <label>:32:                                     ; preds = %28, %23
  %33 = bitcast i32* %14 to i8*
  call void @klee_make_symbolic(i8* %33, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i32 0, i32 0))
  %34 = load i32, i32* %11, align 4
  store i32 %34, i32* %14, align 4
  %35 = load i32, i32* %9, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %41

; <label>:37:                                     ; preds = %32
  %38 = load i32, i32* %11, align 4
  %39 = load i32, i32* %2, align 4
  %40 = add nsw i32 %39, %38
  store i32 %40, i32* %2, align 4
  br label %41

; <label>:41:                                     ; preds = %37, %32
  store i32 0, i32* %1, align 4
  br label %47

; <label>:42:                                     ; preds = %0
  %43 = load i32, i32* %3, align 4
  store i32 %43, i32* %6, align 4
  %44 = load i32, i32* %2, align 4
  store i32 %44, i32* %7, align 4
  %45 = load i32, i32* %11, align 4
  store i32 %45, i32* %4, align 4
  %46 = load i32, i32* %11, align 4
  store i32 %46, i32* %5, align 4
  store i32 0, i32* %1, align 4
  br label %47

; <label>:47:                                     ; preds = %42, %41
  %48 = load i32, i32* %1, align 4
  ret i32 %48
}

declare void @klee_make_symbolic(i8*, i32, i8*) #1

declare void @klee_assume(i32) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
