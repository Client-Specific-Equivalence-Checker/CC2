; ModuleID = 'client_merged_pre_cond_g_1.cil.bc'
source_filename = "client_merged_pre_cond_g_1.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"CLEVER_ret_0_new__CLEVER_EXT\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"sum_old__CLEVER_EXT\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"sum_new__CLEVER_EXT\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"CLEVER_ret_0_old__CLEVER_EXT\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"n__CLEVER_EXT\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"input_sum_old\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"input_n_old\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"input_i_old\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"input_sum_new\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"input_n_new\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"input_i_new\00", align 1

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
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = bitcast i32* %11 to i8*
  call void @klee_make_symbolic(i8* %18, i32 4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i32 0, i32 0))
  %19 = bitcast i32* %10 to i8*
  call void @klee_make_symbolic(i8* %19, i32 4, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i32 0, i32 0))
  %20 = bitcast i32* %9 to i8*
  call void @klee_make_symbolic(i8* %20, i32 4, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i32 0, i32 0))
  %21 = bitcast i32* %8 to i8*
  call void @klee_make_symbolic(i8* %21, i32 4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0))
  %22 = bitcast i32* %7 to i8*
  call void @klee_make_symbolic(i8* %22, i32 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0))
  call void @klee_assume(i32 1)
  store i32 0, i32* %11, align 4
  store i32 0, i32* %10, align 4
  store i32 0, i32* %9, align 4
  store i32 0, i32* %8, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %10, align 4
  %23 = load i32, i32* %10, align 4
  store i32 %23, i32* %9, align 4
  %24 = load i32, i32* %9, align 4
  store i32 %24, i32* %2, align 4
  %25 = bitcast i32* %12 to i8*
  call void @klee_make_symbolic(i8* %25, i32 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i32 0, i32 0))
  %26 = load i32, i32* %2, align 4
  store i32 %26, i32* %12, align 4
  %27 = bitcast i32* %13 to i8*
  call void @klee_make_symbolic(i8* %27, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i32 0, i32 0))
  %28 = load i32, i32* %7, align 4
  store i32 %28, i32* %13, align 4
  %29 = bitcast i32* %14 to i8*
  call void @klee_make_symbolic(i8* %29, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0))
  %30 = load i32, i32* %1, align 4
  store i32 %30, i32* %14, align 4
  %31 = load i32, i32* %4, align 4
  store i32 %31, i32* %3, align 4
  %32 = bitcast i32* %15 to i8*
  call void @klee_make_symbolic(i8* %32, i32 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0))
  %33 = load i32, i32* %2, align 4
  store i32 %33, i32* %15, align 4
  %34 = bitcast i32* %16 to i8*
  call void @klee_make_symbolic(i8* %34, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i32 0, i32 0))
  %35 = load i32, i32* %7, align 4
  store i32 %35, i32* %16, align 4
  %36 = bitcast i32* %17 to i8*
  call void @klee_make_symbolic(i8* %36, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i32 0, i32 0))
  %37 = load i32, i32* %1, align 4
  store i32 %37, i32* %17, align 4
  %38 = load i32, i32* %6, align 4
  store i32 %38, i32* %5, align 4
  ret i32 0
}

declare void @klee_make_symbolic(i8*, i32, i8*) #1

declare void @klee_assume(i32) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
