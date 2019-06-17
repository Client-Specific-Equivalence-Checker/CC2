; ModuleID = 'client_merged_g_0.cil.bc'
source_filename = "client_merged_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_new\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_new\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_old\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_old\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"sum\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"n\00", align 1
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
  %21 = load i32, i32* %5, align 4
  %22 = load i32, i32* %6, align 4
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
  %32 = load i32, i32* %1, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %1, align 4
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
  %42 = load i32, i32* %2, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, i32* %2, align 4
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
  %5 = icmp slt i32 2, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 8, %7
  %9 = zext i1 %8 to i32
  %10 = and i32 %6, %9
  %11 = load i32, i32* %3, align 4
  %12 = srem i32 %11, 4
  %13 = icmp eq i32 0, %12
  %14 = zext i1 %13 to i32
  %15 = icmp eq i32 0, %14
  %16 = zext i1 %15 to i32
  %17 = and i32 %10, %16
  %18 = and i32 %17, 1
  %19 = load i32, i32* %3, align 4
  %20 = icmp slt i32 11, %19
  %21 = zext i1 %20 to i32
  %22 = and i32 %18, %21
  %23 = load i32, i32* %3, align 4
  %24 = srem i32 %23, 5
  %25 = icmp eq i32 0, %24
  %26 = zext i1 %25 to i32
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %22, %28
  %30 = load i32, i32* %3, align 4
  %31 = srem i32 %30, 7
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = and i32 %29, %33
  %35 = load i32, i32* %3, align 4
  %36 = icmp slt i32 10, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %34, %37
  %39 = load i32, i32* %3, align 4
  %40 = srem i32 %39, 6
  %41 = icmp eq i32 0, %40
  %42 = zext i1 %41 to i32
  %43 = icmp eq i32 0, %42
  %44 = zext i1 %43 to i32
  %45 = and i32 %38, %44
  %46 = load i32, i32* %3, align 4
  %47 = icmp slt i32 6, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %45, %48
  %50 = load i32, i32* %3, align 4
  %51 = srem i32 %50, 12
  %52 = icmp eq i32 0, %51
  %53 = zext i1 %52 to i32
  %54 = icmp eq i32 0, %53
  %55 = zext i1 %54 to i32
  %56 = and i32 %49, %55
  %57 = load i32, i32* %3, align 4
  %58 = icmp slt i32 13, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %56, %59
  %61 = load i32, i32* %3, align 4
  %62 = srem i32 %61, 8
  %63 = icmp eq i32 0, %62
  %64 = zext i1 %63 to i32
  %65 = icmp eq i32 0, %64
  %66 = zext i1 %65 to i32
  %67 = and i32 %60, %66
  %68 = load i32, i32* %3, align 4
  %69 = icmp slt i32 5, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %67, %70
  %72 = load i32, i32* %3, align 4
  %73 = srem i32 %72, 9
  %74 = icmp eq i32 0, %73
  %75 = zext i1 %74 to i32
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %71, %77
  %79 = load i32, i32* %3, align 4
  %80 = icmp slt i32 14, %79
  %81 = zext i1 %80 to i32
  %82 = icmp eq i32 0, %81
  %83 = zext i1 %82 to i32
  %84 = and i32 %78, %83
  %85 = load i32, i32* %3, align 4
  %86 = icmp slt i32 9, %85
  %87 = zext i1 %86 to i32
  %88 = and i32 %84, %87
  %89 = load i32, i32* %3, align 4
  %90 = srem i32 %89, 10
  %91 = icmp eq i32 0, %90
  %92 = zext i1 %91 to i32
  %93 = icmp eq i32 0, %92
  %94 = zext i1 %93 to i32
  %95 = and i32 %88, %94
  %96 = load i32, i32* %3, align 4
  %97 = icmp slt i32 12, %96
  %98 = zext i1 %97 to i32
  %99 = and i32 %95, %98
  %100 = load i32, i32* %3, align 4
  %101 = srem i32 %100, 13
  %102 = icmp eq i32 0, %101
  %103 = zext i1 %102 to i32
  %104 = icmp eq i32 0, %103
  %105 = zext i1 %104 to i32
  %106 = and i32 %99, %105
  %107 = load i32, i32* %3, align 4
  %108 = icmp slt i32 4, %107
  %109 = zext i1 %108 to i32
  %110 = and i32 %106, %109
  %111 = load i32, i32* %3, align 4
  %112 = srem i32 %111, 3
  %113 = icmp eq i32 0, %112
  %114 = zext i1 %113 to i32
  %115 = icmp eq i32 0, %114
  %116 = zext i1 %115 to i32
  %117 = and i32 %110, %116
  %118 = load i32, i32* %3, align 4
  %119 = icmp slt i32 7, %118
  %120 = zext i1 %119 to i32
  %121 = and i32 %117, %120
  %122 = load i32, i32* %3, align 4
  %123 = icmp slt i32 3, %122
  %124 = zext i1 %123 to i32
  %125 = and i32 %121, %124
  %126 = load i32, i32* %3, align 4
  %127 = srem i32 %126, 2
  %128 = icmp eq i32 0, %127
  %129 = zext i1 %128 to i32
  %130 = and i32 %125, %129
  %131 = load i32, i32* %3, align 4
  %132 = srem i32 %131, 11
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
  %5 = icmp slt i32 2, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 8, %7
  %9 = zext i1 %8 to i32
  %10 = and i32 %6, %9
  %11 = load i32, i32* %3, align 4
  %12 = srem i32 %11, 4
  %13 = icmp eq i32 0, %12
  %14 = zext i1 %13 to i32
  %15 = icmp eq i32 0, %14
  %16 = zext i1 %15 to i32
  %17 = and i32 %10, %16
  %18 = and i32 %17, 1
  %19 = load i32, i32* %3, align 4
  %20 = icmp slt i32 11, %19
  %21 = zext i1 %20 to i32
  %22 = and i32 %18, %21
  %23 = load i32, i32* %3, align 4
  %24 = srem i32 %23, 5
  %25 = icmp eq i32 0, %24
  %26 = zext i1 %25 to i32
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %22, %28
  %30 = load i32, i32* %3, align 4
  %31 = srem i32 %30, 7
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = and i32 %29, %33
  %35 = load i32, i32* %3, align 4
  %36 = icmp slt i32 10, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %34, %37
  %39 = load i32, i32* %3, align 4
  %40 = srem i32 %39, 6
  %41 = icmp eq i32 0, %40
  %42 = zext i1 %41 to i32
  %43 = icmp eq i32 0, %42
  %44 = zext i1 %43 to i32
  %45 = and i32 %38, %44
  %46 = load i32, i32* %3, align 4
  %47 = icmp slt i32 6, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %45, %48
  %50 = load i32, i32* %3, align 4
  %51 = srem i32 %50, 12
  %52 = icmp eq i32 0, %51
  %53 = zext i1 %52 to i32
  %54 = icmp eq i32 0, %53
  %55 = zext i1 %54 to i32
  %56 = and i32 %49, %55
  %57 = load i32, i32* %3, align 4
  %58 = icmp slt i32 13, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %56, %59
  %61 = load i32, i32* %3, align 4
  %62 = srem i32 %61, 8
  %63 = icmp eq i32 0, %62
  %64 = zext i1 %63 to i32
  %65 = icmp eq i32 0, %64
  %66 = zext i1 %65 to i32
  %67 = and i32 %60, %66
  %68 = load i32, i32* %3, align 4
  %69 = icmp slt i32 5, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %67, %70
  %72 = load i32, i32* %3, align 4
  %73 = srem i32 %72, 9
  %74 = icmp eq i32 0, %73
  %75 = zext i1 %74 to i32
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %71, %77
  %79 = load i32, i32* %3, align 4
  %80 = icmp slt i32 14, %79
  %81 = zext i1 %80 to i32
  %82 = icmp eq i32 0, %81
  %83 = zext i1 %82 to i32
  %84 = and i32 %78, %83
  %85 = load i32, i32* %3, align 4
  %86 = icmp slt i32 9, %85
  %87 = zext i1 %86 to i32
  %88 = and i32 %84, %87
  %89 = load i32, i32* %3, align 4
  %90 = srem i32 %89, 10
  %91 = icmp eq i32 0, %90
  %92 = zext i1 %91 to i32
  %93 = icmp eq i32 0, %92
  %94 = zext i1 %93 to i32
  %95 = and i32 %88, %94
  %96 = load i32, i32* %3, align 4
  %97 = icmp slt i32 12, %96
  %98 = zext i1 %97 to i32
  %99 = and i32 %95, %98
  %100 = load i32, i32* %3, align 4
  %101 = srem i32 %100, 13
  %102 = icmp eq i32 0, %101
  %103 = zext i1 %102 to i32
  %104 = icmp eq i32 0, %103
  %105 = zext i1 %104 to i32
  %106 = and i32 %99, %105
  %107 = load i32, i32* %3, align 4
  %108 = icmp slt i32 4, %107
  %109 = zext i1 %108 to i32
  %110 = and i32 %106, %109
  %111 = load i32, i32* %3, align 4
  %112 = srem i32 %111, 3
  %113 = icmp eq i32 0, %112
  %114 = zext i1 %113 to i32
  %115 = icmp eq i32 0, %114
  %116 = zext i1 %115 to i32
  %117 = and i32 %110, %116
  %118 = load i32, i32* %3, align 4
  %119 = icmp slt i32 7, %118
  %120 = zext i1 %119 to i32
  %121 = and i32 %117, %120
  %122 = load i32, i32* %3, align 4
  %123 = icmp slt i32 3, %122
  %124 = zext i1 %123 to i32
  %125 = and i32 %121, %124
  %126 = load i32, i32* %3, align 4
  %127 = srem i32 %126, 2
  %128 = icmp eq i32 0, %127
  %129 = zext i1 %128 to i32
  %130 = and i32 %125, %129
  %131 = load i32, i32* %3, align 4
  %132 = srem i32 %131, 11
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
