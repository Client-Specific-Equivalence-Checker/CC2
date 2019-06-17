; ModuleID = 'klee_merged_0.bc'
source_filename = "klee_merged_0.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"CEX a=%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"A lovely CEX\00", align 1
@.str.3 = private unnamed_addr constant [68 x i8] c"/home/fengnick/CLEVER+/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.4 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.5 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline noreturn nounwind optnone uwtable
define i32 @lib() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %2, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 2, i32* %7, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %8, align 4
  br label %10

; <label>:10:                                     ; preds = %35, %0
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %2, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %18, label %14

; <label>:14:                                     ; preds = %10
  %15 = load i32, i32* %7, align 4
  %16 = load i32, i32* %2, align 4
  %17 = icmp slt i32 %15, %16
  br label %18

; <label>:18:                                     ; preds = %14, %10
  %19 = phi i1 [ true, %10 ], [ %17, %14 ]
  br i1 %19, label %20, label %36

; <label>:20:                                     ; preds = %18
  %21 = load i32, i32* %7, align 4
  %22 = load i32, i32* %2, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %35

; <label>:24:                                     ; preds = %20
  %25 = load i32, i32* %2, align 4
  %26 = load i32, i32* %7, align 4
  %int_cast_to_i64 = zext i32 %26 to i64
  call fastcc void @klee_div_zero_check(i64 %int_cast_to_i64)
  %27 = srem i32 %25, %26, !klee.check.div !7
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %32

; <label>:29:                                     ; preds = %24
  %30 = load i32, i32* %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %4, align 4
  store i32 1, i32* %3, align 4
  br label %32

; <label>:32:                                     ; preds = %29, %24
  %33 = load i32, i32* %7, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %7, align 4
  br label %35

; <label>:35:                                     ; preds = %32, %20
  br label %10

; <label>:36:                                     ; preds = %18
  %37 = load i32, i32* %4, align 4
  store i32 %37, i32* %5, align 4
  %38 = load i32, i32* %3, align 4
  store i32 %38, i32* %6, align 4
  %39 = load i32, i32* %5, align 4
  %40 = load i32, i32* %6, align 4
  %41 = icmp eq i32 %39, %40
  %42 = xor i1 %41, true
  %43 = zext i1 %42 to i32
  %44 = call i32 (i32, ...) bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %43)
  %45 = load i32, i32* %2, align 4
  %46 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %45)
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 %46)
  %48 = call i32 (i8*, ...) bitcast (i32 (...)* @perror to i32 (i8*, ...)*)(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0))
  call void @abort() #5
  unreachable
}

declare i32 @klee_make_symbolic(...) local_unnamed_addr #1

declare i32 @klee_assume(...) local_unnamed_addr #1

declare i32 @printf(i8*, ...) local_unnamed_addr #1

declare i32 @klee_get_valued(...) local_unnamed_addr #1

declare i32 @perror(...) local_unnamed_addr #1

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @klee_div_zero_check(i64) unnamed_addr #3 !dbg !8 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !12, metadata !DIExpression()), !dbg !13
  %2 = icmp eq i64 %0, 0, !dbg !14
  br i1 %2, label %3, label %4, !dbg !16

; <label>:3:                                      ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.3, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.5, i64 0, i64 0)) #6, !dbg !17
  unreachable, !dbg !17

; <label>:4:                                      ; preds = %1
  ret void, !dbg !18
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

attributes #0 = { noinline noreturn nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

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
!14 = !DILocation(line: 13, column: 9, scope: !15)
!15 = distinct !DILexicalBlock(scope: !8, file: !5, line: 13, column: 7)
!16 = !DILocation(line: 13, column: 7, scope: !8)
!17 = !DILocation(line: 14, column: 5, scope: !15)
!18 = !DILocation(line: 15, column: 1, scope: !8)
