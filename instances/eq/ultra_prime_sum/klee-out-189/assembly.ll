; ModuleID = 'merged_g_1.cil.bc'
source_filename = "merged_g_1.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_new\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_new\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_2_new\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_old\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_1_old\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_2_old\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"i\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"sum\00", align 1
@.str.9 = private unnamed_addr constant [68 x i8] c"/home/fengnick/CLEVER+/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.10 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.11 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib() #0 {
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
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = bitcast i32* %15 to i8*
  call void @klee_make_symbolic(i8* %16, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0))
  %17 = bitcast i32* %14 to i8*
  call void @klee_make_symbolic(i8* %17, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0))
  %18 = bitcast i32* %13 to i8*
  call void @klee_make_symbolic(i8* %18, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0))
  %19 = bitcast i32* %12 to i8*
  call void @klee_make_symbolic(i8* %19, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i32 0, i32 0))
  %20 = bitcast i32* %11 to i8*
  call void @klee_make_symbolic(i8* %20, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i32 0, i32 0))
  %21 = bitcast i32* %10 to i8*
  call void @klee_make_symbolic(i8* %21, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i32 0, i32 0))
  %22 = bitcast i32* %9 to i8*
  call void @klee_make_symbolic(i8* %22, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  %23 = bitcast i32* %8 to i8*
  call void @klee_make_symbolic(i8* %23, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %24 = bitcast i32* %7 to i8*
  call void @klee_make_symbolic(i8* %24, i32 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0))
  %25 = load i32, i32* %7, align 4
  %26 = icmp eq i32 %25, 0
  %27 = zext i1 %26 to i32
  %28 = load i32, i32* %8, align 4
  %29 = icmp eq i32 %28, 2
  %30 = zext i1 %29 to i32
  %31 = and i32 %27, %30
  %32 = load i32, i32* %9, align 4
  %33 = icmp eq i32 %32, 0
  %34 = zext i1 %33 to i32
  %35 = and i32 %31, %34
  call void @klee_assume(i32 %35)
  store i32 0, i32* %15, align 4
  store i32 0, i32* %14, align 4
  store i32 0, i32* %13, align 4
  store i32 0, i32* %12, align 4
  store i32 0, i32* %11, align 4
  store i32 0, i32* %10, align 4
  %36 = load i32, i32* %7, align 4
  store i32 %36, i32* %1, align 4
  %37 = load i32, i32* %7, align 4
  store i32 %37, i32* %2, align 4
  br label %38

; <label>:38:                                     ; preds = %0, %73
  %39 = load i32, i32* %9, align 4
  %40 = load i32, i32* %8, align 4
  %41 = icmp sle i32 %39, %40
  br i1 %41, label %48, label %42

; <label>:42:                                     ; preds = %38
  %43 = load i32, i32* %9, align 4
  %44 = load i32, i32* %8, align 4
  %45 = icmp sle i32 %43, %44
  br i1 %45, label %47, label %46

; <label>:46:                                     ; preds = %42
  br label %74

; <label>:47:                                     ; preds = %42
  br label %48

; <label>:48:                                     ; preds = %47, %38
  %49 = load i32, i32* %9, align 4
  %50 = load i32, i32* %8, align 4
  %51 = icmp sle i32 %49, %50
  br i1 %51, label %52, label %73

; <label>:52:                                     ; preds = %48
  %53 = load i32, i32* %9, align 4
  %54 = call i32 @lib_old(i32 %53)
  store i32 %54, i32* %3, align 4
  %55 = load i32, i32* %3, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %61

; <label>:57:                                     ; preds = %52
  %58 = load i32, i32* %9, align 4
  %59 = load i32, i32* %2, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, i32* %2, align 4
  br label %61

; <label>:61:                                     ; preds = %57, %52
  %62 = load i32, i32* %9, align 4
  %63 = call i32 @lib_new(i32 %62)
  store i32 %63, i32* %4, align 4
  %64 = load i32, i32* %4, align 4
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %70

; <label>:66:                                     ; preds = %61
  %67 = load i32, i32* %9, align 4
  %68 = load i32, i32* %1, align 4
  %69 = add nsw i32 %68, %67
  store i32 %69, i32* %1, align 4
  br label %70

; <label>:70:                                     ; preds = %66, %61
  %71 = load i32, i32* %9, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %9, align 4
  br label %73

; <label>:73:                                     ; preds = %70, %48
  br label %38

; <label>:74:                                     ; preds = %46
  %75 = load i32, i32* %2, align 4
  %76 = call i32 @lib_old(i32 %75)
  store i32 %76, i32* %5, align 4
  %77 = load i32, i32* %5, align 4
  %78 = icmp eq i32 %77, 0
  %79 = zext i1 %78 to i32
  store i32 %79, i32* %12, align 4
  %80 = load i32, i32* %1, align 4
  %81 = call i32 @lib_new(i32 %80)
  store i32 %81, i32* %6, align 4
  %82 = load i32, i32* %6, align 4
  %83 = icmp eq i32 %82, 0
  %84 = zext i1 %83 to i32
  store i32 %84, i32* %15, align 4
  %85 = load i32, i32* %2, align 4
  store i32 %85, i32* %11, align 4
  %86 = load i32, i32* %1, align 4
  store i32 %86, i32* %14, align 4
  %87 = load i32, i32* %9, align 4
  store i32 %87, i32* %10, align 4
  %88 = load i32, i32* %9, align 4
  store i32 %88, i32* %13, align 4
  %89 = load i32, i32* %12, align 4
  %90 = load i32, i32* %15, align 4
  %91 = icmp eq i32 %89, %90
  %92 = zext i1 %91 to i32
  %93 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %92)
  %94 = load i32, i32* %11, align 4
  %95 = load i32, i32* %14, align 4
  %96 = icmp eq i32 %94, %95
  %97 = zext i1 %96 to i32
  %98 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %97)
  %99 = load i32, i32* %10, align 4
  %100 = load i32, i32* %13, align 4
  %101 = icmp eq i32 %99, %100
  %102 = zext i1 %101 to i32
  %103 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %102)
  ret i32 0
}

