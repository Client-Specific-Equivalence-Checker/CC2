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
  %13 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %3, i64 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0))
  %14 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %4, i64 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0))
  %15 = load i32, i32* %4, align 4
  %16 = load i32, i32* %3, align 4
  %17 = icmp sle i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = load i32, i32* %2, align 4
  %20 = load i32, i32* %4, align 4
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
  %28 = icmp slt i32 12, %27
  %29 = zext i1 %28 to i32
  %30 = load i32, i32* %2, align 4
  %31 = srem i32 %30, 11
  %32 = icmp eq i32 0, %31
  %33 = zext i1 %32 to i32
  %34 = icmp eq i32 0, %33
  %35 = zext i1 %34 to i32
  %36 = and i32 %29, %35
  %37 = load i32, i32* %2, align 4
  %38 = icmp slt i32 3, %37
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
  %56 = srem i32 %55, 10
  %57 = icmp eq i32 0, %56
  %58 = zext i1 %57 to i32
  %59 = icmp eq i32 0, %58
  %60 = zext i1 %59 to i32
  %61 = and i32 %54, %60
  %62 = load i32, i32* %2, align 4
  %63 = icmp slt i32 5, %62
  %64 = zext i1 %63 to i32
  %65 = and i32 %61, %64
  %66 = load i32, i32* %2, align 4
  %67 = icmp slt i32 10, %66
  %68 = zext i1 %67 to i32
  %69 = and i32 %65, %68
  %70 = load i32, i32* %2, align 4
  %71 = icmp slt i32 2, %70
  %72 = zext i1 %71 to i32
  %73 = and i32 %69, %72
  %74 = load i32, i32* %2, align 4
  %75 = srem i32 %74, 9
  %76 = icmp eq i32 0, %75
  %77 = zext i1 %76 to i32
  %78 = icmp eq i32 0, %77
  %79 = zext i1 %78 to i32
  %80 = and i32 %73, %79
  %81 = load i32, i32* %2, align 4
  %82 = icmp slt i32 9, %81
  %83 = zext i1 %82 to i32
  %84 = and i32 %80, %83
  %85 = load i32, i32* %2, align 4
  %86 = icmp slt i32 14, %85
  %87 = zext i1 %86 to i32
  %88 = icmp eq i32 0, %87
  %89 = zext i1 %88 to i32
  %90 = and i32 %84, %89
  %91 = load i32, i32* %2, align 4
  %92 = icmp slt i32 7, %91
  %93 = zext i1 %92 to i32
  %94 = and i32 %90, %93
  %95 = load i32, i32* %2, align 4
  %96 = srem i32 %95, 6
  %97 = icmp eq i32 0, %96
  %98 = zext i1 %97 to i32
  %99 = icmp eq i32 0, %98
  %100 = zext i1 %99 to i32
  %101 = and i32 %94, %100
  %102 = load i32, i32* %2, align 4
  %103 = icmp slt i32 6, %102
  %104 = zext i1 %103 to i32
  %105 = and i32 %101, %104
  %106 = load i32, i32* %2, align 4
  %107 = srem i32 %106, 13
  %108 = icmp eq i32 0, %107
  %109 = zext i1 %108 to i32
  %110 = icmp eq i32 0, %109
  %111 = zext i1 %110 to i32
  %112 = and i32 %105, %111
  %113 = load i32, i32* %2, align 4
  %114 = srem i32 %113, 5
  %115 = icmp eq i32 0, %114
  %116 = zext i1 %115 to i32
  %117 = icmp eq i32 0, %116
  %118 = zext i1 %117 to i32
  %119 = and i32 %112, %118
  %120 = load i32, i32* %2, align 4
  %121 = icmp slt i32 11, %120
  %122 = zext i1 %121 to i32
  %123 = and i32 %119, %122
  %124 = load i32, i32* %2, align 4
  %125 = srem i32 %124, 7
  %126 = icmp eq i32 0, %125
  %127 = zext i1 %126 to i32
  %128 = and i32 %123, %127
  %129 = load i32, i32* %2, align 4
  %130 = icmp slt i32 13, %129
  %131 = zext i1 %130 to i32
  %132 = and i32 %128, %131
  %133 = load i32, i32* %2, align 4
  %134 = srem i32 %133, 2
  %135 = icmp eq i32 0, %134
  %136 = zext i1 %135 to i32
  %137 = and i32 %132, %136
  %138 = and i32 %137, 1
  %139 = load i32, i32* %2, align 4
  %140 = icmp slt i32 4, %139
  %141 = zext i1 %140 to i32
  %142 = and i32 %138, %141
  %143 = load i32, i32* %2, align 4
  %144 = srem i32 %143, 8
  %145 = icmp eq i32 0, %144
  %146 = zext i1 %145 to i32
  %147 = icmp eq i32 0, %146
  %148 = zext i1 %147 to i32
  %149 = and i32 %142, %148
  %150 = load i32, i32* %2, align 4
  %151 = srem i32 %150, 4
  %152 = icmp eq i32 0, %151
  %153 = zext i1 %152 to i32
  %154 = icmp eq i32 0, %153
  %155 = zext i1 %154 to i32
  %156 = and i32 %149, %155
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
  %201 = load i32, i32* %9, align 4
  %202 = icmp eq i32 %200, %201
  %203 = zext i1 %202 to i32
  %204 = or i32 %199, %203
  %205 = load i32, i32* %8, align 4
  %206 = icmp eq i32 0, %205
  %207 = zext i1 %206 to i32
  %208 = load i32, i32* %9, align 4
  %209 = icmp eq i32 0, %208
  %210 = zext i1 %209 to i32
  %211 = icmp eq i32 0, %210
  %212 = zext i1 %211 to i32
  %213 = and i32 %207, %212
  %214 = load i32, i32* %5, align 4
  %215 = load i32, i32* %10, align 4
  %216 = add nsw i32 %214, %215
  %217 = load i32, i32* %5, align 4
  %218 = icmp eq i32 %216, %217
  %219 = zext i1 %218 to i32
  %220 = and i32 %213, %219
  %221 = or i32 %204, %220
  %222 = load i32, i32* %8, align 4
  %223 = icmp eq i32 0, %222
  %224 = zext i1 %223 to i32
  %225 = icmp eq i32 0, %224
  %226 = zext i1 %225 to i32
  %227 = load i32, i32* %9, align 4
  %228 = icmp eq i32 0, %227
  %229 = zext i1 %228 to i32
  %230 = and i32 %226, %229
  %231 = load i32, i32* %5, align 4
  %232 = load i32, i32* %5, align 4
  %233 = load i32, i32* %10, align 4
  %234 = add nsw i32 %232, %233
  %235 = icmp eq i32 %231, %234
  %236 = zext i1 %235 to i32
  %237 = and i32 %230, %236
  %238 = or i32 %221, %237
  %239 = load i32, i32* %8, align 4
  %240 = icmp eq i32 0, %239
  %241 = zext i1 %240 to i32
  %242 = icmp eq i32 0, %241
  %243 = zext i1 %242 to i32
  %244 = load i32, i32* %9, align 4
  %245 = icmp eq i32 0, %244
  %246 = zext i1 %245 to i32
  %247 = icmp eq i32 0, %246
  %248 = zext i1 %247 to i32
  %249 = and i32 %243, %248
  %250 = or i32 %238, %249
  %251 = icmp ne i32 %250, 0
  %252 = xor i1 %251, true
  %253 = zext i1 %252 to i32
  %254 = call i32 (i32, ...) bitcast (i32 (...)* @klee_assume to i32 (i32, ...)*)(i32 %253)
  %255 = load i32, i32* %2, align 4
  %256 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %255)
  %257 = load i32, i32* %3, align 4
  %258 = call i32 (i32, ...) bitcast (i32 (...)* @klee_get_valued to i32 (i32, ...)*)(i32 %257)
  %259 = load i32, i32* %4, align 4
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
