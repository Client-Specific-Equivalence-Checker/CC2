; ModuleID = 'merged_g_0.cil.bc'
source_filename = "merged_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_new\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"count_new\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"count_old\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_old\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.5 = private unnamed_addr constant [68 x i8] c"/home/fengnick/CLEVER+/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.6 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.7 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @lib() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = bitcast i32* %7 to i8*
  call void @klee_make_symbolic(i8* %8, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0))
  %9 = bitcast i32* %6 to i8*
  call void @klee_make_symbolic(i8* %9, i32 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0))
  %10 = bitcast i32* %5 to i8*
  call void @klee_make_symbolic(i8* %10, i32 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0))
  %11 = bitcast i32* %4 to i8*
  call void @klee_make_symbolic(i8* %11, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i32 0, i32 0))
  %12 = bitcast i32* %3 to i8*
  call void @klee_make_symbolic(i8* %12, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  %13 = load i32, i32* %3, align 4
  %14 = icmp eq i32 %13, 4
  %15 = zext i1 %14 to i32
  call void @klee_assume(i32 %15)
  store i32 0, i32* %7, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %4, align 4
  store i32 2, i32* %1, align 4
  store i32 0, i32* %6, align 4
  %16 = load i32, i32* %6, align 4
  store i32 %16, i32* %5, align 4
  %17 = load i32, i32* %5, align 4
  store i32 %17, i32* %2, align 4
  br label %18

; <label>:18:                                     ; preds = %0, %43
  %19 = load i32, i32* %1, align 4
  %20 = load i32, i32* %3, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %28, label %22

; <label>:22:                                     ; preds = %18
  %23 = load i32, i32* %1, align 4
  %24 = load i32, i32* %3, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %27, label %26

; <label>:26:                                     ; preds = %22
  br label %44

; <label>:27:                                     ; preds = %22
  br label %28

; <label>:28:                                     ; preds = %27, %18
  %29 = load i32, i32* %1, align 4
  %30 = load i32, i32* %3, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %43

; <label>:32:                                     ; preds = %28
  %33 = load i32, i32* %3, align 4
  %34 = load i32, i32* %1, align 4
  %int_cast_to_i64 = zext i32 %34 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %35 = srem i32 %33, %34, !klee.check.div !7
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %40

; <label>:37:                                     ; preds = %32
  %38 = load i32, i32* %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %5, align 4
  store i32 1, i32* %6, align 4
  br label %40

; <label>:40:                                     ; preds = %37, %32
  %41 = load i32, i32* %1, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %1, align 4
  br label %43

; <label>:43:                                     ; preds = %40, %28
  br label %18

; <label>:44:                                     ; preds = %26
  %45 = load i32, i32* %5, align 4
  store i32 %45, i32* %4, align 4
  %46 = load i32, i32* %6, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %7, align 4
  %48 = load i32, i32* %4, align 4
  %49 = load i32, i32* %7, align 4
  %50 = icmp eq i32 %48, %49
  %51 = zext i1 %50 to i32
  %52 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %51)
  ret i32 0
}

declare void @klee_make_symbolic(i8*, i32, i8*) #1

declare void @klee_assume(i32) #1

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
  call void @klee_report_error(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.5, i32 0, i32 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.6, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.7, i32 0, i32 0)) #5, !dbg !18
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
