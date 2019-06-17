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
  br label %269

; <label>:26:                                     ; preds = %0
  %27 = load i32, i32* %2, align 4
  %28 = icmp slt i32 2, %27
  %29 = zext i1 %28 to i32
  %30 = icmp eq i32 0, %29
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %26
  store i32 0, i32* %1, align 4
  br label %269

; <label>:32:                                     ; preds = %26
  %33 = load i32, i32* %2, align 4
  %34 = srem i32 %33, 7
  %35 = icmp eq i32 0, %34
  %36 = zext i1 %35 to i32
  %37 = load i32, i32* %2, align 4
  %38 = icmp slt i32 9, %37
  %39 = zext i1 %38 to i32
  %40 = and i32 %36, %39
  %41 = load i32, i32* %2, align 4
  %42 = srem i32 %41, 12
  %43 = icmp eq i32 0, %42
  %44 = zext i1 %43 to i32
  %45 = icmp eq i32 0, %44
  %46 = zext i1 %45 to i32
  %47 = and i32 %40, %46
  %48 = load i32, i32* %2, align 4
  %49 = srem i32 %48, 3
  %50 = icmp eq i32 0, %49
  %51 = zext i1 %50 to i32
  %52 = icmp eq i32 0, %51
  %53 = zext i1 %52 to i32
  %54 = and i32 %47, %53
  %55 = load i32, i32* %2, align 4
  %56 = icmp slt i32 6, %55
  %57 = zext i1 %56 to i32
  %58 = and i32 %54, %57
  %59 = load i32, i32* %2, align 4
  %60 = icmp slt i32 2, %59
  %61 = zext i1 %60 to i32
  %62 = and i32 %58, %61
  %63 = load i32, i32* %2, align 4
  %64 = icmp slt i32 10, %63
  %65 = zext i1 %64 to i32
  %66 = and i32 %62, %65
  %67 = load i32, i32* %2, align 4
  %68 = icmp slt i32 14, %67
  %69 = zext i1 %68 to i32
  %70 = icmp eq i32 0, %69
  %71 = zext i1 %70 to i32
  %72 = and i32 %66, %71
  %73 = and i32 %72, 1
  %74 = load i32, i32* %2, align 4
  %75 = icmp slt i32 5, %74
  %76 = zext i1 %75 to i32
  %77 = and i32 %73, %76
  %78 = load i32, i32* %2, align 4
  %79 = srem i32 %78, 11
  %80 = icmp eq i32 0, %79
  %81 = zext i1 %80 to i32
  %82 = icmp eq i32 0, %81
  %83 = zext i1 %82 to i32
  %84 = and i32 %77, %83
  %85 = load i32, i32* %2, align 4
  %86 = srem i32 %85, 13
  %87 = icmp eq i32 0, %86
  %88 = zext i1 %87 to i32
  %89 = icmp eq i32 0, %88
  %90 = zext i1 %89 to i32
  %91 = and i32 %84, %90
  %92 = load i32, i32* %2, align 4
  %93 = srem i32 %92, 9
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = icmp eq i32 0, %95
  %97 = zext i1 %96 to i32
  %98 = and i32 %91, %97
  %99 = load i32, i32* %2, align 4
  %100 = icmp slt i32 8, %99
  %101 = zext i1 %100 to i32
  %102 = and i32 %98, %101
  %103 = load i32, i32* %2, align 4
  %104 = srem i32 %103, 8
  %105 = icmp eq i32 0, %104
  %106 = zext i1 %105 to i32
  %107 = icmp eq i32 0, %106
  %108 = zext i1 %107 to i32
  %109 = and i32 %102, %108
  %110 = load i32, i32* %2, align 4
  %111 = srem i32 %110, 10
  %112 = icmp eq i32 0, %111
  %113 = zext i1 %112 to i32
  %114 = icmp eq i32 0, %113
  %115 = zext i1 %114 to i32
  %116 = and i32 %109, %115
  %117 = load i32, i32* %2, align 4
  %118 = icmp slt i32 13, %117
  %119 = zext i1 %118 to i32
  %120 = and i32 %116, %119
  %121 = load i32, i32* %2, align 4
  %122 = srem i32 %121, 5
  %123 = icmp eq i32 0, %122
  %124 = zext i1 %123 to i32
  %125 = icmp eq i32 0, %124
  %126 = zext i1 %125 to i32
  %127 = and i32 %120, %126
  %128 = load i32, i32* %2, align 4
  %129 = srem i32 %128, 2
  %130 = icmp eq i32 0, %129
  %131 = zext i1 %130 to i32
  %132 = and i32 %127, %131
  %133 = load i32, i32* %2, align 4
  %134 = srem i32 %133, 6
  %135 = icmp eq i32 0, %134
  %136 = zext i1 %135 to i32
  %137 = icmp eq i32 0, %136
  %138 = zext i1 %137 to i32
  %139 = and i32 %132, %138
  %140 = load i32, i32* %2, align 4
  %141 = icmp slt i32 3, %140
  %142 = zext i1 %141 to i32
  %143 = and i32 %139, %142
  %144 = load i32, i32* %2, align 4
  %145 = icmp slt i32 11, %144
  %146 = zext i1 %145 to i32
  %147 = and i32 %143, %146
  %148 = load i32, i32* %2, align 4
  %149 = icmp slt i32 4, %148
  %150 = zext i1 %149 to i32
  %151 = and i32 %147, %150
  %152 = load i32, i32* %2, align 4
  %153 = srem i32 %152, 4
  %154 = icmp eq i32 0, %153
  %155 = zext i1 %154 to i32
  %156 = icmp eq i32 0, %155
  %157 = zext i1 %156 to i32
  %158 = and i32 %151, %157
  %159 = load i32, i32* %2, align 4
  %160 = icmp slt i32 12, %159
  %161 = zext i1 %160 to i32
  %162 = and i32 %158, %161
  %163 = load i32, i32* %2, align 4
  %164 = icmp slt i32 7, %163
  %165 = zext i1 %164 to i32
  %166 = and i32 %162, %165
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %169

