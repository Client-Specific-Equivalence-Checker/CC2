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
  br label %212

; <label>:16:                                     ; preds = %0
  %17 = load i32, i32* %2, align 4
  %18 = icmp slt i32 2, %17
  %19 = zext i1 %18 to i32
  %20 = icmp eq i32 0, %19
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %16
  store i32 0, i32* %1, align 4
  br label %212

; <label>:22:                                     ; preds = %16
  %23 = load i32, i32* %2, align 4
  %24 = srem i32 %23, 7
  %25 = icmp eq i32 0, %24
  %26 = zext i1 %25 to i32
  %27 = load i32, i32* %2, align 4
  %28 = icmp slt i32 9, %27
  %29 = zext i1 %28 to i32
  %30 = and i32 %26, %29
  %31 = load i32, i32* %2, align 4
  %32 = srem i32 %31, 12
  %33 = icmp eq i32 0, %32
  %34 = zext i1 %33 to i32
  %35 = icmp eq i32 0, %34
  %36 = zext i1 %35 to i32
  %37 = and i32 %30, %36
  %38 = load i32, i32* %2, align 4
  %39 = srem i32 %38, 3
  %40 = icmp eq i32 0, %39
  %41 = zext i1 %40 to i32
  %42 = icmp eq i32 0, %41
  %43 = zext i1 %42 to i32
  %44 = and i32 %37, %43
  %45 = load i32, i32* %2, align 4
  %46 = icmp slt i32 6, %45
  %47 = zext i1 %46 to i32
  %48 = and i32 %44, %47
  %49 = load i32, i32* %2, align 4
  %50 = icmp slt i32 2, %49
  %51 = zext i1 %50 to i32
  %52 = and i32 %48, %51
  %53 = load i32, i32* %2, align 4
  %54 = icmp slt i32 10, %53
  %55 = zext i1 %54 to i32
  %56 = and i32 %52, %55
  %57 = load i32, i32* %2, align 4
  %58 = icmp slt i32 14, %57
  %59 = zext i1 %58 to i32
  %60 = icmp eq i32 0, %59
  %61 = zext i1 %60 to i32
  %62 = and i32 %56, %61
  %63 = and i32 %62, 1
  %64 = load i32, i32* %2, align 4
  %65 = icmp slt i32 5, %64
  %66 = zext i1 %65 to i32
  %67 = and i32 %63, %66
  %68 = load i32, i32* %2, align 4
  %69 = srem i32 %68, 11
  %70 = icmp eq i32 0, %69
  %71 = zext i1 %70 to i32
  %72 = icmp eq i32 0, %71
  %73 = zext i1 %72 to i32
  %74 = and i32 %67, %73
  %75 = load i32, i32* %2, align 4
  %76 = srem i32 %75, 13
  %77 = icmp eq i32 0, %76
  %78 = zext i1 %77 to i32
  %79 = icmp eq i32 0, %78
  %80 = zext i1 %79 to i32
  %81 = and i32 %74, %80
  %82 = load i32, i32* %2, align 4
  %83 = srem i32 %82, 9
  %84 = icmp eq i32 0, %83
  %85 = zext i1 %84 to i32
  %86 = icmp eq i32 0, %85
  %87 = zext i1 %86 to i32
  %88 = and i32 %81, %87
  %89 = load i32, i32* %2, align 4
  %90 = icmp slt i32 8, %89
  %91 = zext i1 %90 to i32
  %92 = and i32 %88, %91
  %93 = load i32, i32* %2, align 4
  %94 = srem i32 %93, 8
  %95 = icmp eq i32 0, %94
  %96 = zext i1 %95 to i32
  %97 = icmp eq i32 0, %96
  %98 = zext i1 %97 to i32
  %99 = and i32 %92, %98
  %100 = load i32, i32* %2, align 4
  %101 = srem i32 %100, 10
  %102 = icmp eq i32 0, %101
  %103 = zext i1 %102 to i32
  %104 = icmp eq i32 0, %103
  %105 = zext i1 %104 to i32
  %106 = and i32 %99, %105
  %107 = load i32, i32* %2, align 4
  %108 = icmp slt i32 13, %107
  %109 = zext i1 %108 to i32
  %110 = and i32 %106, %109
  %111 = load i32, i32* %2, align 4
  %112 = srem i32 %111, 5
  %113 = icmp eq i32 0, %112
  %114 = zext i1 %113 to i32
  %115 = icmp eq i32 0, %114
  %116 = zext i1 %115 to i32
  %117 = and i32 %110, %116
  %118 = load i32, i32* %2, align 4
  %119 = srem i32 %118, 2
  %120 = icmp eq i32 0, %119
  %121 = zext i1 %120 to i32
  %122 = and i32 %117, %121
  %123 = load i32, i32* %2, align 4
  %124 = srem i32 %123, 6
  %125 = icmp eq i32 0, %124
  %126 = zext i1 %125 to i32
  %127 = icmp eq i32 0, %126
  %128 = zext i1 %127 to i32
  %129 = and i32 %122, %128
  %130 = load i32, i32* %2, align 4
  %131 = icmp slt i32 3, %130
  %132 = zext i1 %131 to i32
  %133 = and i32 %129, %132
  %134 = load i32, i32* %2, align 4
  %135 = icmp slt i32 11, %134
  %136 = zext i1 %135 to i32
  %137 = and i32 %133, %136
  %138 = load i32, i32* %2, align 4
  %139 = icmp slt i32 4, %138
  %140 = zext i1 %139 to i32
  %141 = and i32 %137, %140
  %142 = load i32, i32* %2, align 4
  %143 = srem i32 %142, 4
  %144 = icmp eq i32 0, %143
  %145 = zext i1 %144 to i32
  %146 = icmp eq i32 0, %145
  %147 = zext i1 %146 to i32
  %148 = and i32 %141, %147
  %149 = load i32, i32* %2, align 4
  %150 = icmp slt i32 12, %149
  %151 = zext i1 %150 to i32
  %152 = and i32 %148, %151
  %153 = load i32, i32* %2, align 4
  %154 = icmp slt i32 7, %153
  %155 = zext i1 %154 to i32
  %156 = and i32 %152, %155
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %158, label %159

