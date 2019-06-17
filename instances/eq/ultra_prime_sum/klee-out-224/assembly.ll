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
  %5 = srem i32 %4, 7
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = load i32, i32* %3, align 4
  %9 = icmp slt i32 9, %8
  %10 = zext i1 %9 to i32
  %11 = and i32 %7, %10
  %12 = load i32, i32* %3, align 4
  %13 = srem i32 %12, 12
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
  %27 = icmp slt i32 6, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %25, %28
  %30 = load i32, i32* %3, align 4
  %31 = icmp slt i32 2, %30
  %32 = zext i1 %31 to i32
  %33 = and i32 %29, %32
  %34 = load i32, i32* %3, align 4
  %35 = icmp slt i32 10, %34
  %36 = zext i1 %35 to i32
  %37 = and i32 %33, %36
  %38 = load i32, i32* %3, align 4
  %39 = icmp slt i32 14, %38
  %40 = zext i1 %39 to i32
  %41 = icmp eq i32 0, %40
  %42 = zext i1 %41 to i32
  %43 = and i32 %37, %42
  %44 = and i32 %43, 1
  %45 = load i32, i32* %3, align 4
  %46 = icmp slt i32 5, %45
  %47 = zext i1 %46 to i32
  %48 = and i32 %44, %47
  %49 = load i32, i32* %3, align 4
  %50 = srem i32 %49, 11
  %51 = icmp eq i32 0, %50
  %52 = zext i1 %51 to i32
  %53 = icmp eq i32 0, %52
  %54 = zext i1 %53 to i32
  %55 = and i32 %48, %54
  %56 = load i32, i32* %3, align 4
  %57 = srem i32 %56, 13
  %58 = icmp eq i32 0, %57
  %59 = zext i1 %58 to i32
  %60 = icmp eq i32 0, %59
  %61 = zext i1 %60 to i32
  %62 = and i32 %55, %61
  %63 = load i32, i32* %3, align 4
  %64 = srem i32 %63, 9
  %65 = icmp eq i32 0, %64
  %66 = zext i1 %65 to i32
  %67 = icmp eq i32 0, %66
  %68 = zext i1 %67 to i32
  %69 = and i32 %62, %68
  %70 = load i32, i32* %3, align 4
  %71 = icmp slt i32 8, %70
  %72 = zext i1 %71 to i32
  %73 = and i32 %69, %72
  %74 = load i32, i32* %3, align 4
  %75 = srem i32 %74, 8
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = icmp eq i32 0, %77
  %79 = zext i1 %78 to i32
  %80 = and i32 %73, %79
  %81 = load i32, i32* %3, align 4
  %82 = srem i32 %81, 10
  %83 = icmp eq i32 0, %82
  %84 = zext i1 %83 to i32
  %85 = icmp eq i32 0, %84
  %86 = zext i1 %85 to i32
  %87 = and i32 %80, %86
  %88 = load i32, i32* %3, align 4
  %89 = icmp slt i32 13, %88
  %90 = zext i1 %89 to i32
  %91 = and i32 %87, %90
  %92 = load i32, i32* %3, align 4
  %93 = srem i32 %92, 5
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = icmp eq i32 0, %95
  %97 = zext i1 %96 to i32
  %98 = and i32 %91, %97
  %99 = load i32, i32* %3, align 4
  %100 = srem i32 %99, 2
  %101 = icmp eq i32 0, %100
  %102 = zext i1 %101 to i32
  %103 = and i32 %98, %102
  %104 = load i32, i32* %3, align 4
  %105 = srem i32 %104, 6
  %106 = icmp eq i32 0, %105
  %107 = zext i1 %106 to i32
  %108 = icmp eq i32 0, %107
  %109 = zext i1 %108 to i32
  %110 = and i32 %103, %109
  %111 = load i32, i32* %3, align 4
  %112 = icmp slt i32 3, %111
  %113 = zext i1 %112 to i32
  %114 = and i32 %110, %113
  %115 = load i32, i32* %3, align 4
  %116 = icmp slt i32 11, %115
  %117 = zext i1 %116 to i32
  %118 = and i32 %114, %117
  %119 = load i32, i32* %3, align 4
  %120 = icmp slt i32 4, %119
  %121 = zext i1 %120 to i32
  %122 = and i32 %118, %121
  %123 = load i32, i32* %3, align 4
  %124 = srem i32 %123, 4
  %125 = icmp eq i32 0, %124
  %126 = zext i1 %125 to i32
  %127 = icmp eq i32 0, %126
  %128 = zext i1 %127 to i32
  %129 = and i32 %122, %128
  %130 = load i32, i32* %3, align 4
  %131 = icmp slt i32 12, %130
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
  %5 = srem i32 %4, 7
  %6 = icmp eq i32 0, %5
  %7 = zext i1 %6 to i32
  %8 = load i32, i32* %3, align 4
  %9 = icmp slt i32 9, %8
  %10 = zext i1 %9 to i32
  %11 = and i32 %7, %10
  %12 = load i32, i32* %3, align 4
  %13 = srem i32 %12, 12
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
  %27 = icmp slt i32 6, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %25, %28
  %30 = load i32, i32* %3, align 4
  %31 = icmp slt i32 2, %30
  %32 = zext i1 %31 to i32
  %33 = and i32 %29, %32
  %34 = load i32, i32* %3, align 4
  %35 = icmp slt i32 10, %34
  %36 = zext i1 %35 to i32
  %37 = and i32 %33, %36
  %38 = load i32, i32* %3, align 4
  %39 = icmp slt i32 14, %38
  %40 = zext i1 %39 to i32
  %41 = icmp eq i32 0, %40
  %42 = zext i1 %41 to i32
  %43 = and i32 %37, %42
  %44 = and i32 %43, 1
  %45 = load i32, i32* %3, align 4
  %46 = icmp slt i32 5, %45
  %47 = zext i1 %46 to i32
  %48 = and i32 %44, %47
  %49 = load i32, i32* %3, align 4
  %50 = srem i32 %49, 11
  %51 = icmp eq i32 0, %50
  %52 = zext i1 %51 to i32
  %53 = icmp eq i32 0, %52
  %54 = zext i1 %53 to i32
  %55 = and i32 %48, %54
  %56 = load i32, i32* %3, align 4
  %57 = srem i32 %56, 13
  %58 = icmp eq i32 0, %57
  %59 = zext i1 %58 to i32
  %60 = icmp eq i32 0, %59
  %61 = zext i1 %60 to i32
  %62 = and i32 %55, %61
  %63 = load i32, i32* %3, align 4
  %64 = srem i32 %63, 9
  %65 = icmp eq i32 0, %64
  %66 = zext i1 %65 to i32
  %67 = icmp eq i32 0, %66
  %68 = zext i1 %67 to i32
  %69 = and i32 %62, %68
  %70 = load i32, i32* %3, align 4
  %71 = icmp slt i32 8, %70
  %72 = zext i1 %71 to i32
  %73 = and i32 %69, %72
  %74 = load i32, i32* %3, align 4
  %75 = srem i32 %74, 8
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = icmp eq i32 0, %77
  %79 = zext i1 %78 to i32
  %80 = and i32 %73, %79
  %81 = load i32, i32* %3, align 4
  %82 = srem i32 %81, 10
  %83 = icmp eq i32 0, %82
  %84 = zext i1 %83 to i32
  %85 = icmp eq i32 0, %84
  %86 = zext i1 %85 to i32
  %87 = and i32 %80, %86
  %88 = load i32, i32* %3, align 4
  %89 = icmp slt i32 13, %88
  %90 = zext i1 %89 to i32
  %91 = and i32 %87, %90
  %92 = load i32, i32* %3, align 4
  %93 = srem i32 %92, 5
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = icmp eq i32 0, %95
  %97 = zext i1 %96 to i32
  %98 = and i32 %91, %97
  %99 = load i32, i32* %3, align 4
  %100 = srem i32 %99, 2
  %101 = icmp eq i32 0, %100
  %102 = zext i1 %101 to i32
  %103 = and i32 %98, %102
  %104 = load i32, i32* %3, align 4
  %105 = srem i32 %104, 6
  %106 = icmp eq i32 0, %105
  %107 = zext i1 %106 to i32
  %108 = icmp eq i32 0, %107
  %109 = zext i1 %108 to i32
  %110 = and i32 %103, %109
  %111 = load i32, i32* %3, align 4
  %112 = icmp slt i32 3, %111
  %113 = zext i1 %112 to i32
  %114 = and i32 %110, %113
  %115 = load i32, i32* %3, align 4
  %116 = icmp slt i32 11, %115
  %117 = zext i1 %116 to i32
  %118 = and i32 %114, %117
  %119 = load i32, i32* %3, align 4
  %120 = icmp slt i32 4, %119
  %121 = zext i1 %120 to i32
  %122 = and i32 %118, %121
  %123 = load i32, i32* %3, align 4
  %124 = srem i32 %123, 4
  %125 = icmp eq i32 0, %124
  %126 = zext i1 %125 to i32
  %127 = icmp eq i32 0, %126
  %128 = zext i1 %127 to i32
  %129 = and i32 %122, %128
  %130 = load i32, i32* %3, align 4
  %131 = icmp slt i32 12, %130
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
