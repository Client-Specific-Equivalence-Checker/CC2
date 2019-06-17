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
  %5 = srem i32 %4, 4
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = icmp eq i32 0, %7
  %9 = zext i1 %8 to i32
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 2, %10
  %12 = zext i1 %11 to i32
  %13 = and i32 %9, %12
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 3, %14
  %16 = zext i1 %15 to i32
  %17 = and i32 %13, %16
  %18 = load i32, i32* %3, align 4
  %19 = srem i32 %18, 2
  %20 = icmp eq i32 0, %19
  %21 = zext i1 %20 to i32
  %22 = icmp eq i32 0, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %17, %23
  %25 = and i32 %24, 1
  %26 = load i32, i32* %3, align 4
  %27 = srem i32 %26, 3
  %28 = icmp eq i32 0, %27
  %29 = zext i1 %28 to i32
  %30 = icmp eq i32 0, %29
  %31 = zext i1 %30 to i32
  %32 = and i32 %25, %31
  %33 = load i32, i32* %3, align 4
  %34 = icmp slt i32 5, %33
  %35 = zext i1 %34 to i32
  %36 = icmp eq i32 0, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %32, %37
  %39 = load i32, i32* %3, align 4
  %40 = icmp slt i32 4, %39
  %41 = zext i1 %40 to i32
  %42 = and i32 %38, %41
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %1
  store i32 3, i32* %2, align 4
  br label %46

; <label>:45:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %46

; <label>:46:                                     ; preds = %45, %44
  %47 = load i32, i32* %2, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_new(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = srem i32 %4, 4
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = icmp eq i32 0, %7
  %9 = zext i1 %8 to i32
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 2, %10
  %12 = zext i1 %11 to i32
  %13 = and i32 %9, %12
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 3, %14
  %16 = zext i1 %15 to i32
  %17 = and i32 %13, %16
  %18 = load i32, i32* %3, align 4
  %19 = srem i32 %18, 2
  %20 = icmp eq i32 0, %19
  %21 = zext i1 %20 to i32
  %22 = icmp eq i32 0, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %17, %23
  %25 = and i32 %24, 1
  %26 = load i32, i32* %3, align 4
  %27 = srem i32 %26, 3
  %28 = icmp eq i32 0, %27
  %29 = zext i1 %28 to i32
  %30 = icmp eq i32 0, %29
  %31 = zext i1 %30 to i32
  %32 = and i32 %25, %31
  %33 = load i32, i32* %3, align 4
  %34 = icmp slt i32 5, %33
  %35 = zext i1 %34 to i32
  %36 = icmp eq i32 0, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %32, %37
  %39 = load i32, i32* %3, align 4
  %40 = icmp slt i32 4, %39
  %41 = zext i1 %40 to i32
  %42 = and i32 %38, %41
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %1
  store i32 1, i32* %2, align 4
  br label %46

; <label>:45:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %46

; <label>:46:                                     ; preds = %45, %44
  %47 = load i32, i32* %2, align 4
  ret i32 %47
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
