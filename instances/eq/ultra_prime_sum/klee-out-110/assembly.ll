; ModuleID = 'client_merged_g_0.cil.bc'
source_filename = "client_merged_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_new\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_new\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_old\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_old\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"sum\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"i\00", align 1
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
  %21 = load i32, i32* %5, align 4
  %22 = load i32, i32* %7, align 4
  %23 = icmp sle i32 %21, %22
  br i1 %23, label %24, label %47

; <label>:24:                                     ; preds = %0
  %25 = load i32, i32* %5, align 4
  %26 = call i32 @lib_old(i32 %25)
  store i32 %26, i32* %3, align 4
  %27 = bitcast i32* %3 to i8*
  call void @klee_make_symbolic(i8* %27, i32 4, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %28 = load i32, i32* %3, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %24
  %31 = load i32, i32* %5, align 4
  %32 = load i32, i32* %2, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %2, align 4
  br label %34

; <label>:34:                                     ; preds = %30, %24
  %35 = load i32, i32* %5, align 4
  %36 = call i32 @lib_new(i32 %35)
  store i32 %36, i32* %4, align 4
  %37 = bitcast i32* %4 to i8*
  call void @klee_make_symbolic(i8* %37, i32 4, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  %38 = load i32, i32* %4, align 4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %34
  %41 = load i32, i32* %5, align 4
  %42 = load i32, i32* %1, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, i32* %1, align 4
  br label %44

; <label>:44:                                     ; preds = %40, %34
  %45 = load i32, i32* %5, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %5, align 4
  br label %47

; <label>:47:                                     ; preds = %44, %0
  %48 = load i32, i32* %5, align 4
  store i32 %48, i32* %9, align 4
  %49 = load i32, i32* %5, align 4
  store i32 %49, i32* %11, align 4
  %50 = load i32, i32* %2, align 4
  store i32 %50, i32* %8, align 4
  %51 = load i32, i32* %1, align 4
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
  %5 = srem i32 %4, 3
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = icmp eq i32 0, %7
  %9 = zext i1 %8 to i32
  %10 = load i32, i32* %3, align 4
  %11 = srem i32 %10, 9
  %12 = icmp eq i32 0, %11
  %13 = zext i1 %12 to i32
  %14 = icmp eq i32 0, %13
  %15 = zext i1 %14 to i32
  %16 = and i32 %9, %15
  %17 = load i32, i32* %3, align 4
  %18 = icmp slt i32 9, %17
  %19 = zext i1 %18 to i32
  %20 = and i32 %16, %19
  %21 = load i32, i32* %3, align 4
  %22 = icmp slt i32 10, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %20, %23
  %25 = load i32, i32* %3, align 4
  %26 = srem i32 %25, 7
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = icmp eq i32 0, %28
  %30 = zext i1 %29 to i32
  %31 = and i32 %24, %30
  %32 = load i32, i32* %3, align 4
  %33 = srem i32 %32, 2
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = icmp eq i32 0, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %31, %37
  %39 = load i32, i32* %3, align 4
  %40 = srem i32 %39, 10
  %41 = icmp eq i32 0, %40
  %42 = zext i1 %41 to i32
  %43 = icmp eq i32 0, %42
  %44 = zext i1 %43 to i32
  %45 = and i32 %38, %44
  %46 = load i32, i32* %3, align 4
  %47 = icmp slt i32 4, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %45, %48
  %50 = load i32, i32* %3, align 4
  %51 = srem i32 %50, 6
  %52 = icmp eq i32 0, %51
  %53 = zext i1 %52 to i32
  %54 = icmp eq i32 0, %53
  %55 = zext i1 %54 to i32
  %56 = and i32 %49, %55
  %57 = load i32, i32* %3, align 4
  %58 = icmp slt i32 11, %57
  %59 = zext i1 %58 to i32
  %60 = icmp eq i32 0, %59
  %61 = zext i1 %60 to i32
  %62 = and i32 %56, %61
  %63 = load i32, i32* %3, align 4
  %64 = icmp slt i32 3, %63
  %65 = zext i1 %64 to i32
  %66 = and i32 %62, %65
  %67 = load i32, i32* %3, align 4
  %68 = srem i32 %67, 4
  %69 = icmp eq i32 0, %68
  %70 = zext i1 %69 to i32
  %71 = icmp eq i32 0, %70
  %72 = zext i1 %71 to i32
  %73 = and i32 %66, %72
  %74 = and i32 %73, 1
  %75 = load i32, i32* %3, align 4
  %76 = icmp slt i32 5, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %74, %77
  %79 = load i32, i32* %3, align 4
  %80 = icmp slt i32 7, %79
  %81 = zext i1 %80 to i32
  %82 = and i32 %78, %81
  %83 = load i32, i32* %3, align 4
  %84 = icmp slt i32 8, %83
  %85 = zext i1 %84 to i32
  %86 = and i32 %82, %85
  %87 = load i32, i32* %3, align 4
  %88 = icmp slt i32 2, %87
  %89 = zext i1 %88 to i32
  %90 = and i32 %86, %89
  %91 = load i32, i32* %3, align 4
  %92 = srem i32 %91, 8
  %93 = icmp eq i32 0, %92
  %94 = zext i1 %93 to i32
  %95 = icmp eq i32 0, %94
  %96 = zext i1 %95 to i32
  %97 = and i32 %90, %96
  %98 = load i32, i32* %3, align 4
  %99 = icmp slt i32 6, %98
  %100 = zext i1 %99 to i32
  %101 = and i32 %97, %100
  %102 = load i32, i32* %3, align 4
  %103 = srem i32 %102, 5
  %104 = icmp eq i32 0, %103
  %105 = zext i1 %104 to i32
  %106 = icmp eq i32 0, %105
  %107 = zext i1 %106 to i32
  %108 = and i32 %101, %107
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %111

; <label>:110:                                    ; preds = %1
  store i32 9, i32* %2, align 4
  br label %112

; <label>:111:                                    ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %112

; <label>:112:                                    ; preds = %111, %110
  %113 = load i32, i32* %2, align 4
  ret i32 %113
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_new(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = srem i32 %4, 3
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = icmp eq i32 0, %7
  %9 = zext i1 %8 to i32
  %10 = load i32, i32* %3, align 4
  %11 = srem i32 %10, 9
  %12 = icmp eq i32 0, %11
  %13 = zext i1 %12 to i32
  %14 = icmp eq i32 0, %13
  %15 = zext i1 %14 to i32
  %16 = and i32 %9, %15
  %17 = load i32, i32* %3, align 4
  %18 = icmp slt i32 9, %17
  %19 = zext i1 %18 to i32
  %20 = and i32 %16, %19
  %21 = load i32, i32* %3, align 4
  %22 = icmp slt i32 10, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %20, %23
  %25 = load i32, i32* %3, align 4
  %26 = srem i32 %25, 7
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = icmp eq i32 0, %28
  %30 = zext i1 %29 to i32
  %31 = and i32 %24, %30
  %32 = load i32, i32* %3, align 4
  %33 = srem i32 %32, 2
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = icmp eq i32 0, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %31, %37
  %39 = load i32, i32* %3, align 4
  %40 = srem i32 %39, 10
  %41 = icmp eq i32 0, %40
  %42 = zext i1 %41 to i32
  %43 = icmp eq i32 0, %42
  %44 = zext i1 %43 to i32
  %45 = and i32 %38, %44
  %46 = load i32, i32* %3, align 4
  %47 = icmp slt i32 4, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %45, %48
  %50 = load i32, i32* %3, align 4
  %51 = srem i32 %50, 6
  %52 = icmp eq i32 0, %51
  %53 = zext i1 %52 to i32
  %54 = icmp eq i32 0, %53
  %55 = zext i1 %54 to i32
  %56 = and i32 %49, %55
  %57 = load i32, i32* %3, align 4
  %58 = icmp slt i32 11, %57
  %59 = zext i1 %58 to i32
  %60 = icmp eq i32 0, %59
  %61 = zext i1 %60 to i32
  %62 = and i32 %56, %61
  %63 = load i32, i32* %3, align 4
  %64 = icmp slt i32 3, %63
  %65 = zext i1 %64 to i32
  %66 = and i32 %62, %65
  %67 = load i32, i32* %3, align 4
  %68 = srem i32 %67, 4
  %69 = icmp eq i32 0, %68
  %70 = zext i1 %69 to i32
  %71 = icmp eq i32 0, %70
  %72 = zext i1 %71 to i32
  %73 = and i32 %66, %72
  %74 = and i32 %73, 1
  %75 = load i32, i32* %3, align 4
  %76 = icmp slt i32 5, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %74, %77
  %79 = load i32, i32* %3, align 4
  %80 = icmp slt i32 7, %79
  %81 = zext i1 %80 to i32
  %82 = and i32 %78, %81
  %83 = load i32, i32* %3, align 4
  %84 = icmp slt i32 8, %83
  %85 = zext i1 %84 to i32
  %86 = and i32 %82, %85
  %87 = load i32, i32* %3, align 4
  %88 = icmp slt i32 2, %87
  %89 = zext i1 %88 to i32
  %90 = and i32 %86, %89
  %91 = load i32, i32* %3, align 4
  %92 = srem i32 %91, 8
  %93 = icmp eq i32 0, %92
  %94 = zext i1 %93 to i32
  %95 = icmp eq i32 0, %94
  %96 = zext i1 %95 to i32
  %97 = and i32 %90, %96
  %98 = load i32, i32* %3, align 4
  %99 = icmp slt i32 6, %98
  %100 = zext i1 %99 to i32
  %101 = and i32 %97, %100
  %102 = load i32, i32* %3, align 4
  %103 = srem i32 %102, 5
  %104 = icmp eq i32 0, %103
  %105 = zext i1 %104 to i32
  %106 = icmp eq i32 0, %105
  %107 = zext i1 %106 to i32
  %108 = and i32 %101, %107
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %111

; <label>:110:                                    ; preds = %1
  store i32 1, i32* %2, align 4
  br label %112

; <label>:111:                                    ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %112

; <label>:112:                                    ; preds = %111, %110
  %113 = load i32, i32* %2, align 4
  ret i32 %113
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
