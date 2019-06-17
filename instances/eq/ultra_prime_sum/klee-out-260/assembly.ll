; ModuleID = 'klee_merged_0.bc'
source_filename = "klee_merged_0.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"n__CLEVER_EXT\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"i__CLEVER_EXT\00", align 1
@.str.3 = private unnamed_addr constant [44 x i8] c"CEX a=%d,n__CLEVER_EXT=%d,i__CLEVER_EXT=%d\0A\00", align 1
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
  %13 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %4, i64 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0))
  %14 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %5, i64 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0))
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %4, align 4
  %17 = icmp sle i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = load i32, i32* %2, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp eq i32 %19, %20
  %22 = zext i1 %21 to i32
  %23 = and i32 %18, %22
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %26, label %25

; <label>:25:                                     ; preds = %0
  store i32 0, i32* %1, align 4
  br label %263

; <label>:26:                                     ; preds = %0
  %27 = load i32, i32* %2, align 4
  %28 = srem i32 %27, 8
  %29 = icmp eq i32 0, %28
  %30 = zext i1 %29 to i32
  %31 = icmp eq i32 0, %30
  %32 = zext i1 %31 to i32
  %33 = load i32, i32* %2, align 4
  %34 = srem i32 %33, 11
  %35 = icmp eq i32 0, %34
  %36 = zext i1 %35 to i32
  %37 = icmp eq i32 0, %36
  %38 = zext i1 %37 to i32
  %39 = and i32 %32, %38
  %40 = load i32, i32* %2, align 4
  %41 = icmp slt i32 6, %40
  %42 = zext i1 %41 to i32
  %43 = and i32 %39, %42
  %44 = load i32, i32* %2, align 4
  %45 = srem i32 %44, 10
  %46 = icmp eq i32 0, %45
  %47 = zext i1 %46 to i32
  %48 = icmp eq i32 0, %47
  %49 = zext i1 %48 to i32
  %50 = and i32 %43, %49
  %51 = load i32, i32* %2, align 4
  %52 = icmp slt i32 13, %51
  %53 = zext i1 %52 to i32
  %54 = and i32 %50, %53
  %55 = load i32, i32* %2, align 4
  %56 = srem i32 %55, 7
  %57 = icmp eq i32 0, %56
  %58 = zext i1 %57 to i32
  %59 = and i32 %54, %58
  %60 = load i32, i32* %2, align 4
  %61 = srem i32 %60, 5
  %62 = icmp eq i32 0, %61
  %63 = zext i1 %62 to i32
  %64 = icmp eq i32 0, %63
  %65 = zext i1 %64 to i32
  %66 = and i32 %59, %65
  %67 = load i32, i32* %2, align 4
  %68 = icmp slt i32 14, %67
  %69 = zext i1 %68 to i32
  %70 = icmp eq i32 0, %69
  %71 = zext i1 %70 to i32
  %72 = and i32 %66, %71
  %73 = load i32, i32* %2, align 4
  %74 = srem i32 %73, 6
  %75 = icmp eq i32 0, %74
  %76 = zext i1 %75 to i32
  %77 = icmp eq i32 0, %76
  %78 = zext i1 %77 to i32
  %79 = and i32 %72, %78
  %80 = load i32, i32* %2, align 4
  %81 = icmp slt i32 7, %80
  %82 = zext i1 %81 to i32
  %83 = and i32 %79, %82
  %84 = and i32 %83, 1
  %85 = load i32, i32* %2, align 4
  %86 = srem i32 %85, 3
  %87 = icmp eq i32 0, %86
  %88 = zext i1 %87 to i32
  %89 = icmp eq i32 0, %88
  %90 = zext i1 %89 to i32
  %91 = and i32 %84, %90
  %92 = load i32, i32* %2, align 4
  %93 = srem i32 %92, 4
  %94 = icmp eq i32 0, %93
  %95 = zext i1 %94 to i32
  %96 = icmp eq i32 0, %95
  %97 = zext i1 %96 to i32
  %98 = and i32 %91, %97
  %99 = load i32, i32* %2, align 4
  %100 = icmp slt i32 10, %99
  %101 = zext i1 %100 to i32
  %102 = and i32 %98, %101
  %103 = load i32, i32* %2, align 4
  %104 = icmp slt i32 12, %103
  %105 = zext i1 %104 to i32
  %106 = and i32 %102, %105
  %107 = load i32, i32* %2, align 4
  %108 = srem i32 %107, 2
  %109 = icmp eq i32 0, %108
  %110 = zext i1 %109 to i32
  %111 = and i32 %106, %110
  %112 = load i32, i32* %2, align 4
  %113 = icmp slt i32 9, %112
  %114 = zext i1 %113 to i32
  %115 = and i32 %111, %114
  %116 = load i32, i32* %2, align 4
  %117 = srem i32 %116, 9
  %118 = icmp eq i32 0, %117
  %119 = zext i1 %118 to i32
  %120 = icmp eq i32 0, %119
  %121 = zext i1 %120 to i32
  %122 = and i32 %115, %121
  %123 = load i32, i32* %2, align 4
  %124 = icmp slt i32 3, %123
  %125 = zext i1 %124 to i32
  %126 = and i32 %122, %125
  %127 = load i32, i32* %2, align 4
  %128 = icmp slt i32 2, %127
  %129 = zext i1 %128 to i32
  %130 = and i32 %126, %129
  %131 = load i32, i32* %2, align 4
  %132 = icmp slt i32 4, %131
  %133 = zext i1 %132 to i32
  %134 = and i32 %130, %133
  %135 = load i32, i32* %2, align 4
  %136 = srem i32 %135, 13
  %137 = icmp eq i32 0, %136
  %138 = zext i1 %137 to i32
  %139 = icmp eq i32 0, %138
  %140 = zext i1 %139 to i32
  %141 = and i32 %134, %140
  %142 = load i32, i32* %2, align 4
  %143 = srem i32 %142, 12
  %144 = icmp eq i32 0, %143
  %145 = zext i1 %144 to i32
  %146 = icmp eq i32 0, %145
  %147 = zext i1 %146 to i32
  %148 = and i32 %141, %147
  %149 = load i32, i32* %2, align 4
  %150 = icmp slt i32 11, %149
  %151 = zext i1 %150 to i32
  %152 = and i32 %148, %151
  %153 = load i32, i32* %2, align 4
  %154 = icmp slt i32 5, %153
  %155 = zext i1 %154 to i32
  %156 = and i32 %152, %155
  %157 = load i32, i32* %2, align 4
  %158 = icmp slt i32 8, %157
  %159 = zext i1 %158 to i32
  %160 = and i32 %156, %159
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %162, label %163