; <label>:168:                                    ; preds = %32
  store i32 0, i32* %1, align 4
  br label %269

; <label>:169:                                    ; preds = %32
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i32 2, i32* %10, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %11, align 4
  br label %170

; <label>:170:                                    ; preds = %195, %169
  %171 = load i32, i32* %10, align 4
  %172 = load i32, i32* %2, align 4
  %173 = icmp slt i32 %171, %172
  br i1 %173, label %178, label %174

; <label>:174:                                    ; preds = %170
  %175 = load i32, i32* %10, align 4
  %176 = load i32, i32* %2, align 4
  %177 = icmp slt i32 %175, %176
  br label %178

; <label>:178:                                    ; preds = %174, %170
  %179 = phi i1 [ true, %170 ], [ %177, %174 ]
  br i1 %179, label %180, label %196

; <label>:180:                                    ; preds = %178
  %181 = load i32, i32* %10, align 4
  %182 = load i32, i32* %2, align 4
  %183 = icmp slt i32 %181, %182
  br i1 %183, label %184, label %195

; <label>:184:                                    ; preds = %180
  %185 = load i32, i32* %2, align 4
  %186 = load i32, i32* %10, align 4
  %int_cast_to_i64 = zext i32 %186 to i64
  call fastcc void @klee_div_zero_check(i64 %int_cast_to_i64)
  %187 = srem i32 %185, %186, !klee.check.div !7
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %189, label %192

; <label>:189:                                    ; preds = %184
  %190 = load i32, i32* %7, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* %7, align 4
  store i32 1, i32* %6, align 4
  br label %192

; <label>:192:                                    ; preds = %189, %184
  %193 = load i32, i32* %10, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %10, align 4
  br label %195

; <label>:195:                                    ; preds = %192, %180
  br label %170

; <label>:196:                                    ; preds = %178
  %197 = load i32, i32* %7, align 4
  store i32 %197, i32* %8, align 4
  %198 = load i32, i32* %6, align 4
  store i32 %198, i32* %9, align 4
  %199 = load i32, i32* %8, align 4
  %200 = icmp eq i32 0, %199
  %201 = zext i1 %200 to i32
  %202 = icmp eq i32 0, %201
  %203 = zext i1 %202 to i32
  %204 = load i32, i32* %9, align 4
  %205 = icmp eq i32 0, %204
  %206 = zext i1 %205 to i32
  %207 = icmp eq i32 0, %206
  %208 = zext i1 %207 to i32
  %209 = and i32 %203, %208
  %210 = load i32, i32* %8, align 4
  %211 = icmp eq i32 0, %210
  %212 = zext i1 %211 to i32
  %213 = load i32, i32* %9, align 4
  %214 = icmp eq i32 0, %213
  %215 = zext i1 %214 to i32
  %216 = and i32 %212, %215
  %217 = or i32 %209, %216
  %218 = load i32, i32* %8, align 4
  %219 = icmp eq i32 0, %218
  %220 = zext i1 %219 to i32
  %221 = load i32, i32* %9, align 4
  %222 = icmp eq i32 0, %221
  %223 = zext i1 %222 to i32
  %224 = icmp eq i32 0, %223
  %225 = zext i1 %224 to i32
  %226 = and i32 %220, %225
  %227 = load i32, i32* %4, align 4
  %228 = load i32, i32* %10, align 4
  %229 = add nsw i32 %227, %228
  %230 = load i32, i32* %4, align 4
  %231 = icmp eq i32 %229, %230
  %232 = zext i1 %231 to i32
  %233 = and i32 %226, %232
  %234 = or i32 %217, %233
  %235 = load i32, i32* %8, align 4
  %236 = icmp eq i32 0, %235
  %237 = zext i1 %236 to i32
  %238 = icmp eq i32 0, %237
  %239 = zext i1 %238 to i32
  %240 = load i32, i32* %9, align 4
  %241 = icmp eq i32 0, %240
  %242 = zext i1 %241 to i32
  %243 = and i32 %239, %242
  %244 = load i32, i32* %4, align 4
  %245 = load i32, i32* %4, align 4
  %246 = load i32, i32* %10, align 4
  %247 = add nsw i32 %245, %246
  %248 = icmp eq i32 %244, %247
  %249 = zext i1 %248 to i32
  %250 = and i32 %243, %249
  %251 = or i32 %234, %250
  %252 = load i32, i32* %8, align 4
  %253 = load i32, i32* %9, align 4
  %254 = icmp eq i32 %252, %253
  %255 = zext i1 %254 to i32
  %256 = or i32 %251, %255
  %257 = icmp ne i32 %256, 0
  %258 = xor i1 %257, true
  %259 = zext i1 %258 to i32
  %260 = call i32 (i32, ...) bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %259)
  %261 = load i32, i32* %2, align 4
  %262 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %261)
  %263 = load i32, i32* %3, align 4
  %264 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %263)
  %265 = load i32, i32* %5, align 4
  %266 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %265)
  %267 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.3, i32 0, i32 0), i32 %262, i32 %264, i32 %266)
  %268 = call i32 (i8*, ...) bitcast (i32 (...)* @perror to i32 (i8*, ...)*)(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0))
  call void @abort() #5
  unreachable

; <label>:269:                                    ; preds = %168, %31, %25
  %270 = load i32, i32* %1, align 4
  ret i32 %270
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
