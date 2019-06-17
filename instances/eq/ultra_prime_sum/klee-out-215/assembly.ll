; ModuleID = 'client_merged_pre_cond_g_1.cil.bc'
source_filename = "client_merged_pre_cond_g_1.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"CLEVER_ret_0_new__CLEVER_EXT\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"CLEVER_ret_0_old__CLEVER_EXT\00", align 1
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
  %8 = bitcast i32* %5 to i8*
  call void @klee_make_symbolic(i8* %8, i32 4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i32 0, i32 0))
  %9 = bitcast i32* %4 to i8*
  call void @klee_make_symbolic(i8* %9, i32 4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i32 0, i32 0))
  %10 = bitcast i32* %3 to i8*
  call void @klee_make_symbolic(i8* %10, i32 4, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  call void @klee_assume(i32 1)
  store i32 0, i32* %5, align 4
  store i32 0, i32* %4, align 4
  %11 = bitcast i32* %6 to i8*
  call void @klee_make_symbolic(i8* %11, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0))
  %12 = load i32, i32* %3, align 4
  store i32 %12, i32* %6, align 4
  %13 = load i32, i32* %1, align 4
  %14 = icmp eq i32 %13, 0
  %15 = zext i1 %14 to i32
  store i32 %15, i32* %4, align 4
  %16 = bitcast i32* %7 to i8*
  call void @klee_make_symbolic(i8* %16, i32 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i32 0, i32 0))
  %17 = load i32, i32* %3, align 4
  store i32 %17, i32* %7, align 4
  %18 = load i32, i32* %2, align 4
  %19 = icmp eq i32 %18, 0
  %20 = zext i1 %19 to i32
  store i32 %20, i32* %5, align 4
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
