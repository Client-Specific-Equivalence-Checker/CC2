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
  %5 = icmp slt i32 12, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = srem i32 %7, 11
  %9 = icmp eq i32 0, %8
  %10 = zext i1 %9 to i32
  %11 = icmp eq i32 0, %10
  %12 = zext i1 %11 to i32
  %13 = and i32 %6, %12
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 3, %14
  %16 = zext i1 %15 to i32
  %17 = and i32 %13, %16
  %18 = load i32, i32* %3, align 4
  %19 = srem i32 %18, 12
  %20 = icmp eq i32 0, %19
  %21 = zext i1 %20 to i32
  %22 = icmp eq i32 0, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %17, %23
  %25 = load i32, i32* %3, align 4
  %26 = srem i32 %25, 3
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = icmp eq i32 0, %28
  %30 = zext i1 %29 to i32
  %31 = and i32 %24, %30
  %32 = load i32, i32* %3, align 4
  %33 = srem i32 %32, 10
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = icmp eq i32 0, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %31, %37
  %39 = load i32, i32* %3, align 4
  %40 = icmp slt i32 5, %39
  %41 = zext i1 %40 to i32
  %42 = and i32 %38, %41
  %43 = load i32, i32* %3, align 4
  %44 = icmp slt i32 10, %43
  %45 = zext i1 %44 to i32
  %46 = and i32 %42, %45
  %47 = load i32, i32* %3, align 4
  %48 = icmp slt i32 2, %47
  %49 = zext i1 %48 to i32
  %50 = and i32 %46, %49
  %51 = load i32, i32* %3, align 4
  %52 = srem i32 %51, 9
  %53 = icmp eq i32 0, %52
  %54 = zext i1 %53 to i32
  %55 = icmp eq i32 0, %54
  %56 = zext i1 %55 to i32
  %57 = and i32 %50, %56
  %58 = load i32, i32* %3, align 4
  %59 = icmp slt i32 9, %58
  %60 = zext i1 %59 to i32
  %61 = and i32 %57, %60
  %62 = load i32, i32* %3, align 4
  %63 = icmp slt i32 14, %62
  %64 = zext i1 %63 to i32
  %65 = icmp eq i32 0, %64
  %66 = zext i1 %65 to i32
  %67 = and i32 %61, %66
  %68 = load i32, i32* %3, align 4
  %69 = icmp slt i32 7, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %67, %70
  %72 = load i32, i32* %3, align 4
  %73 = srem i32 %72, 6
  %74 = icmp eq i32 0, %73
  %75 = zext i1 %74 to i32
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %71, %77
  %79 = load i32, i32* %3, align 4
  %80 = icmp slt i32 6, %79
  %81 = zext i1 %80 to i32
  %82 = and i32 %78, %81
  %83 = load i32, i32* %3, align 4
  %84 = srem i32 %83, 13
  %85 = icmp eq i32 0, %84
  %86 = zext i1 %85 to i32
  %87 = icmp eq i32 0, %86
  %88 = zext i1 %87 to i32
  %89 = and i32 %82, %88
  %90 = load i32, i32* %3, align 4
  %91 = srem i32 %90, 5
  %92 = icmp eq i32 0, %91
  %93 = zext i1 %92 to i32
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = and i32 %89, %95
  %97 = load i32, i32* %3, align 4
  %98 = icmp slt i32 11, %97
  %99 = zext i1 %98 to i32
  %100 = and i32 %96, %99
  %101 = load i32, i32* %3, align 4
  %102 = srem i32 %101, 7
  %103 = icmp eq i32 0, %102
  %104 = zext i1 %103 to i32
  %105 = and i32 %100, %104
  %106 = load i32, i32* %3, align 4
  %107 = icmp slt i32 13, %106
  %108 = zext i1 %107 to i32
  %109 = and i32 %105, %108
  %110 = load i32, i32* %3, align 4
  %111 = srem i32 %110, 2
  %112 = icmp eq i32 0, %111
  %113 = zext i1 %112 to i32
  %114 = and i32 %109, %113
  %115 = and i32 %114, 1
  %116 = load i32, i32* %3, align 4
  %117 = icmp slt i32 4, %116
  %118 = zext i1 %117 to i32
  %119 = and i32 %115, %118
  %120 = load i32, i32* %3, align 4
  %121 = srem i32 %120, 8
  %122 = icmp eq i32 0, %121
  %123 = zext i1 %122 to i32
  %124 = icmp eq i32 0, %123
  %125 = zext i1 %124 to i32
  %126 = and i32 %119, %125
  %127 = load i32, i32* %3, align 4
  %128 = srem i32 %127, 4
  %129 = icmp eq i32 0, %128
  %130 = zext i1 %129 to i32
  %131 = icmp eq i32 0, %130
  %132 = zext i1 %131 to i32
  %133 = and i32 %126, %132
  %134 = load i32, i32* %3, align 4
  %135 = icmp slt i32 8, %134
  %136 = zext i1 %135 to i32
  %137 = and i32 %133, %136
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %140

; <label>:139:                                    ; preds = %1
  store i32 10, i32* %2, align 4
  br label %141

; <label>:140:                                    ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %141

