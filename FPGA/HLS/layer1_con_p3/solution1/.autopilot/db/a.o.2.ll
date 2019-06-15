; ModuleID = 'C:/Users/RA_prof_Jeon/siddharth/HLS/layer1_con_p3/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-linux-gnu"

@str = internal constant [1 x i8] zeroinitializer ; [#uses=1 type=[1 x i8]*]
@executeFirstLayer1_p3.str = internal unnamed_addr constant [22 x i8] c"executeFirstLayer1_p3\00" ; [#uses=1 type=[22 x i8]*]
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

; [#uses=20]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define void @executeFirstLayer1_p3(i32 addrspace(1)* %gmem, i32* %group_id.x, i32* %group_id.y, i32* %group_id.z, i32* %bias, i32* %Layer1_Neurons_GPU, i32* %Layer1_Weights_GPU, i32* %Layer2_Neurons_GPU) {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 addrspace(1)* %gmem), !map !141
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id.x), !map !145
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id.y), !map !149
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id.z), !map !153
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %bias), !map !157
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer1_Neurons_GPU), !map !161
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer1_Weights_GPU), !map !165
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer2_Neurons_GPU), !map !169
  call void (...)* @_ssdm_op_SpecTopModule([22 x i8]* @executeFirstLayer1_p3.str)
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !173), !dbg !174 ; [debug line = 59:84] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !{i32* %group_id.x}, i64 0, metadata !175), !dbg !180 ; [debug line = 59:105] [debug variable = group_id.x]
  call void @llvm.dbg.value(metadata !{i32* %group_id.y}, i64 0, metadata !181), !dbg !180 ; [debug line = 59:105] [debug variable = group_id.y]
  call void @llvm.dbg.value(metadata !{i32* %group_id.z}, i64 0, metadata !185), !dbg !180 ; [debug line = 59:105] [debug variable = group_id.z]
  call void @llvm.dbg.value(metadata !{i32* %bias}, i64 0, metadata !189), !dbg !194 ; [debug line = 59:145] [debug variable = args.bias]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Neurons_GPU}, i64 0, metadata !195), !dbg !194 ; [debug line = 59:145] [debug variable = args.Layer1_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Weights_GPU}, i64 0, metadata !199), !dbg !194 ; [debug line = 59:145] [debug variable = args.Layer1_Weights_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer2_Neurons_GPU}, i64 0, metadata !203), !dbg !194 ; [debug line = 59:145] [debug variable = args.Layer2_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %group_id.x}, i64 0, metadata !207), !dbg !209 ; [debug line = 28:44@65:1] [debug variable = group_id.x]
  call void @llvm.dbg.value(metadata !{i32* %group_id.y}, i64 0, metadata !212), !dbg !209 ; [debug line = 28:44@65:1] [debug variable = group_id.y]
  call void @llvm.dbg.value(metadata !{i32* %group_id.z}, i64 0, metadata !213), !dbg !209 ; [debug line = 28:44@65:1] [debug variable = group_id.z]
  call void @llvm.dbg.value(metadata !{i32* %bias}, i64 0, metadata !214), !dbg !216 ; [debug line = 34:55@66:1] [debug variable = args.bias]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Neurons_GPU}, i64 0, metadata !218), !dbg !216 ; [debug line = 34:55@66:1] [debug variable = args.Layer1_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Weights_GPU}, i64 0, metadata !219), !dbg !216 ; [debug line = 34:55@66:1] [debug variable = args.Layer1_Weights_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer2_Neurons_GPU}, i64 0, metadata !220), !dbg !216 ; [debug line = 34:55@66:1] [debug variable = args.Layer2_Neurons_GPU]
  call void (...)* @_ssdm_op_SpecInterface(i32 addrspace(1)* %gmem, [6 x i8]* @.str, i32 0, i32 0, [1 x i8]* @.str1, i32 128, i32 0, [1 x i8]* @.str1, [1 x i8]* @.str1, [1 x i8]* @.str1, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @.str1, [1 x i8]* @.str1) nounwind, !dbg !221 ; [debug line = 67:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %group_id.x, i32* %group_id.y, i32* %group_id.z, [10 x i8]* @.str2, i32 0, i32 0, [1 x i8]* @.str1, i32 0, i32 0, [8 x i8]* @.str3, [1 x i8]* @.str1, [1 x i8]* @.str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str1, [1 x i8]* @.str1) nounwind, !dbg !222 ; [debug line = 68:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @.str2, i32 0, i32 0, [1 x i8]* @.str1, i32 0, i32 0, [8 x i8]* @.str3, [1 x i8]* @.str1, [1 x i8]* @.str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str1, [1 x i8]* @.str1) nounwind, !dbg !223 ; [debug line = 69:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %bias, i32* %Layer1_Neurons_GPU, i32* %Layer1_Weights_GPU, i32* %Layer2_Neurons_GPU, [10 x i8]* @.str2, i32 0, i32 0, [1 x i8]* @.str1, i32 0, i32 0, [8 x i8]* @.str3, [1 x i8]* @.str1, [1 x i8]* @.str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str1, [1 x i8]* @.str1) nounwind, !dbg !224 ; [debug line = 70:1]
  %group_id.x.load = load i32* %group_id.x, align 4, !dbg !225 ; [#uses=3 type=i32] [debug line = 121:3]
  %group_id.x.load.cast = trunc i32 %group_id.x.load to i30, !dbg !227 ; [#uses=1 type=i30] [debug line = 48:90]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !228), !dbg !227 ; [debug line = 48:90] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !{i32* %bias}, i64 0, metadata !229), !dbg !231 ; [debug line = 48:153] [debug variable = args.bias]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Neurons_GPU}, i64 0, metadata !232), !dbg !231 ; [debug line = 48:153] [debug variable = args.Layer1_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Weights_GPU}, i64 0, metadata !233), !dbg !231 ; [debug line = 48:153] [debug variable = args.Layer1_Weights_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer2_Neurons_GPU}, i64 0, metadata !234), !dbg !231 ; [debug line = 48:153] [debug variable = args.Layer2_Neurons_GPU]
  %bias.load = load i32* %bias, align 4, !dbg !235 ; [#uses=1 type=i32] [debug line = 50:116]
  %tmp.2 = lshr i32 %bias.load, 2, !dbg !235      ; [#uses=1 type=i32] [debug line = 50:116]
  %tmp.2.cast = trunc i32 %tmp.2 to i31, !dbg !237 ; [#uses=1 type=i31] [debug line = 51:144]
  %Layer1_Neurons_GPU.load = load i32* %Layer1_Neurons_GPU, align 4, !dbg !237 ; [#uses=1 type=i32] [debug line = 51:144]
  %tmp.3 = lshr i32 %Layer1_Neurons_GPU.load, 2, !dbg !237 ; [#uses=1 type=i32] [debug line = 51:144]
  %tmp.3.cast = trunc i32 %tmp.3 to i31, !dbg !238 ; [#uses=3 type=i31] [debug line = 52:144]
  %Layer1_Weights_GPU.load = load i32* %Layer1_Weights_GPU, align 4, !dbg !238 ; [#uses=1 type=i32] [debug line = 52:144]
  %tmp.4 = lshr i32 %Layer1_Weights_GPU.load, 2, !dbg !238 ; [#uses=1 type=i32] [debug line = 52:144]
  %tmp.4.cast = trunc i32 %tmp.4 to i31, !dbg !239 ; [#uses=3 type=i31] [debug line = 53:144]
  %Layer2_Neurons_GPU.load = load i32* %Layer2_Neurons_GPU, align 4, !dbg !239 ; [#uses=1 type=i32] [debug line = 53:144]
  %tmp.5 = lshr i32 %Layer2_Neurons_GPU.load, 2, !dbg !239 ; [#uses=1 type=i32] [debug line = 53:144]
  %tmp.5.cast = trunc i32 %tmp.5 to i31, !dbg !240 ; [#uses=1 type=i31] [debug line = 27:13]
  %tmp.7 = mul i32 %group_id.x.load, 363, !dbg !240 ; [#uses=3 type=i32] [debug line = 27:13]
  %gep_idx.i.i.cast = zext i30 %group_id.x.load.cast to i31 ; [#uses=1 type=i31]
  %arg_bias.i.0.sum = add i31 %gep_idx.i.i.cast, %tmp.2.cast ; [#uses=1 type=i31]
  %arg_bias.i.0.sum.cast = zext i31 %arg_bias.i.0.sum to i32 ; [#uses=1 type=i32]
  %gmem.addr = getelementptr i32 addrspace(1)* %gmem, i32 %arg_bias.i.0.sum.cast ; [#uses=1 type=i32 addrspace(1)*]
  %tmp.8 = trunc i32 %group_id.x.load to i30, !dbg !252 ; [#uses=1 type=i30] [debug line = 35:5]
  br label %for.header57.i.i

for.header57.i.i:                                 ; preds = %for.body58.i.i, %0
  %indvar59.reg2mem71.0.i.i = phi i6 [ 0, %0 ], [ %indvar.inc60.reg2mem.0.i.i, %for.body58.i.i ] ; [#uses=3 type=i6]
  %1 = call i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_Y.str) nounwind ; [#uses=0 type=i32]
  %tmp.9 = icmp eq i6 %indvar59.reg2mem71.0.i.i, -32 ; [#uses=1 type=i1]
  %2 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 32, i64 32, i64 32) ; [#uses=0 type=i32]
  br i1 %tmp.9, label %__AESL_call_work_item_NA4.exit, label %for.header.i.i.preheader

for.header.i.i.preheader:                         ; preds = %for.header57.i.i
  %row.0.reg2mem.0.i.i = xor i6 %indvar59.reg2mem71.0.i.i, -32, !dbg !253 ; [#uses=2 type=i6] [debug line = 15:15]
  %row.0.reg2mem.0.i.i.cast22.cast = zext i6 %row.0.reg2mem.0.i.i to i13, !dbg !253 ; [#uses=1 type=i13] [debug line = 15:15]
  %row.0.reg2mem.0.i.i.cast.cast = zext i6 %row.0.reg2mem.0.i.i to i18, !dbg !254 ; [#uses=1 type=i18] [debug line = 18:5]
  %.reg2mem31.0.i.i = mul i18 %row.0.reg2mem.0.i.i.cast.cast, 2724, !dbg !254 ; [#uses=3 type=i18] [debug line = 18:5]
  %tmp. = or i18 %.reg2mem31.0.i.i, 1, !dbg !240  ; [#uses=1 type=i18] [debug line = 27:13]
  %tmp..cast = zext i18 %tmp. to i20, !dbg !240   ; [#uses=1 type=i20] [debug line = 27:13]
  %tmp.1 = or i18 %.reg2mem31.0.i.i, 2, !dbg !240 ; [#uses=1 type=i18] [debug line = 27:13]
  %tmp.1.cast = zext i18 %tmp.1 to i20, !dbg !240 ; [#uses=1 type=i20] [debug line = 27:13]
  %tmp.6 = mul i13 %row.0.reg2mem.0.i.i.cast22.cast, 55, !dbg !252 ; [#uses=1 type=i13] [debug line = 35:5]
  br label %for.header.i.i

for.header.i.i:                                   ; preds = %._crit_edge.i.i, %for.header.i.i.preheader
  %indvar.reg2mem69.0.i.i = phi i5 [ %indvar.inc.reg2mem.0.i.i, %._crit_edge.i.i ], [ 0, %for.header.i.i.preheader ] ; [#uses=5 type=i5]
  %indvar.reg2mem69.0.i.i.cast = zext i5 %indvar.reg2mem69.0.i.i to i7 ; [#uses=1 type=i7]
  %indvar.reg2mem69.0.i.i.cast1 = zext i5 %indvar.reg2mem69.0.i.i to i9 ; [#uses=1 type=i9]
  %3 = call i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_X.str) nounwind ; [#uses=0 type=i32]
  %tmp.10 = icmp eq i5 %indvar.reg2mem69.0.i.i, -9 ; [#uses=1 type=i1]
  %4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 23, i64 23, i64 23) ; [#uses=0 type=i32]
  br i1 %tmp.10, label %for.body58.i.i, label %.split.i.i

for.body58.i.i:                                   ; preds = %for.header.i.i
  %indvar.inc60.reg2mem.0.i.i = add i6 %indvar59.reg2mem71.0.i.i, 1 ; [#uses=1 type=i6]
  br label %for.header57.i.i

.split.i.i:                                       ; preds = %for.header.i.i
  %_shl = shl nuw i9 %indvar.reg2mem69.0.i.i.cast1, 4, !dbg !255 ; [#uses=1 type=i9] [debug line = 21:5]
  %_shl.cast = zext i9 %_shl to i10, !dbg !255    ; [#uses=1 type=i10] [debug line = 21:5]
  %_shl1 = shl nuw i7 %indvar.reg2mem69.0.i.i.cast, 2, !dbg !255 ; [#uses=1 type=i7] [debug line = 21:5]
  %_shl1.cast = zext i7 %_shl1 to i10, !dbg !255  ; [#uses=1 type=i10] [debug line = 21:5]
  %.reg2mem27.0.i.i = sub i10 %_shl.cast, %_shl1.cast, !dbg !255 ; [#uses=2 type=i10] [debug line = 21:5]
  %.reg2mem27.0.i.i.cast1 = sext i10 %.reg2mem27.0.i.i to i20, !dbg !255 ; [#uses=2 type=i20] [debug line = 21:5]
  %.reg2mem27.0.i.i.cast = sext i10 %.reg2mem27.0.i.i to i18, !dbg !255 ; [#uses=1 type=i18] [debug line = 21:5]
  br label %5, !dbg !256                          ; [debug line = 23:18]

; <label>:5                                       ; preds = %9, %.split.i.i
  %i.0.reg2mem47.0.i.i = phi i4 [ 0, %.split.i.i ], [ %.reg2mem5.0.i.i, %9 ] ; [#uses=4 type=i4]
  %product.0.reg2mem49.0.i.i = phi float [ 0.000000e+00, %.split.i.i ], [ %product.1.reg2mem45.0.i.i.lcssa, %9 ] ; [#uses=2 type=float]
  %i.0.reg2mem47.0.i.i.cast = zext i4 %i.0.reg2mem47.0.i.i to i9, !dbg !256 ; [#uses=1 type=i9] [debug line = 23:18]
  %i.0.reg2mem47.0.i.i.cast1 = zext i4 %i.0.reg2mem47.0.i.i to i14, !dbg !240 ; [#uses=1 type=i14] [debug line = 27:13]
  %exitcond5 = icmp eq i4 %i.0.reg2mem47.0.i.i, -5, !dbg !256 ; [#uses=1 type=i1] [debug line = 23:18]
  %6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11) ; [#uses=0 type=i32]
  br i1 %exitcond5, label %._crit_edge.i.i, label %.preheader.preheader, !dbg !256 ; [debug line = 23:18]

.preheader.preheader:                             ; preds = %5
  %tmp.16 = mul i14 %i.0.reg2mem47.0.i.i.cast1, 681, !dbg !240 ; [#uses=3 type=i14] [debug line = 27:13]
  %tmp.17 = mul i9 %i.0.reg2mem47.0.i.i.cast, 11, !dbg !240 ; [#uses=3 type=i9] [debug line = 27:13]
  %tmp.17.cast = trunc i9 %tmp.17 to i7, !dbg !240 ; [#uses=1 type=i7] [debug line = 27:13]
  br label %.preheader, !dbg !257                 ; [debug line = 25:22]

.preheader:                                       ; preds = %8, %.preheader.preheader
  %j.0.reg2mem43.0.i.i = phi i4 [ %.reg2mem7.0.i.i, %8 ], [ 0, %.preheader.preheader ] ; [#uses=6 type=i4]
  %product.1.reg2mem45.0.i.i = phi float [ %.reg2mem9.0.i.i, %8 ], [ %product.0.reg2mem49.0.i.i, %.preheader.preheader ] ; [#uses=2 type=float]
  %j.0.reg2mem43.0.i.i.cast = zext i4 %j.0.reg2mem43.0.i.i to i8, !dbg !257 ; [#uses=1 type=i8] [debug line = 25:22]
  %j.0.reg2mem43.0.i.i.cast14.cast = zext i4 %j.0.reg2mem43.0.i.i to i5, !dbg !257 ; [#uses=1 type=i5] [debug line = 25:22]
  %j.0.reg2mem43.0.i.i.cast1 = zext i4 %j.0.reg2mem43.0.i.i to i7, !dbg !257 ; [#uses=2 type=i7] [debug line = 25:22]
  %j.0.reg2mem43.0.i.i.cast2 = zext i4 %j.0.reg2mem43.0.i.i to i6, !dbg !257 ; [#uses=1 type=i6] [debug line = 25:22]
  %exitcond = icmp eq i4 %j.0.reg2mem43.0.i.i, -5, !dbg !257 ; [#uses=1 type=i1] [debug line = 25:22]
  %7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11) ; [#uses=0 type=i32]
  br i1 %exitcond, label %9, label %8, !dbg !257  ; [debug line = 25:22]

; <label>:8                                       ; preds = %.preheader
  %_shl2 = shl nuw i6 %j.0.reg2mem43.0.i.i.cast2, 2, !dbg !240 ; [#uses=1 type=i6] [debug line = 27:13]
  %_shl2.cast = zext i6 %_shl2 to i7, !dbg !240   ; [#uses=1 type=i7] [debug line = 27:13]
  %tmp.18 = sub i7 %_shl2.cast, %j.0.reg2mem43.0.i.i.cast1, !dbg !240 ; [#uses=1 type=i7] [debug line = 27:13]
  %tmp.18.cast = sext i7 %tmp.18 to i14, !dbg !240 ; [#uses=3 type=i14] [debug line = 27:13]
  %tmp = add i18 %.reg2mem27.0.i.i.cast, %.reg2mem31.0.i.i, !dbg !240 ; [#uses=1 type=i18] [debug line = 27:13]
  %tmp1 = add i14 %tmp.18.cast, %tmp.16, !dbg !240 ; [#uses=1 type=i14] [debug line = 27:13]
  %tmp1.cast = sext i14 %tmp1 to i18, !dbg !240   ; [#uses=1 type=i18] [debug line = 27:13]
  %tmp.21 = add i18 %tmp, %tmp1.cast, !dbg !240   ; [#uses=1 type=i18] [debug line = 27:13]
  %gep_idx20.i.i.cast = zext i18 %tmp.21 to i31   ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum = add i31 %gep_idx20.i.i.cast, %tmp.3.cast ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum.cast = zext i31 %arg_Layer1_Neurons_GPU.i.0.sum to i32 ; [#uses=1 type=i32]
  %gmem.addr.2 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_GPU.i.0.sum.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.1 = load i32 addrspace(1)* %gmem.addr.2, align 4 ; [#uses=1 type=i32]
  %tmp.22 = bitcast i32 %gmem.load.1 to float     ; [#uses=1 type=float]
  %tmp2 = add i7 %j.0.reg2mem43.0.i.i.cast1, %tmp.17.cast, !dbg !240 ; [#uses=1 type=i7] [debug line = 27:13]
  %tmp.31 = zext i7 %tmp2 to i30, !dbg !240       ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp.32 = trunc i32 %tmp.7 to i30, !dbg !240    ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp.24.cast = add i30 %tmp.32, %tmp.31, !dbg !240 ; [#uses=1 type=i30] [debug line = 27:13]
  %gep_idx28.i.i.cast = zext i30 %tmp.24.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum = add i31 %gep_idx28.i.i.cast, %tmp.4.cast ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum.cast = zext i31 %arg_Layer1_Weights_GPU.i.0.sum to i32 ; [#uses=1 type=i32]
  %gmem.addr.3 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_GPU.i.0.sum.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.2 = load i32 addrspace(1)* %gmem.addr.3, align 4 ; [#uses=1 type=i32]
  %tmp.25 = bitcast i32 %gmem.load.2 to float     ; [#uses=1 type=float]
  %tmp.26 = fmul float %tmp.22, %tmp.25, !dbg !240 ; [#uses=1 type=float] [debug line = 27:13]
  %tmp3 = add i20 %.reg2mem27.0.i.i.cast1, %tmp..cast, !dbg !240 ; [#uses=1 type=i20] [debug line = 27:13]
  %tmp4 = add i14 %tmp.18.cast, %tmp.16, !dbg !240 ; [#uses=1 type=i14] [debug line = 27:13]
  %tmp4.cast = sext i14 %tmp4 to i20, !dbg !240   ; [#uses=1 type=i20] [debug line = 27:13]
  %tmp.29 = add i20 %tmp3, %tmp4.cast, !dbg !240  ; [#uses=1 type=i20] [debug line = 27:13]
  %gep_idx36.i.i.cast1 = sext i20 %tmp.29 to i30  ; [#uses=1 type=i30]
  %gep_idx36.i.i.cast = zext i30 %gep_idx36.i.i.cast1 to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum1 = add i31 %gep_idx36.i.i.cast, %tmp.3.cast ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum1.cast = zext i31 %arg_Layer1_Neurons_GPU.i.0.sum1 to i32 ; [#uses=1 type=i32]
  %gmem.addr.4 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_GPU.i.0.sum1.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.3 = load i32 addrspace(1)* %gmem.addr.4, align 4 ; [#uses=1 type=i32]
  %tmp.30 = bitcast i32 %gmem.load.3 to float     ; [#uses=1 type=float]
  %tmp.33 = trunc i32 %tmp.7 to i30, !dbg !240    ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp.37 = zext i9 %tmp.17 to i30, !dbg !240     ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp6 = add i8 %j.0.reg2mem43.0.i.i.cast, 121, !dbg !240 ; [#uses=1 type=i8] [debug line = 27:13]
  %tmp.38 = zext i8 %tmp6 to i30, !dbg !240       ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp.41 = add i30 %tmp.37, %tmp.33, !dbg !240   ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp.33.cast = add i30 %tmp.41, %tmp.38, !dbg !240 ; [#uses=1 type=i30] [debug line = 27:13]
  %gep_idx44.i.i.cast = zext i30 %tmp.33.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum2 = add i31 %gep_idx44.i.i.cast, %tmp.4.cast ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum2.cast = zext i31 %arg_Layer1_Weights_GPU.i.0.sum2 to i32 ; [#uses=1 type=i32]
  %gmem.addr.5 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_GPU.i.0.sum2.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.4 = load i32 addrspace(1)* %gmem.addr.5, align 4 ; [#uses=1 type=i32]
  %tmp.34 = bitcast i32 %gmem.load.4 to float     ; [#uses=1 type=float]
  %tmp.35 = fmul float %tmp.30, %tmp.34, !dbg !240 ; [#uses=1 type=float] [debug line = 27:13]
  %tmp.36 = fadd float %tmp.26, %tmp.35, !dbg !240 ; [#uses=1 type=float] [debug line = 27:13]
  %tmp7 = add i20 %.reg2mem27.0.i.i.cast1, %tmp.1.cast, !dbg !240 ; [#uses=1 type=i20] [debug line = 27:13]
  %tmp8 = add i14 %tmp.18.cast, %tmp.16, !dbg !240 ; [#uses=1 type=i14] [debug line = 27:13]
  %tmp8.cast = sext i14 %tmp8 to i20, !dbg !240   ; [#uses=1 type=i20] [debug line = 27:13]
  %tmp.39 = add i20 %tmp7, %tmp8.cast, !dbg !240  ; [#uses=1 type=i20] [debug line = 27:13]
  %gep_idx52.i.i.cast1 = sext i20 %tmp.39 to i30  ; [#uses=1 type=i30]
  %gep_idx52.i.i.cast = zext i30 %gep_idx52.i.i.cast1 to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum3 = add i31 %gep_idx52.i.i.cast, %tmp.3.cast ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_GPU.i.0.sum3.cast = zext i31 %arg_Layer1_Neurons_GPU.i.0.sum3 to i32 ; [#uses=1 type=i32]
  %gmem.addr.6 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_GPU.i.0.sum3.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.5 = load i32 addrspace(1)* %gmem.addr.6, align 4 ; [#uses=1 type=i32]
  %tmp.40 = bitcast i32 %gmem.load.5 to float     ; [#uses=1 type=float]
  %tmp.42 = trunc i32 %tmp.7 to i30, !dbg !240    ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp.43 = zext i9 %tmp.17 to i30, !dbg !240     ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp10 = add i5 %j.0.reg2mem43.0.i.i.cast14.cast, -14, !dbg !240 ; [#uses=1 type=i5] [debug line = 27:13]
  %tmp10.cast = sext i5 %tmp10 to i8, !dbg !240   ; [#uses=1 type=i8] [debug line = 27:13]
  %tmp.47 = zext i8 %tmp10.cast to i30, !dbg !240 ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp.48 = add i30 %tmp.43, %tmp.42, !dbg !240   ; [#uses=1 type=i30] [debug line = 27:13]
  %tmp.43.cast = add i30 %tmp.48, %tmp.47, !dbg !240 ; [#uses=1 type=i30] [debug line = 27:13]
  %gep_idx60.i.i.cast = zext i30 %tmp.43.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum4 = add i31 %gep_idx60.i.i.cast, %tmp.4.cast ; [#uses=1 type=i31]
  %arg_Layer1_Weights_GPU.i.0.sum4.cast = zext i31 %arg_Layer1_Weights_GPU.i.0.sum4 to i32 ; [#uses=1 type=i32]
  %gmem.addr.7 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_GPU.i.0.sum4.cast ; [#uses=1 type=i32 addrspace(1)*]
  %gmem.load.6 = load i32 addrspace(1)* %gmem.addr.7, align 4 ; [#uses=1 type=i32]
  %tmp.44 = bitcast i32 %gmem.load.6 to float     ; [#uses=1 type=float]
  %tmp.45 = fmul float %tmp.40, %tmp.44, !dbg !240 ; [#uses=1 type=float] [debug line = 27:13]
  %tmp.46 = fadd float %tmp.36, %tmp.45, !dbg !240 ; [#uses=1 type=float] [debug line = 27:13]
  %.reg2mem9.0.i.i = fadd float %product.1.reg2mem45.0.i.i, %tmp.46, !dbg !240 ; [#uses=1 type=float] [debug line = 27:13]
  %.reg2mem7.0.i.i = add i4 %j.0.reg2mem43.0.i.i, 1, !dbg !258 ; [#uses=1 type=i4] [debug line = 25:32]
  br label %.preheader, !dbg !258                 ; [debug line = 25:32]

; <label>:9                                       ; preds = %.preheader
  %product.1.reg2mem45.0.i.i.lcssa = phi float [ %product.1.reg2mem45.0.i.i, %.preheader ] ; [#uses=1 type=float]
  %.reg2mem5.0.i.i = add i4 %i.0.reg2mem47.0.i.i, 1, !dbg !259 ; [#uses=1 type=i4] [debug line = 23:28]
  br label %5, !dbg !259                          ; [debug line = 23:28]

._crit_edge.i.i:                                  ; preds = %5
  %product.0.reg2mem49.0.i.i.lcssa = phi float [ %product.0.reg2mem49.0.i.i, %5 ] ; [#uses=1 type=float]
  %gmem.load = load i32 addrspace(1)* %gmem.addr, align 4 ; [#uses=1 type=i32]
  %tmp.11 = bitcast i32 %gmem.load to float       ; [#uses=1 type=float]
  %.reg2mem.0.i.i = fadd float %product.0.reg2mem49.0.i.i.lcssa, %tmp.11, !dbg !260 ; [#uses=3 type=float] [debug line = 32:5]
  %.reg2mem.0.i.i_to_int = bitcast float %.reg2mem.0.i.i to i32 ; [#uses=2 type=i32]
  %tmp.12 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %.reg2mem.0.i.i_to_int, i32 23, i32 30) ; [#uses=1 type=i8]
  %tmp.13 = trunc i32 %.reg2mem.0.i.i_to_int to i23 ; [#uses=1 type=i23]
  %notlhs = icmp ne i8 %tmp.12, -1                ; [#uses=1 type=i1]
  %notrhs = icmp eq i23 %tmp.13, 0                ; [#uses=1 type=i1]
  %tmp.14 = or i1 %notrhs, %notlhs                ; [#uses=1 type=i1]
  %tmp.19 = fcmp olt float %.reg2mem.0.i.i, 0.000000e+00, !dbg !261 ; [#uses=1 type=i1] [debug line = 33:5]
  %tmp.20 = and i1 %tmp.14, %tmp.19, !dbg !261    ; [#uses=1 type=i1] [debug line = 33:5]
  %tmp.23 = mul i30 %tmp.8, 3025, !dbg !252       ; [#uses=1 type=i30] [debug line = 35:5]
  %tmp.24 = zext i5 %indvar.reg2mem69.0.i.i to i30, !dbg !252 ; [#uses=1 type=i30] [debug line = 35:5]
  %tmp.27 = add i30 %tmp.24, %tmp.23, !dbg !252   ; [#uses=1 type=i30] [debug line = 35:5]
  %tmp.28 = zext i13 %tmp.6 to i30, !dbg !252     ; [#uses=1 type=i30] [debug line = 35:5]
  %tmp.14.cast = add i30 %tmp.28, %tmp.27, !dbg !252 ; [#uses=1 type=i30] [debug line = 35:5]
  %gep_idx12.i.i.cast = zext i30 %tmp.14.cast to i31 ; [#uses=1 type=i31]
  %arg_Layer2_Neurons_GPU.i.0.sum = add i31 %tmp.5.cast, %gep_idx12.i.i.cast ; [#uses=1 type=i31]
  %arg_Layer2_Neurons_GPU.i.0.sum.cast = zext i31 %arg_Layer2_Neurons_GPU.i.0.sum to i32 ; [#uses=1 type=i32]
  %gmem.addr.1 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer2_Neurons_GPU.i.0.sum.cast ; [#uses=1 type=i32 addrspace(1)*]
  %tmp.15 = bitcast float %.reg2mem.0.i.i to i32  ; [#uses=1 type=i32]
  %val.i.i = select i1 %tmp.20, i32 0, i32 %tmp.15 ; [#uses=1 type=i32]
  store i32 %val.i.i, i32 addrspace(1)* %gmem.addr.1, align 4
  %indvar.inc.reg2mem.0.i.i = add i5 %indvar.reg2mem69.0.i.i, 1 ; [#uses=1 type=i5]
  %10 = call i32 (...)* @_ssdm_SpecLoopFlatten(i32 0, [1 x i8]* @str) nounwind ; [#uses=0 type=i32]
  br label %for.header.i.i

__AESL_call_work_item_NA4.exit:                   ; preds = %for.header57.i.i
  ret void, !dbg !262                             ; [debug line = 75:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=4]
declare i32 @_ssdm_op_SpecLoopTripCount(...)

; [#uses=2]
declare i32 @_ssdm_op_SpecLoopName(...)

; [#uses=4]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=8]
declare void @_ssdm_op_SpecBitsMap(...)

; [#uses=1]
declare i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=1]
declare i32 @_ssdm_SpecLoopFlatten(...)

!hls.encrypted.func = !{}
!xcl.libspir = !{!0}
!xcl.reqd_rt_info = !{!1}
!xcl.portmap = !{!2, !4, !5, !6}
!axi4.master.portmap = !{!7}
!xcl.portlist = !{!3, !8}
!xcl.lmem_info = !{}
!xcl.progvar_info = !{}
!llvm.dbg.cu = !{!9}
!llvm.map.gv = !{!124, !131, !136}

!0 = metadata !{metadata !"C:/Xilinx/Vivado_HLS/2016.4/win64/lib/libspir-hls.a"}
!1 = metadata !{metadata !"executeFirstLayer1_p3", metadata !"group_id"}
!2 = metadata !{metadata !"executeFirstLayer1_p3", i32 0, metadata !3}
!3 = metadata !{metadata !"executeFirstLayer1_p3", metadata !"gmem", metadata !"addressable", metadata !"master", i32 32}
!4 = metadata !{metadata !"executeFirstLayer1_p3", i32 1, metadata !3}
!5 = metadata !{metadata !"executeFirstLayer1_p3", i32 2, metadata !3}
!6 = metadata !{metadata !"executeFirstLayer1_p3", i32 3, metadata !3}
!7 = metadata !{metadata !"gmem", metadata !"bias", metadata !"", metadata !"Layer1_Neurons_GPU", metadata !"", metadata !"Layer1_Weights_GPU", metadata !"", metadata !"Layer2_Neurons_GPU", metadata !""}
!8 = metadata !{metadata !"executeFirstLayer1_p3", metadata !"control", metadata !"addressable", metadata !"slave", i32 32}
!9 = metadata !{i32 786449, i32 0, i32 4, metadata !"aesl_gen-tmpA.cpp", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5Clayer1_con_p3\5Csolution1\5C.autopilot\5Cdb", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !10, metadata !10, metadata !11, metadata !81} ; [ DW_TAG_compile_unit ]
!10 = metadata !{i32 0}
!11 = metadata !{metadata !12, metadata !76, metadata !79, metadata !80}
!12 = metadata !{i32 786478, i32 0, metadata !13, metadata !"__AESL_call_work_item_NA", metadata !"__AESL_call_work_item_NA", metadata !"", metadata !13, i32 48, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !48, i32 49} ; [ DW_TAG_subprogram ]
!13 = metadata !{i32 786473, metadata !"executeFirstLayer1_p3_compute_unit", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5Clayer1_con_p3\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!14 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{null, metadata !16, metadata !19, metadata !50}
!16 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !17} ; [ DW_TAG_pointer_type ]
!17 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_volatile_type ]
!18 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!19 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ]
!20 = metadata !{i32 786454, null, metadata !"__spir_rt_info_t", metadata !13, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ]
!21 = metadata !{i32 786434, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 896, i64 64, i32 0, i32 0, null, metadata !23, i32 0, null, null} ; [ DW_TAG_class_type ]
!22 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl/libspir_types.h", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5Clayer1_con_p3\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!23 = metadata !{metadata !24, metadata !25, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !37, metadata !40, metadata !41, metadata !42, metadata !44}
!24 = metadata !{i32 786445, metadata !21, metadata !"work_dim", metadata !22, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !18} ; [ DW_TAG_member ]
!25 = metadata !{i32 786445, metadata !21, metadata !"global_size", metadata !22, i32 124, i64 96, i64 32, i64 32, i32 0, metadata !26} ; [ DW_TAG_member ]
!26 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !18, metadata !27, i32 0, i32 0} ; [ DW_TAG_array_type ]
!27 = metadata !{metadata !28}
!28 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!29 = metadata !{i32 786445, metadata !21, metadata !"global_id", metadata !22, i32 125, i64 96, i64 32, i64 128, i32 0, metadata !26} ; [ DW_TAG_member ]
!30 = metadata !{i32 786445, metadata !21, metadata !"local_size", metadata !22, i32 127, i64 96, i64 32, i64 224, i32 0, metadata !26} ; [ DW_TAG_member ]
!31 = metadata !{i32 786445, metadata !21, metadata !"local_id", metadata !22, i32 128, i64 96, i64 32, i64 320, i32 0, metadata !26} ; [ DW_TAG_member ]
!32 = metadata !{i32 786445, metadata !21, metadata !"num_groups", metadata !22, i32 130, i64 96, i64 32, i64 416, i32 0, metadata !26} ; [ DW_TAG_member ]
!33 = metadata !{i32 786445, metadata !21, metadata !"group_id", metadata !22, i32 131, i64 96, i64 32, i64 512, i32 0, metadata !26} ; [ DW_TAG_member ]
!34 = metadata !{i32 786445, metadata !21, metadata !"global_offset", metadata !22, i32 132, i64 96, i64 32, i64 608, i32 0, metadata !26} ; [ DW_TAG_member ]
!35 = metadata !{i32 786445, metadata !21, metadata !"pthread_barrier", metadata !22, i32 135, i64 32, i64 32, i64 704, i32 0, metadata !36} ; [ DW_TAG_member ]
!36 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!37 = metadata !{i32 786445, metadata !21, metadata !"barriertoscheduler", metadata !22, i32 138, i64 8, i64 8, i64 736, i32 0, metadata !38} ; [ DW_TAG_member ]
!38 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_volatile_type ]
!39 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!40 = metadata !{i32 786445, metadata !21, metadata !"scheduler_context", metadata !22, i32 139, i64 32, i64 32, i64 768, i32 0, metadata !36} ; [ DW_TAG_member ]
!41 = metadata !{i32 786445, metadata !21, metadata !"pe_context", metadata !22, i32 140, i64 32, i64 32, i64 800, i32 0, metadata !36} ; [ DW_TAG_member ]
!42 = metadata !{i32 786445, metadata !21, metadata !"printf_buffer", metadata !22, i32 142, i64 64, i64 64, i64 832, i32 0, metadata !43} ; [ DW_TAG_member ]
!43 = metadata !{i32 786468, null, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!44 = metadata !{i32 786478, i32 0, metadata !21, metadata !"__spir_rt_info_tT", metadata !"__spir_rt_info_tT", metadata !"", metadata !22, i32 120, metadata !45, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !48, i32 120} ; [ DW_TAG_subprogram ]
!45 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !46, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!46 = metadata !{null, metadata !47}
!47 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !21} ; [ DW_TAG_pointer_type ]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!50 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ]
!51 = metadata !{i32 786454, null, metadata !"executeFirstLayer1_p3_args_t", metadata !13, i32 23, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ]
!52 = metadata !{i32 786434, null, metadata !"", metadata !13, i32 17, i64 128, i64 32, i32 0, i32 0, null, metadata !53, i32 0, null, null} ; [ DW_TAG_class_type ]
!53 = metadata !{metadata !54, metadata !56, metadata !57, metadata !58, metadata !59}
!54 = metadata !{i32 786445, metadata !52, metadata !"bias", metadata !13, i32 18, i64 32, i64 32, i64 0, i32 0, metadata !55} ; [ DW_TAG_member ]
!55 = metadata !{i32 786454, null, metadata !"__spir_size_t", metadata !13, i32 108, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ]
!56 = metadata !{i32 786445, metadata !52, metadata !"Layer1_Neurons_GPU", metadata !13, i32 19, i64 32, i64 32, i64 32, i32 0, metadata !55} ; [ DW_TAG_member ]
!57 = metadata !{i32 786445, metadata !52, metadata !"Layer1_Weights_GPU", metadata !13, i32 20, i64 32, i64 32, i64 64, i32 0, metadata !55} ; [ DW_TAG_member ]
!58 = metadata !{i32 786445, metadata !52, metadata !"Layer2_Neurons_GPU", metadata !13, i32 21, i64 32, i64 32, i64 96, i32 0, metadata !55} ; [ DW_TAG_member ]
!59 = metadata !{i32 786474, metadata !52, null, metadata !13, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_friend ]
!60 = metadata !{i32 786434, null, metadata !"aesl_keep_name_class", metadata !13, i32 25, i64 8, i64 8, i32 0, i32 0, null, metadata !61, i32 0, null, null} ; [ DW_TAG_class_type ]
!61 = metadata !{metadata !62, metadata !73}
!62 = metadata !{i32 786478, i32 0, metadata !60, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !13, i32 28, metadata !63, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !48, i32 28} ; [ DW_TAG_subprogram ]
!63 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!64 = metadata !{null, metadata !65}
!65 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !66} ; [ DW_TAG_pointer_type ]
!66 = metadata !{i32 786454, null, metadata !"three_tuple_t", metadata !13, i32 15, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ]
!67 = metadata !{i32 786434, null, metadata !"", metadata !13, i32 10, i64 96, i64 32, i32 0, i32 0, null, metadata !68, i32 0, null, null} ; [ DW_TAG_class_type ]
!68 = metadata !{metadata !69, metadata !70, metadata !71, metadata !72}
!69 = metadata !{i32 786445, metadata !67, metadata !"x", metadata !13, i32 11, i64 32, i64 32, i64 0, i32 0, metadata !18} ; [ DW_TAG_member ]
!70 = metadata !{i32 786445, metadata !67, metadata !"y", metadata !13, i32 12, i64 32, i64 32, i64 32, i32 0, metadata !18} ; [ DW_TAG_member ]
!71 = metadata !{i32 786445, metadata !67, metadata !"z", metadata !13, i32 13, i64 32, i64 32, i64 64, i32 0, metadata !18} ; [ DW_TAG_member ]
!72 = metadata !{i32 786474, metadata !67, null, metadata !13, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_friend ]
!73 = metadata !{i32 786478, i32 0, metadata !60, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP28executeFirstLayer1_p3_args_t", metadata !13, i32 34, metadata !74, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !48, i32 34} ; [ DW_TAG_subprogram ]
!74 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !75, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!75 = metadata !{null, metadata !50}
!76 = metadata !{i32 786478, i32 0, metadata !13, metadata !"__AESL_work_groupA", metadata !"__AESL_work_groupA", metadata !"", metadata !13, i32 59, metadata !77, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !48, i32 60} ; [ DW_TAG_subprogram ]
!77 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !78, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!78 = metadata !{null, metadata !16, metadata !65, metadata !50}
!79 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP28executeFirstLayer1_p3_args_t", metadata !13, i32 34, metadata !74, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !73, metadata !48, i32 34} ; [ DW_TAG_subprogram ]
!80 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !13, i32 28, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !62, metadata !48, i32 28} ; [ DW_TAG_subprogram ]
!81 = metadata !{metadata !82}
!82 = metadata !{metadata !83, metadata !87, metadata !90, metadata !93, metadata !96, metadata !99, metadata !102, metadata !105, metadata !108, metadata !111, metadata !114, metadata !117, metadata !120, metadata !123}
!83 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.work_dim", metadata !"rt_info.work_dim", metadata !"rt_info.work_dim", metadata !84, i32 49, metadata !85, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!84 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl\5Caesl_gen_cu_body.inc", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5Clayer1_con_p3\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!85 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 32, i64 64, i32 0, i32 0, null, metadata !86, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!86 = metadata !{metadata !24}
!87 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.global_size", metadata !"rt_info.global_size", metadata !"rt_info.global_size", metadata !84, i32 49, metadata !88, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!88 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !89, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!89 = metadata !{metadata !25}
!90 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.global_id", metadata !"rt_info.global_id", metadata !"rt_info.global_id", metadata !84, i32 49, metadata !91, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!91 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !92, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!92 = metadata !{metadata !29}
!93 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.local_id", metadata !"rt_info.local_id", metadata !"rt_info.local_id", metadata !84, i32 49, metadata !94, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!94 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !95, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!95 = metadata !{metadata !31}
!96 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.num_groups", metadata !"rt_info.num_groups", metadata !"rt_info.num_groups", metadata !84, i32 49, metadata !97, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!97 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !98, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!98 = metadata !{metadata !32}
!99 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.group_id", metadata !"rt_info.group_id", metadata !"rt_info.group_id", metadata !84, i32 49, metadata !100, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!100 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !101, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!101 = metadata !{metadata !33}
!102 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.local_size", metadata !"rt_info.local_size", metadata !"rt_info.local_size", metadata !84, i32 49, metadata !103, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!103 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !104, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!104 = metadata !{metadata !30}
!105 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.global_offset", metadata !"rt_info.global_offset", metadata !"rt_info.global_offset", metadata !84, i32 49, metadata !106, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!106 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 96, i64 64, i32 0, i32 0, null, metadata !107, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!107 = metadata !{metadata !34}
!108 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.pthread_barrier", metadata !"rt_info.pthread_barrier", metadata !"rt_info.pthread_barrier", metadata !84, i32 49, metadata !109, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!109 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 32, i64 64, i32 0, i32 0, null, metadata !110, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!110 = metadata !{metadata !35}
!111 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.printf_buffer", metadata !"rt_info.printf_buffer", metadata !"rt_info.printf_buffer", metadata !84, i32 49, metadata !112, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!112 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 64, i64 64, i32 0, i32 0, null, metadata !113, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!113 = metadata !{metadata !42}
!114 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.barriertoscheduler", metadata !"rt_info.barriertoscheduler", metadata !"rt_info.barriertoscheduler", metadata !84, i32 49, metadata !115, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!115 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 8, i64 64, i32 0, i32 0, null, metadata !116, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!116 = metadata !{metadata !37}
!117 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.pe_context", metadata !"rt_info.pe_context", metadata !"rt_info.pe_context", metadata !84, i32 49, metadata !118, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!118 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 32, i64 64, i32 0, i32 0, null, metadata !119, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!119 = metadata !{metadata !41}
!120 = metadata !{i32 790546, i32 0, null, metadata !"rt_info.scheduler_context", metadata !"rt_info.scheduler_context", metadata !"rt_info.scheduler_context", metadata !84, i32 49, metadata !121, i32 1, i32 1, null} ; [ DW_TAG_variable_field ]
!121 = metadata !{i32 786438, null, metadata !"__spir_rt_info_tT", metadata !22, i32 120, i64 32, i64 64, i32 0, i32 0, null, metadata !122, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!122 = metadata !{metadata !40}
!123 = metadata !{i32 786484, i32 0, metadata !76, metadata !"rt_info", metadata !"rt_info", metadata !"", metadata !84, i32 49, metadata !20, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!124 = metadata !{metadata !125, i8** @__spir_rt_info.9}
!125 = metadata !{metadata !126}
!126 = metadata !{i32 0, i32 7, metadata !127}
!127 = metadata !{metadata !128}
!128 = metadata !{metadata !"__spir_rt_info.9", metadata !129, metadata !"", i32 0, i32 7}
!129 = metadata !{metadata !130}
!130 = metadata !{i32 0, i32 0, i32 1}
!131 = metadata !{metadata !132, i64** @__spir_rt_info.12}
!132 = metadata !{metadata !133}
!133 = metadata !{i32 0, i32 63, metadata !134}
!134 = metadata !{metadata !135}
!135 = metadata !{metadata !"__spir_rt_info.12", metadata !129, metadata !"", i32 0, i32 63}
!136 = metadata !{metadata !137, i32** @__spir_rt_info.0}
!137 = metadata !{metadata !138}
!138 = metadata !{i32 0, i32 31, metadata !139}
!139 = metadata !{metadata !140}
!140 = metadata !{metadata !"__spir_rt_info.0", metadata !129, metadata !"", i32 0, i32 31}
!141 = metadata !{metadata !142}
!142 = metadata !{i32 0, i32 31, metadata !143}
!143 = metadata !{metadata !144}
!144 = metadata !{metadata !"gmem", metadata !129, metadata !"", i32 0, i32 31}
!145 = metadata !{metadata !146}
!146 = metadata !{i32 0, i32 31, metadata !147}
!147 = metadata !{metadata !148}
!148 = metadata !{metadata !"group_id.x", metadata !129, metadata !"", i32 0, i32 31}
!149 = metadata !{metadata !150}
!150 = metadata !{i32 0, i32 31, metadata !151}
!151 = metadata !{metadata !152}
!152 = metadata !{metadata !"group_id.y", metadata !129, metadata !"", i32 0, i32 31}
!153 = metadata !{metadata !154}
!154 = metadata !{i32 0, i32 31, metadata !155}
!155 = metadata !{metadata !156}
!156 = metadata !{metadata !"group_id.z", metadata !129, metadata !"", i32 0, i32 31}
!157 = metadata !{metadata !158}
!158 = metadata !{i32 0, i32 31, metadata !159}
!159 = metadata !{metadata !160}
!160 = metadata !{metadata !"bias", metadata !129, metadata !"", i32 0, i32 31}
!161 = metadata !{metadata !162}
!162 = metadata !{i32 0, i32 31, metadata !163}
!163 = metadata !{metadata !164}
!164 = metadata !{metadata !"Layer1_Neurons_GPU", metadata !129, metadata !"", i32 0, i32 31}
!165 = metadata !{metadata !166}
!166 = metadata !{i32 0, i32 31, metadata !167}
!167 = metadata !{metadata !168}
!168 = metadata !{metadata !"Layer1_Weights_GPU", metadata !129, metadata !"", i32 0, i32 31}
!169 = metadata !{metadata !170}
!170 = metadata !{i32 0, i32 31, metadata !171}
!171 = metadata !{metadata !172}
!172 = metadata !{metadata !"Layer2_Neurons_GPU", metadata !129, metadata !"", i32 0, i32 31}
!173 = metadata !{i32 786689, metadata !76, metadata !"gmem", metadata !13, i32 16777275, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!174 = metadata !{i32 59, i32 84, metadata !76, null}
!175 = metadata !{i32 790531, metadata !176, metadata !"group_id.x", null, i32 59, metadata !177, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!176 = metadata !{i32 786689, metadata !76, metadata !"group_id", metadata !13, i32 33554491, metadata !65, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!177 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !178} ; [ DW_TAG_pointer_type ]
!178 = metadata !{i32 786438, null, metadata !"", metadata !13, i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !179, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!179 = metadata !{metadata !69}
!180 = metadata !{i32 59, i32 105, metadata !76, null}
!181 = metadata !{i32 790531, metadata !176, metadata !"group_id.y", null, i32 59, metadata !182, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!182 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !183} ; [ DW_TAG_pointer_type ]
!183 = metadata !{i32 786438, null, metadata !"", metadata !13, i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !184, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!184 = metadata !{metadata !70}
!185 = metadata !{i32 790531, metadata !176, metadata !"group_id.z", null, i32 59, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!186 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !187} ; [ DW_TAG_pointer_type ]
!187 = metadata !{i32 786438, null, metadata !"", metadata !13, i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !188, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!188 = metadata !{metadata !71}
!189 = metadata !{i32 790531, metadata !190, metadata !"args.bias", null, i32 59, metadata !191, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!190 = metadata !{i32 786689, metadata !76, metadata !"args", metadata !13, i32 50331707, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!191 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !192} ; [ DW_TAG_pointer_type ]
!192 = metadata !{i32 786438, null, metadata !"", metadata !13, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !193, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!193 = metadata !{metadata !54}
!194 = metadata !{i32 59, i32 145, metadata !76, null}
!195 = metadata !{i32 790531, metadata !190, metadata !"args.Layer1_Neurons_GPU", null, i32 59, metadata !196, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!196 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !197} ; [ DW_TAG_pointer_type ]
!197 = metadata !{i32 786438, null, metadata !"", metadata !13, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !198, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!198 = metadata !{metadata !56}
!199 = metadata !{i32 790531, metadata !190, metadata !"args.Layer1_Weights_GPU", null, i32 59, metadata !200, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!200 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !201} ; [ DW_TAG_pointer_type ]
!201 = metadata !{i32 786438, null, metadata !"", metadata !13, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !202, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!202 = metadata !{metadata !57}
!203 = metadata !{i32 790531, metadata !190, metadata !"args.Layer2_Neurons_GPU", null, i32 59, metadata !204, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!204 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !205} ; [ DW_TAG_pointer_type ]
!205 = metadata !{i32 786438, null, metadata !"", metadata !13, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !206, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!206 = metadata !{metadata !58}
!207 = metadata !{i32 790531, metadata !208, metadata !"group_id.x", null, i32 28, metadata !177, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!208 = metadata !{i32 786689, metadata !80, metadata !"group_id", metadata !13, i32 16777244, metadata !65, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!209 = metadata !{i32 28, i32 44, metadata !80, metadata !210}
!210 = metadata !{i32 65, i32 1, metadata !211, null}
!211 = metadata !{i32 786443, metadata !76, i32 60, i32 1, metadata !13, i32 1} ; [ DW_TAG_lexical_block ]
!212 = metadata !{i32 790531, metadata !208, metadata !"group_id.y", null, i32 28, metadata !182, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!213 = metadata !{i32 790531, metadata !208, metadata !"group_id.z", null, i32 28, metadata !186, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!214 = metadata !{i32 790531, metadata !215, metadata !"args.bias", null, i32 34, metadata !191, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!215 = metadata !{i32 786689, metadata !79, metadata !"args", metadata !13, i32 16777250, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!216 = metadata !{i32 34, i32 55, metadata !79, metadata !217}
!217 = metadata !{i32 66, i32 1, metadata !211, null}
!218 = metadata !{i32 790531, metadata !215, metadata !"args.Layer1_Neurons_GPU", null, i32 34, metadata !196, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!219 = metadata !{i32 790531, metadata !215, metadata !"args.Layer1_Weights_GPU", null, i32 34, metadata !200, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!220 = metadata !{i32 790531, metadata !215, metadata !"args.Layer2_Neurons_GPU", null, i32 34, metadata !204, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!221 = metadata !{i32 67, i32 1, metadata !211, null}
!222 = metadata !{i32 68, i32 1, metadata !211, null}
!223 = metadata !{i32 69, i32 1, metadata !211, null}
!224 = metadata !{i32 70, i32 1, metadata !211, null}
!225 = metadata !{i32 121, i32 3, metadata !226, null}
!226 = metadata !{i32 786443, metadata !211, metadata !84} ; [ DW_TAG_lexical_block ]
!227 = metadata !{i32 48, i32 90, metadata !12, null}
!228 = metadata !{i32 786689, metadata !12, metadata !"gmem", metadata !13, i32 16777264, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!229 = metadata !{i32 790531, metadata !230, metadata !"args.bias", null, i32 48, metadata !191, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!230 = metadata !{i32 786689, metadata !12, metadata !"args", metadata !13, i32 50331696, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!231 = metadata !{i32 48, i32 153, metadata !12, null}
!232 = metadata !{i32 790531, metadata !230, metadata !"args.Layer1_Neurons_GPU", null, i32 48, metadata !196, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!233 = metadata !{i32 790531, metadata !230, metadata !"args.Layer1_Weights_GPU", null, i32 48, metadata !200, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!234 = metadata !{i32 790531, metadata !230, metadata !"args.Layer2_Neurons_GPU", null, i32 48, metadata !204, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!235 = metadata !{i32 50, i32 116, metadata !236, null}
!236 = metadata !{i32 786443, metadata !12, i32 49, i32 1, metadata !13, i32 0} ; [ DW_TAG_lexical_block ]
!237 = metadata !{i32 51, i32 144, metadata !236, null}
!238 = metadata !{i32 52, i32 144, metadata !236, null}
!239 = metadata !{i32 53, i32 144, metadata !236, null}
!240 = metadata !{i32 27, i32 13, metadata !241, null}
!241 = metadata !{i32 786443, metadata !242, i32 26, i32 9, metadata !247, i32 4} ; [ DW_TAG_lexical_block ]
!242 = metadata !{i32 786443, metadata !243, i32 25, i32 9, metadata !247, i32 3} ; [ DW_TAG_lexical_block ]
!243 = metadata !{i32 786443, metadata !244, i32 24, i32 5, metadata !247, i32 2} ; [ DW_TAG_lexical_block ]
!244 = metadata !{i32 786443, metadata !245, i32 23, i32 5, metadata !247, i32 1} ; [ DW_TAG_lexical_block ]
!245 = metadata !{i32 786443, metadata !246, i32 5, i32 1, metadata !247, i32 0} ; [ DW_TAG_lexical_block ]
!246 = metadata !{i32 786478, i32 0, metadata !247, metadata !"executeFirstLayer1_p3", metadata !"executeFirstLayer1_p3", metadata !"", metadata !247, i32 3, metadata !248, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !48, i32 5} ; [ DW_TAG_subprogram ]
!247 = metadata !{i32 786473, metadata !"layer1_con_p3/executeFirstLayer1_p3.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS", null} ; [ DW_TAG_file_type ]
!248 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !249, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!249 = metadata !{null, metadata !250, metadata !250, metadata !250, metadata !250}
!250 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !251} ; [ DW_TAG_pointer_type ]
!251 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!252 = metadata !{i32 35, i32 5, metadata !245, null}
!253 = metadata !{i32 15, i32 15, metadata !245, null}
!254 = metadata !{i32 18, i32 5, metadata !245, null}
!255 = metadata !{i32 21, i32 5, metadata !245, null}
!256 = metadata !{i32 23, i32 18, metadata !244, null}
!257 = metadata !{i32 25, i32 22, metadata !242, null}
!258 = metadata !{i32 25, i32 32, metadata !242, null}
!259 = metadata !{i32 23, i32 28, metadata !244, null}
!260 = metadata !{i32 32, i32 5, metadata !245, null}
!261 = metadata !{i32 33, i32 5, metadata !245, null}
!262 = metadata !{i32 75, i32 1, metadata !263, null}
!263 = metadata !{i32 786443, metadata !211, metadata !13} ; [ DW_TAG_lexical_block ]
