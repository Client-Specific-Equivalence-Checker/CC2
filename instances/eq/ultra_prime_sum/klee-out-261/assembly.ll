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
  %24 = srem i32 %23, 11
  %25 = icmp eq i32 0, %24
  %26 = zext i1 %25 to i32
  %27 = icmp eq i32 0, %26
  %28 = zext i1 %27 to i32
  %29 = and i32 %22, %28
  %30 = load i32, i32* %2, align 4
  %31 = icmp slt i32 6, %30
  %32 = zext i1 %31 to i32
  %33 = and i32 %29, %32
  %34 = load i32, i32* %2, align 4
  %35 = srem i32 %34, 10
  %36 = icmp eq i32 0, %35
  %37 = zext i1 %36 to i32
  %38 = icmp eq i32 0, %37
  %39 = zext i1 %38 to i32
  %40 = and i32 %33, %39
  %41 = load i32, i32* %2, align 4
  %42 = icmp slt i32 13, %41
  %43 = zext i1 %42 to i32
  %44 = and i32 %40, %43
  %45 = load i32, i32* %2, align 4
  %46 = srem i32 %45, 7
  %47 = icmp eq i32 0, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %44, %48
  %50 = load i32, i32* %2, align 4
  %51 = srem i32 %50, 5
  %52 = icmp eq i32 0, %51
  %53 = zext i1 %52 to i32
  %54 = icmp eq i32 0, %53
  %55 = zext i1 %54 to i32
  %56 = and i32 %49, %55
  %57 = load i32, i32* %2, align 4
  %58 = icmp slt i32 14, %57
  %59 = zext i1 %58 to i32
  %60 = icmp eq i32 0, %59
  %61 = zext i1 %60 to i32
  %62 = and i32 %56, %61
  %63 = load i32, i32* %2, align 4
  %64 = srem i32 %63, 6
  %65 = icmp eq i32 0, %64
  %66 = zext i1 %65 to i32
  %67 = icmp eq i32 0, %66
  %68 = zext i1 %67 to i32
  %69 = and i32 %62, %68
  %70 = load i32, i32* %2, align 4
  %71 = icmp slt i32 7, %70
  %72 = zext i1 %71 to i32
  %73 = and i32 %69, %72
  %74 = and i32 %73, 1
  %75 = load i32, i32* %2, align 4
  %76 = srem i32 %75, 3
  %77 = icmp eq i32 0, %76
  %78 = zext i1 %77 to i32
  %79 = icmp eq i32 0, %78
  %80 = zext i1 %79 to i32
  %81 = and i32 %74, %80
  %82 = load i32, i32* %2, align 4
  %83 = srem i32 %82, 4
  %84 = icmp eq i32 0, %83
  %85 = zext i1 %84 to i32
  %86 = icmp eq i32 0, %85
  %87 = zext i1 %86 to i32
  %88 = and i32 %81, %87
  %89 = load i32, i32* %2, align 4
  %90 = icmp slt i32 10, %89
  %91 = zext i1 %90 to i32
  %92 = and i32 %88, %91
  %93 = load i32, i32* %2, align 4
  %94 = icmp slt i32 12, %93
  %95 = zext i1 %94 to i32
  %96 = and i32 %92, %95
  %97 = load i32, i32* %2, align 4
  %98 = srem i32 %97, 2
  %99 = icmp eq i32 0, %98
  %100 = zext i1 %99 to i32
  %101 = and i32 %96, %100
  %102 = load i32, i32* %2, align 4
  %103 = icmp slt i32 9, %102
  %104 = zext i1 %103 to i32
  %105 = and i32 %101, %104
  %106 = load i32, i32* %2, align 4
  %107 = srem i32 %106, 9
  %108 = icmp eq i32 0, %107
  %109 = zext i1 %108 to i32
  %110 = icmp eq i32 0, %109
  %111 = zext i1 %110 to i32
  %112 = and i32 %105, %111
  %113 = load i32, i32* %2, align 4
  %114 = icmp slt i32 3, %113
  %115 = zext i1 %114 to i32
  %116 = and i32 %112, %115
  %117 = load i32, i32* %2, align 4
  %118 = icmp slt i32 2, %117
  %119 = zext i1 %118 to i32
  %120 = and i32 %116, %119
  %121 = load i32, i32* %2, align 4
  %122 = icmp slt i32 4, %121
  %123 = zext i1 %122 to i32
  %124 = and i32 %120, %123
  %125 = load i32, i32* %2, align 4
  %126 = srem i32 %125, 13
  %127 = icmp eq i32 0, %126
  %128 = zext i1 %127 to i32
  %129 = icmp eq i32 0, %128
  %130 = zext i1 %129 to i32
  %131 = and i32 %124, %130
  %132 = load i32, i32* %2, align 4
  %133 = srem i32 %132, 12
  %134 = icmp eq i32 0, %133
  %135 = zext i1 %134 to i32
  %136 = icmp eq i32 0, %135
  %137 = zext i1 %136 to i32
  %138 = and i32 %131, %137
  %139 = load i32, i32* %2, align 4
  %140 = icmp slt i32 11, %139
  %141 = zext i1 %140 to i32
  %142 = and i32 %138, %141
  %143 = load i32, i32* %2, align 4
  %144 = icmp slt i32 5, %143
  %145 = zext i1 %144 to i32
  %146 = and i32 %142, %145
  %147 = load i32, i32* %2, align 4
  %148 = icmp slt i32 8, %147
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
  %174 = load i32, i32* %5, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %5, align 4
  store i32 1, i32* %4, align 4
  br label %176

; <label>:176:                                    ; preds = %173, %168
  %177 = load i32, i32* %8, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %8, align 4
  br label %179

; <label>:179:                                    ; preds = %176, %164
  br label %154

; <label>:180:                                    ; preds = %162
  %181 = load i32, i32* %5, align 4
  store i32 %181, i32* %6, align 4
  %182 = load i32, i32* %4, align 4
  store i32 %182, i32* %7, align 4
  %183 = load i32, i32* %6, align 4
  %184 = icmp eq i32 0, %183
  %185 = zext i1 %184 to i32
  %186 = load i32, i32* %7, align 4
  %187 = icmp eq i32 0, %186
  %188 = zext i1 %187 to i32
  %189 = icmp eq i32 %185, %188
  %190 = zext i1 %189 to i32
  %191 = load i32, i32* %6, align 4
  %192 = load i32, i32* %7, align 4
  %193 = icmp eq i32 %191, %192
  %194 = zext i1 %193 to i32
  %195 = or i32 %190, %194
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
