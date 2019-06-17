; ModuleID = 'klee_merged_1.bc'
source_filename = "klee_merged_1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"sum__CLEVER_EXT\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"CEX a=%d,sum__CLEVER_EXT=%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"A lovely CEX\00", align 1
@.str.4 = private unnamed_addr constant [68 x i8] c"/home/fengnick/CLEVER+/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

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
  %10 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %2, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %11 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %3, i64 4, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0))
  %12 = load i32, i32* %2, align 4
  %13 = load i32, i32* %3, align 4
  %14 = icmp eq i32 %12, %13
  br i1 %14, label %16, label %15

; <label>:15:                                     ; preds = %0
  store i32 0, i32* %1, align 4
  br label %206

; <label>:16:                                     ; preds = %0
  %17 = load i32, i32* %2, align 4
  %18 = srem i32 %17, 8
  %19 = icmp eq i32 0, %18
  %20 = zext i1 %19 to i32
  %21 = icmp eq i32 0, %20
  %22 = zext i1 %21 to i32
  %23 = load i32, i32* %2, align 4
  %24 = icmp slt i32 14, %23
  %25 = zext i1 %24 to i32
  %26 = icmp eq i32 0, %25
  %27 = zext i1 %26 to i32
  %28 = and i32 %22, %27
  %29 = load i32, i32* %2, align 4
  %30 = icmp slt i32 9, %29
  %31 = zext i1 %30 to i32
  %32 = and i32 %28, %31
  %33 = load i32, i32* %2, align 4
  %34 = srem i32 %33, 6
  %35 = icmp eq i32 0, %34
  %36 = zext i1 %35 to i32
  %37 = icmp eq i32 0, %36
  %38 = zext i1 %37 to i32
  %39 = and i32 %32, %38
  %40 = load i32, i32* %2, align 4
  %41 = icmp slt i32 4, %40
  %42 = zext i1 %41 to i32
  %43 = and i32 %39, %42
  %44 = load i32, i32* %2, align 4
  %45 = icmp slt i32 10, %44
  %46 = zext i1 %45 to i32
  %47 = and i32 %43, %46
  %48 = load i32, i32* %2, align 4
  %49 = icmp slt i32 13, %48
  %50 = zext i1 %49 to i32
  %51 = and i32 %47, %50
  %52 = load i32, i32* %2, align 4
  %53 = srem i32 %52, 9
  %54 = icmp eq i32 0, %53
  %55 = zext i1 %54 to i32
  %56 = icmp eq i32 0, %55
  %57 = zext i1 %56 to i32
  %58 = and i32 %51, %57
  %59 = load i32, i32* %2, align 4
  %60 = srem i32 %59, 12
  %61 = icmp eq i32 0, %60
  %62 = zext i1 %61 to i32
  %63 = icmp eq i32 0, %62
  %64 = zext i1 %63 to i32
  %65 = and i32 %58, %64
  %66 = load i32, i32* %2, align 4
  %67 = icmp slt i32 2, %66
  %68 = zext i1 %67 to i32
  %69 = and i32 %65, %68
  %70 = load i32, i32* %2, align 4
  %71 = icmp slt i32 3, %70
  %72 = zext i1 %71 to i32
  %73 = and i32 %69, %72
  %74 = load i32, i32* %2, align 4
  %75 = srem i32 %74, 7
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = and i32 %73, %77
  %79 = load i32, i32* %2, align 4
  %80 = srem i32 %79, 13
  %81 = icmp eq i32 0, %80
  %82 = zext i1 %81 to i32
  %83 = icmp eq i32 0, %82
  %84 = zext i1 %83 to i32
  %85 = and i32 %78, %84
  %86 = and i32 %85, 1
  %87 = load i32, i32* %2, align 4
  %88 = icmp slt i32 7, %87
  %89 = zext i1 %88 to i32
  %90 = and i32 %86, %89
  %91 = load i32, i32* %2, align 4
  %92 = srem i32 %91, 3
  %93 = icmp eq i32 0, %92
  %94 = zext i1 %93 to i32
  %95 = icmp eq i32 0, %94
  %96 = zext i1 %95 to i32
  %97 = and i32 %90, %96
  %98 = load i32, i32* %2, align 4
  %99 = icmp slt i32 6, %98
  %100 = zext i1 %99 to i32
  %101 = and i32 %97, %100
  %102 = load i32, i32* %2, align 4
  %103 = srem i32 %102, 5
  %104 = icmp eq i32 0, %103
  %105 = zext i1 %104 to i32
  %106 = icmp eq i32 0, %105
  %107 = zext i1 %106 to i32
  %108 = and i32 %101, %107
  %109 = load i32, i32* %2, align 4
  %110 = srem i32 %109, 4
  %111 = icmp eq i32 0, %110
  %112 = zext i1 %111 to i32
  %113 = icmp eq i32 0, %112
  %114 = zext i1 %113 to i32
  %115 = and i32 %108, %114
  %116 = load i32, i32* %2, align 4
  %117 = srem i32 %116, 10
  %118 = icmp eq i32 0, %117
  %119 = zext i1 %118 to i32
  %120 = icmp eq i32 0, %119
  %121 = zext i1 %120 to i32
  %122 = and i32 %115, %121
  %123 = load i32, i32* %2, align 4
  %124 = icmp slt i32 5, %123
  %125 = zext i1 %124 to i32
  %126 = and i32 %122, %125
  %127 = load i32, i32* %2, align 4
  %128 = srem i32 %127, 11
  %129 = icmp eq i32 0, %128
  %130 = zext i1 %129 to i32
  %131 = icmp eq i32 0, %130
  %132 = zext i1 %131 to i32
  %133 = and i32 %126, %132
  %134 = load i32, i32* %2, align 4
  %135 = icmp slt i32 11, %134
  %136 = zext i1 %135 to i32
  %137 = and i32 %133, %136
  %138 = load i32, i32* %2, align 4
  %139 = icmp slt i32 8, %138
  %140 = zext i1 %139 to i32
  %141 = and i32 %137, %140
  %142 = load i32, i32* %2, align 4
  %143 = srem i32 %142, 2
  %144 = icmp eq i32 0, %143
  %145 = zext i1 %144 to i32
  %146 = and i32 %141, %145
  %147 = load i32, i32* %2, align 4
  %148 = icmp slt i32 12, %147
  %149 = zext i1 %148 to i32
  %150 = and i32 %146, %149
  %151 = icmp ne i32 %150, 0
  br i1 %151, label %152, label %153

