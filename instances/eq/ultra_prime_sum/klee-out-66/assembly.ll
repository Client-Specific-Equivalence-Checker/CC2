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
  %18 = load i32, i32* %3, align 4
  %19 = srem i32 %18, 2
  %20 = icmp eq i32 0, %19
  %21 = zext i1 %20 to i32
  %22 = icmp eq i32 0, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %17, %23
  %25 = and i32 %24, 1
  %26 = load i32, i32* %3, align 4
  %27 = icmp slt i32 11, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %25, %28
  %30 = load i32, i32* %3, align 4
  %31 = srem i32 %30, 5
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = and i32 %29, %35
  %37 = load i32, i32* %3, align 4
  %38 = icmp slt i32 13, %37
  %39 = zext i1 %38 to i32
  %40 = icmp eq i32 0, %39
  %41 = zext i1 %40 to i32
  %42 = and i32 %36, %41
  %43 = load i32, i32* %3, align 4
  %44 = srem i32 %43, 7
  %45 = icmp eq i32 0, %44
  %46 = zext i1 %45 to i32
  %47 = icmp eq i32 0, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %42, %48
  %50 = load i32, i32* %3, align 4
  %51 = icmp slt i32 10, %50
  %52 = zext i1 %51 to i32
  %53 = and i32 %49, %52
  %54 = load i32, i32* %3, align 4
  %55 = srem i32 %54, 6
  %56 = icmp eq i32 0, %55
  %57 = zext i1 %56 to i32
  %58 = icmp eq i32 0, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %53, %59
  %61 = load i32, i32* %3, align 4
  %62 = icmp slt i32 6, %61
  %63 = zext i1 %62 to i32
  %64 = and i32 %60, %63
  %65 = load i32, i32* %3, align 4
  %66 = srem i32 %65, 12
  %67 = icmp eq i32 0, %66
  %68 = zext i1 %67 to i32
  %69 = icmp eq i32 0, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %64, %70
  %72 = load i32, i32* %3, align 4
  %73 = srem i32 %72, 8
  %74 = icmp eq i32 0, %73
  %75 = zext i1 %74 to i32
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %71, %77
  %79 = load i32, i32* %3, align 4
  %80 = icmp slt i32 5, %79
  %81 = zext i1 %80 to i32
  %82 = and i32 %78, %81
  %83 = load i32, i32* %3, align 4
  %84 = srem i32 %83, 9
  %85 = icmp eq i32 0, %84
  %86 = zext i1 %85 to i32
  %87 = icmp eq i32 0, %86
  %88 = zext i1 %87 to i32
  %89 = and i32 %82, %88
  %90 = load i32, i32* %3, align 4
  %91 = icmp slt i32 9, %90
  %92 = zext i1 %91 to i32
  %93 = and i32 %89, %92
  %94 = load i32, i32* %3, align 4
  %95 = srem i32 %94, 10
  %96 = icmp eq i32 0, %95
  %97 = zext i1 %96 to i32
  %98 = icmp eq i32 0, %97
  %99 = zext i1 %98 to i32
  %100 = and i32 %93, %99
  %101 = load i32, i32* %3, align 4
  %102 = icmp slt i32 12, %101
  %103 = zext i1 %102 to i32
  %104 = and i32 %100, %103
  %105 = load i32, i32* %3, align 4
  %106 = icmp slt i32 4, %105
  %107 = zext i1 %106 to i32
  %108 = and i32 %104, %107
  %109 = load i32, i32* %3, align 4
  %110 = srem i32 %109, 3
  %111 = icmp eq i32 0, %110
  %112 = zext i1 %111 to i32
  %113 = icmp eq i32 0, %112
  %114 = zext i1 %113 to i32
  %115 = and i32 %108, %114
  %116 = load i32, i32* %3, align 4
  %117 = icmp slt i32 7, %116
  %118 = zext i1 %117 to i32
  %119 = and i32 %115, %118
  %120 = load i32, i32* %3, align 4
  %121 = icmp slt i32 3, %120
  %122 = zext i1 %121 to i32
  %123 = and i32 %119, %122
  %124 = load i32, i32* %3, align 4
  %125 = srem i32 %124, 11
  %126 = icmp eq i32 0, %125
  %127 = zext i1 %126 to i32
  %128 = icmp eq i32 0, %127
  %129 = zext i1 %128 to i32
  %130 = and i32 %123, %129
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %132, label %133

; <label>:132:                                    ; preds = %1
  store i32 11, i32* %2, align 4
  br label %134

; <label>:133:                                    ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %134