; <label>:162:                                    ; preds = %26
  store i32 0, i32* %1, align 4
  br label %263

; <label>:163:                                    ; preds = %26
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i32 2, i32* %10, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %11, align 4
  br label %164

; <label>:164:                                    ; preds = %189, %163
  %165 = load i32, i32* %10, align 4
  %166 = load i32, i32* %2, align 4
  %167 = icmp slt i32 %165, %166
  br i1 %167, label %172, label %168

; <label>:168:                                    ; preds = %164
  %169 = load i32, i32* %10, align 4
  %170 = load i32, i32* %2, align 4
  %171 = icmp slt i32 %169, %170
  br label %172

; <label>:172:                                    ; preds = %168, %164
  %173 = phi i1 [ true, %164 ], [ %171, %168 ]
  br i1 %173, label %174, label %190

; <label>:174:                                    ; preds = %172
  %175 = load i32, i32* %10, align 4
  %176 = load i32, i32* %2, align 4
  %177 = icmp slt i32 %175, %176
  br i1 %177, label %178, label %189

; <label>:178:                                    ; preds = %174
  %179 = load i32, i32* %2, align 4
  %180 = load i32, i32* %10, align 4
  %int_cast_to_i64 = zext i32 %180 to i64
  call fastcc void @klee_div_zero_check(i64 %int_cast_to_i64)
  %181 = srem i32 %179, %180, !klee.check.div !7
  %182 = icmp ne i32 %181, 0
  br i1 %182, label %183, label %186

