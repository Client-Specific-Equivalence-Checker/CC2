; ModuleID = 'klee_merged_0.bc'
source_filename = "klee_merged_0.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"i__CLEVER_EXT\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"n__CLEVER_EXT\00", align 1
@.str.3 = private unnamed_addr constant [44 x i8] c"CEX a=%d,i__CLEVER_EXT=%d,n__CLEVER_EXT=%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"A lovely CEX\00", align 1
@.str.5 = private unnamed_addr constant [68 x i8] c"/home/fengnick/CLEVER+/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.6 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.7 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
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
  %12 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %2, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %13 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %3, i64 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0))
  %14 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %5, i64 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0))
  %15 = load i32, i32* %3, align 4
  %16 = load i32, i32* %5, align 4
  %17 = icmp sle i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = load i32, i32* %2, align 4
  %20 = load i32, i32* %3, align 4
  %21 = icmp eq i32 %19, %20
  %22 = zext i1 %21 to i32
  %23 = and i32 %18, %22
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %26, label %25

; <label>:25:                                     ; preds = %0
  store i32 0, i32* %1, align 4
  br label %168

; <label>:26:                                     ; preds = %0
  %27 = load i32, i32* %2, align 4
  %28 = icmp slt i32 4, %27
  %29 = zext i1 %28 to i32
  %30 = and i32 1, %29
  %31 = load i32, i32* %2, align 4
  %32 = icmp slt i32 5, %31
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = and i32 %30, %35
  %37 = load i32, i32* %2, align 4
  %38 = srem i32 %37, 3
  %39 = icmp eq i32 0, %38
  %40 = zext i1 %39 to i32
  %41 = icmp eq i32 0, %40
  %42 = zext i1 %41 to i32
  %43 = and i32 %36, %42
  %44 = load i32, i32* %2, align 4
  %45 = icmp slt i32 2, %44
  %46 = zext i1 %45 to i32
  %47 = and i32 %43, %46
  %48 = load i32, i32* %2, align 4
  %49 = srem i32 %48, 2
  %50 = icmp eq i32 0, %49
  %51 = zext i1 %50 to i32
  %52 = icmp eq i32 0, %51
  %53 = zext i1 %52 to i32
  %54 = and i32 %47, %53
  %55 = load i32, i32* %2, align 4
  %56 = srem i32 %55, 4
  %57 = icmp eq i32 0, %56
  %58 = zext i1 %57 to i32
  %59 = icmp eq i32 0, %58
  %60 = zext i1 %59 to i32
  %61 = and i32 %54, %60
  %62 = load i32, i32* %2, align 4
  %63 = icmp slt i32 3, %62
  %64 = zext i1 %63 to i32
  %65 = and i32 %61, %64
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %68

; <label>:67:                                     ; preds = %26
  store i32 0, i32* %1, align 4
  br label %168

; <label>:68:                                     ; preds = %26
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i32 2, i32* %10, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %11, align 4
  br label %69

; <label>:69:                                     ; preds = %94, %68
  %70 = load i32, i32* %10, align 4
  %71 = load i32, i32* %2, align 4
  %72 = icmp slt i32 %70, %71
  br i1 %72, label %77, label %73

; <label>:73:                                     ; preds = %69
  %74 = load i32, i32* %10, align 4
  %75 = load i32, i32* %2, align 4
  %76 = icmp slt i32 %74, %75
  br label %77

; <label>:77:                                     ; preds = %73, %69
  %78 = phi i1 [ true, %69 ], [ %76, %73 ]
  br i1 %78, label %79, label %95

; <label>:79:                                     ; preds = %77
  %80 = load i32, i32* %10, align 4
  %81 = load i32, i32* %2, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %94

; <label>:83:                                     ; preds = %79
  %84 = load i32, i32* %2, align 4
  %85 = load i32, i32* %10, align 4
  %int_cast_to_i64 = zext i32 %85 to i64
  call fastcc void @klee_div_zero_check(i64 %int_cast_to_i64)
  %86 = srem i32 %84, %85, !klee.check.div !7
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %91

