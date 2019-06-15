; ModuleID = 'C:/Users/RA_prof_Jeon/siddharth/layer1_con_p2/solution1/.autopilot/db/a.g.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-linux-gnu"

; [#uses=0]
define spir_kernel void @executeFirstLayer1_p2(float addrspace(1)* %bias, float addrspace(1)* %Layer1_Neurons_GPU, float addrspace(1)* %Layer1_Weights_GPU, float addrspace(1)* %Layer2_Neurons_GPU) nounwind {
  %1 = alloca float addrspace(1)*, align 4        ; [#uses=2 type=float addrspace(1)**]
  %2 = alloca float addrspace(1)*, align 4        ; [#uses=4 type=float addrspace(1)**]
  %3 = alloca float addrspace(1)*, align 4        ; [#uses=4 type=float addrspace(1)**]
  %4 = alloca float addrspace(1)*, align 4        ; [#uses=2 type=float addrspace(1)**]
  %r_offset = alloca i32, align 4                 ; [#uses=2 type=i32*]
  %c_offset = alloca i32, align 4                 ; [#uses=2 type=i32*]
  %product = alloca float, align 4                ; [#uses=10 type=float*]
  %col_width = alloca i32, align 4                ; [#uses=2 type=i32*]
  %stride_width = alloca i32, align 4             ; [#uses=2 type=i32*]
  %stride = alloca i32, align 4                   ; [#uses=6 type=i32*]
  %colstride = alloca i32, align 4                ; [#uses=5 type=i32*]
  %output = alloca i32, align 4                   ; [#uses=6 type=i32*]
  %row = alloca i32, align 4                      ; [#uses=3 type=i32*]
  %col = alloca i32, align 4                      ; [#uses=3 type=i32*]
  %i = alloca i32, align 4                        ; [#uses=10 type=i32*]
  %j = alloca i32, align 4                        ; [#uses=10 type=i32*]
  store float addrspace(1)* %bias, float addrspace(1)** %1, align 4
  call void @llvm.dbg.declare(metadata !{float addrspace(1)** %1}, metadata !20), !dbg !21 ; [debug line = 2:133] [debug variable = bias]
  store float addrspace(1)* %Layer1_Neurons_GPU, float addrspace(1)** %2, align 4
  call void @llvm.dbg.declare(metadata !{float addrspace(1)** %2}, metadata !22), !dbg !23 ; [debug line = 2:187] [debug variable = Layer1_Neurons_GPU]
  store float addrspace(1)* %Layer1_Weights_GPU, float addrspace(1)** %3, align 4
  call void @llvm.dbg.declare(metadata !{float addrspace(1)** %3}, metadata !24), !dbg !25 ; [debug line = 3:82] [debug variable = Layer1_Weights_GPU]
  store float addrspace(1)* %Layer2_Neurons_GPU, float addrspace(1)** %4, align 4
  call void @llvm.dbg.declare(metadata !{float addrspace(1)** %4}, metadata !26), !dbg !27 ; [debug line = 3:149] [debug variable = Layer2_Neurons_GPU]
  call void @llvm.dbg.declare(metadata !{i32* %r_offset}, metadata !28), !dbg !31 ; [debug line = 6:6] [debug variable = r_offset]
  store i32 0, i32* %r_offset, align 4, !dbg !32  ; [debug line = 6:18]
  call void @llvm.dbg.declare(metadata !{i32* %c_offset}, metadata !33), !dbg !34 ; [debug line = 7:6] [debug variable = c_offset]
  store i32 32, i32* %c_offset, align 4, !dbg !35 ; [debug line = 7:19]
  call void @llvm.dbg.declare(metadata !{float* %product}, metadata !36), !dbg !37 ; [debug line = 9:11] [debug variable = product]
  store float 0.000000e+00, float* %product, align 4, !dbg !38 ; [debug line = 9:22]
  call void @llvm.dbg.declare(metadata !{i32* %col_width}, metadata !39), !dbg !40 ; [debug line = 10:9] [debug variable = col_width]
  store i32 227, i32* %col_width, align 4, !dbg !41 ; [debug line = 10:24]
  call void @llvm.dbg.declare(metadata !{i32* %stride_width}, metadata !42), !dbg !43 ; [debug line = 11:9] [debug variable = stride_width]
  store i32 4, i32* %stride_width, align 4, !dbg !44 ; [debug line = 11:25]
  call void @llvm.dbg.declare(metadata !{i32* %stride}, metadata !45), !dbg !46 ; [debug line = 12:9] [debug variable = stride]
  store i32 0, i32* %stride, align 4, !dbg !47    ; [debug line = 12:33]
  call void @llvm.dbg.declare(metadata !{i32* %colstride}, metadata !48), !dbg !49 ; [debug line = 12:20] [debug variable = colstride]
  store i32 0, i32* %colstride, align 4, !dbg !47 ; [debug line = 12:33]
  call void @llvm.dbg.declare(metadata !{i32* %output}, metadata !50), !dbg !51 ; [debug line = 13:9] [debug variable = output]
  %5 = call spir_func i32 @_Z12get_group_idj(i32 0), !dbg !52 ; [#uses=1 type=i32] [debug line = 13:18]
  store i32 %5, i32* %output, align 4, !dbg !52   ; [debug line = 13:18]
  call void @llvm.dbg.declare(metadata !{i32* %row}, metadata !53), !dbg !54 ; [debug line = 14:9] [debug variable = row]
  %6 = call spir_func i32 @_Z12get_local_idj(i32 1), !dbg !55 ; [#uses=1 type=i32] [debug line = 14:15]
  %7 = load i32* %r_offset, align 4, !dbg !55     ; [#uses=1 type=i32] [debug line = 14:15]
  %8 = add i32 %6, %7, !dbg !55                   ; [#uses=1 type=i32] [debug line = 14:15]
  store i32 %8, i32* %row, align 4, !dbg !55      ; [debug line = 14:15]
  call void @llvm.dbg.declare(metadata !{i32* %col}, metadata !56), !dbg !57 ; [debug line = 15:9] [debug variable = col]
  %9 = call spir_func i32 @_Z12get_local_idj(i32 0), !dbg !58 ; [#uses=1 type=i32] [debug line = 15:15]
  %10 = load i32* %c_offset, align 4, !dbg !58    ; [#uses=1 type=i32] [debug line = 15:15]
  %11 = add i32 %9, %10, !dbg !58                 ; [#uses=1 type=i32] [debug line = 15:15]
  store i32 %11, i32* %col, align 4, !dbg !58     ; [debug line = 15:15]
  %12 = load i32* %row, align 4, !dbg !59         ; [#uses=1 type=i32] [debug line = 17:5]
  %13 = mul nsw i32 3, %12, !dbg !59              ; [#uses=1 type=i32] [debug line = 17:5]
  %14 = load i32* %stride_width, align 4, !dbg !59 ; [#uses=1 type=i32] [debug line = 17:5]
  %15 = mul nsw i32 %13, %14, !dbg !59            ; [#uses=1 type=i32] [debug line = 17:5]
  %16 = load i32* %col_width, align 4, !dbg !59   ; [#uses=1 type=i32] [debug line = 17:5]
  %17 = mul nsw i32 %15, %16, !dbg !59            ; [#uses=1 type=i32] [debug line = 17:5]
  store i32 %17, i32* %colstride, align 4, !dbg !59 ; [debug line = 17:5]
  store i32 0, i32* %stride, align 4, !dbg !60    ; [debug line = 18:5]
  store float 0.000000e+00, float* %product, align 4, !dbg !61 ; [debug line = 19:5]
  %18 = load i32* %col, align 4, !dbg !62         ; [#uses=1 type=i32] [debug line = 20:5]
  %19 = mul nsw i32 %18, 4, !dbg !62              ; [#uses=1 type=i32] [debug line = 20:5]
  %20 = mul nsw i32 %19, 3, !dbg !62              ; [#uses=1 type=i32] [debug line = 20:5]
  store i32 %20, i32* %stride, align 4, !dbg !62  ; [debug line = 20:5]
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !63), !dbg !65 ; [debug line = 22:13] [debug variable = i]
  store i32 0, i32* %i, align 4, !dbg !66         ; [debug line = 22:18]
  br label %21, !dbg !66                          ; [debug line = 22:18]

; <label>:21                                      ; preds = %119, %0
  %22 = load i32* %i, align 4, !dbg !66           ; [#uses=1 type=i32] [debug line = 22:18]
  %23 = icmp slt i32 %22, 11, !dbg !66            ; [#uses=1 type=i1] [debug line = 22:18]
  br i1 %23, label %24, label %122, !dbg !66      ; [debug line = 22:18]

; <label>:24                                      ; preds = %21
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !67), !dbg !70 ; [debug line = 24:17] [debug variable = j]
  store i32 0, i32* %j, align 4, !dbg !71         ; [debug line = 24:22]
  br label %25, !dbg !71                          ; [debug line = 24:22]

; <label>:25                                      ; preds = %115, %24
  %26 = load i32* %j, align 4, !dbg !71           ; [#uses=1 type=i32] [debug line = 24:22]
  %27 = icmp slt i32 %26, 11, !dbg !71            ; [#uses=1 type=i1] [debug line = 24:22]
  br i1 %27, label %28, label %118, !dbg !71      ; [debug line = 24:22]

; <label>:28                                      ; preds = %25
  %29 = load i32* %i, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %30 = mul nsw i32 %29, 227, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %31 = mul nsw i32 %30, 3, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %32 = load i32* %j, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %33 = mul nsw i32 %32, 3, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %34 = add nsw i32 %31, %33, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %35 = load i32* %stride, align 4, !dbg !72      ; [#uses=1 type=i32] [debug line = 26:13]
  %36 = add nsw i32 %34, %35, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %37 = load i32* %colstride, align 4, !dbg !72   ; [#uses=1 type=i32] [debug line = 26:13]
  %38 = add nsw i32 %36, %37, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %39 = load float addrspace(1)** %2, align 4, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %40 = getelementptr inbounds float addrspace(1)* %39, i32 %38, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %41 = load float addrspace(1)* %40, align 4, !dbg !72 ; [#uses=1 type=float] [debug line = 26:13]
  %42 = load i32* %i, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %43 = mul nsw i32 %42, 11, !dbg !72             ; [#uses=1 type=i32] [debug line = 26:13]
  %44 = load i32* %j, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %45 = add nsw i32 %43, %44, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %46 = load i32* %output, align 4, !dbg !72      ; [#uses=1 type=i32] [debug line = 26:13]
  %47 = mul nsw i32 %46, 11, !dbg !72             ; [#uses=1 type=i32] [debug line = 26:13]
  %48 = mul nsw i32 %47, 11, !dbg !72             ; [#uses=1 type=i32] [debug line = 26:13]
  %49 = mul nsw i32 %48, 3, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %50 = add nsw i32 %45, %49, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %51 = load float addrspace(1)** %3, align 4, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %52 = getelementptr inbounds float addrspace(1)* %51, i32 %50, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %53 = load float addrspace(1)* %52, align 4, !dbg !72 ; [#uses=1 type=float] [debug line = 26:13]
  %54 = fmul float %41, %53, !dbg !72             ; [#uses=1 type=float] [debug line = 26:13]
  %55 = load i32* %i, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %56 = mul nsw i32 %55, 227, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %57 = mul nsw i32 %56, 3, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %58 = load i32* %j, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %59 = mul nsw i32 %58, 3, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %60 = add nsw i32 %57, %59, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %61 = add nsw i32 %60, 1, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %62 = load i32* %stride, align 4, !dbg !72      ; [#uses=1 type=i32] [debug line = 26:13]
  %63 = add nsw i32 %61, %62, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %64 = load i32* %colstride, align 4, !dbg !72   ; [#uses=1 type=i32] [debug line = 26:13]
  %65 = add nsw i32 %63, %64, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %66 = load float addrspace(1)** %2, align 4, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %67 = getelementptr inbounds float addrspace(1)* %66, i32 %65, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %68 = load float addrspace(1)* %67, align 4, !dbg !72 ; [#uses=1 type=float] [debug line = 26:13]
  %69 = load i32* %i, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %70 = mul nsw i32 %69, 11, !dbg !72             ; [#uses=1 type=i32] [debug line = 26:13]
  %71 = add nsw i32 %70, 121, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %72 = load i32* %j, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %73 = add nsw i32 %71, %72, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %74 = load i32* %output, align 4, !dbg !72      ; [#uses=1 type=i32] [debug line = 26:13]
  %75 = mul nsw i32 %74, 11, !dbg !72             ; [#uses=1 type=i32] [debug line = 26:13]
  %76 = mul nsw i32 %75, 11, !dbg !72             ; [#uses=1 type=i32] [debug line = 26:13]
  %77 = mul nsw i32 %76, 3, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %78 = add nsw i32 %73, %77, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %79 = load float addrspace(1)** %3, align 4, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %80 = getelementptr inbounds float addrspace(1)* %79, i32 %78, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %81 = load float addrspace(1)* %80, align 4, !dbg !72 ; [#uses=1 type=float] [debug line = 26:13]
  %82 = fmul float %68, %81, !dbg !72             ; [#uses=1 type=float] [debug line = 26:13]
  %83 = fadd float %54, %82, !dbg !72             ; [#uses=1 type=float] [debug line = 26:13]
  %84 = load i32* %i, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %85 = mul nsw i32 %84, 227, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %86 = mul nsw i32 %85, 3, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %87 = load i32* %j, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %88 = mul nsw i32 %87, 3, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %89 = add nsw i32 %86, %88, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %90 = add nsw i32 %89, 2, !dbg !72              ; [#uses=1 type=i32] [debug line = 26:13]
  %91 = load i32* %stride, align 4, !dbg !72      ; [#uses=1 type=i32] [debug line = 26:13]
  %92 = add nsw i32 %90, %91, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %93 = load i32* %colstride, align 4, !dbg !72   ; [#uses=1 type=i32] [debug line = 26:13]
  %94 = add nsw i32 %92, %93, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %95 = load float addrspace(1)** %2, align 4, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %96 = getelementptr inbounds float addrspace(1)* %95, i32 %94, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %97 = load float addrspace(1)* %96, align 4, !dbg !72 ; [#uses=1 type=float] [debug line = 26:13]
  %98 = load i32* %i, align 4, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %99 = mul nsw i32 %98, 11, !dbg !72             ; [#uses=1 type=i32] [debug line = 26:13]
  %100 = add nsw i32 %99, 242, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %101 = load i32* %j, align 4, !dbg !72          ; [#uses=1 type=i32] [debug line = 26:13]
  %102 = add nsw i32 %100, %101, !dbg !72         ; [#uses=1 type=i32] [debug line = 26:13]
  %103 = load i32* %output, align 4, !dbg !72     ; [#uses=1 type=i32] [debug line = 26:13]
  %104 = mul nsw i32 %103, 11, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %105 = mul nsw i32 %104, 11, !dbg !72           ; [#uses=1 type=i32] [debug line = 26:13]
  %106 = mul nsw i32 %105, 3, !dbg !72            ; [#uses=1 type=i32] [debug line = 26:13]
  %107 = add nsw i32 %102, %106, !dbg !72         ; [#uses=1 type=i32] [debug line = 26:13]
  %108 = load float addrspace(1)** %3, align 4, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %109 = getelementptr inbounds float addrspace(1)* %108, i32 %107, !dbg !72 ; [#uses=1 type=float addrspace(1)*] [debug line = 26:13]
  %110 = load float addrspace(1)* %109, align 4, !dbg !72 ; [#uses=1 type=float] [debug line = 26:13]
  %111 = fmul float %97, %110, !dbg !72           ; [#uses=1 type=float] [debug line = 26:13]
  %112 = fadd float %83, %111, !dbg !72           ; [#uses=1 type=float] [debug line = 26:13]
  %113 = load float* %product, align 4, !dbg !72  ; [#uses=1 type=float] [debug line = 26:13]
  %114 = fadd float %113, %112, !dbg !72          ; [#uses=1 type=float] [debug line = 26:13]
  store float %114, float* %product, align 4, !dbg !72 ; [debug line = 26:13]
  br label %115, !dbg !74                         ; [debug line = 29:9]

; <label>:115                                     ; preds = %28
  %116 = load i32* %j, align 4, !dbg !75          ; [#uses=1 type=i32] [debug line = 24:32]
  %117 = add nsw i32 %116, 1, !dbg !75            ; [#uses=1 type=i32] [debug line = 24:32]
  store i32 %117, i32* %j, align 4, !dbg !75      ; [debug line = 24:32]
  br label %25, !dbg !75                          ; [debug line = 24:32]

; <label>:118                                     ; preds = %25
  br label %119, !dbg !76                         ; [debug line = 30:5]

; <label>:119                                     ; preds = %118
  %120 = load i32* %i, align 4, !dbg !77          ; [#uses=1 type=i32] [debug line = 22:28]
  %121 = add nsw i32 %120, 1, !dbg !77            ; [#uses=1 type=i32] [debug line = 22:28]
  store i32 %121, i32* %i, align 4, !dbg !77      ; [debug line = 22:28]
  br label %21, !dbg !77                          ; [debug line = 22:28]

; <label>:122                                     ; preds = %21
  %123 = load i32* %output, align 4, !dbg !78     ; [#uses=1 type=i32] [debug line = 31:5]
  %124 = load float addrspace(1)** %1, align 4, !dbg !78 ; [#uses=1 type=float addrspace(1)*] [debug line = 31:5]
  %125 = getelementptr inbounds float addrspace(1)* %124, i32 %123, !dbg !78 ; [#uses=1 type=float addrspace(1)*] [debug line = 31:5]
  %126 = load float addrspace(1)* %125, align 4, !dbg !78 ; [#uses=1 type=float] [debug line = 31:5]
  %127 = load float* %product, align 4, !dbg !78  ; [#uses=1 type=float] [debug line = 31:5]
  %128 = fadd float %127, %126, !dbg !78          ; [#uses=1 type=float] [debug line = 31:5]
  store float %128, float* %product, align 4, !dbg !78 ; [debug line = 31:5]
  %129 = load float* %product, align 4, !dbg !79  ; [#uses=1 type=float] [debug line = 32:5]
  %130 = fcmp olt float %129, 0.000000e+00, !dbg !79 ; [#uses=1 type=i1] [debug line = 32:5]
  br i1 %130, label %131, label %132, !dbg !79    ; [debug line = 32:5]

; <label>:131                                     ; preds = %122
  store float 0.000000e+00, float* %product, align 4, !dbg !80 ; [debug line = 33:9]
  br label %132, !dbg !80                         ; [debug line = 33:9]

; <label>:132                                     ; preds = %131, %122
  %133 = load float* %product, align 4, !dbg !81  ; [#uses=1 type=float] [debug line = 34:5]
  %134 = load i32* %output, align 4, !dbg !81     ; [#uses=1 type=i32] [debug line = 34:5]
  %135 = mul nsw i32 %134, 55, !dbg !81           ; [#uses=1 type=i32] [debug line = 34:5]
  %136 = mul nsw i32 %135, 55, !dbg !81           ; [#uses=1 type=i32] [debug line = 34:5]
  %137 = load i32* %row, align 4, !dbg !81        ; [#uses=1 type=i32] [debug line = 34:5]
  %138 = mul nsw i32 %137, 55, !dbg !81           ; [#uses=1 type=i32] [debug line = 34:5]
  %139 = add nsw i32 %136, %138, !dbg !81         ; [#uses=1 type=i32] [debug line = 34:5]
  %140 = load i32* %col, align 4, !dbg !81        ; [#uses=1 type=i32] [debug line = 34:5]
  %141 = add nsw i32 %139, %140, !dbg !81         ; [#uses=1 type=i32] [debug line = 34:5]
  %142 = load float addrspace(1)** %4, align 4, !dbg !81 ; [#uses=1 type=float addrspace(1)*] [debug line = 34:5]
  %143 = getelementptr inbounds float addrspace(1)* %142, i32 %141, !dbg !81 ; [#uses=1 type=float addrspace(1)*] [debug line = 34:5]
  store float %133, float addrspace(1)* %143, align 4, !dbg !81 ; [debug line = 34:5]
  store float 0.000000e+00, float* %product, align 4, !dbg !82 ; [debug line = 35:5]
  ret void, !dbg !83                              ; [debug line = 36:1]
}

; [#uses=16]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare spir_func i32 @_Z12get_group_idj(i32)

; [#uses=2]
declare spir_func i32 @_Z12get_local_idj(i32)

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!13}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"C:/Users/RA_prof_Jeon/siddharth/layer1_con_p2/solution1/.autopilot/db/executeFirstLayer1_conv_p2.pragma.2.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"executeFirstLayer1_p2", metadata !"executeFirstLayer1_p2", metadata !"", metadata !6, i32 2, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float addrspace(1)*, float addrspace(1)*, float addrspace(1)*, float addrspace(1)*)* @executeFirstLayer1_p2, null, null, metadata !11, i32 4} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"layer1_con_p2/executeFirstLayer1_conv_p2.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{void (float addrspace(1)*, float addrspace(1)*, float addrspace(1)*, float addrspace(1)*)* @executeFirstLayer1_p2, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 1}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"float*", metadata !"float*", metadata !"float*", metadata !"float*"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"bias", metadata !"Layer1_Neurons_GPU", metadata !"Layer1_Weights_GPU", metadata !"Layer2_Neurons_GPU"}
!19 = metadata !{metadata !"reqd_work_group_size", i32 32, i32 23, i32 1}
!20 = metadata !{i32 786689, metadata !5, metadata !"bias", metadata !6, i32 16777218, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!21 = metadata !{i32 2, i32 133, metadata !5, null}
!22 = metadata !{i32 786689, metadata !5, metadata !"Layer1_Neurons_GPU", metadata !6, i32 33554434, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!23 = metadata !{i32 2, i32 187, metadata !5, null}
!24 = metadata !{i32 786689, metadata !5, metadata !"Layer1_Weights_GPU", metadata !6, i32 50331651, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!25 = metadata !{i32 3, i32 82, metadata !5, null}
!26 = metadata !{i32 786689, metadata !5, metadata !"Layer2_Neurons_GPU", metadata !6, i32 67108867, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!27 = metadata !{i32 3, i32 149, metadata !5, null}
!28 = metadata !{i32 786688, metadata !29, metadata !"r_offset", metadata !6, i32 6, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!29 = metadata !{i32 786443, metadata !5, i32 4, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!30 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!31 = metadata !{i32 6, i32 6, metadata !29, null}
!32 = metadata !{i32 6, i32 18, metadata !29, null}
!33 = metadata !{i32 786688, metadata !29, metadata !"c_offset", metadata !6, i32 7, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!34 = metadata !{i32 7, i32 6, metadata !29, null}
!35 = metadata !{i32 7, i32 19, metadata !29, null}
!36 = metadata !{i32 786688, metadata !29, metadata !"product", metadata !6, i32 9, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!37 = metadata !{i32 9, i32 11, metadata !29, null}
!38 = metadata !{i32 9, i32 22, metadata !29, null}
!39 = metadata !{i32 786688, metadata !29, metadata !"col_width", metadata !6, i32 10, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!40 = metadata !{i32 10, i32 9, metadata !29, null}
!41 = metadata !{i32 10, i32 24, metadata !29, null}
!42 = metadata !{i32 786688, metadata !29, metadata !"stride_width", metadata !6, i32 11, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!43 = metadata !{i32 11, i32 9, metadata !29, null}
!44 = metadata !{i32 11, i32 25, metadata !29, null}
!45 = metadata !{i32 786688, metadata !29, metadata !"stride", metadata !6, i32 12, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 12, i32 9, metadata !29, null}
!47 = metadata !{i32 12, i32 33, metadata !29, null}
!48 = metadata !{i32 786688, metadata !29, metadata !"colstride", metadata !6, i32 12, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 12, i32 20, metadata !29, null}
!50 = metadata !{i32 786688, metadata !29, metadata !"output", metadata !6, i32 13, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 13, i32 9, metadata !29, null}
!52 = metadata !{i32 13, i32 18, metadata !29, null}
!53 = metadata !{i32 786688, metadata !29, metadata !"row", metadata !6, i32 14, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!54 = metadata !{i32 14, i32 9, metadata !29, null}
!55 = metadata !{i32 14, i32 15, metadata !29, null}
!56 = metadata !{i32 786688, metadata !29, metadata !"col", metadata !6, i32 15, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!57 = metadata !{i32 15, i32 9, metadata !29, null}
!58 = metadata !{i32 15, i32 15, metadata !29, null}
!59 = metadata !{i32 17, i32 5, metadata !29, null}
!60 = metadata !{i32 18, i32 5, metadata !29, null}
!61 = metadata !{i32 19, i32 5, metadata !29, null}
!62 = metadata !{i32 20, i32 5, metadata !29, null}
!63 = metadata !{i32 786688, metadata !64, metadata !"i", metadata !6, i32 22, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!64 = metadata !{i32 786443, metadata !29, i32 22, i32 5, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!65 = metadata !{i32 22, i32 13, metadata !64, null}
!66 = metadata !{i32 22, i32 18, metadata !64, null}
!67 = metadata !{i32 786688, metadata !68, metadata !"j", metadata !6, i32 24, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 786443, metadata !69, i32 24, i32 9, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!69 = metadata !{i32 786443, metadata !64, i32 23, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!70 = metadata !{i32 24, i32 17, metadata !68, null}
!71 = metadata !{i32 24, i32 22, metadata !68, null}
!72 = metadata !{i32 26, i32 13, metadata !73, null}
!73 = metadata !{i32 786443, metadata !68, i32 25, i32 9, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!74 = metadata !{i32 29, i32 9, metadata !73, null}
!75 = metadata !{i32 24, i32 32, metadata !68, null}
!76 = metadata !{i32 30, i32 5, metadata !69, null}
!77 = metadata !{i32 22, i32 28, metadata !64, null}
!78 = metadata !{i32 31, i32 5, metadata !29, null}
!79 = metadata !{i32 32, i32 5, metadata !29, null}
!80 = metadata !{i32 33, i32 9, metadata !29, null}
!81 = metadata !{i32 34, i32 5, metadata !29, null}
!82 = metadata !{i32 35, i32 5, metadata !29, null}
!83 = metadata !{i32 36, i32 1, metadata !29, null}
