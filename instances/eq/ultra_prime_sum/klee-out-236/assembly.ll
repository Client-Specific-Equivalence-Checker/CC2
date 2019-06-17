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
  %18 = icmp slt i32 3, %17
  %19 = zext i1 %18 to i32
  %20 = load i32, i32* %2, align 4
  %21 = icmp slt i32 10, %20
  %22 = zext i1 %21 to i32
  %23 = and i32 %19, %22
  %24 = load i32, i32* %2, align 4
  %25 = icmp slt i32 6, %24
  %26 = zext i1 %25 to i32
  %27 = and i32 %23, %26
  %28 = load i32, i32* %2, align 4
  %29 = srem i32 %28, 10
  %30 = icmp eq i32 0, %29
  %31 = zext i1 %30 to i32
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = and i32 %27, %33
  %35 = load i32, i32* %2, align 4
  %36 = srem i32 %35, 5
  %37 = icmp eq i32 0, %36
  %38 = zext i1 %37 to i32
  %39 = icmp eq i32 0, %38
  %40 = zext i1 %39 to i32
  %41 = and i32 %34, %40
  %42 = load i32, i32* %2, align 4
  %43 = icmp slt i32 12, %42
  %44 = zext i1 %43 to i32
  %45 = and i32 %41, %44
  %46 = load i32, i32* %2, align 4
  %47 = srem i32 %46, 3
  %48 = icmp eq i32 0, %47
  %49 = zext i1 %48 to i32
  %50 = icmp eq i32 0, %49
  %51 = zext i1 %50 to i32
  %52 = and i32 %45, %51
  %53 = load i32, i32* %2, align 4
  %54 = srem i32 %53, 11
  %55 = icmp eq i32 0, %54
  %56 = zext i1 %55 to i32
  %57 = icmp eq i32 0, %56
  %58 = zext i1 %57 to i32
  %59 = and i32 %52, %58
  %60 = load i32, i32* %2, align 4
  %61 = srem i32 %60, 8
  %62 = icmp eq i32 0, %61
  %63 = zext i1 %62 to i32
  %64 = icmp eq i32 0, %63
  %65 = zext i1 %64 to i32
  %66 = and i32 %59, %65
  %67 = load i32, i32* %2, align 4
  %68 = srem i32 %67, 4
  %69 = icmp eq i32 0, %68
  %70 = zext i1 %69 to i32
  %71 = icmp eq i32 0, %70
  %72 = zext i1 %71 to i32
  %73 = and i32 %66, %72
  %74 = load i32, i32* %2, align 4
  %75 = icmp slt i32 4, %74
  %76 = zext i1 %75 to i32
  %77 = and i32 %73, %76
  %78 = load i32, i32* %2, align 4
  %79 = icmp slt i32 2, %78
  %80 = zext i1 %79 to i32
  %81 = and i32 %77, %80
  %82 = load i32, i32* %2, align 4
  %83 = icmp slt i32 5, %82
  %84 = zext i1 %83 to i32
  %85 = and i32 %81, %84
  %86 = load i32, i32* %2, align 4
  %87 = srem i32 %86, 13
  %88 = icmp eq i32 0, %87
  %89 = zext i1 %88 to i32
  %90 = icmp eq i32 0, %89
  %91 = zext i1 %90 to i32
  %92 = and i32 %85, %91
  %93 = load i32, i32* %2, align 4
  %94 = icmp slt i32 11, %93
  %95 = zext i1 %94 to i32
  %96 = and i32 %92, %95
  %97 = load i32, i32* %2, align 4
  %98 = srem i32 %97, 9
  %99 = icmp eq i32 0, %98
  %100 = zext i1 %99 to i32
  %101 = icmp eq i32 0, %100
  %102 = zext i1 %101 to i32
  %103 = and i32 %96, %102
  %104 = load i32, i32* %2, align 4
  %105 = icmp slt i32 14, %104
  %106 = zext i1 %105 to i32
  %107 = icmp eq i32 0, %106
  %108 = zext i1 %107 to i32
  %109 = and i32 %103, %108
  %110 = load i32, i32* %2, align 4
  %111 = icmp slt i32 8, %110
  %112 = zext i1 %111 to i32
  %113 = and i32 %109, %112
  %114 = load i32, i32* %2, align 4
  %115 = srem i32 %114, 2
  %116 = icmp eq i32 0, %115
  %117 = zext i1 %116 to i32
  %118 = and i32 %113, %117
  %119 = load i32, i32* %2, align 4
  %120 = icmp slt i32 13, %119
  %121 = zext i1 %120 to i32
  %122 = and i32 %118, %121
  %123 = load i32, i32* %2, align 4
  %124 = icmp slt i32 9, %123
  %125 = zext i1 %124 to i32
  %126 = and i32 %122, %125
  %127 = load i32, i32* %2, align 4
  %128 = srem i32 %127, 7
  %129 = icmp eq i32 0, %128
  %130 = zext i1 %129 to i32
  %131 = and i32 %126, %130
  %132 = load i32, i32* %2, align 4
  %133 = srem i32 %132, 6
  %134 = icmp eq i32 0, %133
  %135 = zext i1 %134 to i32
  %136 = icmp eq i32 0, %135
  %137 = zext i1 %136 to i32
  %138 = and i32 %131, %137
  %139 = load i32, i32* %2, align 4
  %140 = icmp slt i32 7, %139
  %141 = zext i1 %140 to i32
  %142 = and i32 %138, %141
  %143 = and i32 %142, 1
  %144 = load i32, i32* %2, align 4
  %145 = srem i32 %144, 12
  %146 = icmp eq i32 0, %145
  %147 = zext i1 %146 to i32
  %148 = icmp eq i32 0, %147
  %149 = zext i1 %148 to i32
  %150 = and i32 %143, %149
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
  %183 = load i32, i32* %7, align 4
  %184 = icmp eq i32 0, %183
  %185 = zext i1 %184 to i32
  %186 = load i32, i32* %6, align 4
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
