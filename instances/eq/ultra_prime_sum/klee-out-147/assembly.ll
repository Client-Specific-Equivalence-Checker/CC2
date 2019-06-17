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
  %5 = icmp slt i32 7, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 6, %7
  %9 = zext i1 %8 to i32
  %10 = and i32 %6, %9
  %11 = load i32, i32* %3, align 4
  %12 = srem i32 %11, 4
  %13 = icmp eq i32 0, %12
  %14 = zext i1 %13 to i32
  %15 = and i32 %10, %14
  %16 = load i32, i32* %3, align 4
  %17 = icmp slt i32 2, %16
  %18 = zext i1 %17 to i32
  %19 = and i32 %15, %18
  %20 = load i32, i32* %3, align 4
  %21 = icmp slt i32 5, %20
  %22 = zext i1 %21 to i32
  %23 = and i32 %19, %22
  %24 = load i32, i32* %3, align 4
  %25 = icmp slt i32 8, %24
  %26 = zext i1 %25 to i32
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %23, %28
  %30 = load i32, i32* %3, align 4
  %31 = srem i32 %30, 6
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = and i32 %29, %35
  %37 = load i32, i32* %3, align 4
  %38 = icmp slt i32 3, %37
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
  %49 = srem i32 %48, 2
  %50 = icmp eq i32 0, %49
  %51 = zext i1 %50 to i32
  %52 = and i32 %47, %51
  %53 = and i32 %52, 1
  %54 = load i32, i32* %3, align 4
  %55 = srem i32 %54, 3
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
  %66 = srem i32 %65, 5
  %67 = icmp eq i32 0, %66
  %68 = zext i1 %67 to i32
  %69 = icmp eq i32 0, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %64, %70
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %74

; <label>:73:                                     ; preds = %1
  store i32 4, i32* %2, align 4
  br label %75

; <label>:74:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %75

; <label>:75:                                     ; preds = %74, %73
  %76 = load i32, i32* %2, align 4
  ret i32 %76
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_new(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp slt i32 7, %4
  %6 = zext i1 %5 to i32
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 6, %7
  %9 = zext i1 %8 to i32
  %10 = and i32 %6, %9
  %11 = load i32, i32* %3, align 4
  %12 = srem i32 %11, 4
  %13 = icmp eq i32 0, %12
  %14 = zext i1 %13 to i32
  %15 = and i32 %10, %14
  %16 = load i32, i32* %3, align 4
  %17 = icmp slt i32 2, %16
  %18 = zext i1 %17 to i32
  %19 = and i32 %15, %18
  %20 = load i32, i32* %3, align 4
  %21 = icmp slt i32 5, %20
  %22 = zext i1 %21 to i32
  %23 = and i32 %19, %22
  %24 = load i32, i32* %3, align 4
  %25 = icmp slt i32 8, %24
  %26 = zext i1 %25 to i32
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %23, %28
  %30 = load i32, i32* %3, align 4
  %31 = srem i32 %30, 6
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = and i32 %29, %35
  %37 = load i32, i32* %3, align 4
  %38 = icmp slt i32 3, %37
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
  %49 = srem i32 %48, 2
  %50 = icmp eq i32 0, %49
  %51 = zext i1 %50 to i32
  %52 = and i32 %47, %51
  %53 = and i32 %52, 1
  %54 = load i32, i32* %3, align 4
  %55 = srem i32 %54, 3
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
  %66 = srem i32 %65, 5
  %67 = icmp eq i32 0, %66
  %68 = zext i1 %67 to i32
  %69 = icmp eq i32 0, %68
  %70 = zext i1 %69 to i32
  %71 = and i32 %64, %70
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %74

; <label>:73:                                     ; preds = %1
  store i32 1, i32* %2, align 4
  br label %75

; <label>:74:                                     ; preds = %1
  store i32 99999, i32* %2, align 4
  br label %75

; <label>:75:                                     ; preds = %74, %73
  %76 = load i32, i32* %2, align 4
  ret i32 %76
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
