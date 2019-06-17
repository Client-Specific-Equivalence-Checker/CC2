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
  %5 = srem i32 %4, 8
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = icmp eq i32 0, %7
  %9 = zext i1 %8 to i32
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 14, %10
  %12 = zext i1 %11 to i32
  %13 = icmp eq i32 0, %12
  %14 = zext i1 %13 to i32
  %15 = and i32 %9, %14
  %16 = load i32, i32* %3, align 4
  %17 = icmp slt i32 9, %16
  %18 = zext i1 %17 to i32
  %19 = and i32 %15, %18
  %20 = load i32, i32* %3, align 4
  %21 = srem i32 %20, 6
  %22 = icmp eq i32 0, %21
  %23 = zext i1 %22 to i32
  %24 = icmp eq i32 0, %23
  %25 = zext i1 %24 to i32
  %26 = and i32 %19, %25
  %27 = load i32, i32* %3, align 4
  %28 = icmp slt i32 4, %27
  %29 = zext i1 %28 to i32
  %30 = and i32 %26, %29
  %31 = load i32, i32* %3, align 4
  %32 = icmp slt i32 10, %31
  %33 = zext i1 %32 to i32
  %34 = and i32 %30, %33
  %35 = load i32, i32* %3, align 4
  %36 = icmp slt i32 13, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %34, %37
  %39 = load i32, i32* %3, align 4
  %40 = srem i32 %39, 9
  %41 = icmp eq i32 0, %40
  %42 = zext i1 %41 to i32
  %43 = icmp eq i32 0, %42
  %44 = zext i1 %43 to i32
  %45 = and i32 %38, %44
  %46 = load i32, i32* %3, align 4
  %47 = srem i32 %46, 12
  %48 = icmp eq i32 0, %47
  %49 = zext i1 %48 to i32
  %50 = icmp eq i32 0, %49
  %51 = zext i1 %50 to i32
  %52 = and i32 %45, %51
  %53 = load i32, i32* %3, align 4
  %54 = icmp slt i32 2, %53
  %55 = zext i1 %54 to i32
  %56 = and i32 %52, %55
  %57 = load i32, i32* %3, align 4
  %58 = icmp slt i32 3, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %56, %59
  %61 = load i32, i32* %3, align 4
  %62 = srem i32 %61, 7
  %63 = icmp eq i32 0, %62
  %64 = zext i1 %63 to i32
  %65 = and i32 %60, %64
  %66 = load i32, i32* %3, align 4
  %67 = srem i32 %66, 13
  %68 = icmp eq i32 0, %67
  %69 = zext i1 %68 to i32
  %70 = icmp eq i32 0, %69
  %71 = zext i1 %70 to i32
  %72 = and i32 %65, %71
  %73 = and i32 %72, 1
  %74 = load i32, i32* %3, align 4
  %75 = icmp slt i32 7, %74
  %76 = zext i1 %75 to i32
  %77 = and i32 %73, %76
  %78 = load i32, i32* %3, align 4
  %79 = srem i32 %78, 3
  %80 = icmp eq i32 0, %79
  %81 = zext i1 %80 to i32
  %82 = icmp eq i32 0, %81
  %83 = zext i1 %82 to i32
  %84 = and i32 %77, %83
  %85 = load i32, i32* %3, align 4
  %86 = icmp slt i32 6, %85
  %87 = zext i1 %86 to i32
  %88 = and i32 %84, %87
  %89 = load i32, i32* %3, align 4
  %90 = srem i32 %89, 5
  %91 = icmp eq i32 0, %90
  %92 = zext i1 %91 to i32
  %93 = icmp eq i32 0, %92
  %94 = zext i1 %93 to i32
  %95 = and i32 %88, %94
  %96 = load i32, i32* %3, align 4
  %97 = srem i32 %96, 4
  %98 = icmp eq i32 0, %97
  %99 = zext i1 %98 to i32
  %100 = icmp eq i32 0, %99
  %101 = zext i1 %100 to i32
  %102 = and i32 %95, %101
  %103 = load i32, i32* %3, align 4
  %104 = srem i32 %103, 10
  %105 = icmp eq i32 0, %104
  %106 = zext i1 %105 to i32
  %107 = icmp eq i32 0, %106
  %108 = zext i1 %107 to i32
  %109 = and i32 %102, %108
  %110 = load i32, i32* %3, align 4
  %111 = icmp slt i32 5, %110
  %112 = zext i1 %111 to i32
  %113 = and i32 %109, %112
  %114 = load i32, i32* %3, align 4
  %115 = srem i32 %114, 11
  %116 = icmp eq i32 0, %115
  %117 = zext i1 %116 to i32
  %118 = icmp eq i32 0, %117
  %119 = zext i1 %118 to i32
  %120 = and i32 %113, %119
  %121 = load i32, i32* %3, align 4
  %122 = icmp slt i32 11, %121
  %123 = zext i1 %122 to i32
  %124 = and i32 %120, %123
  %125 = load i32, i32* %3, align 4
  %126 = icmp slt i32 8, %125
  %127 = zext i1 %126 to i32
  %128 = and i32 %124, %127
  %129 = load i32, i32* %3, align 4
  %130 = srem i32 %129, 2
  %131 = icmp eq i32 0, %130
  %132 = zext i1 %131 to i32
  %133 = and i32 %128, %132
  %134 = load i32, i32* %3, align 4
  %135 = icmp slt i32 12, %134
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
  %5 = srem i32 %4, 8
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = icmp eq i32 0, %7
  %9 = zext i1 %8 to i32
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 14, %10
  %12 = zext i1 %11 to i32
  %13 = icmp eq i32 0, %12
  %14 = zext i1 %13 to i32
  %15 = and i32 %9, %14
  %16 = load i32, i32* %3, align 4
  %17 = icmp slt i32 9, %16
  %18 = zext i1 %17 to i32
  %19 = and i32 %15, %18
  %20 = load i32, i32* %3, align 4
  %21 = srem i32 %20, 6
  %22 = icmp eq i32 0, %21
  %23 = zext i1 %22 to i32
  %24 = icmp eq i32 0, %23
  %25 = zext i1 %24 to i32
  %26 = and i32 %19, %25
  %27 = load i32, i32* %3, align 4
  %28 = icmp slt i32 4, %27
  %29 = zext i1 %28 to i32
  %30 = and i32 %26, %29
  %31 = load i32, i32* %3, align 4
  %32 = icmp slt i32 10, %31
  %33 = zext i1 %32 to i32
  %34 = and i32 %30, %33
  %35 = load i32, i32* %3, align 4
  %36 = icmp slt i32 13, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %34, %37
  %39 = load i32, i32* %3, align 4
  %40 = srem i32 %39, 9
  %41 = icmp eq i32 0, %40
  %42 = zext i1 %41 to i32
  %43 = icmp eq i32 0, %42
  %44 = zext i1 %43 to i32
  %45 = and i32 %38, %44
  %46 = load i32, i32* %3, align 4
  %47 = srem i32 %46, 12
  %48 = icmp eq i32 0, %47
  %49 = zext i1 %48 to i32
  %50 = icmp eq i32 0, %49
  %51 = zext i1 %50 to i32
  %52 = and i32 %45, %51
  %53 = load i32, i32* %3, align 4
  %54 = icmp slt i32 2, %53
  %55 = zext i1 %54 to i32
  %56 = and i32 %52, %55
  %57 = load i32, i32* %3, align 4
  %58 = icmp slt i32 3, %57
  %59 = zext i1 %58 to i32
  %60 = and i32 %56, %59
  %61 = load i32, i32* %3, align 4
  %62 = srem i32 %61, 7
  %63 = icmp eq i32 0, %62
  %64 = zext i1 %63 to i32
  %65 = and i32 %60, %64
  %66 = load i32, i32* %3, align 4
  %67 = srem i32 %66, 13
  %68 = icmp eq i32 0, %67
  %69 = zext i1 %68 to i32
  %70 = icmp eq i32 0, %69
  %71 = zext i1 %70 to i32
  %72 = and i32 %65, %71
  %73 = and i32 %72, 1
  %74 = load i32, i32* %3, align 4
  %75 = icmp slt i32 7, %74
  %76 = zext i1 %75 to i32
  %77 = and i32 %73, %76
  %78 = load i32, i32* %3, align 4
  %79 = srem i32 %78, 3
  %80 = icmp eq i32 0, %79
  %81 = zext i1 %80 to i32
  %82 = icmp eq i32 0, %81
  %83 = zext i1 %82 to i32
  %84 = and i32 %77, %83
  %85 = load i32, i32* %3, align 4
  %86 = icmp slt i32 6, %85
  %87 = zext i1 %86 to i32
  %88 = and i32 %84, %87
  %89 = load i32, i32* %3, align 4
  %90 = srem i32 %89, 5
  %91 = icmp eq i32 0, %90
  %92 = zext i1 %91 to i32
  %93 = icmp eq i32 0, %92
  %94 = zext i1 %93 to i32
  %95 = and i32 %88, %94
  %96 = load i32, i32* %3, align 4
  %97 = srem i32 %96, 4
  %98 = icmp eq i32 0, %97
  %99 = zext i1 %98 to i32
  %100 = icmp eq i32 0, %99
  %101 = zext i1 %100 to i32
  %102 = and i32 %95, %101
  %103 = load i32, i32* %3, align 4
  %104 = srem i32 %103, 10
  %105 = icmp eq i32 0, %104
  %106 = zext i1 %105 to i32
  %107 = icmp eq i32 0, %106
  %108 = zext i1 %107 to i32
  %109 = and i32 %102, %108
  %110 = load i32, i32* %3, align 4
  %111 = icmp slt i32 5, %110
  %112 = zext i1 %111 to i32
  %113 = and i32 %109, %112
  %114 = load i32, i32* %3, align 4
  %115 = srem i32 %114, 11
  %116 = icmp eq i32 0, %115
  %117 = zext i1 %116 to i32
  %118 = icmp eq i32 0, %117
  %119 = zext i1 %118 to i32
  %120 = and i32 %113, %119
  %121 = load i32, i32* %3, align 4
  %122 = icmp slt i32 11, %121
  %123 = zext i1 %122 to i32
  %124 = and i32 %120, %123
  %125 = load i32, i32* %3, align 4
  %126 = icmp slt i32 8, %125
  %127 = zext i1 %126 to i32
  %128 = and i32 %124, %127
  %129 = load i32, i32* %3, align 4
  %130 = srem i32 %129, 2
  %131 = icmp eq i32 0, %130
  %132 = zext i1 %131 to i32
  %133 = and i32 %128, %132
  %134 = load i32, i32* %3, align 4
  %135 = icmp slt i32 12, %134
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
