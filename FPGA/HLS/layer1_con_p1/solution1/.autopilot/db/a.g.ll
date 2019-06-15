; ModuleID = 'C:/Users/RA_prof_Jeon/siddharth/HLS/Alexnet_dev/solution1/.autopilot/db/a.g.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-linux-gnu"

; [#uses=0]
define spir_kernel void @executeFirstLayer(float addrspace(1)* %bias, float addrspace(1)* %Layer1_Neurons_GPU, float addrspace(1)* %Layer1_Weights_GPU, float addrspace(1)* %Layer2_Neurons_GPU, i32 %r_offset, i32 %c_offset) nounwind {
  %1 = alloca float addrspace(1)*, align 4        ; [#uses=2 type=float addrspace(1)**]
  %2 = alloca float addrspace(1)*, align 4        ; [#uses=4 type=float addrspace(1)**]
  %3 = alloca float addrspace(1)*, align 4        ; [#uses=4 type=float addrspace(1)**]
  %4 = alloca float addrspace(1)*, align 4        ; [#uses=2 type=float addrspace(1)**]
  %5 = alloca i32, align 4                        ; [#uses=2 type=i32*]
  %6 = alloca i32, align 4                        ; [#uses=2 type=i32*]
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
  call void @llvm.dbg.declare(metadata !{float addrspace(1)** %1}, metadata !21), !dbg !22 ; [debug line = 2:129] [debug variable = bias]
  store float addrspace(1)* %Layer1_Neurons_GPU, float addrspace(1)** %2, align 4
  call void @llvm.dbg.declare(metadata !{float addrspace(1)** %2}, metadata !23), !dbg !24 ; [debug line = 2:183] [debug variable = Layer1_Neurons_GPU]
  store float addrspace(1)* %Layer1_Weights_GPU, float addrspace(1)** %3, align 4
  call void @llvm.dbg.declare(metadata !{float addrspace(1)** %3}, metadata !25), !dbg !26 ; [debug line = 3:82] [debug variable = Layer1_Weights_GPU]
  store float addrspace(1)* %Layer2_Neurons_GPU, float addrspace(1)** %4, align 4
  call void @llvm.dbg.declare(metadata !{float addrspace(1)** %4}, metadata !27), !dbg !28 ; [debug line = 3:149] [debug variable = Layer2_Neurons_GPU]
  store i32 %r_offset, i32* %5, align 4
  call void @llvm.dbg.declare(metadata !{i32* %5}, metadata !29), !dbg !30 ; [debug line = 4:38] [debug variable = r_offset]
  store i32 %c_offset, i32* %6, align 4
  call void @llvm.dbg.declare(metadata !{i32* %6}, metadata !31), !dbg !32 ; [debug line = 4:52] [debug variable = c_offset]
  call void @llvm.dbg.declare(metadata !{float* %product}, metadata !33), !dbg !35 ; [debug line = 6:11] [debug variable = product]
  store float 0.000000e+00, float* %product, align 4, !dbg !36 ; [debug line = 6:22]
  call void @llvm.dbg.declare(metadata !{i32* %col_width}, metadata !37), !dbg !38 ; [debug line = 7:9] [debug variable = col_width]
  store i32 227, i32* %col_width, align 4, !dbg !39 ; [debug line = 7:24]
  call void @llvm.dbg.declare(metadata !{i32* %stride_width}, metadata !40), !dbg !41 ; [debug line = 8:9] [debug variable = stride_width]
  store i32 4, i32* %stride_width, align 4, !dbg !42 ; [debug line = 8:25]
  call void @llvm.dbg.declare(metadata !{i32* %stride}, metadata !43), !dbg !44 ; [debug line = 9:9] [debug variable = stride]
  store i32 0, i32* %stride, align 4, !dbg !45    ; [debug line = 9:33]
  call void @llvm.dbg.declare(metadata !{i32* %colstride}, metadata !46), !dbg !47 ; [debug line = 9:20] [debug variable = colstride]
  store i32 0, i32* %colstride, align 4, !dbg !45 ; [debug line = 9:33]
  call void @llvm.dbg.declare(metadata !{i32* %output}, metadata !48), !dbg !49 ; [debug line = 10:9] [debug variable = output]
  %7 = call spir_func i32 @_Z12get_group_idj(i32 0), !dbg !50 ; [#uses=1 type=i32] [debug line = 10:18]
  store i32 %7, i32* %output, align 4, !dbg !50   ; [debug line = 10:18]
  call void @llvm.dbg.declare(metadata !{i32* %row}, metadata !51), !dbg !52 ; [debug line = 11:9] [debug variable = row]
  %8 = call spir_func i32 @_Z12get_local_idj(i32 1), !dbg !53 ; [#uses=1 type=i32] [debug line = 11:15]
  %9 = load i32* %5, align 4, !dbg !53            ; [#uses=1 type=i32] [debug line = 11:15]
  %10 = add i32 %8, %9, !dbg !53                  ; [#uses=1 type=i32] [debug line = 11:15]
  store i32 %10, i32* %row, align 4, !dbg !53     ; [debug line = 11:15]
  call void @llvm.dbg.declare(metadata !{i32* %col}, metadata !54), !dbg !55 ; [debug line = 12:9] [debug variable = col]
  %11 = call spir_func i32 @_Z12get_local_idj(i32 0), !dbg !56 ; [#uses=1 type=i32] [debug line = 12:15]
  %12 = load i32* %6, align 4, !dbg !56           ; [#uses=1 type=i32] [debug line = 12:15]
  %13 = add i32 %11, %12, !dbg !56                ; [#uses=1 type=i32] [debug line = 12:15]
  store i32 %13, i32* %col, align 4, !dbg !56     ; [debug line = 12:15]
  %14 = load i32* %row, align 4, !dbg !57         ; [#uses=1 type=i32] [debug line = 14:5]
  %15 = mul nsw i32 3, %14, !dbg !57              ; [#uses=1 type=i32] [debug line = 14:5]
  %16 = load i32* %stride_width, align 4, !dbg !57 ; [#uses=1 type=i32] [debug line = 14:5]
  %17 = mul nsw i32 %15, %16, !dbg !57            ; [#uses=1 type=i32] [debug line = 14:5]
  %18 = load i32* %col_width, align 4, !dbg !57   ; [#uses=1 type=i32] [debug line = 14:5]
  %19 = mul nsw i32 %17, %18, !dbg !57            ; [#uses=1 type=i32] [debug line = 14:5]
  store i32 %19, i32* %colstride, align 4, !dbg !57 ; [debug line = 14:5]
  store i32 0, i32* %stride, align 4, !dbg !58    ; [debug line = 15:5]
  store float 0.000000e+00, float* %product, align 4, !dbg !59 ; [debug line = 16:5]
  %20 = load i32* %col, align 4, !dbg !60         ; [#uses=1 type=i32] [debug line = 17:5]
  %21 = mul nsw i32 %20, 4, !dbg !60              ; [#uses=1 type=i32] [debug line = 17:5]
  %22 = mul nsw i32 %21, 3, !dbg !60              ; [#uses=1 type=i32] [debug line = 17:5]
  store i32 %22, i32* %stride, align 4, !dbg !60  ; [debug line = 17:5]
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !61), !dbg !63 ; [debug line = 19:13] [debug variable = i]
  store i32 0, i32* %i, align 4, !dbg !64         ; [debug line = 19:18]
  br label %23, !dbg !64                          ; [debug line = 19:18]

; <label>:23                                      ; preds = %121, %0
  %24 = load i32* %i, align 4, !dbg !64           ; [#uses=1 type=i32] [debug line = 19:18]
  %25 = icmp slt i32 %24, 11, !dbg !64            ; [#uses=1 type=i1] [debug line = 19:18]
  br i1 %25, label %26, label %124, !dbg !64      ; [debug line = 19:18]

; <label>:26                                      ; preds = %23
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !65), !dbg !68 ; [debug line = 21:17] [debug variable = j]
  store i32 0, i32* %j, align 4, !dbg !69         ; [debug line = 21:22]
  br label %27, !dbg !69                          ; [debug line = 21:22]

; <label>:27                                      ; preds = %117, %26
  %28 = load i32* %j, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 21:22]
  %29 = icmp slt i32 %28, 11, !dbg !69            ; [#uses=1 type=i1] [debug line = 21:22]
  br i1 %29, label %30, label %120, !dbg !69      ; [debug line = 21:22]

; <label>:30                                      ; preds = %27
  %31 = load i32* %i, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %32 = mul nsw i32 %31, 227, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %33 = mul nsw i32 %32, 3, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %34 = load i32* %j, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %35 = mul nsw i32 %34, 3, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %36 = add nsw i32 %33, %35, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %37 = load i32* %stride, align 4, !dbg !70      ; [#uses=1 type=i32] [debug line = 23:13]
  %38 = add nsw i32 %36, %37, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %39 = load i32* %colstride, align 4, !dbg !70   ; [#uses=1 type=i32] [debug line = 23:13]
  %40 = add nsw i32 %38, %39, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %41 = load float addrspace(1)** %2, align 4, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %42 = getelementptr inbounds float addrspace(1)* %41, i32 %40, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %43 = load float addrspace(1)* %42, align 4, !dbg !70 ; [#uses=1 type=float] [debug line = 23:13]
  %44 = load i32* %i, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %45 = mul nsw i32 %44, 11, !dbg !70             ; [#uses=1 type=i32] [debug line = 23:13]
  %46 = load i32* %j, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %47 = add nsw i32 %45, %46, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %48 = load i32* %output, align 4, !dbg !70      ; [#uses=1 type=i32] [debug line = 23:13]
  %49 = mul nsw i32 %48, 11, !dbg !70             ; [#uses=1 type=i32] [debug line = 23:13]
  %50 = mul nsw i32 %49, 11, !dbg !70             ; [#uses=1 type=i32] [debug line = 23:13]
  %51 = mul nsw i32 %50, 3, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %52 = add nsw i32 %47, %51, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %53 = load float addrspace(1)** %3, align 4, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %54 = getelementptr inbounds float addrspace(1)* %53, i32 %52, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %55 = load float addrspace(1)* %54, align 4, !dbg !70 ; [#uses=1 type=float] [debug line = 23:13]
  %56 = fmul float %43, %55, !dbg !70             ; [#uses=1 type=float] [debug line = 23:13]
  %57 = load i32* %i, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %58 = mul nsw i32 %57, 227, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %59 = mul nsw i32 %58, 3, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %60 = load i32* %j, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %61 = mul nsw i32 %60, 3, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %62 = add nsw i32 %59, %61, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %63 = add nsw i32 %62, 1, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %64 = load i32* %stride, align 4, !dbg !70      ; [#uses=1 type=i32] [debug line = 23:13]
  %65 = add nsw i32 %63, %64, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %66 = load i32* %colstride, align 4, !dbg !70   ; [#uses=1 type=i32] [debug line = 23:13]
  %67 = add nsw i32 %65, %66, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %68 = load float addrspace(1)** %2, align 4, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %69 = getelementptr inbounds float addrspace(1)* %68, i32 %67, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %70 = load float addrspace(1)* %69, align 4, !dbg !70 ; [#uses=1 type=float] [debug line = 23:13]
  %71 = load i32* %i, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %72 = mul nsw i32 %71, 11, !dbg !70             ; [#uses=1 type=i32] [debug line = 23:13]
  %73 = add nsw i32 %72, 121, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %74 = load i32* %j, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %75 = add nsw i32 %73, %74, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %76 = load i32* %output, align 4, !dbg !70      ; [#uses=1 type=i32] [debug line = 23:13]
  %77 = mul nsw i32 %76, 11, !dbg !70             ; [#uses=1 type=i32] [debug line = 23:13]
  %78 = mul nsw i32 %77, 11, !dbg !70             ; [#uses=1 type=i32] [debug line = 23:13]
  %79 = mul nsw i32 %78, 3, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %80 = add nsw i32 %75, %79, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %81 = load float addrspace(1)** %3, align 4, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %82 = getelementptr inbounds float addrspace(1)* %81, i32 %80, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %83 = load float addrspace(1)* %82, align 4, !dbg !70 ; [#uses=1 type=float] [debug line = 23:13]
  %84 = fmul float %70, %83, !dbg !70             ; [#uses=1 type=float] [debug line = 23:13]
  %85 = fadd float %56, %84, !dbg !70             ; [#uses=1 type=float] [debug line = 23:13]
  %86 = load i32* %i, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %87 = mul nsw i32 %86, 227, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %88 = mul nsw i32 %87, 3, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %89 = load i32* %j, align 4, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %90 = mul nsw i32 %89, 3, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %91 = add nsw i32 %88, %90, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %92 = add nsw i32 %91, 2, !dbg !70              ; [#uses=1 type=i32] [debug line = 23:13]
  %93 = load i32* %stride, align 4, !dbg !70      ; [#uses=1 type=i32] [debug line = 23:13]
  %94 = add nsw i32 %92, %93, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %95 = load i32* %colstride, align 4, !dbg !70   ; [#uses=1 type=i32] [debug line = 23:13]
  %96 = add nsw i32 %94, %95, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %97 = load float addrspace(1)** %2, align 4, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %98 = getelementptr inbounds float addrspace(1)* %97, i32 %96, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %99 = load float addrspace(1)* %98, align 4, !dbg !70 ; [#uses=1 type=float] [debug line = 23:13]
  %100 = load i32* %i, align 4, !dbg !70          ; [#uses=1 type=i32] [debug line = 23:13]
  %101 = mul nsw i32 %100, 11, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %102 = add nsw i32 %101, 242, !dbg !70          ; [#uses=1 type=i32] [debug line = 23:13]
  %103 = load i32* %j, align 4, !dbg !70          ; [#uses=1 type=i32] [debug line = 23:13]
  %104 = add nsw i32 %102, %103, !dbg !70         ; [#uses=1 type=i32] [debug line = 23:13]
  %105 = load i32* %output, align 4, !dbg !70     ; [#uses=1 type=i32] [debug line = 23:13]
  %106 = mul nsw i32 %105, 11, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %107 = mul nsw i32 %106, 11, !dbg !70           ; [#uses=1 type=i32] [debug line = 23:13]
  %108 = mul nsw i32 %107, 3, !dbg !70            ; [#uses=1 type=i32] [debug line = 23:13]
  %109 = add nsw i32 %104, %108, !dbg !70         ; [#uses=1 type=i32] [debug line = 23:13]
  %110 = load float addrspace(1)** %3, align 4, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %111 = getelementptr inbounds float addrspace(1)* %110, i32 %109, !dbg !70 ; [#uses=1 type=float addrspace(1)*] [debug line = 23:13]
  %112 = load float addrspace(1)* %111, align 4, !dbg !70 ; [#uses=1 type=float] [debug line = 23:13]
  %113 = fmul float %99, %112, !dbg !70           ; [#uses=1 type=float] [debug line = 23:13]
  %114 = fadd float %85, %113, !dbg !70           ; [#uses=1 type=float] [debug line = 23:13]
  %115 = load float* %product, align 4, !dbg !70  ; [#uses=1 type=float] [debug line = 23:13]
  %116 = fadd float %115, %114, !dbg !70          ; [#uses=1 type=float] [debug line = 23:13]
  store float %116, float* %product, align 4, !dbg !70 ; [debug line = 23:13]
  br label %117, !dbg !72                         ; [debug line = 26:9]

; <label>:117                                     ; preds = %30
  %118 = load i32* %j, align 4, !dbg !73          ; [#uses=1 type=i32] [debug line = 21:32]
  %119 = add nsw i32 %118, 1, !dbg !73            ; [#uses=1 type=i32] [debug line = 21:32]
  store i32 %119, i32* %j, align 4, !dbg !73      ; [debug line = 21:32]
  br label %27, !dbg !73                          ; [debug line = 21:32]

; <label>:120                                     ; preds = %27
  br label %121, !dbg !74                         ; [debug line = 27:5]

; <label>:121                                     ; preds = %120
  %122 = load i32* %i, align 4, !dbg !75          ; [#uses=1 type=i32] [debug line = 19:28]
  %123 = add nsw i32 %122, 1, !dbg !75            ; [#uses=1 type=i32] [debug line = 19:28]
  store i32 %123, i32* %i, align 4, !dbg !75      ; [debug line = 19:28]
  br label %23, !dbg !75                          ; [debug line = 19:28]

; <label>:124                                     ; preds = %23
  %125 = load i32* %output, align 4, !dbg !76     ; [#uses=1 type=i32] [debug line = 28:5]
  %126 = load float addrspace(1)** %1, align 4, !dbg !76 ; [#uses=1 type=float addrspace(1)*] [debug line = 28:5]
  %127 = getelementptr inbounds float addrspace(1)* %126, i32 %125, !dbg !76 ; [#uses=1 type=float addrspace(1)*] [debug line = 28:5]
  %128 = load float addrspace(1)* %127, align 4, !dbg !76 ; [#uses=1 type=float] [debug line = 28:5]
  %129 = load float* %product, align 4, !dbg !76  ; [#uses=1 type=float] [debug line = 28:5]
  %130 = fadd float %129, %128, !dbg !76          ; [#uses=1 type=float] [debug line = 28:5]
  store float %130, float* %product, align 4, !dbg !76 ; [debug line = 28:5]
  %131 = load float* %product, align 4, !dbg !77  ; [#uses=1 type=float] [debug line = 29:5]
  %132 = fcmp olt float %131, 0.000000e+00, !dbg !77 ; [#uses=1 type=i1] [debug line = 29:5]
  br i1 %132, label %133, label %134, !dbg !77    ; [debug line = 29:5]

; <label>:133                                     ; preds = %124
  store float 0.000000e+00, float* %product, align 4, !dbg !78 ; [debug line = 30:9]
  br label %134, !dbg !78                         ; [debug line = 30:9]

; <label>:134                                     ; preds = %133, %124
  %135 = load float* %product, align 4, !dbg !79  ; [#uses=1 type=float] [debug line = 31:5]
  %136 = load i32* %output, align 4, !dbg !79     ; [#uses=1 type=i32] [debug line = 31:5]
  %137 = mul nsw i32 %136, 55, !dbg !79           ; [#uses=1 type=i32] [debug line = 31:5]
  %138 = mul nsw i32 %137, 55, !dbg !79           ; [#uses=1 type=i32] [debug line = 31:5]
  %139 = load i32* %row, align 4, !dbg !79        ; [#uses=1 type=i32] [debug line = 31:5]
  %140 = mul nsw i32 %139, 55, !dbg !79           ; [#uses=1 type=i32] [debug line = 31:5]
  %141 = add nsw i32 %138, %140, !dbg !79         ; [#uses=1 type=i32] [debug line = 31:5]
  %142 = load i32* %col, align 4, !dbg !79        ; [#uses=1 type=i32] [debug line = 31:5]
  %143 = add nsw i32 %141, %142, !dbg !79         ; [#uses=1 type=i32] [debug line = 31:5]
  %144 = load float addrspace(1)** %4, align 4, !dbg !79 ; [#uses=1 type=float addrspace(1)*] [debug line = 31:5]
  %145 = getelementptr inbounds float addrspace(1)* %144, i32 %143, !dbg !79 ; [#uses=1 type=float addrspace(1)*] [debug line = 31:5]
  store float %135, float addrspace(1)* %145, align 4, !dbg !79 ; [debug line = 31:5]
  store float 0.000000e+00, float* %product, align 4, !dbg !80 ; [debug line = 32:5]
  ret void, !dbg !81                              ; [debug line = 33:1]
}

; [#uses=16]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare spir_func i32 @_Z12get_group_idj(i32)

; [#uses=2]
declare spir_func i32 @_Z12get_local_idj(i32)

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!14}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"C:/Users/RA_prof_Jeon/siddharth/HLS/Alexnet_dev/solution1/.autopilot/db/layer1.pragma.2.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"executeFirstLayer", metadata !"executeFirstLayer", metadata !"", metadata !6, i32 2, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float addrspace(1)*, float addrspace(1)*, float addrspace(1)*, float addrspace(1)*, i32, i32)* @executeFirstLayer, null, null, metadata !12, i32 5} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"Alexnet_dev/layer1.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9, metadata !9, metadata !11, metadata !11}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!14 = metadata !{void (float addrspace(1)*, float addrspace(1)*, float addrspace(1)*, float addrspace(1)*, i32, i32)* @executeFirstLayer, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20}
!15 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 1, i32 0, i32 0}
!16 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!17 = metadata !{metadata !"kernel_arg_type", metadata !"float*", metadata !"float*", metadata !"float*", metadata !"float*", metadata !"int", metadata !"int"}
!18 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!19 = metadata !{metadata !"kernel_arg_name", metadata !"bias", metadata !"Layer1_Neurons_GPU", metadata !"Layer1_Weights_GPU", metadata !"Layer2_Neurons_GPU", metadata !"r_offset", metadata !"c_offset"}
!20 = metadata !{metadata !"reqd_work_group_size", i32 32, i32 32, i32 1}
!21 = metadata !{i32 786689, metadata !5, metadata !"bias", metadata !6, i32 16777218, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!22 = metadata !{i32 2, i32 129, metadata !5, null}
!23 = metadata !{i32 786689, metadata !5, metadata !"Layer1_Neurons_GPU", metadata !6, i32 33554434, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!24 = metadata !{i32 2, i32 183, metadata !5, null}
!25 = metadata !{i32 786689, metadata !5, metadata !"Layer1_Weights_GPU", metadata !6, i32 50331651, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!26 = metadata !{i32 3, i32 82, metadata !5, null}
!27 = metadata !{i32 786689, metadata !5, metadata !"Layer2_Neurons_GPU", metadata !6, i32 67108867, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!28 = metadata !{i32 3, i32 149, metadata !5, null}
!29 = metadata !{i32 786689, metadata !5, metadata !"r_offset", metadata !6, i32 83886084, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!30 = metadata !{i32 4, i32 38, metadata !5, null}
!31 = metadata !{i32 786689, metadata !5, metadata !"c_offset", metadata !6, i32 100663300, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!32 = metadata !{i32 4, i32 52, metadata !5, null}
!33 = metadata !{i32 786688, metadata !34, metadata !"product", metadata !6, i32 6, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!34 = metadata !{i32 786443, metadata !5, i32 5, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!35 = metadata !{i32 6, i32 11, metadata !34, null}
!36 = metadata !{i32 6, i32 22, metadata !34, null}
!37 = metadata !{i32 786688, metadata !34, metadata !"col_width", metadata !6, i32 7, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!38 = metadata !{i32 7, i32 9, metadata !34, null}
!39 = metadata !{i32 7, i32 24, metadata !34, null}
!40 = metadata !{i32 786688, metadata !34, metadata !"stride_width", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!41 = metadata !{i32 8, i32 9, metadata !34, null}
!42 = metadata !{i32 8, i32 25, metadata !34, null}
!43 = metadata !{i32 786688, metadata !34, metadata !"stride", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!44 = metadata !{i32 9, i32 9, metadata !34, null}
!45 = metadata !{i32 9, i32 33, metadata !34, null}
!46 = metadata !{i32 786688, metadata !34, metadata !"colstride", metadata !6, i32 9, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!47 = metadata !{i32 9, i32 20, metadata !34, null}
!48 = metadata !{i32 786688, metadata !34, metadata !"output", metadata !6, i32 10, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 10, i32 9, metadata !34, null}
!50 = metadata !{i32 10, i32 18, metadata !34, null}
!51 = metadata !{i32 786688, metadata !34, metadata !"row", metadata !6, i32 11, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!52 = metadata !{i32 11, i32 9, metadata !34, null}
!53 = metadata !{i32 11, i32 15, metadata !34, null}
!54 = metadata !{i32 786688, metadata !34, metadata !"col", metadata !6, i32 12, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 12, i32 9, metadata !34, null}
!56 = metadata !{i32 12, i32 15, metadata !34, null}
!57 = metadata !{i32 14, i32 5, metadata !34, null}
!58 = metadata !{i32 15, i32 5, metadata !34, null}
!59 = metadata !{i32 16, i32 5, metadata !34, null}
!60 = metadata !{i32 17, i32 5, metadata !34, null}
!61 = metadata !{i32 786688, metadata !62, metadata !"i", metadata !6, i32 19, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!62 = metadata !{i32 786443, metadata !34, i32 19, i32 5, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!63 = metadata !{i32 19, i32 13, metadata !62, null}
!64 = metadata !{i32 19, i32 18, metadata !62, null}
!65 = metadata !{i32 786688, metadata !66, metadata !"j", metadata !6, i32 21, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 786443, metadata !67, i32 21, i32 9, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!67 = metadata !{i32 786443, metadata !62, i32 20, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!68 = metadata !{i32 21, i32 17, metadata !66, null}
!69 = metadata !{i32 21, i32 22, metadata !66, null}
!70 = metadata !{i32 23, i32 13, metadata !71, null}
!71 = metadata !{i32 786443, metadata !66, i32 22, i32 9, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!72 = metadata !{i32 26, i32 9, metadata !71, null}
!73 = metadata !{i32 21, i32 32, metadata !66, null}
!74 = metadata !{i32 27, i32 5, metadata !67, null}
!75 = metadata !{i32 19, i32 28, metadata !62, null}
!76 = metadata !{i32 28, i32 5, metadata !34, null}
!77 = metadata !{i32 29, i32 5, metadata !34, null}
!78 = metadata !{i32 30, i32 9, metadata !34, null}
!79 = metadata !{i32 31, i32 5, metadata !34, null}
!80 = metadata !{i32 32, i32 5, metadata !34, null}
!81 = metadata !{i32 33, i32 1, metadata !34, null}