; <label>:152:                                    ; preds = %16
  store i32 0, i32* %1, align 4
  br label %206

; <label>:153:                                    ; preds = %16
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  store i32 2, i32* %8, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %9, align 4
  br label %154

; <label>:154:                                    ; preds = %179, %153
  %155 = load i32, i32* %8, align 4
  %156 = load i32, i32* %2, align 4
  %157 = icmp slt i32 %155, %156
  br i1 %157, label %162, label %158

; <label>:158:                                    ; preds = %154
  %159 = load i32, i32* %8, align 4
  %160 = load i32, i32* %2, align 4
  %161 = icmp slt i32 %159, %160
  br label %162

; <label>:162:                                    ; preds = %158, %154
  %163 = phi i1 [ true, %154 ], [ %161, %158 ]
  br i1 %163, label %164, label %180

; <label>:164:                                    ; preds = %162
  %165 = load i32, i32* %8, align 4
  %166 = load i32, i32* %2, align 4
  %167 = icmp slt i32 %165, %166
  br i1 %167, label %168, label %179

; <label>:168:                                    ; preds = %164
  %169 = load i32, i32* %2, align 4
  %170 = load i32, i32* %8, align 4
  %int_cast_to_i64 = zext i32 %170 to i64
  call fastcc void @klee_div_zero_check(i64 %int_cast_to_i64)
  %171 = srem i32 %169, %170, !klee.check.div !7
  %172 = icmp ne i32 %171, 0
  br i1 %172, label %173, label %176

; <label>:173:                                    ; preds = %168
  %174 = load i32, i32* %4, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %4, align 4
  store i32 1, i32* %5, align 4
  br label %176

; <label>:176:                                    ; preds = %173, %168
  %177 = load i32, i32* %8, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %8, align 4
  br label %179

; <label>:179:                                    ; preds = %176, %164
  br label %154

; <label>:180:                                    ; preds = %162
  %181 = load i32, i32* %4, align 4
  store i32 %181, i32* %6, align 4
  %182 = load i32, i32* %5, align 4
  store i32 %182, i32* %7, align 4
  %183 = load i32, i32* %6, align 4
  %184 = load i32, i32* %7, align 4
  %185 = icmp eq i32 %183, %184
  %186 = zext i1 %185 to i32
  %187 = load i32, i32* %7, align 4
  %188 = icmp eq i32 0, %187
  %189 = zext i1 %188 to i32
  %190 = load i32, i32* %6, align 4
  %191 = icmp eq i32 0, %190
  %192 = zext i1 %191 to i32
  %193 = icmp eq i32 %189, %192
  %194 = zext i1 %193 to i32
  %195 = or i32 %186, %194
  %196 = icmp ne i32 %195, 0
  %197 = xor i1 %196, true
  %198 = zext i1 %197 to i32
  %199 = call i32 (i32, ...) bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %198)
  %200 = load i32, i32* %2, align 4
  %201 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %200)
  %202 = load i32, i32* %3, align 4
  %203 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %202)
  %204 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0), i32 %201, i32 %203)
  %205 = call i32 (i8*, ...) bitcast (i32 (...)* @perror to i32 (i8*, ...)*)(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0))
  call void @abort() #5
  unreachable

; <label>:206:                                    ; preds = %152, %15
  %207 = load i32, i32* %1, align 4
  ret i32 %207
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
  tail call void @klee_report_error(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !17
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
