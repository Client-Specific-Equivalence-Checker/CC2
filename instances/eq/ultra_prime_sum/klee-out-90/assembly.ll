; ModuleID = 'client_merged_g_0.cil.bc'
source_filename = "client_merged_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_new\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_new\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_old\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_old\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"i\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"sum\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"delta_CLEVER_ret_0_old\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"delta_CLEVER_ret_0_new\00", align 1

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
  call void @klee_make_symbolic(i8* %12, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0))
  %13 = bitcast i32* %10 to i8*
  call void @klee_make_symbolic(i8* %13, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0))
  %14 = bitcast i32* %9 to i8*
  call void @klee_make_symbolic(i8* %14, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0))
  %15 = bitcast i32* %8 to i8*
  call void @klee_make_symbolic(i8* %15, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i32 0, i32 0))
  %16 = bitcast i32* %7 to i8*
  call void @klee_make_symbolic(i8* %16, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  %17 = bitcast i32* %6 to i8*
  call void @klee_make_symbolic(i8* %17, i32 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0))
  %18 = bitcast i32* %5 to i8*
  call void @klee_make_symbolic(i8* %18, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  call void @klee_assume(i32 1)
  store i32 0, i32* %11, align 4
  store i32 0, i32* %10, align 4
  store i32 0, i32* %9, align 4
  store i32 0, i32* %8, align 4
  %19 = load i32, i32* %6, align 4
  store i32 %19, i32* %1, align 4
  %20 = load i32, i32* %6, align 4
  store i32 %20, i32* %2, align 4
  %21 = load i32, i32* %7, align 4
  %22 = load i32, i32* %5, align 4
  %23 = icmp sle i32 %21, %22
  br i1 %23, label %24, label %47

; <label>:24:                                     ; preds = %0
  %25 = load i32, i32* %7, align 4
  %26 = call i32 @lib_old(i32 %25)
  store i32 %26, i32* %3, align 4
  %27 = bitcast i32* %3 to i8*
  call void @klee_make_symbolic(i8* %27, i32 4, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %28 = load i32, i32* %3, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %24
  %31 = load i32, i32* %7, align 4
  %32 = load i32, i32* %2, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %2, align 4
  br label %34

; <label>:34:                                     ; preds = %30, %24
  %35 = load i32, i32* %7, align 4
  %36 = call i32 @lib_new(i32 %35)
  store i32 %36, i32* %4, align 4
  %37 = bitcast i32* %4 to i8*
  call void @klee_make_symbolic(i8* %37, i32 4, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  %38 = load i32, i32* %4, align 4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %34
  %41 = load i32, i32* %7, align 4
  %42 = load i32, i32* %1, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, i32* %1, align 4
  br label %44

; <label>:44:                                     ; preds = %40, %34
  %45 = load i32, i32* %7, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %7, align 4
  br label %47

; <label>:47:                                     ; preds = %44, %0
  %48 = load i32, i32* %2, align 4
  store i32 %48, i32* %9, align 4
  %49 = load i32, i32* %1, align 4
  store i32 %49, i32* %11, align 4
  %50 = load i32, i32* %7, align 4
  store i32 %50, i32* %8, align 4
  %51 = load i32, i32* %7, align 4
  store i32 %51, i32* %10, align 4
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
  %5 = srem i32 %4, 5
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = load i32, i32* %3, align 4
  %9 = srem i32 %8, 9
  %10 = icmp eq i32 0, %9
  %11 = zext i1 %10 to i32
  %12 = icmp eq i32 0, %11
  %13 = zext i1 %12 to i32
  %14 = and i32 %7, %13
  %15 = load i32, i32* %3, align 4
  %16 = srem i32 %15, 2
  %17 = icmp eq i32 0, %16
  %18 = zext i1 %17 to i32
  %19 = and i32 %14, %18
  %20 = load i32, i32* %3, align 4
  %21 = icmp slt i32 8, %20
  %22 = zext i1 %21 to i32
  %23 = and i32 %19, %22
  %24 = load i32, i32* %3, align 4
  %25 = icmp slt i32 5, %24
  %26 = zext i1 %25 to i32
  %27 = and i32 %23, %26
  %28 = load i32, i32* %3, align 4
  %29 = icmp slt i32 2, %28
  %30 = zext i1 %29 to i32
  %31 = and i32 %27, %30
  %32 = load i32, i32* %3, align 4
  %33 = icmp slt i32 3, %32
  %34 = zext i1 %33 to i32
  %35 = and i32 %31, %34
  %36 = and i32 %35, 1
  %37 = load i32, i32* %3, align 4
  %38 = icmp slt i32 4, %37
  %39 = zext i1 %38 to i32
  %40 = and i32 %36, %39
  %41 = load i32, i32* %3, align 4
  %42 = srem i32 %41, 7
  %43 = icmp eq i32 0, %42
  %44 = zext i1 %43 to i32
  %45 = icmp eq i32 0, %44
  %46 = zext i1 %45 to i32
  %47 = and i32 %40, %46
  %48 = load i32, i32* %3, align 4
  %49 = srem i32 %48, 3
  %50 = icmp eq i32 0, %49
  %51 = zext i1 %50 to i32
  %52 = icmp eq i32 0, %51
  %53 = zext i1 %52 to i32
  %54 = and i32 %47, %53
  %55 = load i32, i32* %3, align 4
  %56 = icmp slt i32 10, %55
  %57 = zext i1 %56 to i32
  %58 = icmp eq i32 0, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %54, %59
  %61 = load i32, i32* %3, align 4
  %62 = srem i32 %61, 8
  %63 = icmp eq i32 0, %62
  %64 = zext i1 %63 to i32
  %65 = icmp eq i32 0, %64
  %66 = zext i1 %65 to i32
  %67 = and i32 %60, %66
  %68 = load i32, i32* %3, align 4
  %69 = icmp slt i32 9, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %67, %70
  %72 = load i32, i32* %3, align 4
  %73 = icmp slt i32 7, %72
  %74 = zext i1 %73 to i32
  %75 = and i32 %71, %74
  %76 = load i32, i32* %3, align 4
  %77 = srem i32 %76, 6
  %78 = icmp eq i32 0, %77
  %79 = zext i1 %78 to i32
  %80 = icmp eq i32 0, %79
  %81 = zext i1 %80 to i32
  %82 = and i32 %75, %81
  %83 = load i32, i32* %3, align 4
  %84 = icmp slt i32 6, %83
  %85 = zext i1 %84 to i32
  %86 = and i32 %82, %85
  %87 = load i32, i32* %3, align 4
  %88 = srem i32 %87, 4
  %89 = icmp eq i32 0, %88
  %90 = zext i1 %89 to i32
  %91 = icmp eq i32 0, %90
  %92 = zext i1 %91 to i32
  %93 = and i32 %86, %92
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %96

; <label>:95:                                     ; preds = %1
  store i32 7, i32* %2, align 4
  br label %97

; <label>:96:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %97

; <label>:97:                                     ; preds = %96, %95
  %98 = load i32, i32* %2, align 4
  ret i32 %98
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_new(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = srem i32 %4, 5
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = load i32, i32* %3, align 4
  %9 = srem i32 %8, 9
  %10 = icmp eq i32 0, %9
  %11 = zext i1 %10 to i32
  %12 = icmp eq i32 0, %11
  %13 = zext i1 %12 to i32
  %14 = and i32 %7, %13
  %15 = load i32, i32* %3, align 4
  %16 = srem i32 %15, 2
  %17 = icmp eq i32 0, %16
  %18 = zext i1 %17 to i32
  %19 = and i32 %14, %18
  %20 = load i32, i32* %3, align 4
  %21 = icmp slt i32 8, %20
  %22 = zext i1 %21 to i32
  %23 = and i32 %19, %22
  %24 = load i32, i32* %3, align 4
  %25 = icmp slt i32 5, %24
  %26 = zext i1 %25 to i32
  %27 = and i32 %23, %26
  %28 = load i32, i32* %3, align 4
  %29 = icmp slt i32 2, %28
  %30 = zext i1 %29 to i32
  %31 = and i32 %27, %30
  %32 = load i32, i32* %3, align 4
  %33 = icmp slt i32 3, %32
  %34 = zext i1 %33 to i32
  %35 = and i32 %31, %34
  %36 = and i32 %35, 1
  %37 = load i32, i32* %3, align 4
  %38 = icmp slt i32 4, %37
  %39 = zext i1 %38 to i32
  %40 = and i32 %36, %39
  %41 = load i32, i32* %3, align 4
  %42 = srem i32 %41, 7
  %43 = icmp eq i32 0, %42
  %44 = zext i1 %43 to i32
  %45 = icmp eq i32 0, %44
  %46 = zext i1 %45 to i32
  %47 = and i32 %40, %46
  %48 = load i32, i32* %3, align 4
  %49 = srem i32 %48, 3
  %50 = icmp eq i32 0, %49
  %51 = zext i1 %50 to i32
  %52 = icmp eq i32 0, %51
  %53 = zext i1 %52 to i32
  %54 = and i32 %47, %53
  %55 = load i32, i32* %3, align 4
  %56 = icmp slt i32 10, %55
  %57 = zext i1 %56 to i32
  %58 = icmp eq i32 0, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %54, %59
  %61 = load i32, i32* %3, align 4
  %62 = srem i32 %61, 8
  %63 = icmp eq i32 0, %62
  %64 = zext i1 %63 to i32
  %65 = icmp eq i32 0, %64
  %66 = zext i1 %65 to i32
  %67 = and i32 %60, %66
  %68 = load i32, i32* %3, align 4
  %69 = icmp slt i32 9, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %67, %70
  %72 = load i32, i32* %3, align 4
  %73 = icmp slt i32 7, %72
  %74 = zext i1 %73 to i32
  %75 = and i32 %71, %74
  %76 = load i32, i32* %3, align 4
  %77 = srem i32 %76, 6
  %78 = icmp eq i32 0, %77
  %79 = zext i1 %78 to i32
  %80 = icmp eq i32 0, %79
  %81 = zext i1 %80 to i32
  %82 = and i32 %75, %81
  %83 = load i32, i32* %3, align 4
  %84 = icmp slt i32 6, %83
  %85 = zext i1 %84 to i32
  %86 = and i32 %82, %85
  %87 = load i32, i32* %3, align 4
  %88 = srem i32 %87, 4
  %89 = icmp eq i32 0, %88
  %90 = zext i1 %89 to i32
  %91 = icmp eq i32 0, %90
  %92 = zext i1 %91 to i32
  %93 = and i32 %86, %92
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %96

; <label>:95:                                     ; preds = %1
  store i32 1, i32* %2, align 4
  br label %97

; <label>:96:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %97

; <label>:97:                                     ; preds = %96, %95
  %98 = load i32, i32* %2, align 4
  ret i32 %98
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
