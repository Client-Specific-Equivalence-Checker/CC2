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
  %13 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %4, i64 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0))
  %14 = call i32 (i32*, i64, i8*, ...) bitcast (i32 (...)* @klee_make_symbolic to i32 (i32*, i64, i8*, ...)*)(i32* %5, i64 4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0))
  %15 = load i32, i32* %4, align 4
  %16 = load i32, i32* %5, align 4
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
  %28 = srem i32 %27, 8
  %29 = icmp eq i32 0, %28
  %30 = zext i1 %29 to i32
  %31 = icmp eq i32 0, %30
  %32 = zext i1 %31 to i32
  %33 = load i32, i32* %2, align 4
  %34 = icmp slt i32 14, %33
  %35 = zext i1 %34 to i32
  %36 = icmp eq i32 0, %35
  %37 = zext i1 %36 to i32
  %38 = and i32 %32, %37
  %39 = load i32, i32* %2, align 4
  %40 = icmp slt i32 9, %39
  %41 = zext i1 %40 to i32
  %42 = and i32 %38, %41
  %43 = load i32, i32* %2, align 4
  %44 = srem i32 %43, 6
  %45 = icmp eq i32 0, %44
  %46 = zext i1 %45 to i32
  %47 = icmp eq i32 0, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %42, %48
  %50 = load i32, i32* %2, align 4
  %51 = icmp slt i32 4, %50
  %52 = zext i1 %51 to i32
  %53 = and i32 %49, %52
  %54 = load i32, i32* %2, align 4
  %55 = icmp slt i32 10, %54
  %56 = zext i1 %55 to i32
  %57 = and i32 %53, %56
  %58 = load i32, i32* %2, align 4
  %59 = icmp slt i32 13, %58
  %60 = zext i1 %59 to i32
  %61 = and i32 %57, %60
  %62 = load i32, i32* %2, align 4
  %63 = srem i32 %62, 9
  %64 = icmp eq i32 0, %63
  %65 = zext i1 %64 to i32
  %66 = icmp eq i32 0, %65
  %67 = zext i1 %66 to i32
  %68 = and i32 %61, %67
  %69 = load i32, i32* %2, align 4
  %70 = srem i32 %69, 12
  %71 = icmp eq i32 0, %70
  %72 = zext i1 %71 to i32
  %73 = icmp eq i32 0, %72
  %74 = zext i1 %73 to i32
  %75 = and i32 %68, %74
  %76 = load i32, i32* %2, align 4
  %77 = icmp slt i32 2, %76
  %78 = zext i1 %77 to i32
  %79 = and i32 %75, %78
  %80 = load i32, i32* %2, align 4
  %81 = icmp slt i32 3, %80
  %82 = zext i1 %81 to i32
  %83 = and i32 %79, %82
  %84 = load i32, i32* %2, align 4
  %85 = srem i32 %84, 7
  %86 = icmp eq i32 0, %85
  %87 = zext i1 %86 to i32
  %88 = and i32 %83, %87
  %89 = load i32, i32* %2, align 4
  %90 = srem i32 %89, 13
  %91 = icmp eq i32 0, %90
  %92 = zext i1 %91 to i32
  %93 = icmp eq i32 0, %92
  %94 = zext i1 %93 to i32
  %95 = and i32 %88, %94
  %96 = and i32 %95, 1
  %97 = load i32, i32* %2, align 4
  %98 = icmp slt i32 7, %97
  %99 = zext i1 %98 to i32
  %100 = and i32 %96, %99
  %101 = load i32, i32* %2, align 4
  %102 = srem i32 %101, 3
  %103 = icmp eq i32 0, %102
  %104 = zext i1 %103 to i32
  %105 = icmp eq i32 0, %104
  %106 = zext i1 %105 to i32
  %107 = and i32 %100, %106
  %108 = load i32, i32* %2, align 4
  %109 = icmp slt i32 6, %108
  %110 = zext i1 %109 to i32
  %111 = and i32 %107, %110
  %112 = load i32, i32* %2, align 4
  %113 = srem i32 %112, 5
  %114 = icmp eq i32 0, %113
  %115 = zext i1 %114 to i32
  %116 = icmp eq i32 0, %115
  %117 = zext i1 %116 to i32
  %118 = and i32 %111, %117
  %119 = load i32, i32* %2, align 4
  %120 = srem i32 %119, 4
  %121 = icmp eq i32 0, %120
  %122 = zext i1 %121 to i32
  %123 = icmp eq i32 0, %122
  %124 = zext i1 %123 to i32
  %125 = and i32 %118, %124
  %126 = load i32, i32* %2, align 4
  %127 = srem i32 %126, 10
  %128 = icmp eq i32 0, %127
  %129 = zext i1 %128 to i32
  %130 = icmp eq i32 0, %129
  %131 = zext i1 %130 to i32
  %132 = and i32 %125, %131
  %133 = load i32, i32* %2, align 4
  %134 = icmp slt i32 5, %133
  %135 = zext i1 %134 to i32
  %136 = and i32 %132, %135
  %137 = load i32, i32* %2, align 4
  %138 = srem i32 %137, 11
  %139 = icmp eq i32 0, %138
  %140 = zext i1 %139 to i32
  %141 = icmp eq i32 0, %140
  %142 = zext i1 %141 to i32
  %143 = and i32 %136, %142
  %144 = load i32, i32* %2, align 4
  %145 = icmp slt i32 11, %144
  %146 = zext i1 %145 to i32
  %147 = and i32 %143, %146
  %148 = load i32, i32* %2, align 4
  %149 = icmp slt i32 8, %148
  %150 = zext i1 %149 to i32
  %151 = and i32 %147, %150
  %152 = load i32, i32* %2, align 4
  %153 = srem i32 %152, 2
  %154 = icmp eq i32 0, %153
  %155 = zext i1 %154 to i32
  %156 = and i32 %151, %155
  %157 = load i32, i32* %2, align 4
  %158 = icmp slt i32 12, %157
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
  %184 = load i32, i32* %6, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %6, align 4
  store i32 1, i32* %7, align 4
  br label %186