; <label>:134:                                    ; preds = %133, %132
  %135 = load i32, i32* %2, align 4
  ret i32 %135
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
  %18 = load i32, i32* %3, align 4
  %19 = srem i32 %18, 2
  %20 = icmp eq i32 0, %19
  %21 = zext i1 %20 to i32
  %22 = icmp eq i32 0, %21
  %23 = zext i1 %22 to i32
  %24 = and i32 %17, %23
  %25 = and i32 %24, 1
  %26 = load i32, i32* %3, align 4
  %27 = icmp slt i32 11, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %25, %28
  %30 = load i32, i32* %3, align 4
  %31 = srem i32 %30, 5
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = and i32 %29, %35
  %37 = load i32, i32* %3, align 4
  %38 = icmp slt i32 13, %37
  %39 = zext i1 %38 to i32
  %40 = icmp eq i32 0, %39
  %41 = zext i1 %40 to i32
  %42 = and i32 %36, %41
  %43 = load i32, i32* %3, align 4
  %44 = srem i32 %43, 7
  %45 = icmp eq i32 0, %44
  %46 = zext i1 %45 to i32
  %47 = icmp eq i32 0, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %42, %48
  %50 = load i32, i32* %3, align 4
  %51 = icmp slt i32 10, %50
  %52 = zext i1 %51 to i32
  %53 = and i32 %49, %52
  %54 = load i32, i32* %3, align 4
  %55 = srem i32 %54, 6
  %56 = icmp eq i32 0, %55
  %57 = zext i1 %56 to i32
  %58 = icmp eq i32 0, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %53, %59
  %61 = load i32, i32* %3, align 4
  %62 = icmp slt i32 6, %61
  %63 = zext i1 %62 to i32
  %64 = and i32 %60, %63
  %65 = load i32, i32* %3, align 4
  %66 = srem i32 %65, 12
  %67 = icmp eq i32 0, %66
  %68 = zext i1 %67 to i32
  %69 = icmp eq i32 0, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %64, %70
  %72 = load i32, i32* %3, align 4
  %73 = srem i32 %72, 8
  %74 = icmp eq i32 0, %73
  %75 = zext i1 %74 to i32
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %71, %77
  %79 = load i32, i32* %3, align 4
  %80 = icmp slt i32 5, %79
  %81 = zext i1 %80 to i32
  %82 = and i32 %78, %81
  %83 = load i32, i32* %3, align 4
  %84 = srem i32 %83, 9
  %85 = icmp eq i32 0, %84
  %86 = zext i1 %85 to i32
  %87 = icmp eq i32 0, %86
  %88 = zext i1 %87 to i32
  %89 = and i32 %82, %88
  %90 = load i32, i32* %3, align 4
  %91 = icmp slt i32 9, %90
  %92 = zext i1 %91 to i32
  %93 = and i32 %89, %92
  %94 = load i32, i32* %3, align 4
  %95 = srem i32 %94, 10
  %96 = icmp eq i32 0, %95
  %97 = zext i1 %96 to i32
  %98 = icmp eq i32 0, %97
  %99 = zext i1 %98 to i32
  %100 = and i32 %93, %99
  %101 = load i32, i32* %3, align 4
  %102 = icmp slt i32 12, %101
  %103 = zext i1 %102 to i32
  %104 = and i32 %100, %103
  %105 = load i32, i32* %3, align 4
  %106 = icmp slt i32 4, %105
  %107 = zext i1 %106 to i32
  %108 = and i32 %104, %107
  %109 = load i32, i32* %3, align 4
  %110 = srem i32 %109, 3
  %111 = icmp eq i32 0, %110
  %112 = zext i1 %111 to i32
  %113 = icmp eq i32 0, %112
  %114 = zext i1 %113 to i32
  %115 = and i32 %108, %114
  %116 = load i32, i32* %3, align 4
  %117 = icmp slt i32 7, %116
  %118 = zext i1 %117 to i32
  %119 = and i32 %115, %118
  %120 = load i32, i32* %3, align 4
  %121 = icmp slt i32 3, %120
  %122 = zext i1 %121 to i32
  %123 = and i32 %119, %122
  %124 = load i32, i32* %3, align 4
  %125 = srem i32 %124, 11
  %126 = icmp eq i32 0, %125
  %127 = zext i1 %126 to i32
  %128 = icmp eq i32 0, %127
  %129 = zext i1 %128 to i32
  %130 = and i32 %123, %129
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %132, label %133

; <label>:132:                                    ; preds = %1
  store i32 1, i32* %2, align 4
  br label %134

; <label>:133:                                    ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %134

; <label>:134:                                    ; preds = %133, %132
  %135 = load i32, i32* %2, align 4
  ret i32 %135
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
