; ModuleID = 'klee_merged_1.bc'
source_filename = "klee_merged_1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"sum\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"i\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"CEX sum=%d,i=%d,n=%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"A lovely CEX\00", align 1
@.str.5 = private unnamed_addr constant [68 x i8] c"/home/fengnick/CLEVER+/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.6 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.7 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

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
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %2, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  %14 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %3, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  %15 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %4, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %16 = load i32, i32* %2, align 4
  store i32 %16, i32* %5, align 4
  %17 = load i32, i32* %2, align 4
  store i32 %17, i32* %6, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i32 0, i32* %10, align 4
  store i32 0, i32* %11, align 4
  store i32 0, i32* %12, align 4
  br label %18

; <label>:18:                                     ; preds = %51, %0
  %19 = load i32, i32* %3, align 4
  %20 = load i32, i32* %4, align 4
  %21 = icmp sle i32 %19, %20
  br i1 %21, label %26, label %22

; <label>:22:                                     ; preds = %18
  %23 = load i32, i32* %3, align 4
  %24 = load i32, i32* %4, align 4
  %25 = icmp sle i32 %23, %24
  br label %26

; <label>:26:                                     ; preds = %22, %18
  %27 = phi i1 [ true, %18 ], [ %25, %22 ]
  br i1 %27, label %28, label %52

; <label>:28:                                     ; preds = %26
  %29 = load i32, i32* %3, align 4
  %30 = load i32, i32* %4, align 4
  %31 = icmp sle i32 %29, %30
  br i1 %31, label %32, label %51

; <label>:32:                                     ; preds = %28
  %33 = load i32, i32* %3, align 4
  %34 = call fastcc i32 @lib_old(i32 %33)
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %40

; <label>:36:                                     ; preds = %32
  %37 = load i32, i32* %3, align 4
  %38 = load i32, i32* %5, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, i32* %5, align 4
  br label %40

; <label>:40:                                     ; preds = %36, %32
  %41 = load i32, i32* %3, align 4
  %42 = call fastcc i32 @lib_new(i32 %41)
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %40
  %45 = load i32, i32* %3, align 4
  %46 = load i32, i32* %6, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, i32* %6, align 4
  br label %48

; <label>:48:                                     ; preds = %44, %40
  %49 = load i32, i32* %3, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %3, align 4
  br label %51

; <label>:51:                                     ; preds = %48, %28
  br label %18

; <label>:52:                                     ; preds = %26
  %53 = load i32, i32* %5, align 4
  %54 = call fastcc i32 @lib_old(i32 %53)
  %55 = icmp eq i32 %54, 0
  %56 = zext i1 %55 to i32
  store i32 %56, i32* %11, align 4
  %57 = load i32, i32* %6, align 4
  %58 = call fastcc i32 @lib_new(i32 %57)
  %59 = icmp eq i32 %58, 0
  %60 = zext i1 %59 to i32
  store i32 %60, i32* %12, align 4
  %61 = load i32, i32* %5, align 4
  store i32 %61, i32* %9, align 4
  %62 = load i32, i32* %6, align 4
  store i32 %62, i32* %10, align 4
  %63 = load i32, i32* %3, align 4
  store i32 %63, i32* %7, align 4
  %64 = load i32, i32* %3, align 4
  store i32 %64, i32* %8, align 4
  %65 = load i32, i32* %11, align 4
  %66 = load i32, i32* %12, align 4
  %67 = icmp eq i32 %65, %66
  %68 = zext i1 %67 to i32
  %69 = load i32, i32* %9, align 4
  %70 = load i32, i32* %10, align 4
  %71 = icmp eq i32 %69, %70
  %72 = zext i1 %71 to i32
  %73 = and i32 %68, %72
  %74 = load i32, i32* %7, align 4
  %75 = load i32, i32* %8, align 4
  %76 = icmp eq i32 %74, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %73, %77
  %79 = icmp ne i32 %78, 0
  %80 = xor i1 %79, true
  %81 = zext i1 %80 to i32
  %82 = call i32 (i32, ...) bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %81)
  %83 = load i32, i32* %2, align 4
  %84 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %83)
  %85 = load i32, i32* %3, align 4
  %86 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %85)
  %87 = load i32, i32* %4, align 4
  %88 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %87)
  %89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0), i32 %84, i32 %86, i32 %88)
  %90 = call i32 (i8*, ...) bitcast (i32 (...)* @perror to i32 (i8*, ...)*)(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0))
  call void @abort() #6
  unreachable
}

declare i32 @klee_make_symbolic(...) local_unnamed_addr #1

declare i32 @klee_assume(...) local_unnamed_addr #1

declare i32 @printf(i8*, ...) local_unnamed_addr #1

declare i32 @klee_get_valued(...) local_unnamed_addr #1

declare i32 @perror(...) local_unnamed_addr #1

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @lib_old(i32) unnamed_addr #3 {
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
  call fastcc void @klee_div_zero_check(i64 %int_cast_to_i64)
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
  %21 = load i32, i32* %4, align 4
  %22 = add nsw i32 %21, 1
  ret i32 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define internal fastcc i32 @lib_new(i32) unnamed_addr #3 {
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
  call fastcc void @klee_div_zero_check(i64 %int_cast_to_i64)
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

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @klee_div_zero_check(i64) unnamed_addr #4 !dbg !8 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !12, metadata !DIExpression()), !dbg !13
  %2 = icmp eq i64 %0, 0, !dbg !14
  br i1 %2, label %3, label %4, !dbg !16

; <label>:3:                                      ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.5, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.6, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.7, i64 0, i64 0)) #7, !dbg !17
  unreachable, !dbg !17

; <label>:4:                                      ; preds = %1
  ret void, !dbg !18
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #5

attributes #0 = { noinline noreturn nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable }
attributes #6 = { noreturn }
attributes #7 = { noreturn nounwind }

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
