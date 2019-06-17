; ModuleID = 'merged_g_0.cil.bc'
source_filename = "merged_g_0.cil.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.3 = private unnamed_addr constant [68 x i8] c"/home/fengnick/CLEVER+/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

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
  call void @klee_make_symbolic(i8* %8, i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %9 = load i32, i32* %7, align 4
  %10 = icmp eq i32 %9, 4
  %11 = zext i1 %10 to i32
  call void @klee_assume(i32 %11)
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 2, i32* %5, align 4
  store i32 0, i32* %2, align 4
  %12 = load i32, i32* %2, align 4
  store i32 %12, i32* %1, align 4
  %13 = load i32, i32* %1, align 4
  store i32 %13, i32* %6, align 4
  br label %14

; <label>:14:                                     ; preds = %0, %39
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %7, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %24, label %18

; <label>:18:                                     ; preds = %14
  %19 = load i32, i32* %5, align 4
  %20 = load i32, i32* %7, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %23, label %22

; <label>:22:                                     ; preds = %18
  br label %40

; <label>:23:                                     ; preds = %18
  br label %24

; <label>:24:                                     ; preds = %23, %14
  %25 = load i32, i32* %5, align 4
  %26 = load i32, i32* %7, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %39

; <label>:28:                                     ; preds = %24
  %29 = load i32, i32* %7, align 4
  %30 = load i32, i32* %5, align 4
  %int_cast_to_i64 = zext i32 %30 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %31 = srem i32 %29, %30, !klee.check.div !7
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %28
  %34 = load i32, i32* %2, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %2, align 4
  store i32 1, i32* %1, align 4
  br label %36

; <label>:36:                                     ; preds = %33, %28
  %37 = load i32, i32* %5, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %5, align 4
  br label %39

; <label>:39:                                     ; preds = %36, %24
  br label %14

; <label>:40:                                     ; preds = %22
  %41 = load i32, i32* %2, align 4
  store i32 %41, i32* %3, align 4
  %42 = load i32, i32* %1, align 4
  store i32 %42, i32* %4, align 4
  %43 = load i32, i32* %3, align 4
  %44 = load i32, i32* %4, align 4
  %45 = icmp eq i32 %43, %44
  %46 = zext i1 %45 to i32
  %47 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 %46)
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
  call void @klee_report_error(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.3, i32 0, i32 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0)) #5, !dbg !18
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
