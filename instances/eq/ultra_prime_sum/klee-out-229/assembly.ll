; ModuleID = 'client_merged_g_0.cil.bc'
source_filename = "client_merged_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_new\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_new\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_old\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_old\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"sum\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"i\00", align 1
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
  call void @klee_make_symbolic(i8* %16, i32 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0))
  %17 = bitcast i32* %6 to i8*
  call void @klee_make_symbolic(i8* %17, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  %18 = bitcast i32* %5 to i8*
  call void @klee_make_symbolic(i8* %18, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  call void @klee_assume(i32 1)
  store i32 0, i32* %11, align 4
  store i32 0, i32* %10, align 4
  store i32 0, i32* %9, align 4
  store i32 0, i32* %8, align 4
  %19 = load i32, i32* %7, align 4
  store i32 %19, i32* %1, align 4
  %20 = load i32, i32* %7, align 4
  store i32 %20, i32* %2, align 4
  %21 = load i32, i32* %6, align 4
  %22 = load i32, i32* %5, align 4
  %23 = icmp sle i32 %21, %22
  br i1 %23, label %24, label %47

; <label>:24:                                     ; preds = %0
  %25 = load i32, i32* %6, align 4
  %26 = call i32 @lib_old(i32 %25)
  store i32 %26, i32* %3, align 4
  %27 = bitcast i32* %3 to i8*
  call void @klee_make_symbolic(i8* %27, i32 4, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  %28 = load i32, i32* %3, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %24
  %31 = load i32, i32* %6, align 4
  %32 = load i32, i32* %1, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %1, align 4
  br label %34

; <label>:34:                                     ; preds = %30, %24
  %35 = load i32, i32* %6, align 4
  %36 = call i32 @lib_new(i32 %35)
  store i32 %36, i32* %4, align 4
  %37 = bitcast i32* %4 to i8*
  call void @klee_make_symbolic(i8* %37, i32 4, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  %38 = load i32, i32* %4, align 4
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40:                                     ; preds = %34
  %41 = load i32, i32* %6, align 4
  %42 = load i32, i32* %2, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, i32* %2, align 4
  br label %44

; <label>:44:                                     ; preds = %40, %34
  %45 = load i32, i32* %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %6, align 4
  br label %47

; <label>:47:                                     ; preds = %44, %0
  %48 = load i32, i32* %6, align 4
  store i32 %48, i32* %9, align 4
  %49 = load i32, i32* %6, align 4
  store i32 %49, i32* %11, align 4
  %50 = load i32, i32* %1, align 4
  store i32 %50, i32* %8, align 4
  %51 = load i32, i32* %2, align 4
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
  %5 = icmp slt i32 3, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 10, %7
  %9 = zext i1 %8 to i32
  %10 = and i32 %6, %9
  %11 = load i32, i32* %3, align 4
  %12 = icmp slt i32 6, %11
  %13 = zext i1 %12 to i32
  %14 = and i32 %10, %13
  %15 = load i32, i32* %3, align 4
  %16 = srem i32 %15, 10
  %17 = icmp eq i32 0, %16
  %18 = zext i1 %17 to i32
  %19 = icmp eq i32 0, %18
  %20 = zext i1 %19 to i32
  %21 = and i32 %14, %20
  %22 = load i32, i32* %3, align 4
  %23 = srem i32 %22, 5
  %24 = icmp eq i32 0, %23
  %25 = zext i1 %24 to i32
  %26 = icmp eq i32 0, %25
  %27 = zext i1 %26 to i32
  %28 = and i32 %21, %27
  %29 = load i32, i32* %3, align 4
  %30 = icmp slt i32 12, %29
  %31 = zext i1 %30 to i32
  %32 = and i32 %28, %31
  %33 = load i32, i32* %3, align 4
  %34 = srem i32 %33, 3
  %35 = icmp eq i32 0, %34
  %36 = zext i1 %35 to i32
  %37 = icmp eq i32 0, %36
  %38 = zext i1 %37 to i32
  %39 = and i32 %32, %38
  %40 = load i32, i32* %3, align 4
  %41 = srem i32 %40, 11
  %42 = icmp eq i32 0, %41
  %43 = zext i1 %42 to i32
  %44 = icmp eq i32 0, %43
  %45 = zext i1 %44 to i32
  %46 = and i32 %39, %45
  %47 = load i32, i32* %3, align 4
  %48 = srem i32 %47, 8
  %49 = icmp eq i32 0, %48
  %50 = zext i1 %49 to i32
  %51 = icmp eq i32 0, %50
  %52 = zext i1 %51 to i32
  %53 = and i32 %46, %52
  %54 = load i32, i32* %3, align 4
  %55 = srem i32 %54, 4
  %56 = icmp eq i32 0, %55
  %57 = zext i1 %56 to i32
  %58 = icmp eq i32 0, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %53, %59
  %61 = load i32, i32* %3, align 4
  %62 = icmp slt i32 4, %61
  %63 = zext i1 %62 to i32
  %64 = and i32 %60, %63
  %65 = load i32, i32* %3, align 4
  %66 = icmp slt i32 2, %65
  %67 = zext i1 %66 to i32
  %68 = and i32 %64, %67
  %69 = load i32, i32* %3, align 4
  %70 = icmp slt i32 5, %69
  %71 = zext i1 %70 to i32
  %72 = and i32 %68, %71
  %73 = load i32, i32* %3, align 4
  %74 = srem i32 %73, 13
  %75 = icmp eq i32 0, %74
  %76 = zext i1 %75 to i32
  %77 = icmp eq i32 0, %76
  %78 = zext i1 %77 to i32
  %79 = and i32 %72, %78
  %80 = load i32, i32* %3, align 4
  %81 = icmp slt i32 11, %80
  %82 = zext i1 %81 to i32
  %83 = and i32 %79, %82
  %84 = load i32, i32* %3, align 4
  %85 = srem i32 %84, 9
  %86 = icmp eq i32 0, %85
  %87 = zext i1 %86 to i32
  %88 = icmp eq i32 0, %87
  %89 = zext i1 %88 to i32
  %90 = and i32 %83, %89
  %91 = load i32, i32* %3, align 4
  %92 = icmp slt i32 14, %91
  %93 = zext i1 %92 to i32
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = and i32 %90, %95
  %97 = load i32, i32* %3, align 4
  %98 = icmp slt i32 8, %97
  %99 = zext i1 %98 to i32
  %100 = and i32 %96, %99
  %101 = load i32, i32* %3, align 4
  %102 = srem i32 %101, 2
  %103 = icmp eq i32 0, %102
  %104 = zext i1 %103 to i32
  %105 = and i32 %100, %104
  %106 = load i32, i32* %3, align 4
  %107 = icmp slt i32 13, %106
  %108 = zext i1 %107 to i32
  %109 = and i32 %105, %108
  %110 = load i32, i32* %3, align 4
  %111 = icmp slt i32 9, %110
  %112 = zext i1 %111 to i32
  %113 = and i32 %109, %112
  %114 = load i32, i32* %3, align 4
  %115 = srem i32 %114, 7
  %116 = icmp eq i32 0, %115
  %117 = zext i1 %116 to i32
  %118 = and i32 %113, %117
  %119 = load i32, i32* %3, align 4
  %120 = srem i32 %119, 6
  %121 = icmp eq i32 0, %120
  %122 = zext i1 %121 to i32
  %123 = icmp eq i32 0, %122
  %124 = zext i1 %123 to i32
  %125 = and i32 %118, %124
  %126 = load i32, i32* %3, align 4
  %127 = icmp slt i32 7, %126
  %128 = zext i1 %127 to i32
  %129 = and i32 %125, %128
  %130 = and i32 %129, 1
  %131 = load i32, i32* %3, align 4
  %132 = srem i32 %131, 12
  %133 = icmp eq i32 0, %132
  %134 = zext i1 %133 to i32
  %135 = icmp eq i32 0, %134
  %136 = zext i1 %135 to i32
  %137 = and i32 %130, %136
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
  %5 = icmp slt i32 3, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 10, %7
  %9 = zext i1 %8 to i32
  %10 = and i32 %6, %9
  %11 = load i32, i32* %3, align 4
  %12 = icmp slt i32 6, %11
  %13 = zext i1 %12 to i32
  %14 = and i32 %10, %13
  %15 = load i32, i32* %3, align 4
  %16 = srem i32 %15, 10
  %17 = icmp eq i32 0, %16
  %18 = zext i1 %17 to i32
  %19 = icmp eq i32 0, %18
  %20 = zext i1 %19 to i32
  %21 = and i32 %14, %20
  %22 = load i32, i32* %3, align 4
  %23 = srem i32 %22, 5
  %24 = icmp eq i32 0, %23
  %25 = zext i1 %24 to i32
  %26 = icmp eq i32 0, %25
  %27 = zext i1 %26 to i32
  %28 = and i32 %21, %27
  %29 = load i32, i32* %3, align 4
  %30 = icmp slt i32 12, %29
  %31 = zext i1 %30 to i32
  %32 = and i32 %28, %31
  %33 = load i32, i32* %3, align 4
  %34 = srem i32 %33, 3
  %35 = icmp eq i32 0, %34
  %36 = zext i1 %35 to i32
  %37 = icmp eq i32 0, %36
  %38 = zext i1 %37 to i32
  %39 = and i32 %32, %38
  %40 = load i32, i32* %3, align 4
  %41 = srem i32 %40, 11
  %42 = icmp eq i32 0, %41
  %43 = zext i1 %42 to i32
  %44 = icmp eq i32 0, %43
  %45 = zext i1 %44 to i32
  %46 = and i32 %39, %45
  %47 = load i32, i32* %3, align 4
  %48 = srem i32 %47, 8
  %49 = icmp eq i32 0, %48
  %50 = zext i1 %49 to i32
  %51 = icmp eq i32 0, %50
  %52 = zext i1 %51 to i32
  %53 = and i32 %46, %52
  %54 = load i32, i32* %3, align 4
  %55 = srem i32 %54, 4
  %56 = icmp eq i32 0, %55
  %57 = zext i1 %56 to i32
  %58 = icmp eq i32 0, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %53, %59
  %61 = load i32, i32* %3, align 4
  %62 = icmp slt i32 4, %61
  %63 = zext i1 %62 to i32
  %64 = and i32 %60, %63
  %65 = load i32, i32* %3, align 4
  %66 = icmp slt i32 2, %65
  %67 = zext i1 %66 to i32
  %68 = and i32 %64, %67
  %69 = load i32, i32* %3, align 4
  %70 = icmp slt i32 5, %69
  %71 = zext i1 %70 to i32
  %72 = and i32 %68, %71
  %73 = load i32, i32* %3, align 4
  %74 = srem i32 %73, 13
  %75 = icmp eq i32 0, %74
  %76 = zext i1 %75 to i32
  %77 = icmp eq i32 0, %76
  %78 = zext i1 %77 to i32
  %79 = and i32 %72, %78
  %80 = load i32, i32* %3, align 4
  %81 = icmp slt i32 11, %80
  %82 = zext i1 %81 to i32
  %83 = and i32 %79, %82
  %84 = load i32, i32* %3, align 4
  %85 = srem i32 %84, 9
  %86 = icmp eq i32 0, %85
  %87 = zext i1 %86 to i32
  %88 = icmp eq i32 0, %87
  %89 = zext i1 %88 to i32
  %90 = and i32 %83, %89
  %91 = load i32, i32* %3, align 4
  %92 = icmp slt i32 14, %91
  %93 = zext i1 %92 to i32
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = and i32 %90, %95
  %97 = load i32, i32* %3, align 4
  %98 = icmp slt i32 8, %97
  %99 = zext i1 %98 to i32
  %100 = and i32 %96, %99
  %101 = load i32, i32* %3, align 4
  %102 = srem i32 %101, 2
  %103 = icmp eq i32 0, %102
  %104 = zext i1 %103 to i32
  %105 = and i32 %100, %104
  %106 = load i32, i32* %3, align 4
  %107 = icmp slt i32 13, %106
  %108 = zext i1 %107 to i32
  %109 = and i32 %105, %108
  %110 = load i32, i32* %3, align 4
  %111 = icmp slt i32 9, %110
  %112 = zext i1 %111 to i32
  %113 = and i32 %109, %112
  %114 = load i32, i32* %3, align 4
  %115 = srem i32 %114, 7
  %116 = icmp eq i32 0, %115
  %117 = zext i1 %116 to i32
  %118 = and i32 %113, %117
  %119 = load i32, i32* %3, align 4
  %120 = srem i32 %119, 6
  %121 = icmp eq i32 0, %120
  %122 = zext i1 %121 to i32
  %123 = icmp eq i32 0, %122
  %124 = zext i1 %123 to i32
  %125 = and i32 %118, %124
  %126 = load i32, i32* %3, align 4
  %127 = icmp slt i32 7, %126
  %128 = zext i1 %127 to i32
  %129 = and i32 %125, %128
  %130 = and i32 %129, 1
  %131 = load i32, i32* %3, align 4
  %132 = srem i32 %131, 12
  %133 = icmp eq i32 0, %132
  %134 = zext i1 %133 to i32
  %135 = icmp eq i32 0, %134
  %136 = zext i1 %135 to i32
  %137 = and i32 %130, %136
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
