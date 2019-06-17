; ModuleID = 'merged_g_0.cil.bc'
source_filename = "merged_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_new\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"CLEVER_ret_0_old\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.3 = private unnamed_addr constant [68 x i8] c"/home/fengnick/CLEVER+/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.4 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.5 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

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
  call void @klee_make_symbolic(i8* %9, i32 4, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0))
  %10 = bitcast i32* %5 to i8*
  call void @klee_make_symbolic(i8* %10, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %11 = load i32, i32* %5, align 4
  %12 = icmp eq i32 %11, 4
  %13 = zext i1 %12 to i32
  call void @klee_assume(i32 %13)
  store i32 0, i32* %7, align 4
  store i32 0, i32* %6, align 4
  store i32 2, i32* %3, align 4
  store i32 0, i32* %2, align 4
  %14 = load i32, i32* %2, align 4
  store i32 %14, i32* %1, align 4
  %15 = load i32, i32* %1, align 4
  store i32 %15, i32* %4, align 4
  br label %16

; <label>:16:                                     ; preds = %0, %41
  %17 = load i32, i32* %3, align 4
  %18 = load i32, i32* %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %26, label %20

; <label>:20:                                     ; preds = %16
  %21 = load i32, i32* %3, align 4
  %22 = load i32, i32* %5, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %25, label %24

; <label>:24:                                     ; preds = %20
  br label %42

; <label>:25:                                     ; preds = %20
  br label %26

; <label>:26:                                     ; preds = %25, %16
  %27 = load i32, i32* %3, align 4
  %28 = load i32, i32* %5, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %41

; <label>:30:                                     ; preds = %26
  %31 = load i32, i32* %5, align 4
  %32 = load i32, i32* %3, align 4
  %int_cast_to_i64 = zext i32 %32 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %33 = srem i32 %31, %32, !klee.check.div !7
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %38

; <label>:35:                                     ; preds = %30
  %36 = load i32, i32* %1, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %1, align 4
  store i32 1, i32* %2, align 4
  br label %38

; <label>:38:                                     ; preds = %35, %30
  %39 = load i32, i32* %3, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %3, align 4
  br label %41

; <label>:41:                                     ; preds = %38, %26
  br label %16

; <label>:42:                                     ; preds = %24
  %43 = load i32, i32* %1, align 4
  store i32 %43, i32* %6, align 4
  %44 = load i32, i32* %2, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %7, align 4
  %46 = load i32, i32* %6, align 4
  %47 = load i32, i32* %7, align 4
  %48 = icmp eq i32 %46, %47
  %49 = zext i1 %48 to i32
  %50 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %49)
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
  call void @klee_report_error(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.3, i32 0, i32 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.4, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.5, i32 0, i32 0)) #5, !dbg !18
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