; <label>:186:                                    ; preds = %183, %178
  %187 = load i32, i32* %10, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %10, align 4
  br label %189

; <label>:189:                                    ; preds = %186, %174
  br label %164

; <label>:190:                                    ; preds = %172
  %191 = load i32, i32* %6, align 4
  store i32 %191, i32* %8, align 4
  %192 = load i32, i32* %7, align 4
  store i32 %192, i32* %9, align 4
  %193 = load i32, i32* %8, align 4
  %194 = icmp eq i32 0, %193
  %195 = zext i1 %194 to i32
  %196 = icmp eq i32 0, %195
  %197 = zext i1 %196 to i32
  %198 = load i32, i32* %9, align 4
  %199 = icmp eq i32 0, %198
  %200 = zext i1 %199 to i32
  %201 = icmp eq i32 0, %200
  %202 = zext i1 %201 to i32
  %203 = and i32 %197, %202
  %204 = load i32, i32* %8, align 4
  %205 = icmp eq i32 0, %204
  %206 = zext i1 %205 to i32
  %207 = load i32, i32* %9, align 4
  %208 = icmp eq i32 0, %207
  %209 = zext i1 %208 to i32
  %210 = icmp eq i32 0, %209
  %211 = zext i1 %210 to i32
  %212 = and i32 %206, %211
  %213 = load i32, i32* %3, align 4
  %214 = load i32, i32* %3, align 4
  %215 = load i32, i32* %10, align 4
  %216 = add nsw i32 %214, %215
  %217 = icmp eq i32 %213, %216
  %218 = zext i1 %217 to i32
  %219 = and i32 %212, %218
  %220 = or i32 %203, %219
  %221 = load i32, i32* %8, align 4
  %222 = load i32, i32* %9, align 4
  %223 = icmp eq i32 %221, %222
  %224 = zext i1 %223 to i32
  %225 = or i32 %220, %224
  %226 = load i32, i32* %8, align 4
  %227 = icmp eq i32 0, %226
  %228 = zext i1 %227 to i32
  %229 = load i32, i32* %9, align 4
  %230 = icmp eq i32 0, %229
  %231 = zext i1 %230 to i32
  %232 = and i32 %228, %231
  %233 = or i32 %225, %232
  %234 = load i32, i32* %8, align 4
  %235 = icmp eq i32 0, %234
  %236 = zext i1 %235 to i32
  %237 = icmp eq i32 0, %236
  %238 = zext i1 %237 to i32
  %239 = load i32, i32* %9, align 4
  %240 = icmp eq i32 0, %239
  %241 = zext i1 %240 to i32
  %242 = and i32 %238, %241
  %243 = load i32, i32* %3, align 4
  %244 = load i32, i32* %10, align 4
  %245 = add nsw i32 %243, %244
  %246 = load i32, i32* %3, align 4
  %247 = icmp eq i32 %245, %246
  %248 = zext i1 %247 to i32
  %249 = and i32 %242, %248
  %250 = or i32 %233, %249
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