; <label>:141:                                    ; preds = %140, %139
  %142 = load i32, i32* %2, align 4
  ret i32 %142
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_new(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp slt i32 12, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = srem i32 %7, 11
  %9 = icmp eq i32 0, %8
  %10 = zext i1 %9 to i32
  %11 = icmp eq i32 0, %10
  %12 = zext i1 %11 to i32
  %13 = and i32 %6, %12
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 3, %14
  %16 = zext i1 %15 to i32
  %17 = and i32 %13, %16
  %18 = load i32, i32* %3, align 4
  %19 = srem i32 %18, 12
  %20 = icmp eq i32 0, %19
  %21 = zext i1 %20 to i32
  %22 = icmp eq i32 0, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %17, %23
  %25 = load i32, i32* %3, align 4
  %26 = srem i32 %25, 3
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = icmp eq i32 0, %28
  %30 = zext i1 %29 to i32
  %31 = and i32 %24, %30
  %32 = load i32, i32* %3, align 4
  %33 = srem i32 %32, 10
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = icmp eq i32 0, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %31, %37
  %39 = load i32, i32* %3, align 4
  %40 = icmp slt i32 5, %39
  %41 = zext i1 %40 to i32
  %42 = and i32 %38, %41
  %43 = load i32, i32* %3, align 4
  %44 = icmp slt i32 10, %43
  %45 = zext i1 %44 to i32
  %46 = and i32 %42, %45
  %47 = load i32, i32* %3, align 4
  %48 = icmp slt i32 2, %47
  %49 = zext i1 %48 to i32
  %50 = and i32 %46, %49
  %51 = load i32, i32* %3, align 4
  %52 = srem i32 %51, 9
  %53 = icmp eq i32 0, %52
  %54 = zext i1 %53 to i32
  %55 = icmp eq i32 0, %54
  %56 = zext i1 %55 to i32
  %57 = and i32 %50, %56
  %58 = load i32, i32* %3, align 4
  %59 = icmp slt i32 9, %58
  %60 = zext i1 %59 to i32
  %61 = and i32 %57, %60
  %62 = load i32, i32* %3, align 4
  %63 = icmp slt i32 14, %62
  %64 = zext i1 %63 to i32
  %65 = icmp eq i32 0, %64
  %66 = zext i1 %65 to i32
  %67 = and i32 %61, %66
  %68 = load i32, i32* %3, align 4
  %69 = icmp slt i32 7, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %67, %70
  %72 = load i32, i32* %3, align 4
  %73 = srem i32 %72, 6
  %74 = icmp eq i32 0, %73
  %75 = zext i1 %74 to i32
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %71, %77
  %79 = load i32, i32* %3, align 4
  %80 = icmp slt i32 6, %79
  %81 = zext i1 %80 to i32
  %82 = and i32 %78, %81
  %83 = load i32, i32* %3, align 4
  %84 = srem i32 %83, 13
  %85 = icmp eq i32 0, %84
  %86 = zext i1 %85 to i32
  %87 = icmp eq i32 0, %86
  %88 = zext i1 %87 to i32
  %89 = and i32 %82, %88
  %90 = load i32, i32* %3, align 4
  %91 = srem i32 %90, 5
  %92 = icmp eq i32 0, %91
  %93 = zext i1 %92 to i32
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = and i32 %89, %95
  %97 = load i32, i32* %3, align 4
  %98 = icmp slt i32 11, %97
  %99 = zext i1 %98 to i32
  %100 = and i32 %96, %99
  %101 = load i32, i32* %3, align 4
  %102 = srem i32 %101, 7
  %103 = icmp eq i32 0, %102
  %104 = zext i1 %103 to i32
  %105 = and i32 %100, %104
  %106 = load i32, i32* %3, align 4
  %107 = icmp slt i32 13, %106
  %108 = zext i1 %107 to i32
  %109 = and i32 %105, %108
  %110 = load i32, i32* %3, align 4
  %111 = srem i32 %110, 2
  %112 = icmp eq i32 0, %111
  %113 = zext i1 %112 to i32
  %114 = and i32 %109, %113
  %115 = and i32 %114, 1
  %116 = load i32, i32* %3, align 4
  %117 = icmp slt i32 4, %116
  %118 = zext i1 %117 to i32
  %119 = and i32 %115, %118
  %120 = load i32, i32* %3, align 4
  %121 = srem i32 %120, 8
  %122 = icmp eq i32 0, %121
  %123 = zext i1 %122 to i32
  %124 = icmp eq i32 0, %123
  %125 = zext i1 %124 to i32
  %126 = and i32 %119, %125
  %127 = load i32, i32* %3, align 4
  %128 = srem i32 %127, 4
  %129 = icmp eq i32 0, %128
  %130 = zext i1 %129 to i32
  %131 = icmp eq i32 0, %130
  %132 = zext i1 %131 to i32
  %133 = and i32 %126, %132
  %134 = load i32, i32* %3, align 4
  %135 = icmp slt i32 8, %134
  %136 = zext i1 %135 to i32
  %137 = and i32 %133, %136
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %140

; <label>:139:                                    ; preds = %1
  store i32 1, i32* %2, align 4
  br label %141

; <label>:140:                                    ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %141

; <label>:141:                                    ; preds = %140, %139
  %142 = load i32, i32* %2, align 4
  ret i32 %142
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