declare void @klee_make_symbolic(i8*, i32, i8*) #1

declare void @klee_assume(i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_old(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  store i32 2, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %17, %1
  %6 = load i32, i32* %3, align 4
  %7 = load i32, i32* %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %20

; <label>:9:                                      ; preds = %5
  %10 = load i32, i32* %2, align 4
  %11 = load i32, i32* %3, align 4
  %int_cast_to_i64 = zext i32 %11 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %12 = srem i32 %10, %11, !klee.check.div !7
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %17

; <label>:14:                                     ; preds = %9
  %15 = load i32, i32* %4, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %4, align 4
  br label %17

; <label>:17:                                     ; preds = %14, %9
  %18 = load i32, i32* %3, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %3, align 4
  br label %5

; <label>:20:                                     ; preds = %5
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib_new(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  store i32 2, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %15, %1
  %6 = load i32, i32* %3, align 4
  %7 = load i32, i32* %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %18

; <label>:9:                                      ; preds = %5
  %10 = load i32, i32* %2, align 4
  %11 = load i32, i32* %3, align 4
  %int_cast_to_i64 = zext i32 %11 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %12 = srem i32 %10, %11, !klee.check.div !7
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %9
  store i32 1, i32* %4, align 4
  br label %15

; <label>:15:                                     ; preds = %14, %9
  %16 = load i32, i32* %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %3, align 4
  br label %5

; <label>:18:                                     ; preds = %5
  %19 = load i32, i32* %4, align 4
  ret i32 %19
}

declare i32 @assert(...) #1

; Function Attrs: noinline nounwind uwtable
define void @klee_div_zero_check(i64) #2 !dbg !8 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  call void @llvm.dbg.declare(metadata i64* %2, metadata !12, metadata !DIExpression()), !dbg !13
  %3 = load i64, i64* %2, align 8, !dbg !14
  %4 = icmp eq i64 %3, 0, !dbg !16
  br i1 %4, label %5, label %6, !dbg !17

; <label>:5:                                      ; preds = %1
  call void @klee_report_error(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.9, i32 0, i32 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.10, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.11, i32 0, i32 0)) #5, !dbg !18
  unreachable, !dbg !18

; <label>:6:                                      ; preds = %1
  ret void, !dbg !19
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #4

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3, !3}
!llvm.dbg.cu = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{!"clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)"}
!4 = distinct !DICompileUnit(language: DW_LANG_C89, file: !5, producer: "clang version 6.0.0-1ubuntu2~16.04.1 (tags/RELEASE_600/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !6)
!5 = !DIFile(filename: "/home/fengnick/CLEVER+/klee/runtime/Intrinsic/klee_div_zero_check.c", directory: "/home/fengnick/CLEVER+/klee/build/runtime/Intrinsic")
!6 = !{}
!7 = !{!"True"}
!8 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !5, file: !5, line: 12, type: !9, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, unit: !4, variables: !6)
!9 = !DISubroutineType(types: !10)
!10 = !{null, !11}
!11 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "z", arg: 1, scope: !8, file: !5, line: 12, type: !11)
!13 = !DILocation(line: 12, column: 36, scope: !8)
!14 = !DILocation(line: 13, column: 7, scope: !15)
!15 = distinct !DILexicalBlock(scope: !8, file: !5, line: 13, column: 7)
!16 = !DILocation(line: 13, column: 9, scope: !15)
!17 = !DILocation(line: 13, column: 7, scope: !8)
!18 = !DILocation(line: 14, column: 5, scope: !15)
!19 = !DILocation(line: 15, column: 1, scope: !8)