; <label>:183:                                    ; preds = %178
  %184 = load i32, i32* %7, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %7, align 4
  store i32 1, i32* %6, align 4
  br label %186

; <label>:186:                                    ; preds = %183, %178
  %187 = load i32, i32* %10, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %10, align 4
  br label %189

; <label>:189:                                    ; preds = %186, %174
  br label %164

; <label>:190:                                    ; preds = %172
  %191 = load i32, i32* %7, align 4
  store i32 %191, i32* %8, align 4
  %192 = load i32, i32* %6, align 4
  store i32 %192, i32* %9, align 4
  %193 = load i32, i32* %8, align 4
  %194 = icmp eq i32 0, %193
  %195 = zext i1 %194 to i32
  %196 = load i32, i32* %9, align 4
  %197 = icmp eq i32 0, %196
  %198 = zext i1 %197 to i32
  %199 = and i32 %195, %198
  %200 = load i32, i32* %8, align 4
  %201 = icmp eq i32 0, %200
  %202 = zext i1 %201 to i32
  %203 = icmp eq i32 0, %202
  %204 = zext i1 %203 to i32
  %205 = load i32, i32* %9, align 4
  %206 = icmp eq i32 0, %205
  %207 = zext i1 %206 to i32
  %208 = and i32 %204, %207
  %209 = load i32, i32* %3, align 4
  %210 = load i32, i32* %3, align 4
  %211 = load i32, i32* %10, align 4
  %212 = add nsw i32 %210, %211
  %213 = icmp eq i32 %209, %212
  %214 = zext i1 %213 to i32
  %215 = and i32 %208, %214
  %216 = or i32 %199, %215
  %217 = load i32, i32* %8, align 4
  %218 = icmp eq i32 0, %217
  %219 = zext i1 %218 to i32
  %220 = load i32, i32* %9, align 4
  %221 = icmp eq i32 0, %220
  %222 = zext i1 %221 to i32
  %223 = icmp eq i32 0, %222
  %224 = zext i1 %223 to i32
  %225 = and i32 %219, %224
  %226 = load i32, i32* %3, align 4
  %227 = load i32, i32* %10, align 4
  %228 = add nsw i32 %226, %227
  %229 = load i32, i32* %3, align 4
  %230 = icmp eq i32 %228, %229
  %231 = zext i1 %230 to i32
  %232 = and i32 %225, %231
  %233 = or i32 %216, %232
  %234 = load i32, i32* %8, align 4
  %235 = icmp eq i32 0, %234
  %236 = zext i1 %235 to i32
  %237 = icmp eq i32 0, %236
  %238 = zext i1 %237 to i32
  %239 = load i32, i32* %9, align 4
  %240 = icmp eq i32 0, %239
  %241 = zext i1 %240 to i32
  %242 = icmp eq i32 0, %241
  %243 = zext i1 %242 to i32
  %244 = and i32 %238, %243
  %245 = or i32 %233, %244
  %246 = load i32, i32* %8, align 4
  %247 = load i32, i32* %9, align 4
  %248 = icmp eq i32 %246, %247
  %249 = zext i1 %248 to i32
  %250 = or i32 %245, %249
  %251 = icmp ne i32 %250, 0
  %252 = xor i1 %251, true
  %253 = zext i1 %252 to i32
  %254 = call i32 (i32, ...) bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %253)
  %255 = load i32, i32* %2, align 4
  %256 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %255)
  %257 = load i32, i32* %4, align 4
  %258 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %257)
  %259 = load i32, i32* %5, align 4
  %260 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %259)
  %261 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.3, i32 0, i32 0), i32 %256, i32 %258, i32 %260)
  %262 = call i32 (i8*, ...) bitcast (i32 (...)* @perror to i32 (i8*, ...)*)(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i32 0, i32 0))
  call void @abort() #5
  unreachable

; <label>:263:                                    ; preds = %162, %25
  %264 = load i32, i32* %1, align 4
  ret i32 %264
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
