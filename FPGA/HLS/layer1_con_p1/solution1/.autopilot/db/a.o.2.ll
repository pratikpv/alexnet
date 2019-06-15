; ModuleID = 'C:/Users/RA_prof_Jeon/siddharth/HLS/Alexnet_dev/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-linux-gnu"

@str = internal constant [1 x i8] zeroinitializer ; [#uses=1 type=[1 x i8]*]
@executeFirstLayer.str = internal unnamed_addr constant [18 x i8] c"executeFirstLayer\00" ; [#uses=1 type=[18 x i8]*]
@__spir_rt_info.9 = global i8* null               ; [#uses=0 type=i8**]
@__spir_rt_info.8 = global i8** null              ; [#uses=0 type=i8***]
@__spir_rt_info.7 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@__spir_rt_info.6 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@__spir_rt_info.5 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@__spir_rt_info.4 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@__spir_rt_info.3 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@__spir_rt_info.2 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@__spir_rt_info.12 = global i64* null             ; [#uses=0 type=i64**]
@__spir_rt_info.11 = global i8** null             ; [#uses=0 type=i8***]
@__spir_rt_info.10 = global i8** null             ; [#uses=0 type=i8***]
@__spir_rt_info.1 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@__spir_rt_info.0 = global i32* null              ; [#uses=0 type=i32**]
@XCL_WG_DIM_Y.str = internal unnamed_addr constant [13 x i8] c"XCL_WG_DIM_Y\00" ; [#uses=1 type=[13 x i8]*]
@XCL_WG_DIM_X.str = internal unnamed_addr constant [13 x i8] c"XCL_WG_DIM_X\00" ; [#uses=1 type=[13 x i8]*]
@.str3 = private unnamed_addr constant [8 x i8] c"control\00", align 1 ; [#uses=3 type=[8 x i8]*]
@.str2 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1 ; [#uses=3 type=[10 x i8]*]
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=21 type=[1 x i8]*]
@.str = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=1 type=[6 x i8]*]

; [#uses=28]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define void @executeFirstLayer(i32 addrspace(1)* %gmem, i32* %group_id.x, i32* %group_id.y, i32* %group_id.z, i32* %bias, i32* %Layer1_Neurons_GPU, i32* %Layer1_Weights_GPU, i32* %Layer2_Neurons_GPU, i32* %r_offset, i32* %c_offset) {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 addrspace(1)* %gmem), !map !145
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id.x), !map !149
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id.y), !map !153
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id.z), !map !157
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %bias), !map !161
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer1_Neurons_GPU), !map !165
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer1_Weights_GPU), !map !169
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer2_Neurons_GPU), !map !173
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %r_offset), !map !177
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %c_offset), !map !181
  call void (...)* @_ssdm_op_SpecTopModule([18 x i8]* @executeFirstLayer.str)
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !185), !dbg !186 ; [debug line = 65:84] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !{i32* %group_id.x}, i64 0, metadata !187), !dbg !192 ; [debug line = 65:105] [debug variable = group_id.x]
  call void @llvm.dbg.value(metadata !{i32* %group_id.y}, i64 0, metadata !193), !dbg !192 ; [debug line = 65:105] [debug variable = group_id.y]
  call void @llvm.dbg.value(metadata !{i32* %group_id.z}, i64 0, metadata !197), !dbg !192 ; [debug line = 65:105] [debug variable = group_id.z]
  call void @llvm.dbg.value(metadata !{i32* %bias}, i64 0, metadata !201), !dbg !206 ; [debug line = 65:141] [debug variable = args.bias]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Neurons_GPU}, i64 0, metadata !207), !dbg !206 ; [debug line = 65:141] [debug variable = args.Layer1_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Weights_GPU}, i64 0, metadata !211), !dbg !206 ; [debug line = 65:141] [debug variable = args.Layer1_Weights_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer2_Neurons_GPU}, i64 0, metadata !215), !dbg !206 ; [debug line = 65:141] [debug variable = args.Layer2_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %r_offset}, i64 0, metadata !219), !dbg !206 ; [debug line = 65:141] [debug variable = args.r_offset]
  call void @llvm.dbg.value(metadata !{i32* %c_offset}, i64 0, metadata !223), !dbg !206 ; [debug line = 65:141] [debug variable = args.c_offset]
  call void @llvm.dbg.value(metadata !{i32* %group_id.x}, i64 0, metadata !227), !dbg !229 ; [debug line = 30:44@71:1] [debug variable = group_id.x]
  call void @llvm.dbg.value(metadata !{i32* %group_id.y}, i64 0, metadata !232), !dbg !229 ; [debug line = 30:44@71:1] [debug variable = group_id.y]
  call void @llvm.dbg.value(metadata !{i32* %group_id.z}, i64 0, metadata !233), !dbg !229 ; [debug line = 30:44@71:1] [debug variable = group_id.z]
  call void @llvm.dbg.value(metadata !{i32* %bias}, i64 0, metadata !234), !dbg !236 ; [debug line = 36:51@72:1] [debug variable = args.bias]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Neurons_GPU}, i64 0, metadata !238), !dbg !236 ; [debug line = 36:51@72:1] [debug variable = args.Layer1_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Weights_GPU}, i64 0, metadata !239), !dbg !236 ; [debug line = 36:51@72:1] [debug variable = args.Layer1_Weights_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer2_Neurons_GPU}, i64 0, metadata !240), !dbg !236 ; [debug line = 36:51@72:1] [debug variable = args.Layer2_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %r_offset}, i64 0, metadata !241), !dbg !236 ; [debug line = 36:51@72:1] [debug variable = args.r_offset]
  call void @llvm.dbg.value(metadata !{i32* %c_offset}, i64 0, metadata !242), !dbg !236 ; [debug line = 36:51@72:1] [debug variable = args.c_offset]
  call void (...)* @_ssdm_op_SpecInterface(i32 addrspace(1)* %gmem, [6 x i8]* @.str, i32 0, i32 0, [1 x i8]* @.str1, i32 128, i32 0, [1 x i8]* @.str1, [1 x i8]* @.str1, [1 x i8]* @.str1, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @.str1, [1 x i8]* @.str1) nounwind, !dbg !243 ; [debug line = 73:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %group_id.x, i32* %group_id.y, i32* %group_id.z, [10 x i8]* @.str2, i32 0, i32 0, [1 x i8]* @.str1, i32 0, i32 0, [8 x i8]* @.str3, [1 x i8]* @.str1, [1 x i8]* @.str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str1, [1 x i8]* @.str1) nounwind, !dbg !244 ; [debug line = 74:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @.str2, i32 0, i32 0, [1 x i8]* @.str1, i32 0, i32 0, [8 x i8]* @.str3, [1 x i8]* @.str1, [1 x i8]* @.str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str1, [1 x i8]* @.str1) nounwind, !dbg !245 ; [debug line = 75:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %bias, i32* %Layer1_Neurons_GPU, i32* %Layer1_Weights_GPU, i32* %Layer2_Neurons_GPU, i32* %r_offset, i32* %c_offset, [10 x i8]* @.str2, i32 0, i32 0, [1 x i8]* @.str1, i32 0, i32 0, [8 x i8]* @.str3, [1 x i8]* @.str1, [1 x i8]* @.str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str1, [1 x i8]* @.str1) nounwind, !dbg !246 ; [debug line = 76:1]
  %group_id.x.load = load i32* %group_id.x, align 4, !dbg !247 ; [#uses=3 type=i32] [debug line = 121:3]
  %group_id.x.load.cast = trunc i32 %group_id.x.load to i30, !dbg !249 ; [#uses=1 type=i30] [debug line = 52:90]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !250), !dbg !249 ; [debug line = 52:90] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !{i32* %bias}, i64 0, metadata !251), !dbg !253 ; [debug line = 52:149] [debug variable = args.bias]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Neurons_GPU}, i64 0, metadata !254), !dbg !253 ; [debug line = 52:149] [debug variable = args.Layer1_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Weights_GPU}, i64 0, metadata !255), !dbg !253 ; [debug line = 52:149] [debug variable = args.Layer1_Weights_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer2_Neurons_GPU}, i64 0, metadata !256), !dbg !253 ; [debug line = 52:149] [debug variable = args.Layer2_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %r_offset}, i64 0, metadata !257), !dbg !253 ; [debug line = 52:149] [debug variable = args.r_offset]
  call void @llvm.dbg.value(metadata !{i32* %c_offset}, i64 0, metadata !258), !dbg !253 ; [debug line = 52:149] [debug variable = args.c_offset]
  %bias.load = load i32* %bias, align 4, !dbg !259 ; [#uses=1 type=i32] [debug line = 54:116]
  %tmp.2 = lshr i32 %bias.load, 2, !dbg !259      ; [#uses=1 type=i32] [debug line = 54:116]
  %tmp.2.cast = trunc i32 %tmp.2 to i31, !dbg !261 ; [#uses=1 type=i31] [debug line = 55:144]
  %Layer1_Neurons_GPU.load = load i32* %Layer1_Neurons_GPU, align 4, !dbg !261 ; [#uses=1 type=i32] [debug line = 55:144]
  %tmp.3 = lshr i32 %Layer1_Neurons_GPU.load, 2, !dbg !261 ; [#uses=1 type=i32] [debug line = 55:144]
  %tmp.3.cast = trunc i32 %tmp.3 to i31, !dbg !262 ; [#uses=3 type=i31] [debug line = 56:144]
  %Layer1_Weights_GPU.load = load i32* %Layer1_Weights_GPU, align 4, !dbg !262 ; [#uses=1 type=i32] [debug line = 56:144]
  %tmp.4 = lshr i32 %Layer1_Weights_GPU.load, 2, !dbg !262 ; [#uses=1 type=i32] [debug line = 56:144]
  %tmp.4.cast = trunc i32 %tmp.4 to i31, !dbg !263 ; [#uses=3 type=i31] [debug line = 57:144]
  %Layer2_Neurons_GPU.load = load i32* %Layer2_Neurons_GPU, align 4, !dbg !263 ; [#uses=1 type=i32] [debug line = 57:144]
  %tmp.5 = lshr i32 %Layer2_Neurons_GPU.load, 2, !dbg !263 ; [#uses=1 type=i32] [debug line = 57:144]
  %tmp.5.cast = trunc i32 %tmp.5 to i31, !dbg !264 ; [#uses=1 type=i31] [debug line = 58:45]
  %arg_r_offset = load i32* %r_offset, align 4, !dbg !264 ; [#uses=1 type=i32] [debug line = 58:45]
  call void @llvm.dbg.value(metadata !{i32 %arg_r_offset}, i64 0, metadata !265), !dbg !264 ; [debug line = 58:45] [debug variable = arg_r_offset]
  %arg_c_offset = load i32* %c_offset, align 4, !dbg !266 ; [#uses=2 type=i32] [debug line = 59:45]
  call void @llvm.dbg.value(metadata !{i32 %arg_c_offset}, i64 0, metadata !267), !dbg !266 ; [debug line = 59:45] [debug variable = arg_c_offset]
  %tmp.7 = mul i32 %group_id.x.load, 363, !dbg !268 ; [#uses=3 type=i32] [debug line = 23:13]
  %gep_idx.i.i.cast = zext i30 %group_id.x.load.cast to i31 ; [#uses=1 type=i31]
  %arg_bias.i.0.sum = add i31 %gep_idx.i.i.cast, %tmp.2.cast ; [#uses=1 type=i31]
  %arg_bias.i.0.sum.cast = zext i31 %arg_bias.i.0.sum to i32 ; [#uses=1 type=i32]
  %gmem.addr = getelementptr i32 addrspace(1)* %gmem, i32 %arg_bias.i.0.sum.cast ; [#uses=1 type=i32 addrspace(1)*]
  %tmp = trunc i32 %group_id.x.load to i30, !dbg !281 ; [#uses=1 type=i30] [debug line = 31:5]
  br label %for.header55.i.i

for.header55.i.i:                                 ; preds = %for.body56.i.i, %0
  %indvar57.reg2mem69.0.i.i = phi i6 [ 0, %0 ], [ %indvar.inc58.reg2mem.0.i.i, %for.body56.i.i ] ; [#uses=3 type=i6]
  %indvar57.reg2mem69.0.i.i.cast = zext i6 %indvar57.reg2mem69.0.i.i to i32 ; [#uses=1 type=i32]
  %1 = call i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_Y.str) nounwind ; [#uses=0 type=i32]
  %tmp.9 = icmp eq i6 %indvar57.reg2mem69.0.i.i, -32 ; [#uses=1 type=i1]
  %2 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 32, i64 32, i64 32) ; [#uses=0 type=i32]
  br i1 %tmp.9, label %__AESL_call_work_item_NA4.exit, label %for.header.i.i.preheader

for.header.i.i.preheader:                         ; preds = %for.header55.i.i
  %row.0.reg2mem.0.i.i = add i32 %indvar57.reg2mem69.0.i.i.cast, %arg_r_offset, !dbg !282 ; [#uses=2 type=i32] [debug line = 11:15]
  %.reg2mem31.0.i.i = mul i32 %row.0.reg2mem.0.i.i, 2724, !dbg !283 ; [#uses=3 type=i32] [debug line = 14:5]
  %tmp.1 = trunc i32 %.reg2mem31.0.i.i to i30     ; [#uses=1 type=i30]
  %tmp.6 = trunc i32 %.reg2mem31.0.i.i to i30     ; [#uses=1 type=i30]
  %tmp.8 = trunc i32 %row.0.reg2mem.0.i.i to i30, !dbg !281 ; [#uses=1 type=i30] [debug line = 31:5]
  br label %for.header.i.i

for.header.i.i:                                   ; preds = %._crit_edge.i.i, %for.header.i.i.preheader
  %indvar.reg2mem67.0.i.i = phi i6 [ %indvar.inc.reg2mem.0.i.i, %._crit_edge.i.i ], [ 0, %for.header.i.i.preheader ] ; [#uses=4 type=i6]
  %indvar.reg2mem67.0.i.i.cast = zext i6 %indvar.reg2mem67.0.i.i to i32 ; [#uses=1 type=i32]
  %3 = call i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_X.str) nounwind ; [#uses=0 type=i32]
  %tmp. = icmp eq i6 %indvar.reg2mem67.0.i.i, -32 ; [#uses=1 type=i1]
  %4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 32, i64 32, i64 32) ; [#uses=0 type=i32]
  br i1 %tmp., label %for.body56.i.i, label %.split.i.i

for.body56.i.i:                                   ; preds = %for.header.i.i
  %indvar.inc58.reg2mem.0.i.i = add i6 %indvar57.reg2mem69.0.i.i, 1 ; [#uses=1 type=i6]
  br label %for.header55.i.i

.split.i.i:                                       ; preds = %for.header.i.i
  %tmp.10 = zext i6 %indvar.reg2mem67.0.i.i to i30 ; [#uses=1 type=i30]
  %tmp.12 = trunc i32 %arg_c_offset to i30        ; [#uses=1 type=i30]
  %col.0.reg2mem.0.i.i = add i32 %indvar.reg2mem67.0.i.i.cast, %arg_c_offset, !dbg !284 ; [#uses=2 type=i32] [debug line = 12:15]
  %_shl = shl i32 %col.0.reg2mem.0.i.i, 4, !dbg !285 ; [#uses=1 type=i32] [debug line = 17:5]
  %_shl1 = shl i32 %col.0.reg2mem.0.i.i, 2, !dbg !285 ; [#uses=1 type=i32] [debug line = 17:5]
  %.reg2mem27.0.i.i = sub i32 %_shl, %_shl1, !dbg !285 ; [#uses=3 type=i32] [debug line = 17:5]
  br label %5, !dbg !286                          ; [debug line = 19:18]

; <label>:5                                       ; preds = %9, %.split.i.i
  %i.0.reg2mem45.0.i.i = phi i4 [ 0, %.split.i.i ], [ %.reg2mem5.0.i.i, %9 ] ; [#uses=4 type=i4]
  %product.0.reg2mem47.0.i.i = phi float [ 0.000000e+00, %.split.i.i ], [ %product.1.reg2mem43.0.i.i.lcssa, %9 ] ; [#uses=2 type=float]
  %i.0.reg2mem45.0.i.i.cast = zext i4 %i.0.reg2mem45.0.i.i to i9, !dbg !286 ; [#uses=1 type=i9] [debug line = 19:18]
  %i.0.reg2mem45.0.i.i.cast1 = zext i4 %i.0.reg2mem45.0.i.i to i14, !dbg !268 ; [#uses=1 type=i14] [debug line = 23:13]
  %exitcond5 = icmp eq i4 %i.0.reg2mem45.0.i.i, -5, !dbg !286 ; [#uses=1 type=i1] [debug line = 19:18]
  %6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11) ; [#uses=0 type=i32]
  br i1 %exitcond5, label %._crit_edge.i.i, label %.preheader.preheader, !dbg !286 ; [debug line = 19:18]

.preheader.preheader:                             ; preds = %5
  %tmp.16 = mul i14 %i.0.reg2mem45.0.i.i.cast1, 681, !dbg !268 ; [#uses=3 type=i14] [debug line = 23:13]
  %tmp.17 = mul i9 %i.0.reg2mem45.0.i.i.cast, 11, !dbg !268 ; [#uses=3 type=i9] [debug line = 23:13]
  %tmp.17.cast = trunc i9 %tmp.17 to i7, !dbg !268 ; [#uses=1 type=i7] [debug line = 23:13]
  br label %.preheader, !dbg !287                 ; [debug line = 21:22]

.preheader:                                       ; preds = %8, %.preheader.preheader
  %j.0.reg2mem41.0.i.i = phi i4 [ %.reg2mem7.0.i.i, %8 ], [ 0, %.preheader.preheader ] ; [#uses=6 type=i4]
  %product.1.reg2mem43.0.i.i = phi float [ %.reg2mem9.0.i.i, %8 ], [ %product.0.reg2mem47.0.i.i, %.preheader.preheader ] ; [#uses=2 type=float]
  %j.0.reg2mem41.0.i.i.cast = zext i4 %j.0.reg2mem41.0.i.i to i8, !dbg !287 ; [#uses=1 type=i8] [debug line = 21:22]
  %j.0.reg2mem41.0.i.i.cast14.cast = zext i4 %j.0.reg2mem41.0.i.i to i5, !dbg !287 ; [#uses=1 type=i5] [debug line = 21:22]
  %j.0.reg2mem41.0.i.i.cast1 = zext i4 %j.0.reg2mem41.0.i.i to i7, !dbg !287 ; [#uses=2 type=i7] [debug line = 21:22]
  %j.0.reg2mem41.0.i.i.cast2 = zext i4 %j.0.reg2mem41.0.i.i to i6, !dbg !287 ; [#uses=1 type=i6] [debug line = 21:22]
  %exitcond = icmp eq i4 %j.0.reg2mem41.0.i.i, -5, !dbg !287 ; [#uses=1 type=i1] [debug line = 21:22]
  %7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11) ; [#uses=0 type=i32]
  br i1 %exitcond, label %9, label %8, !dbg !287  ; [debug line = 21:22]

; <label>:8                                       ; preds = %.preheader
  %_shl2 = shl nuw i6 %j.0.reg2mem41.0.i.i.cast2, 2, !dbg !268 ; [#uses=1 type=i6] [debug line = 23:13]
  %_shl2.cast = zext i6 %_shl2 to i7, !dbg !268   ; [#uses=1 type=i7] [debug line = 23:13]
  %tmp.18 = sub i7 %_shl2.cast, %j.0.reg2mem41.0.i.i.cast1, !dbg !268 ; [#uses=1 type=i7] [debug line = 23:13]
  %tmp.18.cast = sext i7 %tmp.18 to i14, !dbg !268 ; [#uses=3 type=i14] [debug line = 23:13]
  %tmp.29 = trunc i32 %.reg2mem31.0.i.i to i30    ; [#uses=1 type=i30]
  %tmp.31 = trunc i32 %.reg2mem27.0.i.i to i30    ; [#uses=1 type=i30]
  %tmp1 = add i14 %tmp.18.cast, %tmp.16, !dbg !268 ; [#uses=1 type=i14] [debug line = 23:13]
  %tmp.32 = sext i14 %tmp1 to i30, !dbg !268      ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.33 = add i30 %tmp.29, %tmp.31, !dbg !268   ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.21.cast = add i30 %tmp.33, %tmp.32, !dbg !268 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx20.i.i.cast = zext i30 %tmp.21.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum = add i31 %gep_idx20.i.i.cast, %tmp.3.cast ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum.cast = zext i31 %arg_Layer1_Neurons_GPU.i.0.sum to i32 ; [#uses=1 type=i32]
  %gmem.addr.2 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_GPU.i.0.sum.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.1 = load i32 addrspace(1)* %gmem.addr.2, align 4 ; [#uses=1 type=i32]
  %tmp.22 = bitcast i32 %gmem.load.1 to float     ; [#uses=1 type=float]
  %tmp2 = add i7 %j.0.reg2mem41.0.i.i.cast1, %tmp.17.cast, !dbg !268 ; [#uses=1 type=i7] [debug line = 23:13]
  %tmp.37 = zext i7 %tmp2 to i30, !dbg !268       ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.38 = trunc i32 %tmp.7 to i30, !dbg !268    ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.24.cast = add i30 %tmp.38, %tmp.37, !dbg !268 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx28.i.i.cast = zext i30 %tmp.24.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum = add i31 %gep_idx28.i.i.cast, %tmp.4.cast ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum.cast = zext i31 %arg_Layer1_Weights_GPU.i.0.sum to i32 ; [#uses=1 type=i32]
  %gmem.addr.3 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_GPU.i.0.sum.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.2 = load i32 addrspace(1)* %gmem.addr.3, align 4 ; [#uses=1 type=i32]
  %tmp.25 = bitcast i32 %gmem.load.2 to float     ; [#uses=1 type=float]
  %tmp.26 = fmul float %tmp.22, %tmp.25, !dbg !268 ; [#uses=1 type=float] [debug line = 23:13]
  %tmp.39 = or i30 %tmp.1, 1                      ; [#uses=1 type=i30]
  %tmp.41 = trunc i32 %.reg2mem27.0.i.i to i30    ; [#uses=1 type=i30]
  %tmp4 = add i14 %tmp.18.cast, %tmp.16, !dbg !268 ; [#uses=1 type=i14] [debug line = 23:13]
  %tmp.42 = sext i14 %tmp4 to i30, !dbg !268      ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.43 = add i30 %tmp.39, %tmp.41, !dbg !268   ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.29.cast = add i30 %tmp.43, %tmp.42, !dbg !268 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx36.i.i.cast = zext i30 %tmp.29.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum1 = add i31 %gep_idx36.i.i.cast, %tmp.3.cast ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum1.cast = zext i31 %arg_Layer1_Neurons_GPU.i.0.sum1 to i32 ; [#uses=1 type=i32]
  %gmem.addr.4 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_GPU.i.0.sum1.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.3 = load i32 addrspace(1)* %gmem.addr.4, align 4 ; [#uses=1 type=i32]
  %tmp.30 = bitcast i32 %gmem.load.3 to float     ; [#uses=1 type=float]
  %tmp.47 = trunc i32 %tmp.7 to i30, !dbg !268    ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.48 = zext i9 %tmp.17 to i30, !dbg !268     ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp6 = add i8 %j.0.reg2mem41.0.i.i.cast, 121, !dbg !268 ; [#uses=1 type=i8] [debug line = 23:13]
  %tmp.49 = zext i8 %tmp6 to i30, !dbg !268       ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.50 = add i30 %tmp.48, %tmp.47, !dbg !268   ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.33.cast = add i30 %tmp.50, %tmp.49, !dbg !268 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx44.i.i.cast = zext i30 %tmp.33.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum2 = add i31 %gep_idx44.i.i.cast, %tmp.4.cast ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum2.cast = zext i31 %arg_Layer1_Weights_GPU.i.0.sum2 to i32 ; [#uses=1 type=i32]
  %gmem.addr.5 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_GPU.i.0.sum2.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.4 = load i32 addrspace(1)* %gmem.addr.5, align 4 ; [#uses=1 type=i32]
  %tmp.34 = bitcast i32 %gmem.load.4 to float     ; [#uses=1 type=float]
  %tmp.35 = fmul float %tmp.30, %tmp.34, !dbg !268 ; [#uses=1 type=float] [debug line = 23:13]
  %tmp.36 = fadd float %tmp.26, %tmp.35, !dbg !268 ; [#uses=1 type=float] [debug line = 23:13]
  %tmp.51 = or i30 %tmp.6, 2                      ; [#uses=1 type=i30]
  %tmp.52 = trunc i32 %.reg2mem27.0.i.i to i30    ; [#uses=1 type=i30]
  %tmp8 = add i14 %tmp.18.cast, %tmp.16, !dbg !268 ; [#uses=1 type=i14] [debug line = 23:13]
  %tmp.53 = sext i14 %tmp8 to i30, !dbg !268      ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.54 = add i30 %tmp.51, %tmp.52, !dbg !268   ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.39.cast = add i30 %tmp.54, %tmp.53, !dbg !268 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx52.i.i.cast = zext i30 %tmp.39.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum3 = add i31 %gep_idx52.i.i.cast, %tmp.3.cast ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum3.cast = zext i31 %arg_Layer1_Neurons_GPU.i.0.sum3 to i32 ; [#uses=1 type=i32]
  %gmem.addr.6 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_GPU.i.0.sum3.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.5 = load i32 addrspace(1)* %gmem.addr.6, align 4 ; [#uses=1 type=i32]
  %tmp.40 = bitcast i32 %gmem.load.5 to float     ; [#uses=1 type=float]
  %tmp.55 = trunc i32 %tmp.7 to i30, !dbg !268    ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.56 = zext i9 %tmp.17 to i30, !dbg !268     ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp10 = add i5 %j.0.reg2mem41.0.i.i.cast14.cast, -14, !dbg !268 ; [#uses=1 type=i5] [debug line = 23:13]
  %tmp10.cast = sext i5 %tmp10 to i8, !dbg !268   ; [#uses=1 type=i8] [debug line = 23:13]
  %tmp.57 = zext i8 %tmp10.cast to i30, !dbg !268 ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.58 = add i30 %tmp.56, %tmp.55, !dbg !268   ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp.43.cast = add i30 %tmp.58, %tmp.57, !dbg !268 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx60.i.i.cast = zext i30 %tmp.43.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum4 = add i31 %gep_idx60.i.i.cast, %tmp.4.cast ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum4.cast = zext i31 %arg_Layer1_Weights_GPU.i.0.sum4 to i32 ; [#uses=1 type=i32]
  %gmem.addr.7 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_GPU.i.0.sum4.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.6 = load i32 addrspace(1)* %gmem.addr.7, align 4 ; [#uses=1 type=i32]
  %tmp.44 = bitcast i32 %gmem.load.6 to float     ; [#uses=1 type=float]
  %tmp.45 = fmul float %tmp.40, %tmp.44, !dbg !268 ; [#uses=1 type=float] [debug line = 23:13]
  %tmp.46 = fadd float %tmp.36, %tmp.45, !dbg !268 ; [#uses=1 type=float] [debug line = 23:13]
  %.reg2mem9.0.i.i = fadd float %product.1.reg2mem43.0.i.i, %tmp.46, !dbg !268 ; [#uses=1 type=float] [debug line = 23:13]
  %.reg2mem7.0.i.i = add i4 %j.0.reg2mem41.0.i.i, 1, !dbg !288 ; [#uses=1 type=i4] [debug line = 21:32]
  br label %.preheader, !dbg !288                 ; [debug line = 21:32]

; <label>:9                                       ; preds = %.preheader
  %product.1.reg2mem43.0.i.i.lcssa = phi float [ %product.1.reg2mem43.0.i.i, %.preheader ] ; [#uses=1 type=float]
  %.reg2mem5.0.i.i = add i4 %i.0.reg2mem45.0.i.i, 1, !dbg !289 ; [#uses=1 type=i4] [debug line = 19:28]
  br label %5, !dbg !289                          ; [debug line = 19:28]

._crit_edge.i.i:                                  ; preds = %5
  %product.0.reg2mem47.0.i.i.lcssa = phi float [ %product.0.reg2mem47.0.i.i, %5 ] ; [#uses=1 type=float]
  %gmem.load = load i32 addrspace(1)* %gmem.addr, align 4 ; [#uses=1 type=i32]
  %tmp.11 = bitcast i32 %gmem.load to float       ; [#uses=1 type=float]
  %.reg2mem.0.i.i = fadd float %product.0.reg2mem47.0.i.i.lcssa, %tmp.11, !dbg !290 ; [#uses=3 type=float] [debug line = 28:5]
  %.reg2mem.0.i.i_to_int = bitcast float %.reg2mem.0.i.i to i32 ; [#uses=2 type=i32]
  %tmp.13 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %.reg2mem.0.i.i_to_int, i32 23, i32 30) ; [#uses=1 type=i8]
  %tmp.14 = trunc i32 %.reg2mem.0.i.i_to_int to i23 ; [#uses=1 type=i23]
  %notlhs = icmp ne i8 %tmp.13, -1                ; [#uses=1 type=i1]
  %notrhs = icmp eq i23 %tmp.14, 0                ; [#uses=1 type=i1]
  %tmp.19 = or i1 %notrhs, %notlhs                ; [#uses=1 type=i1]
  %tmp.20 = fcmp olt float %.reg2mem.0.i.i, 0.000000e+00, !dbg !291 ; [#uses=1 type=i1] [debug line = 29:5]
  %tmp.21 = and i1 %tmp.19, %tmp.20, !dbg !291    ; [#uses=1 type=i1] [debug line = 29:5]
  %tmp.23 = add i30 %tmp.12, %tmp.10              ; [#uses=1 type=i30]
  %tmp.24 = mul i30 %tmp, 3025, !dbg !281         ; [#uses=1 type=i30] [debug line = 31:5]
  %tmp.27 = add i30 %tmp.23, %tmp.24              ; [#uses=1 type=i30]
  %tmp.28 = mul i30 %tmp.8, 55, !dbg !281         ; [#uses=1 type=i30] [debug line = 31:5]
  %tmp.14.cast = add i30 %tmp.28, %tmp.27         ; [#uses=1 type=i30]
  %gep_idx12.i.i.cast = zext i30 %tmp.14.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer2_Neurons_GPU.i.0.sum = add i31 %gep_idx12.i.i.cast, %tmp.5.cast ; [#uses=1 type=i31]
  %arg_Layer2_Neurons_GPU.i.0.sum.cast = zext i31 %arg_Layer2_Neurons_GPU.i.0.sum to i32 ; [#uses=1 type=i32]
  %gmem.addr.1 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer2_Neurons_GPU.i.0.sum.cast ; [#uses=1 type=i32 addrspace(1)*]
  %tmp.15 = bitcast float %.reg2mem.0.i.i to i32  ; [#uses=1 type=i32]
  %val.i.i = select i1 %tmp.21, i32 0, i32 %tmp.15 ; [#uses=1 type=i32]
  store i32 %val.i.i, i32 addrspace(1)* %gmem.addr.1, align 4
  %indvar.inc.reg2mem.0.i.i = add i6 %indvar.reg2mem67.0.i.i, 1 ; [#uses=1 type=i6]
  %10 = call i32 (...)* @_ssdm_SpecLoopFlatten(i32 0, [1 x i8]* @str) nounwind ; [#uses=0 type=i32]
  br label %for.header.i.i

__AESL_call_work_item_NA4.exit:                   ; preds = %for.header55.i.i
  ret void, !dbg !292                             ; [debug line = 81:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=4]
declare i32 @_ssdm_op_SpecLoopTripCount(...)

; [#uses=2]
declare i32 @_ssdm_op_SpecLoopName(...)

; [#uses=4]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=10]
declare void @_ssdm_op_SpecBitsMap(...)

; [#uses=1]
declare i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=1]
declare i32 @_ssdm_SpecLoopFlatten(...)

!hls.encrypted.func = !{}
!xcl.libspir = !{!0}
!xcl.reqd_rt_info = !{!1}
!xcl.portmap = !{!2, !4, !5, !6, !7, !9}
!axi4.master.portmap = !{!10}
!xcl.portlist = !{!3, !8}
!xcl.lmem_info = !{}
!xcl.progvar_info = !{}
!llvm.dbg.cu = !{!11}
!llvm.map.gv = !{!128, !135, !140}

!0 = metadata !{metadata !"C:/Xilinx/Vivado_HLS/2016.4/win64/lib/libspir-hls.a"}
!1 = metadata !{metadata !"executeFirstLayer", metadata !"group_id"}
!2 = metadata !{metadata !"executeFirstLayer", i32 0, metadata !3}
!3 = metadata !{metadata !"executeFirstLayer", metadata !"gmem", metadata !"addressable", metadata !"master", i32 32}
!4 = metadata !{metadata !"executeFirstLayer", i32 1, metadata !3}
!5 = metadata !{metadata !"executeFirstLayer", i32 2, metadata !3}
!6 = metadata !{metadata !"executeFirstLayer", i32 3, metadata !3}
!7 = metadata !{metadata !"executeFirstLayer", i32 4, metadata !8}
!8 = metadata !{metadata !"executeFirstLayer", metadata !"control", metadata !"addressable", metadata !"slave", i32 32}
!9 = metadata !{metadata !"executeFirstLayer", i32 5, metadata !8}
!10 = metadata !{metadata !"gmem", metadata !"bias", metadata !"", metadata !"Layer1_Neurons_GPU", metadata !"", metadata !"Layer1_Weights_GPU", metadata !"", metadata !"Layer2_Neurons_GPU", metadata !""}
!11 = metadata !{i32 786449, i32 0, i32 4, metadata !"aesl_gen-tmpA.cpp", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !12, metadata !12, metadata !13, metadata !85} ; [ DW_TAG_compile_unit ]
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14, metadata !80, metadata !83, metadata !84}
!14 = metadata !{i32 786478, i32 0, metadata !15, metadata !"__AESL_call_work_item_NA", metadata !"__AESL_call_work_item_NA", metadata !"", metadata !15, i32 52, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !50, i32 53} ; [ DW_TAG_subprogram ]
!15 = metadata !{i32 786473, metadata !"executeFirstLayer_compute_unit", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!16 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!17 = metadata !{null, metadata !18, metadata !21, metadata !52}
!18 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ]
!19 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_volatile_type ]
!20 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!22 = metadata !{i32 786454, null, metadata !"__spir_rt_info_t", metadata !15, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!23 = metadata !{i32 786434, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 896, i64 64, i32 0, i32 0, null, metadata !25, i32 0, null, null} ; [ DW_TAG_class_type ]
!24 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl/libspir_types.h", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!25 = metadata !{metadata !26, metadata !27, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !39, metadata !42, metadata !43, metadata !44, metadata !46}
!26 = metadata !{i32 786445, metadata !23, metadata !"work_dim", metadata !24, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ]
!27 = metadata !{i32 786445, metadata !23, metadata !"global_size", metadata !24, i32 124, i64 96, i64 32, i64 32, i32 0, metadata !28} ; [ DW_TAG_member ]
!28 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !20, metadata !29, i32 0, i32 0} ; [ DW_TAG_array_type ]
!29 = metadata !{metadata !30}
!30 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!31 = metadata !{i32 786445, metadata !23, metadata !"global_id", metadata !24, i32 125, i64 96, i64 32, i64 128, i32 0, metadata !28} ; [ DW_TAG_member ]
!32 = metadata !{i32 786445, metadata !23, metadata !"local_size", metadata !24, i32 127, i64 96, i64 32, i64 224, i32 0, metadata !28} ; [ DW_TAG_member ]
!33 = metadata !{i32 786445, metadata !23, metadata !"local_id", metadata !24, i32 128, i64 96, i64 32, i64 320, i32 0, metadata !28} ; [ DW_TAG_member ]
!34 = metadata !{i32 786445, metadata !23, metadata !"num_groups", metadata !24, i32 130, i64 96, i64 32, i64 416, i32 0, metadata !28} ; [ DW_TAG_member ]
!35 = metadata !{i32 786445, metadata !23, metadata !"group_id", metadata !24, i32 131, i64 96, i64 32, i64 512, i32 0, metadata !28} ; [ DW_TAG_member ]
!36 = metadata !{i32 786445, metadata !23, metadata !"global_offset", metadata !24, i32 132, i64 96, i64 32, i64 608, i32 0, metadata !28} ; [ DW_TAG_member ]
!37 = metadata !{i32 786445, metadata !23, metadata !"pthread_barrier", metadata !24, i32 135, i64 32, i64 32, i64 704, i32 0, metadata !38} ; [ DW_TAG_member ]
!38 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!39 = metadata !{i32 786445, metadata !23, metadata !"barriertoscheduler", metadata !24, i32 138, i64 8, i64 8, i64 736, i32 0, metadata !40} ; [ DW_TAG_member ]
!40 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_volatile_type ]
!41 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!42 = metadata !{i32 786445, metadata !23, metadata !"scheduler_context", metadata !24, i32 139, i64 32, i64 32, i64 768, i32 0, metadata !38} ; [ DW_TAG_member ]
!43 = metadata !{i32 786445, metadata !23, metadata !"pe_context", metadata !24, i32 140, i64 32, i64 32, i64 800, i32 0, metadata !38} ; [ DW_TAG_member ]
!44 = metadata !{i32 786445, metadata !23, metadata !"printf_buffer", metadata !24, i32 142, i64 64, i64 64, i64 832, i32 0, metadata !45} ; [ DW_TAG_member ]
!45 = metadata !{i32 786468, null, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!46 = metadata !{i32 786478, i32 0, metadata !23, metadata !"__spir_rt_info_tT", metadata !"__spir_rt_info_tT", metadata !"", metadata !24, i32 120, metadata !47, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !50, i32 120} ; [ DW_TAG_subprogram ]
!47 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!48 = metadata !{null, metadata !49}
!49 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !23} ; [ DW_TAG_pointer_type ]
!50 = metadata !{metadata !51}
!51 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!52 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ]
!53 = metadata !{i32 786454, null, metadata !"executeFirstLayer_args_t", metadata !15, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !54} ; [ DW_TAG_typedef ]
!54 = metadata !{i32 786434, null, metadata !"", metadata !15, i32 17, i64 192, i64 32, i32 0, i32 0, null, metadata !55, i32 0, null, null} ; [ DW_TAG_class_type ]
!55 = metadata !{metadata !56, metadata !58, metadata !59, metadata !60, metadata !61, metadata !62, metadata !63}
!56 = metadata !{i32 786445, metadata !54, metadata !"bias", metadata !15, i32 18, i64 32, i64 32, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!57 = metadata !{i32 786454, null, metadata !"__spir_size_t", metadata !15, i32 108, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!58 = metadata !{i32 786445, metadata !54, metadata !"Layer1_Neurons_GPU", metadata !15, i32 19, i64 32, i64 32, i64 32, i32 0, metadata !57} ; [ DW_TAG_member ]
!59 = metadata !{i32 786445, metadata !54, metadata !"Layer1_Weights_GPU", metadata !15, i32 20, i64 32, i64 32, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!60 = metadata !{i32 786445, metadata !54, metadata !"Layer2_Neurons_GPU", metadata !15, i32 21, i64 32, i64 32, i64 96, i32 0, metadata !57} ; [ DW_TAG_member ]
!61 = metadata !{i32 786445, metadata !54, metadata !"r_offset", metadata !15, i32 22, i64 32, i64 32, i64 128, i32 0, metadata !20} ; [ DW_TAG_member ]
!62 = metadata !{i32 786445, metadata !54, metadata !"c_offset", metadata !15, i32 23, i64 32, i64 32, i64 160, i32 0, metadata !20} ; [ DW_TAG_member ]
!63 = metadata !{i32 786474, metadata !54, null, metadata !15, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_friend ]
!64 = metadata !{i32 786434, null, metadata !"aesl_keep_name_class", metadata !15, i32 27, i64 8, i64 8, i32 0, i32 0, null, metadata !65, i32 0, null, null} ; [ DW_TAG_class_type ]
!65 = metadata !{metadata !66, metadata !77}
!66 = metadata !{i32 786478, i32 0, metadata !64, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !15, i32 30, metadata !67, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !50, i32 30} ; [ DW_TAG_subprogram ]
!67 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !68, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!68 = metadata !{null, metadata !69}
!69 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !70} ; [ DW_TAG_pointer_type ]
!70 = metadata !{i32 786454, null, metadata !"three_tuple_t", metadata !15, i32 15, i64 0, i64 0, i64 0, i32 0, metadata !71} ; [ DW_TAG_typedef ]
!71 = metadata !{i32 786434, null, metadata !"", metadata !15, i32 10, i64 96, i64 32, i32 0, i32 0, null, metadata !72, i32 0, null, null} ; [ DW_TAG_class_type ]
!72 = metadata !{metadata !73, metadata !74, metadata !75, metadata !76}
!73 = metadata !{i32 786445, metadata !71, metadata !"x", metadata !15, i32 11, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ]
!74 = metadata !{i32 786445, metadata !71, metadata !"y", metadata !15, i32 12, i64 32, i64 32, i64 32, i32 0, metadata !20} ; [ DW_TAG_member ]
!75 = metadata !{i32 786445, metadata !71, metadata !"z", metadata !15, i32 13, i64 32, i64 32, i64 64, i32 0, metadata !20} ; [ DW_TAG_member ]
!76 = metadata !{i32 786474, metadata !71, null, metadata !15, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_friend ]
!77 = metadata !{i32 786478, i32 0, metadata !64, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP24executeFirstLayer_args_t", metadata !15, i32 36, metadata !78, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !50, i32 36} ; [ DW_TAG_subprogram ]
!78 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !79, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!79 = metadata !{null, metadata !52}
!80 = metadata !{i32 786478, i32 0, metadata !15, metadata !"__AESL_work_groupA", metadata !"__AESL_work_groupA", metadata !"", metadata !15, i32 65, metadata !81, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !50, i32 66} ; [ DW_TAG_subprogram ]
!81 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !82, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!82 = metadata !{null, metadata !18, metadata !69, metadata !52}
!83 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP24executeFirstLayer_args_t", metadata !15, i32 36, metadata !78, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !77, metadata !50, i32 36} ; [ DW_TAG_subprogram ]
!84 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !15, i32 30, metadata !67, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !66, metadata !50, i32 30} ; [ DW_TAG_subprogram ]
!85 = metadata !{metadata !86}
!86 = metadata !{metadata !87, metadata !91, metadata !94, metadata !97, metadata !100, metadata !103, metadata !106, metadata !109, metadata !112, metadata !115, metadata !118, metadata !121, metadata !124, metadata !127}
!87 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.work_dim", metadata !"rt_info.work_dim", metadata !"rt_info.work_dim", metadata !88, i32 49, metadata !89, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!88 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl\5Caesl_gen_cu_body.inc", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!89 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 32, i64 64, i32 0, i32 0, null, metadata !90, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!90 = metadata !{metadata !26}
!91 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.global_size", metadata !"rt_info.global_size", metadata !"rt_info.global_size", metadata !88, i32 49, metadata !92, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!92 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !93, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!93 = metadata !{metadata !27}
!94 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.global_id", metadata !"rt_info.global_id", metadata !"rt_info.global_id", metadata !88, i32 49, metadata !95, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!95 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !96, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!96 = metadata !{metadata !31}
!97 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.local_size", metadata !"rt_info.local_size", metadata !"rt_info.local_size", metadata !88, i32 49, metadata !98, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!98 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !99, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!99 = metadata !{metadata !32}
!100 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.local_id", metadata !"rt_info.local_id", metadata !"rt_info.local_id", metadata !88, i32 49, metadata !101, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!101 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !102, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!102 = metadata !{metadata !33}
!103 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.num_groups", metadata !"rt_info.num_groups", metadata !"rt_info.num_groups", metadata !88, i32 49, metadata !104, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!104 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !105, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!105 = metadata !{metadata !34}
!106 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.group_id", metadata !"rt_info.group_id", metadata !"rt_info.group_id", metadata !88, i32 49, metadata !107, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!107 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !108, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!108 = metadata !{metadata !35}
!109 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.pe_context", metadata !"rt_info.pe_context", metadata !"rt_info.pe_context", metadata !88, i32 49, metadata !110, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!110 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 32, i64 64, i32 0, i32 0, null, metadata !111, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!111 = metadata !{metadata !43}
!112 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.global_offset", metadata !"rt_info.global_offset", metadata !"rt_info.global_offset", metadata !88, i32 49, metadata !113, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!113 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !114, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!114 = metadata !{metadata !36}
!115 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.scheduler_context", metadata !"rt_info.scheduler_context", metadata !"rt_info.scheduler_context", metadata !88, i32 49, metadata !116, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!116 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 32, i64 64, i32 0, i32 0, null, metadata !117, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!117 = metadata !{metadata !42}
!118 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.printf_buffer", metadata !"rt_info.printf_buffer", metadata !"rt_info.printf_buffer", metadata !88, i32 49, metadata !119, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!119 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 64, i64 64, i32 0, i32 0, null, metadata !120, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!120 = metadata !{metadata !44}
!121 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.pthread_barrier", metadata !"rt_info.pthread_barrier", metadata !"rt_info.pthread_barrier", metadata !88, i32 49, metadata !122, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!122 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 32, i64 64, i32 0, i32 0, null, metadata !123, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!123 = metadata !{metadata !37}
!124 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.barriertoscheduler", metadata !"rt_info.barriertoscheduler", metadata !"rt_info.barriertoscheduler", metadata !88, i32 49, metadata !125, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!125 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !24, i32 120, i64 8, i64 64, i32 0, i32 0, null, metadata !126, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!126 = metadata !{metadata !39}
!127 = metadata !{i32 786484, i32 0, metadata !80, metadata !"rt_info", metadata !"rt_info", metadata !"", metadata !88, i32 49, metadata !22, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!128 = metadata !{metadata !129, i8** @__spir_rt_info.9}
!129 = metadata !{metadata !130}
!130 = metadata !{i32 0, i32 7, metadata !131}
!131 = metadata !{metadata !132}
!132 = metadata !{metadata !"__spir_rt_info.9", metadata !133, metadata !"", i32 0, i32 7}
!133 = metadata !{metadata !134}
!134 = metadata !{i32 0, i32 0, i32 1}
!135 = metadata !{metadata !136, i64** @__spir_rt_info.12}
!136 = metadata !{metadata !137}
!137 = metadata !{i32 0, i32 63, metadata !138}
!138 = metadata !{metadata !139}
!139 = metadata !{metadata !"__spir_rt_info.12", metadata !133, metadata !"", i32 0, i32 63}
!140 = metadata !{metadata !141, i32** @__spir_rt_info.0}
!141 = metadata !{metadata !142}
!142 = metadata !{i32 0, i32 31, metadata !143}
!143 = metadata !{metadata !144}
!144 = metadata !{metadata !"__spir_rt_info.0", metadata !133, metadata !"", i32 0, i32 31}
!145 = metadata !{metadata !146}
!146 = metadata !{i32 0, i32 31, metadata !147}
!147 = metadata !{metadata !148}
!148 = metadata !{metadata !"gmem", metadata !133, metadata !"", i32 0, i32 31}
!149 = metadata !{metadata !150}
!150 = metadata !{i32 0, i32 31, metadata !151}
!151 = metadata !{metadata !152}
!152 = metadata !{metadata !"group_id.x", metadata !133, metadata !"", i32 0, i32 31}
!153 = metadata !{metadata !154}
!154 = metadata !{i32 0, i32 31, metadata !155}
!155 = metadata !{metadata !156}
!156 = metadata !{metadata !"group_id.y", metadata !133, metadata !"", i32 0, i32 31}
!157 = metadata !{metadata !158}
!158 = metadata !{i32 0, i32 31, metadata !159}
!159 = metadata !{metadata !160}
!160 = metadata !{metadata !"group_id.z", metadata !133, metadata !"", i32 0, i32 31}
!161 = metadata !{metadata !162}
!162 = metadata !{i32 0, i32 31, metadata !163}
!163 = metadata !{metadata !164}
!164 = metadata !{metadata !"bias", metadata !133, metadata !"", i32 0, i32 31}
!165 = metadata !{metadata !166}
!166 = metadata !{i32 0, i32 31, metadata !167}
!167 = metadata !{metadata !168}
!168 = metadata !{metadata !"Layer1_Neurons_GPU", metadata !133, metadata !"", i32 0, i32 31}
!169 = metadata !{metadata !170}
!170 = metadata !{i32 0, i32 31, metadata !171}
!171 = metadata !{metadata !172}
!172 = metadata !{metadata !"Layer1_Weights_GPU", metadata !133, metadata !"", i32 0, i32 31}
!173 = metadata !{metadata !174}
!174 = metadata !{i32 0, i32 31, metadata !175}
!175 = metadata !{metadata !176}
!176 = metadata !{metadata !"Layer2_Neurons_GPU", metadata !133, metadata !"", i32 0, i32 31}
!177 = metadata !{metadata !178}
!178 = metadata !{i32 0, i32 31, metadata !179}
!179 = metadata !{metadata !180}
!180 = metadata !{metadata !"r_offset", metadata !133, metadata !"", i32 0, i32 31}
!181 = metadata !{metadata !182}
!182 = metadata !{i32 0, i32 31, metadata !183}
!183 = metadata !{metadata !184}
!184 = metadata !{metadata !"c_offset", metadata !133, metadata !"", i32 0, i32 31}
!185 = metadata !{i32 786689, metadata !80, metadata !"gmem", metadata !15, i32 16777281, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!186 = metadata !{i32 65, i32 84, metadata !80, null}
!187 = metadata !{i32 790531, metadata !188, metadata !"group_id.x", null, i32 65, metadata !189, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!188 = metadata !{i32 786689, metadata !80, metadata !"group_id", metadata !15, i32 33554497, metadata !69, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!189 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !190} ; [ DW_TAG_pointer_type ]
!190 = metadata !{i32 786438, null, metadata !"", metadata !15, i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !191, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!191 = metadata !{metadata !73}
!192 = metadata !{i32 65, i32 105, metadata !80, null}
!193 = metadata !{i32 790531, metadata !188, metadata !"group_id.y", null, i32 65, metadata !194, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!194 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !195} ; [ DW_TAG_pointer_type ]
!195 = metadata !{i32 786438, null, metadata !"", metadata !15, i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !196, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!196 = metadata !{metadata !74}
!197 = metadata !{i32 790531, metadata !188, metadata !"group_id.z", null, i32 65, metadata !198, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!198 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !199} ; [ DW_TAG_pointer_type ]
!199 = metadata !{i32 786438, null, metadata !"", metadata !15, i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !200, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!200 = metadata !{metadata !75}
!201 = metadata !{i32 790531, metadata !202, metadata !"args.bias", null, i32 65, metadata !203, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!202 = metadata !{i32 786689, metadata !80, metadata !"args", metadata !15, i32 50331713, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!203 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !204} ; [ DW_TAG_pointer_type ]
!204 = metadata !{i32 786438, null, metadata !"", metadata !15, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !205, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!205 = metadata !{metadata !56}
!206 = metadata !{i32 65, i32 141, metadata !80, null}
!207 = metadata !{i32 790531, metadata !202, metadata !"args.Layer1_Neurons_GPU", null, i32 65, metadata !208, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!208 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !209} ; [ DW_TAG_pointer_type ]
!209 = metadata !{i32 786438, null, metadata !"", metadata !15, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !210, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!210 = metadata !{metadata !58}
!211 = metadata !{i32 790531, metadata !202, metadata !"args.Layer1_Weights_GPU", null, i32 65, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!212 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !213} ; [ DW_TAG_pointer_type ]
!213 = metadata !{i32 786438, null, metadata !"", metadata !15, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !214, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!214 = metadata !{metadata !59}
!215 = metadata !{i32 790531, metadata !202, metadata !"args.Layer2_Neurons_GPU", null, i32 65, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!216 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !217} ; [ DW_TAG_pointer_type ]
!217 = metadata !{i32 786438, null, metadata !"", metadata !15, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !218, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!218 = metadata !{metadata !60}
!219 = metadata !{i32 790531, metadata !202, metadata !"args.r_offset", null, i32 65, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!220 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !221} ; [ DW_TAG_pointer_type ]
!221 = metadata !{i32 786438, null, metadata !"", metadata !15, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !222, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!222 = metadata !{metadata !61}
!223 = metadata !{i32 790531, metadata !202, metadata !"args.c_offset", null, i32 65, metadata !224, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!224 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !225} ; [ DW_TAG_pointer_type ]
!225 = metadata !{i32 786438, null, metadata !"", metadata !15, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !226, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!226 = metadata !{metadata !62}
!227 = metadata !{i32 790531, metadata !228, metadata !"group_id.x", null, i32 30, metadata !189, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!228 = metadata !{i32 786689, metadata !84, metadata !"group_id", metadata !15, i32 16777246, metadata !69, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!229 = metadata !{i32 30, i32 44, metadata !84, metadata !230}
!230 = metadata !{i32 71, i32 1, metadata !231, null}
!231 = metadata !{i32 786443, metadata !80, i32 66, i32 1, metadata !15, i32 1} ; [ DW_TAG_lexical_block ]
!232 = metadata !{i32 790531, metadata !228, metadata !"group_id.y", null, i32 30, metadata !194, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!233 = metadata !{i32 790531, metadata !228, metadata !"group_id.z", null, i32 30, metadata !198, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!234 = metadata !{i32 790531, metadata !235, metadata !"args.bias", null, i32 36, metadata !203, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!235 = metadata !{i32 786689, metadata !83, metadata !"args", metadata !15, i32 16777252, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!236 = metadata !{i32 36, i32 51, metadata !83, metadata !237}
!237 = metadata !{i32 72, i32 1, metadata !231, null}
!238 = metadata !{i32 790531, metadata !235, metadata !"args.Layer1_Neurons_GPU", null, i32 36, metadata !208, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!239 = metadata !{i32 790531, metadata !235, metadata !"args.Layer1_Weights_GPU", null, i32 36, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!240 = metadata !{i32 790531, metadata !235, metadata !"args.Layer2_Neurons_GPU", null, i32 36, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!241 = metadata !{i32 790531, metadata !235, metadata !"args.r_offset", null, i32 36, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!242 = metadata !{i32 790531, metadata !235, metadata !"args.c_offset", null, i32 36, metadata !224, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!243 = metadata !{i32 73, i32 1, metadata !231, null}
!244 = metadata !{i32 74, i32 1, metadata !231, null}
!245 = metadata !{i32 75, i32 1, metadata !231, null}
!246 = metadata !{i32 76, i32 1, metadata !231, null}
!247 = metadata !{i32 121, i32 3, metadata !248, null}
!248 = metadata !{i32 786443, metadata !231, metadata !88} ; [ DW_TAG_lexical_block ]
!249 = metadata !{i32 52, i32 90, metadata !14, null}
!250 = metadata !{i32 786689, metadata !14, metadata !"gmem", metadata !15, i32 16777268, metadata !18, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!251 = metadata !{i32 790531, metadata !252, metadata !"args.bias", null, i32 52, metadata !203, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!252 = metadata !{i32 786689, metadata !14, metadata !"args", metadata !15, i32 50331700, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!253 = metadata !{i32 52, i32 149, metadata !14, null}
!254 = metadata !{i32 790531, metadata !252, metadata !"args.Layer1_Neurons_GPU", null, i32 52, metadata !208, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!255 = metadata !{i32 790531, metadata !252, metadata !"args.Layer1_Weights_GPU", null, i32 52, metadata !212, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!256 = metadata !{i32 790531, metadata !252, metadata !"args.Layer2_Neurons_GPU", null, i32 52, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!257 = metadata !{i32 790531, metadata !252, metadata !"args.r_offset", null, i32 52, metadata !220, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!258 = metadata !{i32 790531, metadata !252, metadata !"args.c_offset", null, i32 52, metadata !224, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!259 = metadata !{i32 54, i32 116, metadata !260, null}
!260 = metadata !{i32 786443, metadata !14, i32 53, i32 1, metadata !15, i32 0} ; [ DW_TAG_lexical_block ]
!261 = metadata !{i32 55, i32 144, metadata !260, null}
!262 = metadata !{i32 56, i32 144, metadata !260, null}
!263 = metadata !{i32 57, i32 144, metadata !260, null}
!264 = metadata !{i32 58, i32 45, metadata !260, null}
!265 = metadata !{i32 786688, metadata !260, metadata !"arg_r_offset", metadata !15, i32 58, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!266 = metadata !{i32 59, i32 45, metadata !260, null}
!267 = metadata !{i32 786688, metadata !260, metadata !"arg_c_offset", metadata !15, i32 59, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!268 = metadata !{i32 23, i32 13, metadata !269, null}
!269 = metadata !{i32 786443, metadata !270, i32 22, i32 9, metadata !275, i32 4} ; [ DW_TAG_lexical_block ]
!270 = metadata !{i32 786443, metadata !271, i32 21, i32 9, metadata !275, i32 3} ; [ DW_TAG_lexical_block ]
!271 = metadata !{i32 786443, metadata !272, i32 20, i32 5, metadata !275, i32 2} ; [ DW_TAG_lexical_block ]
!272 = metadata !{i32 786443, metadata !273, i32 19, i32 5, metadata !275, i32 1} ; [ DW_TAG_lexical_block ]
!273 = metadata !{i32 786443, metadata !274, i32 5, i32 1, metadata !275, i32 0} ; [ DW_TAG_lexical_block ]
!274 = metadata !{i32 786478, i32 0, metadata !275, metadata !"executeFirstLayer", metadata !"executeFirstLayer", metadata !"", metadata !275, i32 2, metadata !276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !50, i32 5} ; [ DW_TAG_subprogram ]
!275 = metadata !{i32 786473, metadata !"Alexnet_dev/layer1.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS", null} ; [ DW_TAG_file_type ]
!276 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !277, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!277 = metadata !{null, metadata !278, metadata !278, metadata !278, metadata !278, metadata !280, metadata !280}
!278 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !279} ; [ DW_TAG_pointer_type ]
!279 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!280 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!281 = metadata !{i32 31, i32 5, metadata !273, null}
!282 = metadata !{i32 11, i32 15, metadata !273, null}
!283 = metadata !{i32 14, i32 5, metadata !273, null}
!284 = metadata !{i32 12, i32 15, metadata !273, null}
!285 = metadata !{i32 17, i32 5, metadata !273, null}
!286 = metadata !{i32 19, i32 18, metadata !272, null}
!287 = metadata !{i32 21, i32 22, metadata !270, null}
!288 = metadata !{i32 21, i32 32, metadata !270, null}
!289 = metadata !{i32 19, i32 28, metadata !272, null}
!290 = metadata !{i32 28, i32 5, metadata !273, null}
!291 = metadata !{i32 29, i32 5, metadata !273, null}
!292 = metadata !{i32 81, i32 1, metadata !293, null}
!293 = metadata !{i32 786443, metadata !231, metadata !15} ; [ DW_TAG_lexical_block ]