; <label>:158:                                    ; preds = %22
  store i32 0, i32* %1, align 4
  br label %212

; <label>:159:                                    ; preds = %22
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  store i32 2, i32* %8, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %9, align 4
  br label %160

; <label>:160:                                    ; preds = %185, %159
  %161 = load i32, i32* %8, align 4
  %162 = load i32, i32* %2, align 4
  %163 = icmp slt i32 %161, %162
  br i1 %163, label %168, label %164

; <label>:164:                                    ; preds = %160
  %165 = load i32, i32* %8, align 4
  %166 = load i32, i32* %2, align 4
  %167 = icmp slt i32 %165, %166
  br label %168

; <label>:168:                                    ; preds = %164, %160
  %169 = phi i1 [ true, %160 ], [ %167, %164 ]
  br i1 %169, label %170, label %186

; <label>:170:                                    ; preds = %168
  %171 = load i32, i32* %8, align 4
  %172 = load i32, i32* %2, align 4
  %173 = icmp slt i32 %171, %172
  br i1 %173, label %174, label %185

; <label>:174:                                    ; preds = %170
  %175 = load i32, i32* %2, align 4
  %176 = load i32, i32* %8, align 4
  %int_cast_to_i64 = zext i32 %176 to i64
  call fastcc void @klee_div_zero_check(i64 %int_cast_to_i64)
  %177 = srem i32 %175, %176, !klee.check.div !7
  %178 = icmp ne i32 %177, 0
  br i1 %178, label %179, label %182

; <label>:179:                                    ; preds = %174
  %180 = load i32, i32* %5, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* %5, align 4
  store i32 1, i32* %4, align 4
  br label %182

; <label>:182:                                    ; preds = %179, %174
  %183 = load i32, i32* %8, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, i32* %8, align 4
  br label %185

; <label>:185:                                    ; preds = %182, %170
  br label %160

; <label>:186:                                    ; preds = %168
  %187 = load i32, i32* %5, align 4
  store i32 %187, i32* %6, align 4
  %188 = load i32, i32* %4, align 4
  store i32 %188, i32* %7, align 4
  %189 = load i32, i32* %6, align 4
  %190 = icmp eq i32 0, %189
  %191 = zext i1 %190 to i32
  %192 = load i32, i32* %7, align 4
  %193 = icmp eq i32 0, %192
  %194 = zext i1 %193 to i32
  %195 = icmp eq i32 %191, %194
  %196 = zext i1 %195 to i32
  %197 = load i32, i32* %6, align 4
  %198 = load i32, i32* %7, align 4
  %199 = icmp eq i32 %197, %198
  %200 = zext i1 %199 to i32
  %201 = or i32 %196, %200
  %202 = icmp ne i32 %201, 0
  %203 = xor i1 %202, true
  %204 = zext i1 %203 to i32
  %205 = call i32 (i32, ...) bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %204)
  %206 = load i32, i32* %2, align 4
  %207 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %206)
  %208 = load i32, i32* %3, align 4
  %209 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %208)
  %210 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0), i32 %207, i32 %209)
  %211 = call i32 (i8*, ...) bitcast (i32 (...)* @perror to i32 (i8*, ...)*)(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0))
  call void @abort() #5
  unreachable

; <label>:212:                                    ; preds = %158, %21, %15
  %213 = load i32, i32* %1, align 4
  ret i32 %213
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
