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
  %5 = icmp slt i32 2, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 5, %7
  %9 = zext i1 %8 to i32
  %10 = and i32 %6, %9
  %11 = and i32 %10, 1
  %12 = load i32, i32* %3, align 4
  %13 = srem i32 %12, 9
  %14 = icmp eq i32 0, %13
  %15 = zext i1 %14 to i32
  %16 = icmp eq i32 0, %15
  %17 = zext i1 %16 to i32
  %18 = and i32 %11, %17
  %19 = load i32, i32* %3, align 4
  %20 = srem i32 %19, 3
  %21 = icmp eq i32 0, %20
  %22 = zext i1 %21 to i32
  %23 = icmp eq i32 0, %22
  %24 = zext i1 %23 to i32
  %25 = and i32 %18, %24
  %26 = load i32, i32* %3, align 4
  %27 = icmp slt i32 4, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %25, %28
  %30 = load i32, i32* %3, align 4
  %31 = srem i32 %30, 8
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = and i32 %29, %35
  %37 = load i32, i32* %3, align 4
  %38 = icmp slt i32 6, %37
  %39 = zext i1 %38 to i32
  %40 = and i32 %36, %39
  %41 = load i32, i32* %3, align 4
  %42 = icmp slt i32 10, %41
  %43 = zext i1 %42 to i32
  %44 = and i32 %40, %43
  %45 = load i32, i32* %3, align 4
  %46 = icmp slt i32 14, %45
  %47 = zext i1 %46 to i32
  %48 = icmp eq i32 0, %47
  %49 = zext i1 %48 to i32
  %50 = and i32 %44, %49
  %51 = load i32, i32* %3, align 4
  %52 = srem i32 %51, 6
  %53 = icmp eq i32 0, %52
  %54 = zext i1 %53 to i32
  %55 = icmp eq i32 0, %54
  %56 = zext i1 %55 to i32
  %57 = and i32 %50, %56
  %58 = load i32, i32* %3, align 4
  %59 = srem i32 %58, 4
  %60 = icmp eq i32 0, %59
  %61 = zext i1 %60 to i32
  %62 = icmp eq i32 0, %61
  %63 = zext i1 %62 to i32
  %64 = and i32 %57, %63
  %65 = load i32, i32* %3, align 4
  %66 = srem i32 %65, 2
  %67 = icmp eq i32 0, %66
  %68 = zext i1 %67 to i32
  %69 = and i32 %64, %68
  %70 = load i32, i32* %3, align 4
  %71 = srem i32 %70, 11
  %72 = icmp eq i32 0, %71
  %73 = zext i1 %72 to i32
  %74 = icmp eq i32 0, %73
  %75 = zext i1 %74 to i32
  %76 = and i32 %69, %75
  %77 = load i32, i32* %3, align 4
  %78 = icmp slt i32 11, %77
  %79 = zext i1 %78 to i32
  %80 = and i32 %76, %79
  %81 = load i32, i32* %3, align 4
  %82 = icmp slt i32 9, %81
  %83 = zext i1 %82 to i32
  %84 = and i32 %80, %83
  %85 = load i32, i32* %3, align 4
  %86 = srem i32 %85, 5
  %87 = icmp eq i32 0, %86
  %88 = zext i1 %87 to i32
  %89 = icmp eq i32 0, %88
  %90 = zext i1 %89 to i32
  %91 = and i32 %84, %90
  %92 = load i32, i32* %3, align 4
  %93 = srem i32 %92, 13
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = icmp eq i32 0, %95
  %97 = zext i1 %96 to i32
  %98 = and i32 %91, %97
  %99 = load i32, i32* %3, align 4
  %100 = icmp slt i32 8, %99
  %101 = zext i1 %100 to i32
  %102 = and i32 %98, %101
  %103 = load i32, i32* %3, align 4
  %104 = srem i32 %103, 7
  %105 = icmp eq i32 0, %104
  %106 = zext i1 %105 to i32
  %107 = and i32 %102, %106
  %108 = load i32, i32* %3, align 4
  %109 = srem i32 %108, 12
  %110 = icmp eq i32 0, %109
  %111 = zext i1 %110 to i32
  %112 = icmp eq i32 0, %111
  %113 = zext i1 %112 to i32
  %114 = and i32 %107, %113
  %115 = load i32, i32* %3, align 4
  %116 = icmp slt i32 3, %115
  %117 = zext i1 %116 to i32
  %118 = and i32 %114, %117
  %119 = load i32, i32* %3, align 4
  %120 = icmp slt i32 12, %119
  %121 = zext i1 %120 to i32
  %122 = and i32 %118, %121
  %123 = load i32, i32* %3, align 4
  %124 = srem i32 %123, 10
  %125 = icmp eq i32 0, %124
  %126 = zext i1 %125 to i32
  %127 = icmp eq i32 0, %126
  %128 = zext i1 %127 to i32
  %129 = and i32 %122, %128
  %130 = load i32, i32* %3, align 4
  %131 = icmp slt i32 13, %130
  %132 = zext i1 %131 to i32
  %133 = and i32 %129, %132
  %134 = load i32, i32* %3, align 4
  %135 = icmp slt i32 7, %134
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
  %5 = icmp slt i32 2, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 5, %7
  %9 = zext i1 %8 to i32
  %10 = and i32 %6, %9
  %11 = and i32 %10, 1
  %12 = load i32, i32* %3, align 4
  %13 = srem i32 %12, 9
  %14 = icmp eq i32 0, %13
  %15 = zext i1 %14 to i32
  %16 = icmp eq i32 0, %15
  %17 = zext i1 %16 to i32
  %18 = and i32 %11, %17
  %19 = load i32, i32* %3, align 4
  %20 = srem i32 %19, 3
  %21 = icmp eq i32 0, %20
  %22 = zext i1 %21 to i32
  %23 = icmp eq i32 0, %22
  %24 = zext i1 %23 to i32
  %25 = and i32 %18, %24
  %26 = load i32, i32* %3, align 4
  %27 = icmp slt i32 4, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %25, %28
  %30 = load i32, i32* %3, align 4
  %31 = srem i32 %30, 8
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = and i32 %29, %35
  %37 = load i32, i32* %3, align 4
  %38 = icmp slt i32 6, %37
  %39 = zext i1 %38 to i32
  %40 = and i32 %36, %39
  %41 = load i32, i32* %3, align 4
  %42 = icmp slt i32 10, %41
  %43 = zext i1 %42 to i32
  %44 = and i32 %40, %43
  %45 = load i32, i32* %3, align 4
  %46 = icmp slt i32 14, %45
  %47 = zext i1 %46 to i32
  %48 = icmp eq i32 0, %47
  %49 = zext i1 %48 to i32
  %50 = and i32 %44, %49
  %51 = load i32, i32* %3, align 4
  %52 = srem i32 %51, 6
  %53 = icmp eq i32 0, %52
  %54 = zext i1 %53 to i32
  %55 = icmp eq i32 0, %54
  %56 = zext i1 %55 to i32
  %57 = and i32 %50, %56
  %58 = load i32, i32* %3, align 4
  %59 = srem i32 %58, 4
  %60 = icmp eq i32 0, %59
  %61 = zext i1 %60 to i32
  %62 = icmp eq i32 0, %61
  %63 = zext i1 %62 to i32
  %64 = and i32 %57, %63
  %65 = load i32, i32* %3, align 4
  %66 = srem i32 %65, 2
  %67 = icmp eq i32 0, %66
  %68 = zext i1 %67 to i32
  %69 = and i32 %64, %68
  %70 = load i32, i32* %3, align 4
  %71 = srem i32 %70, 11
  %72 = icmp eq i32 0, %71
  %73 = zext i1 %72 to i32
  %74 = icmp eq i32 0, %73
  %75 = zext i1 %74 to i32
  %76 = and i32 %69, %75
  %77 = load i32, i32* %3, align 4
  %78 = icmp slt i32 11, %77
  %79 = zext i1 %78 to i32
  %80 = and i32 %76, %79
  %81 = load i32, i32* %3, align 4
  %82 = icmp slt i32 9, %81
  %83 = zext i1 %82 to i32
  %84 = and i32 %80, %83
  %85 = load i32, i32* %3, align 4
  %86 = srem i32 %85, 5
  %87 = icmp eq i32 0, %86
  %88 = zext i1 %87 to i32
  %89 = icmp eq i32 0, %88
  %90 = zext i1 %89 to i32
  %91 = and i32 %84, %90
  %92 = load i32, i32* %3, align 4
  %93 = srem i32 %92, 13
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = icmp eq i32 0, %95
  %97 = zext i1 %96 to i32
  %98 = and i32 %91, %97
  %99 = load i32, i32* %3, align 4
  %100 = icmp slt i32 8, %99
  %101 = zext i1 %100 to i32
  %102 = and i32 %98, %101
  %103 = load i32, i32* %3, align 4
  %104 = srem i32 %103, 7
  %105 = icmp eq i32 0, %104
  %106 = zext i1 %105 to i32
  %107 = and i32 %102, %106
  %108 = load i32, i32* %3, align 4
  %109 = srem i32 %108, 12
  %110 = icmp eq i32 0, %109
  %111 = zext i1 %110 to i32
  %112 = icmp eq i32 0, %111
  %113 = zext i1 %112 to i32
  %114 = and i32 %107, %113
  %115 = load i32, i32* %3, align 4
  %116 = icmp slt i32 3, %115
  %117 = zext i1 %116 to i32
  %118 = and i32 %114, %117
  %119 = load i32, i32* %3, align 4
  %120 = icmp slt i32 12, %119
  %121 = zext i1 %120 to i32
  %122 = and i32 %118, %121
  %123 = load i32, i32* %3, align 4
  %124 = srem i32 %123, 10
  %125 = icmp eq i32 0, %124
  %126 = zext i1 %125 to i32
  %127 = icmp eq i32 0, %126
  %128 = zext i1 %127 to i32
  %129 = and i32 %122, %128
  %130 = load i32, i32* %3, align 4
  %131 = icmp slt i32 13, %130
  %132 = zext i1 %131 to i32
  %133 = and i32 %129, %132
  %134 = load i32, i32* %3, align 4
  %135 = icmp slt i32 7, %134
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
