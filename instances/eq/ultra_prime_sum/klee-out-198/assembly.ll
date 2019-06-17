; ModuleID = 'client_merged_pre_cond_g_0.cil.bc'
source_filename = "client_merged_pre_cond_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"CLEVER_ret_0_new__CLEVER_EXT\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"CLEVER_ret_1_new__CLEVER_EXT\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"CLEVER_ret_0_old__CLEVER_EXT\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"CLEVER_ret_1_old__CLEVER_EXT\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"n__CLEVER_EXT\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"sum__CLEVER_EXT\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"i__CLEVER_EXT\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"input_a_old\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"input_a_new\00", align 1

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
  call void @klee_make_symbolic(i8* %15, i32 4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i32 0, i32 0))
  %16 = bitcast i32* %11 to i8*
  call void @klee_make_symbolic(i8* %16, i32 4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i32 0, i32 0))
  %17 = bitcast i32* %10 to i8*
  call void @klee_make_symbolic(i8* %17, i32 4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0))
  %18 = bitcast i32* %9 to i8*
  call void @klee_make_symbolic(i8* %18, i32 4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0))
  %19 = bitcast i32* %8 to i8*
  call void @klee_make_symbolic(i8* %19, i32 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0))
  %20 = bitcast i32* %7 to i8*
  call void @klee_make_symbolic(i8* %20, i32 4, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i32 0, i32 0))
  %21 = bitcast i32* %6 to i8*
  call void @klee_make_symbolic(i8* %21, i32 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i32 0, i32 0))
  call void @klee_assume(i32 1)
  store i32 0, i32* %12, align 4
  store i32 0, i32* %11, align 4
  store i32 0, i32* %10, align 4
  store i32 0, i32* %9, align 4
  %22 = load i32, i32* %7, align 4
  store i32 %22, i32* %2, align 4
  %23 = load i32, i32* %7, align 4
  store i32 %23, i32* %3, align 4
  %24 = load i32, i32* %6, align 4
  %25 = load i32, i32* %8, align 4
  %26 = icmp sle i32 %24, %25
  br i1 %26, label %27, label %46

; <label>:27:                                     ; preds = %0
  %28 = bitcast i32* %13 to i8*
  call void @klee_make_symbolic(i8* %28, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0))
  %29 = load i32, i32* %6, align 4
  store i32 %29, i32* %13, align 4
  %30 = load i32, i32* %4, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %36

; <label>:32:                                     ; preds = %27
  %33 = load i32, i32* %6, align 4
  %34 = load i32, i32* %3, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, i32* %3, align 4
  br label %36

; <label>:36:                                     ; preds = %32, %27
  %37 = bitcast i32* %14 to i8*
  call void @klee_make_symbolic(i8* %37, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0))
  %38 = load i32, i32* %6, align 4
  store i32 %38, i32* %14, align 4
  %39 = load i32, i32* %5, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %45

; <label>:41:                                     ; preds = %36
  %42 = load i32, i32* %6, align 4
  %43 = load i32, i32* %2, align 4
  %44 = add nsw i32 %43, %42
  store i32 %44, i32* %2, align 4
  br label %45

; <label>:45:                                     ; preds = %41, %36
  store i32 0, i32* %1, align 4
  br label %51

; <label>:46:                                     ; preds = %0
  %47 = load i32, i32* %6, align 4
  store i32 %47, i32* %10, align 4
  %48 = load i32, i32* %6, align 4
  store i32 %48, i32* %12, align 4
  %49 = load i32, i32* %3, align 4
  store i32 %49, i32* %9, align 4
  %50 = load i32, i32* %2, align 4
  store i32 %50, i32* %11, align 4
  store i32 0, i32* %1, align 4
  br label %51

; <label>:51:                                     ; preds = %46, %45
  %52 = load i32, i32* %1, align 4
  ret i32 %52
}

declare void @klee_make_symbolic(i8*, i32, i8*) #1

declare void @klee_assume(i32) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