; <label>:88:                                     ; preds = %83
  %89 = load i32, i32* %7, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, i32* %7, align 4
  store i32 1, i32* %6, align 4
  br label %91

; <label>:91:                                     ; preds = %88, %83
  %92 = load i32, i32* %10, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %10, align 4
  br label %94

; <label>:94:                                     ; preds = %91, %79
  br label %69

; <label>:95:                                     ; preds = %77
  %96 = load i32, i32* %7, align 4
  store i32 %96, i32* %8, align 4
  %97 = load i32, i32* %6, align 4
  store i32 %97, i32* %9, align 4
  %98 = load i32, i32* %8, align 4
  %99 = icmp eq i32 0, %98
  %100 = zext i1 %99 to i32
  %101 = icmp eq i32 0, %100
  %102 = zext i1 %101 to i32
  %103 = load i32, i32* %9, align 4
  %104 = icmp eq i32 0, %103
  %105 = zext i1 %104 to i32
  %106 = icmp eq i32 0, %105
  %107 = zext i1 %106 to i32
  %108 = and i32 %102, %107
  %109 = load i32, i32* %8, align 4
  %110 = icmp eq i32 0, %109
  %111 = zext i1 %110 to i32
  %112 = icmp eq i32 0, %111
  %113 = zext i1 %112 to i32
  %114 = load i32, i32* %9, align 4
  %115 = icmp eq i32 0, %114
  %116 = zext i1 %115 to i32
  %117 = and i32 %113, %116
  %118 = load i32, i32* %4, align 4
  %119 = load i32, i32* %4, align 4
  %120 = load i32, i32* %10, align 4
  %121 = add nsw i32 %119, %120
  %122 = icmp eq i32 %118, %121
  %123 = zext i1 %122 to i32
  %124 = and i32 %117, %123
  %125 = or i32 %108, %124
  %126 = load i32, i32* %8, align 4
  %127 = icmp eq i32 0, %126
  %128 = zext i1 %127 to i32
  %129 = load i32, i32* %9, align 4
  %130 = icmp eq i32 0, %129
  %131 = zext i1 %130 to i32
  %132 = and i32 %128, %131
  %133 = or i32 %125, %132
  %134 = load i32, i32* %8, align 4
  %135 = icmp eq i32 0, %134
  %136 = zext i1 %135 to i32
  %137 = load i32, i32* %9, align 4
  %138 = icmp eq i32 0, %137
  %139 = zext i1 %138 to i32
  %140 = icmp eq i32 0, %139
  %141 = zext i1 %140 to i32
  %142 = and i32 %136, %141
  %143 = load i32, i32* %4, align 4
  %144 = load i32, i32* %10, align 4
  %145 = add nsw i32 %143, %144
  %146 = load i32, i32* %4, align 4
  %147 = icmp eq i32 %145, %146
  %148 = zext i1 %147 to i32
  %149 = and i32 %142, %148
  %150 = or i32 %133, %149
  %151 = load i32, i32* %8, align 4
  %152 = load i32, i32* %9, align 4
  %153 = icmp eq i32 %151, %152
  %154 = zext i1 %153 to i32
  %155 = or i32 %150, %154
  %156 = icmp ne i32 %155, 0
  %157 = xor i1 %156, true
  %158 = zext i1 %157 to i32
  %159 = call i32 (i32, ...) bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %158)
  %160 = load i32, i32* %2, align 4
  %161 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %160)
  %162 = load i32, i32* %3, align 4
  %163 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %162)
  %164 = load i32, i32* %5, align 4
  %165 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %164)
  %166 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.3, i32 0, i32 0), i32 %161, i32 %163, i32 %165)
  %167 = call i32 (i8*, ...) bitcast (i32 (...)* @perror to i32 (i8*, ...)*)(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0))
  call void @abort() #5
  unreachable

; <label>:168:                                    ; preds = %67, %25
  %169 = load i32, i32* %1, align 4
  ret i32 %169
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
  tail call void @klee_report_error(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.5, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.6, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.7, i64 0, i64 0)) #6, !dbg !17
  unreachable, !dbg !17

; <label>:4:                                      ; preds = %1
  ret void, !dbg !18
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
