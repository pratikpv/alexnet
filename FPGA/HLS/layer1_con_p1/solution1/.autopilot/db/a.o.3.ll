; ModuleID = 'C:/Users/RA_prof_Jeon/siddharth/HLS/Alexnet_dev/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-linux-gnu"

@executeFirstLayer_st = internal unnamed_addr constant [18 x i8] c"executeFirstLayer\00" ; [#uses=1 type=[18 x i8]*]
@p_spir_rt_info_9 = global i8* null               ; [#uses=0 type=i8**]
@p_spir_rt_info_8 = global i8** null              ; [#uses=0 type=i8***]
@p_spir_rt_info_7 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@p_spir_rt_info_6 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@p_spir_rt_info_5 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@p_spir_rt_info_4 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@p_spir_rt_info_3 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@p_spir_rt_info_2 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@p_spir_rt_info_12 = global i64* null             ; [#uses=0 type=i64**]
@p_spir_rt_info_11 = global i8** null             ; [#uses=0 type=i8***]
@p_spir_rt_info_10 = global i8** null             ; [#uses=0 type=i8***]
@p_spir_rt_info_1 = global [3 x i32]* null        ; [#uses=0 type=[3 x i32]**]
@p_spir_rt_info_0 = global i32* null              ; [#uses=0 type=i32**]
@XCL_WG_DIM_Y_XCL_WG_s = internal unnamed_addr constant [26 x i8] c"XCL_WG_DIM_Y_XCL_WG_DIM_X\00" ; [#uses=1 type=[26 x i8]*]
@XCL_WG_DIM_X_str = internal unnamed_addr constant [13 x i8] c"XCL_WG_DIM_X\00" ; [#uses=1 type=[13 x i8]*]
@p_str3 = private unnamed_addr constant [8 x i8] c"control\00", align 1 ; [#uses=3 type=[8 x i8]*]
@p_str2 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1 ; [#uses=3 type=[10 x i8]*]
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=21 type=[1 x i8]*]
@p_str = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=1 type=[6 x i8]*]

; [#uses=2]
declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

; [#uses=28]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define void @executeFirstLayer(i32 addrspace(1)* %gmem, i32* %group_id_x, i32* %group_id_y, i32* %group_id_z, i32* %bias, i32* %Layer1_Neurons_GPU, i32* %Layer1_Weights_GPU, i32* %Layer2_Neurons_GPU, i32* %r_offset, i32* %c_offset) {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 addrspace(1)* %gmem), !map !28
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id_x), !map !32
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id_y), !map !36
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id_z), !map !40
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %bias), !map !44
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer1_Neurons_GPU), !map !48
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer1_Weights_GPU), !map !52
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer2_Neurons_GPU), !map !56
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %r_offset), !map !60
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %c_offset), !map !64
  call void (...)* @_ssdm_op_SpecTopModule([18 x i8]* @executeFirstLayer_st)
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !68), !dbg !106 ; [debug line = 65:84] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !{i32* %group_id_x}, i64 0, metadata !107), !dbg !112 ; [debug line = 65:105] [debug variable = group_id.x]
  call void @llvm.dbg.value(metadata !{i32* %group_id_y}, i64 0, metadata !113), !dbg !112 ; [debug line = 65:105] [debug variable = group_id.y]
  call void @llvm.dbg.value(metadata !{i32* %group_id_z}, i64 0, metadata !117), !dbg !112 ; [debug line = 65:105] [debug variable = group_id.z]
  call void @llvm.dbg.value(metadata !{i32* %bias}, i64 0, metadata !121), !dbg !126 ; [debug line = 65:141] [debug variable = args.bias]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Neurons_GPU}, i64 0, metadata !127), !dbg !126 ; [debug line = 65:141] [debug variable = args.Layer1_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Weights_GPU}, i64 0, metadata !131), !dbg !126 ; [debug line = 65:141] [debug variable = args.Layer1_Weights_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer2_Neurons_GPU}, i64 0, metadata !135), !dbg !126 ; [debug line = 65:141] [debug variable = args.Layer2_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %r_offset}, i64 0, metadata !139), !dbg !126 ; [debug line = 65:141] [debug variable = args.r_offset]
  call void @llvm.dbg.value(metadata !{i32* %c_offset}, i64 0, metadata !143), !dbg !126 ; [debug line = 65:141] [debug variable = args.c_offset]
  call void @llvm.dbg.value(metadata !{i32* %group_id_x}, i64 0, metadata !147), !dbg !150 ; [debug line = 30:44@71:1] [debug variable = group_id.x]
  call void @llvm.dbg.value(metadata !{i32* %group_id_y}, i64 0, metadata !153), !dbg !150 ; [debug line = 30:44@71:1] [debug variable = group_id.y]
  call void @llvm.dbg.value(metadata !{i32* %group_id_z}, i64 0, metadata !154), !dbg !150 ; [debug line = 30:44@71:1] [debug variable = group_id.z]
  call void @llvm.dbg.value(metadata !{i32* %bias}, i64 0, metadata !155), !dbg !158 ; [debug line = 36:51@72:1] [debug variable = args.bias]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Neurons_GPU}, i64 0, metadata !160), !dbg !158 ; [debug line = 36:51@72:1] [debug variable = args.Layer1_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Weights_GPU}, i64 0, metadata !161), !dbg !158 ; [debug line = 36:51@72:1] [debug variable = args.Layer1_Weights_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer2_Neurons_GPU}, i64 0, metadata !162), !dbg !158 ; [debug line = 36:51@72:1] [debug variable = args.Layer2_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %r_offset}, i64 0, metadata !163), !dbg !158 ; [debug line = 36:51@72:1] [debug variable = args.r_offset]
  call void @llvm.dbg.value(metadata !{i32* %c_offset}, i64 0, metadata !164), !dbg !158 ; [debug line = 36:51@72:1] [debug variable = args.c_offset]
  call void (...)* @_ssdm_op_SpecInterface(i32 addrspace(1)* %gmem, [6 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 128, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind, !dbg !165 ; [debug line = 73:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %group_id_x, i32* %group_id_y, i32* %group_id_z, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [8 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind, !dbg !166 ; [debug line = 74:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [8 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind, !dbg !167 ; [debug line = 75:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %bias, i32* %Layer1_Neurons_GPU, i32* %Layer1_Weights_GPU, i32* %Layer2_Neurons_GPU, i32* %r_offset, i32* %c_offset, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [8 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind, !dbg !168 ; [debug line = 76:1]
  %group_id_x_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %group_id_x), !dbg !169 ; [#uses=1 type=i32] [debug line = 121:3]
  %tmp_4 = trunc i32 %group_id_x_read to i30, !dbg !172 ; [#uses=3 type=i30] [debug line = 52:90]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !205), !dbg !172 ; [debug line = 52:90] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !{i32* %bias}, i64 0, metadata !206), !dbg !208 ; [debug line = 52:149] [debug variable = args.bias]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Neurons_GPU}, i64 0, metadata !209), !dbg !208 ; [debug line = 52:149] [debug variable = args.Layer1_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer1_Weights_GPU}, i64 0, metadata !210), !dbg !208 ; [debug line = 52:149] [debug variable = args.Layer1_Weights_GPU]
  call void @llvm.dbg.value(metadata !{i32* %Layer2_Neurons_GPU}, i64 0, metadata !211), !dbg !208 ; [debug line = 52:149] [debug variable = args.Layer2_Neurons_GPU]
  call void @llvm.dbg.value(metadata !{i32* %r_offset}, i64 0, metadata !212), !dbg !208 ; [debug line = 52:149] [debug variable = args.r_offset]
  call void @llvm.dbg.value(metadata !{i32* %c_offset}, i64 0, metadata !213), !dbg !208 ; [debug line = 52:149] [debug variable = args.c_offset]
  %bias_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %bias), !dbg !214 ; [#uses=1 type=i32] [debug line = 54:116]
  %tmp = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %bias_read, i32 2, i32 31), !dbg !216 ; [#uses=1 type=i30] [debug line = 55:144]
  %tmp_2_cast = zext i30 %tmp to i31, !dbg !216   ; [#uses=1 type=i31] [debug line = 55:144]
  %Layer1_Neurons_GPU_r = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %Layer1_Neurons_GPU), !dbg !216 ; [#uses=1 type=i32] [debug line = 55:144]
  %tmp_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %Layer1_Neurons_GPU_r, i32 2, i32 31), !dbg !217 ; [#uses=1 type=i30] [debug line = 56:144]
  %tmp_3_cast = zext i30 %tmp_1 to i31, !dbg !217 ; [#uses=3 type=i31] [debug line = 56:144]
  %Layer1_Weights_GPU_r = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %Layer1_Weights_GPU), !dbg !217 ; [#uses=1 type=i32] [debug line = 56:144]
  %tmp_2 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %Layer1_Weights_GPU_r, i32 2, i32 31), !dbg !218 ; [#uses=1 type=i30] [debug line = 57:144]
  %tmp_4_cast = zext i30 %tmp_2 to i31, !dbg !218 ; [#uses=3 type=i31] [debug line = 57:144]
  %Layer2_Neurons_GPU_r = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %Layer2_Neurons_GPU), !dbg !218 ; [#uses=1 type=i32] [debug line = 57:144]
  %tmp_3 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %Layer2_Neurons_GPU_r, i32 2, i32 31), !dbg !219 ; [#uses=1 type=i30] [debug line = 58:45]
  %tmp_5_cast = zext i30 %tmp_3 to i31, !dbg !219 ; [#uses=1 type=i31] [debug line = 58:45]
  %arg_r_offset = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %r_offset), !dbg !219 ; [#uses=2 type=i32] [debug line = 58:45]
  call void @llvm.dbg.value(metadata !{i32 %arg_r_offset}, i64 0, metadata !220), !dbg !219 ; [debug line = 58:45] [debug variable = arg_r_offset]
  %arg_c_offset = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %c_offset), !dbg !221 ; [#uses=2 type=i32] [debug line = 59:45]
  call void @llvm.dbg.value(metadata !{i32 %arg_c_offset}, i64 0, metadata !222), !dbg !221 ; [debug line = 59:45] [debug variable = arg_c_offset]
  %gep_idx_i_i_cast = zext i30 %tmp_4 to i31      ; [#uses=1 type=i31]
  %arg_bias_i_0_sum = add i31 %gep_idx_i_i_cast, %tmp_2_cast ; [#uses=1 type=i31]
  %arg_bias_i_0_sum_cas = zext i31 %arg_bias_i_0_sum to i32 ; [#uses=1 type=i32]
  %gmem_addr = getelementptr i32 addrspace(1)* %gmem, i32 %arg_bias_i_0_sum_cas ; [#uses=2 type=i32 addrspace(1)*]
  %tmp_7 = trunc i32 %arg_c_offset to i30         ; [#uses=1 type=i30]
  %tmp_5 = mul i30 363, %tmp_4, !dbg !223         ; [#uses=2 type=i30] [debug line = 23:13]
  %tmp_6 = mul i30 3025, %tmp_4, !dbg !236        ; [#uses=1 type=i30] [debug line = 31:5]
  br label %for.header.i.i

for.header.i.i:                                   ; preds = %._crit_edge.i.i, %0
  %indvar_flatten = phi i11 [ 0, %0 ], [ %indvar_flatten_next, %._crit_edge.i.i ] ; [#uses=2 type=i11]
  %indvar57_reg2mem69 = phi i6 [ 0, %0 ], [ %indvar57_reg2mem69_0_3, %._crit_edge.i.i ] ; [#uses=3 type=i6]
  %indvar_reg2mem67_0_i = phi i6 [ 0, %0 ], [ %indvar_inc_reg2mem, %._crit_edge.i.i ] ; [#uses=2 type=i6]
  %tmp_8 = trunc i32 %arg_r_offset to i30, !dbg !237 ; [#uses=1 type=i30] [debug line = 11:15]
  %tmp_12 = zext i6 %indvar57_reg2mem69 to i30, !dbg !237 ; [#uses=1 type=i30] [debug line = 11:15]
  %exitcond_flatten = icmp eq i11 %indvar_flatten, -1024 ; [#uses=1 type=i1]
  %indvar_flatten_next = add i11 1, %indvar_flatten ; [#uses=1 type=i11]
  br i1 %exitcond_flatten, label %__AESL_call_work_item_NA4.exit, label %for.body56.i.i

for.body56.i.i:                                   ; preds = %for.header.i.i
  %empty = call i32 (...)* @_ssdm_op_SpecLoopName([26 x i8]* @XCL_WG_DIM_Y_XCL_WG_s) ; [#uses=0 type=i32]
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1024, i64 1024, i64 1024) ; [#uses=0 type=i32]
  %tmp_s = icmp eq i6 %indvar_reg2mem67_0_i, -32  ; [#uses=3 type=i1]
  %indvar_reg2mem67_0_i_1 = select i1 %tmp_s, i6 0, i6 %indvar_reg2mem67_0_i ; [#uses=3 type=i6]
  %indvar_inc58_reg2mem = add i6 1, %indvar57_reg2mem69 ; [#uses=2 type=i6]
  %tmp_14 = zext i6 %indvar_inc58_reg2mem to i30, !dbg !237 ; [#uses=1 type=i30] [debug line = 11:15]
  %tmp_15 = trunc i32 %arg_r_offset to i30, !dbg !237 ; [#uses=1 type=i30] [debug line = 11:15]
  %tmp_16 = add i30 %tmp_15, %tmp_14, !dbg !237   ; [#uses=1 type=i30] [debug line = 11:15]
  %tmp_17 = add i30 %tmp_12, %tmp_8, !dbg !237    ; [#uses=1 type=i30] [debug line = 11:15]
  %tmp_9 = select i1 %tmp_s, i30 %tmp_16, i30 %tmp_17 ; [#uses=2 type=i30]
  %tmp_1_mid2 = mul i30 2724, %tmp_9              ; [#uses=3 type=i30]
  %tmp_39_mid2 = or i30 %tmp_1_mid2, 1            ; [#uses=1 type=i30]
  %tmp_51_mid2 = or i30 %tmp_1_mid2, 2            ; [#uses=1 type=i30]
  %tmp_28_mid2 = mul i30 55, %tmp_9, !dbg !236    ; [#uses=1 type=i30] [debug line = 31:5]
  %indvar57_reg2mem69_0_3 = select i1 %tmp_s, i6 %indvar_inc58_reg2mem, i6 %indvar57_reg2mem69 ; [#uses=1 type=i6]
  %indvar_reg2mem67_0_i_2 = zext i6 %indvar_reg2mem67_0_i_1 to i32 ; [#uses=1 type=i32]
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_X_str) nounwind ; [#uses=0 type=i32]
  %tmp_10 = zext i6 %indvar_reg2mem67_0_i_1 to i30 ; [#uses=1 type=i30]
  %col_0_reg2mem_0_i_i = add i32 %arg_c_offset, %indvar_reg2mem67_0_i_2, !dbg !238 ; [#uses=2 type=i32] [debug line = 12:15]
  %tmp_24 = shl i32 %col_0_reg2mem_0_i_i, 4, !dbg !239 ; [#uses=1 type=i32] [debug line = 17:5]
  %tmp_45 = shl i32 %col_0_reg2mem_0_i_i, 2, !dbg !239 ; [#uses=1 type=i32] [debug line = 17:5]
  %p_reg2mem27_0_i_i = sub i32 %tmp_24, %tmp_45, !dbg !239 ; [#uses=1 type=i32] [debug line = 17:5]
  %tmp_46 = trunc i32 %p_reg2mem27_0_i_i to i30   ; [#uses=3 type=i30]
  %tmp_28 = add i30 %tmp_46, %tmp_1_mid2, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp_29 = add i30 %tmp_46, %tmp_39_mid2, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp_31 = add i30 %tmp_46, %tmp_51_mid2, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  br label %.loopexit, !dbg !240                  ; [debug line = 19:18]

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %for.body56.i.i
  %i_0_reg2mem45_0_i_i = phi i4 [ 0, %for.body56.i.i ], [ %p_reg2mem5_0_i_i, %.loopexit.loopexit ] ; [#uses=2 type=i4]
  %product_0_reg2mem47_s = phi float [ 0.000000e+00, %for.body56.i.i ], [ %product_1_reg2mem43_s, %.loopexit.loopexit ] ; [#uses=2 type=float]
  %phi_mul = phi i13 [ 0, %for.body56.i.i ], [ %next_mul, %.loopexit.loopexit ] ; [#uses=2 type=i13]
  %phi_mul2 = phi i7 [ 0, %for.body56.i.i ], [ %next_mul3, %.loopexit.loopexit ] ; [#uses=3 type=i7]
  %phi_mul_cast = zext i13 %phi_mul to i14        ; [#uses=1 type=i14]
  %next_mul3 = add i7 %phi_mul2, 11               ; [#uses=1 type=i7]
  %next_mul = add i13 %phi_mul, 681               ; [#uses=1 type=i13]
  %exitcond5 = icmp eq i4 %i_0_reg2mem45_0_i_i, -5, !dbg !240 ; [#uses=1 type=i1] [debug line = 19:18]
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11) ; [#uses=0 type=i32]
  %p_reg2mem5_0_i_i = add i4 %i_0_reg2mem45_0_i_i, 1, !dbg !241 ; [#uses=1 type=i4] [debug line = 19:28]
  br i1 %exitcond5, label %._crit_edge.i.i, label %.preheader.preheader, !dbg !240 ; [debug line = 19:18]

.preheader.preheader:                             ; preds = %.loopexit
  %tmp_33 = zext i7 %phi_mul2 to i30, !dbg !223   ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp_38 = add i30 %tmp_33, %tmp_5, !dbg !223    ; [#uses=2 type=i30] [debug line = 23:13]
  br label %.preheader, !dbg !242                 ; [debug line = 21:22]

.preheader:                                       ; preds = %1, %.preheader.preheader
  %j_0_reg2mem41_0_i_i = phi i4 [ %p_reg2mem7_0_i_i, %1 ], [ 0, %.preheader.preheader ] ; [#uses=6 type=i4]
  %product_1_reg2mem43_s = phi float [ %p_reg2mem9_0_i_i, %1 ], [ %product_0_reg2mem47_s, %.preheader.preheader ] ; [#uses=2 type=float]
  %j_0_reg2mem41_0_i_i_s = zext i4 %j_0_reg2mem41_0_i_i to i8, !dbg !242 ; [#uses=1 type=i8] [debug line = 21:22]
  %j_0_reg2mem41_0_i_i_1 = zext i4 %j_0_reg2mem41_0_i_i to i5, !dbg !242 ; [#uses=1 type=i5] [debug line = 21:22]
  %j_0_reg2mem41_0_i_i_2 = zext i4 %j_0_reg2mem41_0_i_i to i7, !dbg !242 ; [#uses=2 type=i7] [debug line = 21:22]
  %exitcond = icmp eq i4 %j_0_reg2mem41_0_i_i, -5, !dbg !242 ; [#uses=1 type=i1] [debug line = 21:22]
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11) ; [#uses=0 type=i32]
  %p_reg2mem7_0_i_i = add i4 %j_0_reg2mem41_0_i_i, 1, !dbg !243 ; [#uses=1 type=i4] [debug line = 21:32]
  br i1 %exitcond, label %.loopexit.loopexit, label %1, !dbg !242 ; [debug line = 21:22]

; <label>:1                                       ; preds = %.preheader
  %p_shl2 = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %j_0_reg2mem41_0_i_i, i2 0), !dbg !223 ; [#uses=1 type=i6] [debug line = 23:13]
  %p_shl2_cast = zext i6 %p_shl2 to i7, !dbg !223 ; [#uses=1 type=i7] [debug line = 23:13]
  %tmp_18 = sub i7 %p_shl2_cast, %j_0_reg2mem41_0_i_i_2, !dbg !223 ; [#uses=1 type=i7] [debug line = 23:13]
  %tmp_18_cast = sext i7 %tmp_18 to i14, !dbg !223 ; [#uses=1 type=i14] [debug line = 23:13]
  %tmp1 = add i14 %tmp_18_cast, %phi_mul_cast, !dbg !223 ; [#uses=1 type=i14] [debug line = 23:13]
  %tmp_32 = sext i14 %tmp1 to i30, !dbg !223      ; [#uses=3 type=i30] [debug line = 23:13]
  %tmp_21_cast = add i30 %tmp_28, %tmp_32, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx20_i_i_cast = zext i30 %tmp_21_cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_G = add i31 %gep_idx20_i_i_cast, %tmp_3_cast ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_G_1 = zext i31 %arg_Layer1_Neurons_G to i32 ; [#uses=1 type=i32]
  %gmem_addr_2 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_G_1 ; [#uses=2 type=i32 addrspace(1)*]
  %gmem_load_1_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_2, i32 1) ; [#uses=0 type=i1]
  %gmem_addr_2_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_2) ; [#uses=1 type=i32]
  %tmp_22 = bitcast i32 %gmem_addr_2_read to float ; [#uses=1 type=float]
  %tmp2 = add i7 %j_0_reg2mem41_0_i_i_2, %phi_mul2, !dbg !223 ; [#uses=1 type=i7] [debug line = 23:13]
  %tmp_37 = zext i7 %tmp2 to i30, !dbg !223       ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp_24_cast = add i30 %tmp_5, %tmp_37, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx28_i_i_cast = zext i30 %tmp_24_cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Weights_G = add i31 %gep_idx28_i_i_cast, %tmp_4_cast ; [#uses=1 type=i31]
  %arg_Layer1_Weights_G_1 = zext i31 %arg_Layer1_Weights_G to i32 ; [#uses=1 type=i32]
  %gmem_addr_3 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_G_1 ; [#uses=2 type=i32 addrspace(1)*]
  %gmem_load_2_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_3, i32 1) ; [#uses=0 type=i1]
  %gmem_addr_3_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_3) ; [#uses=1 type=i32]
  %tmp_25 = bitcast i32 %gmem_addr_3_read to float ; [#uses=1 type=float]
  %tmp_26 = fmul float %tmp_22, %tmp_25, !dbg !223 ; [#uses=1 type=float] [debug line = 23:13]
  %tmp_29_cast = add i30 %tmp_29, %tmp_32, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx36_i_i_cast = zext i30 %tmp_29_cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_G_2 = add i31 %gep_idx36_i_i_cast, %tmp_3_cast ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_G_3 = zext i31 %arg_Layer1_Neurons_G_2 to i32 ; [#uses=1 type=i32]
  %gmem_addr_4 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_G_3 ; [#uses=2 type=i32 addrspace(1)*]
  %gmem_load_3_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_4, i32 1) ; [#uses=0 type=i1]
  %gmem_addr_4_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_4) ; [#uses=1 type=i32]
  %tmp_30 = bitcast i32 %gmem_addr_4_read to float ; [#uses=1 type=float]
  %tmp6 = add i8 %j_0_reg2mem41_0_i_i_s, 121, !dbg !223 ; [#uses=1 type=i8] [debug line = 23:13]
  %tmp_39 = zext i8 %tmp6 to i30, !dbg !223       ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp_33_cast = add i30 %tmp_38, %tmp_39, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx44_i_i_cast = zext i30 %tmp_33_cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Weights_G_2 = add i31 %gep_idx44_i_i_cast, %tmp_4_cast ; [#uses=1 type=i31]
  %arg_Layer1_Weights_G_3 = zext i31 %arg_Layer1_Weights_G_2 to i32 ; [#uses=1 type=i32]
  %gmem_addr_5 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_G_3 ; [#uses=2 type=i32 addrspace(1)*]
  %gmem_load_4_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_5, i32 1) ; [#uses=0 type=i1]
  %gmem_addr_5_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_5) ; [#uses=1 type=i32]
  %tmp_34 = bitcast i32 %gmem_addr_5_read to float ; [#uses=1 type=float]
  %tmp_35 = fmul float %tmp_30, %tmp_34, !dbg !223 ; [#uses=1 type=float] [debug line = 23:13]
  %tmp_36 = fadd float %tmp_26, %tmp_35, !dbg !223 ; [#uses=1 type=float] [debug line = 23:13]
  %tmp_39_cast = add i30 %tmp_31, %tmp_32, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx52_i_i_cast = zext i30 %tmp_39_cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_G_4 = add i31 %gep_idx52_i_i_cast, %tmp_3_cast ; [#uses=1 type=i31]
  %arg_Layer1_Neurons_G_5 = zext i31 %arg_Layer1_Neurons_G_4 to i32 ; [#uses=1 type=i32]
  %gmem_addr_6 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_G_5 ; [#uses=2 type=i32 addrspace(1)*]
  %gmem_load_5_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_6, i32 1) ; [#uses=0 type=i1]
  %gmem_addr_6_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_6) ; [#uses=1 type=i32]
  %tmp_40 = bitcast i32 %gmem_addr_6_read to float ; [#uses=1 type=float]
  %tmp10 = add i5 %j_0_reg2mem41_0_i_i_1, -14, !dbg !223 ; [#uses=1 type=i5] [debug line = 23:13]
  %tmp10_cast = sext i5 %tmp10 to i8, !dbg !223   ; [#uses=1 type=i8] [debug line = 23:13]
  %tmp_41 = zext i8 %tmp10_cast to i30, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  %tmp_43_cast = add i30 %tmp_38, %tmp_41, !dbg !223 ; [#uses=1 type=i30] [debug line = 23:13]
  %gep_idx60_i_i_cast = zext i30 %tmp_43_cast to i31 ; [#uses=1 type=i31]
  %arg_Layer1_Weights_G_4 = add i31 %gep_idx60_i_i_cast, %tmp_4_cast ; [#uses=1 type=i31]
  %arg_Layer1_Weights_G_5 = zext i31 %arg_Layer1_Weights_G_4 to i32 ; [#uses=1 type=i32]
  %gmem_addr_7 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_G_5 ; [#uses=2 type=i32 addrspace(1)*]
  %gmem_load_6_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_7, i32 1) ; [#uses=0 type=i1]
  %gmem_addr_7_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_7) ; [#uses=1 type=i32]
  %tmp_42 = bitcast i32 %gmem_addr_7_read to float ; [#uses=1 type=float]
  %tmp_43 = fmul float %tmp_40, %tmp_42, !dbg !223 ; [#uses=1 type=float] [debug line = 23:13]
  %tmp_44 = fadd float %tmp_36, %tmp_43, !dbg !223 ; [#uses=1 type=float] [debug line = 23:13]
  %p_reg2mem9_0_i_i = fadd float %product_1_reg2mem43_s, %tmp_44, !dbg !223 ; [#uses=1 type=float] [debug line = 23:13]
  br label %.preheader, !dbg !243                 ; [debug line = 21:32]

._crit_edge.i.i:                                  ; preds = %.loopexit
  %gmem_load_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr, i32 1) ; [#uses=0 type=i1]
  %gmem_addr_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr) ; [#uses=1 type=i32]
  %tmp_11 = bitcast i32 %gmem_addr_read to float  ; [#uses=1 type=float]
  %p_reg2mem_0_i_i = fadd float %product_0_reg2mem47_s, %tmp_11, !dbg !244 ; [#uses=2 type=float] [debug line = 28:5]
  %p_reg2mem_0_i_i_to_in = bitcast float %p_reg2mem_0_i_i to i32 ; [#uses=3 type=i32]
  %tmp_13 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %p_reg2mem_0_i_i_to_in, i32 23, i32 30) ; [#uses=1 type=i8]
  %tmp_47 = trunc i32 %p_reg2mem_0_i_i_to_in to i23 ; [#uses=1 type=i23]
  %notlhs = icmp ne i8 %tmp_13, -1                ; [#uses=1 type=i1]
  %notrhs = icmp eq i23 %tmp_47, 0                ; [#uses=1 type=i1]
  %tmp_19 = or i1 %notrhs, %notlhs                ; [#uses=1 type=i1]
  %tmp_20 = fcmp olt float %p_reg2mem_0_i_i, 0.000000e+00, !dbg !245 ; [#uses=1 type=i1] [debug line = 29:5]
  %tmp_21 = and i1 %tmp_19, %tmp_20, !dbg !245    ; [#uses=1 type=i1] [debug line = 29:5]
  %tmp_23 = add i30 %tmp_10, %tmp_7               ; [#uses=1 type=i30]
  %tmp_27 = add i30 %tmp_6, %tmp_23               ; [#uses=1 type=i30]
  %tmp_14_cast = add i30 %tmp_27, %tmp_28_mid2    ; [#uses=1 type=i30]
  %gep_idx12_i_i_cast = zext i30 %tmp_14_cast to i31 ; [#uses=1 type=i31]
  %arg_Layer2_Neurons_G = add i31 %tmp_5_cast, %gep_idx12_i_i_cast ; [#uses=1 type=i31]
  %arg_Layer2_Neurons_G_1 = zext i31 %arg_Layer2_Neurons_G to i32 ; [#uses=1 type=i32]
  %gmem_addr_1 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer2_Neurons_G_1 ; [#uses=3 type=i32 addrspace(1)*]
  %val_i_i = select i1 %tmp_21, i32 0, i32 %p_reg2mem_0_i_i_to_in ; [#uses=1 type=i32]
  %gmem_addr_1_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_1, i32 1) ; [#uses=0 type=i1]
  call void @_ssdm_op_Write.m_axi.i32P(i32 addrspace(1)* %gmem_addr_1, i32 %val_i_i, i4 -1)
  %gmem_addr_1_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32 addrspace(1)* %gmem_addr_1) ; [#uses=0 type=i1]
  %indvar_inc_reg2mem = add i6 1, %indvar_reg2mem67_0_i_1 ; [#uses=1 type=i6]
  br label %for.header.i.i

__AESL_call_work_item_NA4.exit:                   ; preds = %for.header.i.i
  ret void, !dbg !246                             ; [debug line = 81:1]
}

; [#uses=1]
define weak i1 @_ssdm_op_WriteResp.m_axi.i32P(i32 addrspace(1)*) {
entry:
  ret i1 true
}

; [#uses=1]
define weak i1 @_ssdm_op_WriteReq.m_axi.i32P(i32 addrspace(1)*, i32) {
entry:
  ret i1 true
}

; [#uses=1]
define weak void @_ssdm_op_Write.m_axi.i32P(i32 addrspace(1)*, i32, i4) {
entry:
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=3]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=2]
define weak i32 @_ssdm_op_SpecLoopName(...) {
entry:
  ret i32 0
}

; [#uses=4]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=10]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=7]
define weak i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)*, i32) {
entry:
  ret i1 true
}

; [#uses=7]
define weak i32 @_ssdm_op_Read.s_axilite.i32P(i32*) {
entry:
  %empty = load i32* %0                           ; [#uses=1 type=i32]
  ret i32 %empty
}

; [#uses=7]
define weak i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)*) {
entry:
  %empty = load i32 addrspace(1)* %0              ; [#uses=1 type=i32]
  ret i32 %empty
}

; [#uses=1]
define weak i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_8 = trunc i32 %empty to i8               ; [#uses=1 type=i8]
  ret i8 %empty_8
}

; [#uses=4]
define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_9 = trunc i32 %empty to i30              ; [#uses=1 type=i30]
  ret i30 %empty_9
}

; [#uses=0]
declare i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i23 @_ssdm_op_PartSelect.i23.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=1]
define weak i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4, i2) nounwind readnone {
entry:
  %empty = zext i4 %0 to i6                       ; [#uses=1 type=i6]
  %empty_10 = zext i2 %1 to i6                    ; [#uses=1 type=i6]
  %empty_11 = shl i6 %empty, 2                    ; [#uses=1 type=i6]
  %empty_12 = or i6 %empty_11, %empty_10          ; [#uses=1 type=i6]
  ret i6 %empty_12
}

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i30.i2(i30, i2) nounwind readnone

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i28.i4(i28, i4) nounwind readnone

!hls.encrypted.func = !{}
!xcl.libspir = !{!0}
!xcl.reqd_rt_info = !{!1}
!xcl.portmap = !{!2, !4, !5, !6, !7, !9}
!axi4.master.portmap = !{!10}
!xcl.portlist = !{!3, !8}
!xcl.lmem_info = !{}
!xcl.progvar_info = !{}
!llvm.map.gv = !{!11, !18, !23}

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
!11 = metadata !{metadata !12, i8** @p_spir_rt_info_9}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 0, i32 7, metadata !14}
!14 = metadata !{metadata !15}
!15 = metadata !{metadata !"__spir_rt_info.9", metadata !16, metadata !"", i32 0, i32 7}
!16 = metadata !{metadata !17}
!17 = metadata !{i32 0, i32 0, i32 1}
!18 = metadata !{metadata !19, i64** @p_spir_rt_info_12}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 63, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"__spir_rt_info.12", metadata !16, metadata !"", i32 0, i32 63}
!23 = metadata !{metadata !24, i32** @p_spir_rt_info_0}
!24 = metadata !{metadata !25}
!25 = metadata !{i32 0, i32 31, metadata !26}
!26 = metadata !{metadata !27}
!27 = metadata !{metadata !"__spir_rt_info.0", metadata !16, metadata !"", i32 0, i32 31}
!28 = metadata !{metadata !29}
!29 = metadata !{i32 0, i32 31, metadata !30}
!30 = metadata !{metadata !31}
!31 = metadata !{metadata !"gmem", metadata !16, metadata !"", i32 0, i32 31}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 0, i32 31, metadata !34}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !"group_id.x", metadata !16, metadata !"", i32 0, i32 31}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 0, i32 31, metadata !38}
!38 = metadata !{metadata !39}
!39 = metadata !{metadata !"group_id.y", metadata !16, metadata !"", i32 0, i32 31}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 0, i32 31, metadata !42}
!42 = metadata !{metadata !43}
!43 = metadata !{metadata !"group_id.z", metadata !16, metadata !"", i32 0, i32 31}
!44 = metadata !{metadata !45}
!45 = metadata !{i32 0, i32 31, metadata !46}
!46 = metadata !{metadata !47}
!47 = metadata !{metadata !"bias", metadata !16, metadata !"", i32 0, i32 31}
!48 = metadata !{metadata !49}
!49 = metadata !{i32 0, i32 31, metadata !50}
!50 = metadata !{metadata !51}
!51 = metadata !{metadata !"Layer1_Neurons_GPU", metadata !16, metadata !"", i32 0, i32 31}
!52 = metadata !{metadata !53}
!53 = metadata !{i32 0, i32 31, metadata !54}
!54 = metadata !{metadata !55}
!55 = metadata !{metadata !"Layer1_Weights_GPU", metadata !16, metadata !"", i32 0, i32 31}
!56 = metadata !{metadata !57}
!57 = metadata !{i32 0, i32 31, metadata !58}
!58 = metadata !{metadata !59}
!59 = metadata !{metadata !"Layer2_Neurons_GPU", metadata !16, metadata !"", i32 0, i32 31}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 0, i32 31, metadata !62}
!62 = metadata !{metadata !63}
!63 = metadata !{metadata !"r_offset", metadata !16, metadata !"", i32 0, i32 31}
!64 = metadata !{metadata !65}
!65 = metadata !{i32 0, i32 31, metadata !66}
!66 = metadata !{metadata !67}
!67 = metadata !{metadata !"c_offset", metadata !16, metadata !"", i32 0, i32 31}
!68 = metadata !{i32 786689, metadata !69, metadata !"gmem", metadata !70, i32 16777281, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!69 = metadata !{i32 786478, i32 0, metadata !70, metadata !"__AESL_work_groupA", metadata !"__AESL_work_groupA", metadata !"", metadata !70, i32 65, metadata !71, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !89, i32 66} ; [ DW_TAG_subprogram ]
!70 = metadata !{i32 786473, metadata !"executeFirstLayer_compute_unit", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!71 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !72, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!72 = metadata !{null, metadata !73, metadata !76, metadata !94}
!73 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ]
!74 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_volatile_type ]
!75 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!76 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !77} ; [ DW_TAG_pointer_type ]
!77 = metadata !{i32 786454, null, metadata !"three_tuple_t", metadata !70, i32 15, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_typedef ]
!78 = metadata !{i32 786434, null, metadata !"", metadata !70, i32 10, i64 96, i64 32, i32 0, i32 0, null, metadata !79, i32 0, null, null} ; [ DW_TAG_class_type ]
!79 = metadata !{metadata !80, metadata !81, metadata !82, metadata !83}
!80 = metadata !{i32 786445, metadata !78, metadata !"x", metadata !70, i32 11, i64 32, i64 32, i64 0, i32 0, metadata !75} ; [ DW_TAG_member ]
!81 = metadata !{i32 786445, metadata !78, metadata !"y", metadata !70, i32 12, i64 32, i64 32, i64 32, i32 0, metadata !75} ; [ DW_TAG_member ]
!82 = metadata !{i32 786445, metadata !78, metadata !"z", metadata !70, i32 13, i64 32, i64 32, i64 64, i32 0, metadata !75} ; [ DW_TAG_member ]
!83 = metadata !{i32 786474, metadata !78, null, metadata !70, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_friend ]
!84 = metadata !{i32 786434, null, metadata !"aesl_keep_name_class", metadata !70, i32 27, i64 8, i64 8, i32 0, i32 0, null, metadata !85, i32 0, null, null} ; [ DW_TAG_class_type ]
!85 = metadata !{metadata !86, metadata !91}
!86 = metadata !{i32 786478, i32 0, metadata !84, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !70, i32 30, metadata !87, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !89, i32 30} ; [ DW_TAG_subprogram ]
!87 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !88, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!88 = metadata !{null, metadata !76}
!89 = metadata !{metadata !90}
!90 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!91 = metadata !{i32 786478, i32 0, metadata !84, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP24executeFirstLayer_args_t", metadata !70, i32 36, metadata !92, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !89, i32 36} ; [ DW_TAG_subprogram ]
!92 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !93, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!93 = metadata !{null, metadata !94}
!94 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !95} ; [ DW_TAG_pointer_type ]
!95 = metadata !{i32 786454, null, metadata !"executeFirstLayer_args_t", metadata !70, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !96} ; [ DW_TAG_typedef ]
!96 = metadata !{i32 786434, null, metadata !"", metadata !70, i32 17, i64 192, i64 32, i32 0, i32 0, null, metadata !97, i32 0, null, null} ; [ DW_TAG_class_type ]
!97 = metadata !{metadata !98, metadata !100, metadata !101, metadata !102, metadata !103, metadata !104, metadata !105}
!98 = metadata !{i32 786445, metadata !96, metadata !"bias", metadata !70, i32 18, i64 32, i64 32, i64 0, i32 0, metadata !99} ; [ DW_TAG_member ]
!99 = metadata !{i32 786454, null, metadata !"__spir_size_t", metadata !70, i32 108, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!100 = metadata !{i32 786445, metadata !96, metadata !"Layer1_Neurons_GPU", metadata !70, i32 19, i64 32, i64 32, i64 32, i32 0, metadata !99} ; [ DW_TAG_member ]
!101 = metadata !{i32 786445, metadata !96, metadata !"Layer1_Weights_GPU", metadata !70, i32 20, i64 32, i64 32, i64 64, i32 0, metadata !99} ; [ DW_TAG_member ]
!102 = metadata !{i32 786445, metadata !96, metadata !"Layer2_Neurons_GPU", metadata !70, i32 21, i64 32, i64 32, i64 96, i32 0, metadata !99} ; [ DW_TAG_member ]
!103 = metadata !{i32 786445, metadata !96, metadata !"r_offset", metadata !70, i32 22, i64 32, i64 32, i64 128, i32 0, metadata !75} ; [ DW_TAG_member ]
!104 = metadata !{i32 786445, metadata !96, metadata !"c_offset", metadata !70, i32 23, i64 32, i64 32, i64 160, i32 0, metadata !75} ; [ DW_TAG_member ]
!105 = metadata !{i32 786474, metadata !96, null, metadata !70, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_friend ]
!106 = metadata !{i32 65, i32 84, metadata !69, null}
!107 = metadata !{i32 790531, metadata !108, metadata !"group_id.x", null, i32 65, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!108 = metadata !{i32 786689, metadata !69, metadata !"group_id", metadata !70, i32 33554497, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!109 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !110} ; [ DW_TAG_pointer_type ]
!110 = metadata !{i32 786438, null, metadata !"", metadata !70, i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !111, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!111 = metadata !{metadata !80}
!112 = metadata !{i32 65, i32 105, metadata !69, null}
!113 = metadata !{i32 790531, metadata !108, metadata !"group_id.y", null, i32 65, metadata !114, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!114 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !115} ; [ DW_TAG_pointer_type ]
!115 = metadata !{i32 786438, null, metadata !"", metadata !70, i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !116, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!116 = metadata !{metadata !81}
!117 = metadata !{i32 790531, metadata !108, metadata !"group_id.z", null, i32 65, metadata !118, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!118 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !119} ; [ DW_TAG_pointer_type ]
!119 = metadata !{i32 786438, null, metadata !"", metadata !70, i32 10, i64 32, i64 32, i32 0, i32 0, null, metadata !120, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!120 = metadata !{metadata !82}
!121 = metadata !{i32 790531, metadata !122, metadata !"args.bias", null, i32 65, metadata !123, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!122 = metadata !{i32 786689, metadata !69, metadata !"args", metadata !70, i32 50331713, metadata !94, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!123 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !124} ; [ DW_TAG_pointer_type ]
!124 = metadata !{i32 786438, null, metadata !"", metadata !70, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !125, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!125 = metadata !{metadata !98}
!126 = metadata !{i32 65, i32 141, metadata !69, null}
!127 = metadata !{i32 790531, metadata !122, metadata !"args.Layer1_Neurons_GPU", null, i32 65, metadata !128, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!128 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !129} ; [ DW_TAG_pointer_type ]
!129 = metadata !{i32 786438, null, metadata !"", metadata !70, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !130, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!130 = metadata !{metadata !100}
!131 = metadata !{i32 790531, metadata !122, metadata !"args.Layer1_Weights_GPU", null, i32 65, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!132 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !133} ; [ DW_TAG_pointer_type ]
!133 = metadata !{i32 786438, null, metadata !"", metadata !70, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !134, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!134 = metadata !{metadata !101}
!135 = metadata !{i32 790531, metadata !122, metadata !"args.Layer2_Neurons_GPU", null, i32 65, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!136 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !137} ; [ DW_TAG_pointer_type ]
!137 = metadata !{i32 786438, null, metadata !"", metadata !70, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !138, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!138 = metadata !{metadata !102}
!139 = metadata !{i32 790531, metadata !122, metadata !"args.r_offset", null, i32 65, metadata !140, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!140 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !141} ; [ DW_TAG_pointer_type ]
!141 = metadata !{i32 786438, null, metadata !"", metadata !70, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !142, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!142 = metadata !{metadata !103}
!143 = metadata !{i32 790531, metadata !122, metadata !"args.c_offset", null, i32 65, metadata !144, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!144 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !145} ; [ DW_TAG_pointer_type ]
!145 = metadata !{i32 786438, null, metadata !"", metadata !70, i32 17, i64 32, i64 32, i32 0, i32 0, null, metadata !146, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!146 = metadata !{metadata !104}
!147 = metadata !{i32 790531, metadata !148, metadata !"group_id.x", null, i32 30, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!148 = metadata !{i32 786689, metadata !149, metadata !"group_id", metadata !70, i32 16777246, metadata !76, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!149 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !70, i32 30, metadata !87, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !86, metadata !89, i32 30} ; [ DW_TAG_subprogram ]
!150 = metadata !{i32 30, i32 44, metadata !149, metadata !151}
!151 = metadata !{i32 71, i32 1, metadata !152, null}
!152 = metadata !{i32 786443, metadata !69, i32 66, i32 1, metadata !70, i32 1} ; [ DW_TAG_lexical_block ]
!153 = metadata !{i32 790531, metadata !148, metadata !"group_id.y", null, i32 30, metadata !114, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!154 = metadata !{i32 790531, metadata !148, metadata !"group_id.z", null, i32 30, metadata !118, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!155 = metadata !{i32 790531, metadata !156, metadata !"args.bias", null, i32 36, metadata !123, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!156 = metadata !{i32 786689, metadata !157, metadata !"args", metadata !70, i32 16777252, metadata !94, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!157 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP24executeFirstLayer_args_t", metadata !70, i32 36, metadata !92, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !91, metadata !89, i32 36} ; [ DW_TAG_subprogram ]
!158 = metadata !{i32 36, i32 51, metadata !157, metadata !159}
!159 = metadata !{i32 72, i32 1, metadata !152, null}
!160 = metadata !{i32 790531, metadata !156, metadata !"args.Layer1_Neurons_GPU", null, i32 36, metadata !128, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!161 = metadata !{i32 790531, metadata !156, metadata !"args.Layer1_Weights_GPU", null, i32 36, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!162 = metadata !{i32 790531, metadata !156, metadata !"args.Layer2_Neurons_GPU", null, i32 36, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!163 = metadata !{i32 790531, metadata !156, metadata !"args.r_offset", null, i32 36, metadata !140, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!164 = metadata !{i32 790531, metadata !156, metadata !"args.c_offset", null, i32 36, metadata !144, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!165 = metadata !{i32 73, i32 1, metadata !152, null}
!166 = metadata !{i32 74, i32 1, metadata !152, null}
!167 = metadata !{i32 75, i32 1, metadata !152, null}
!168 = metadata !{i32 76, i32 1, metadata !152, null}
!169 = metadata !{i32 121, i32 3, metadata !170, null}
!170 = metadata !{i32 786443, metadata !152, metadata !171} ; [ DW_TAG_lexical_block ]
!171 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl\5Caesl_gen_cu_body.inc", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!172 = metadata !{i32 52, i32 90, metadata !173, null}
!173 = metadata !{i32 786478, i32 0, metadata !70, metadata !"__AESL_call_work_item_NA", metadata !"__AESL_call_work_item_NA", metadata !"", metadata !70, i32 52, metadata !174, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !89, i32 53} ; [ DW_TAG_subprogram ]
!174 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !175, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!175 = metadata !{null, metadata !73, metadata !176, metadata !94}
!176 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !177} ; [ DW_TAG_pointer_type ]
!177 = metadata !{i32 786454, null, metadata !"__spir_rt_info_t", metadata !70, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !178} ; [ DW_TAG_typedef ]
!178 = metadata !{i32 786434, null, metadata !"__spir_rt_info_tT", metadata !179, i32 120, i64 896, i64 64, i32 0, i32 0, null, metadata !180, i32 0, null, null} ; [ DW_TAG_class_type ]
!179 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl/libspir_types.h", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!180 = metadata !{metadata !181, metadata !182, metadata !186, metadata !187, metadata !188, metadata !189, metadata !190, metadata !191, metadata !192, metadata !194, metadata !197, metadata !198, metadata !199, metadata !201}
!181 = metadata !{i32 786445, metadata !178, metadata !"work_dim", metadata !179, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !75} ; [ DW_TAG_member ]
!182 = metadata !{i32 786445, metadata !178, metadata !"global_size", metadata !179, i32 124, i64 96, i64 32, i64 32, i32 0, metadata !183} ; [ DW_TAG_member ]
!183 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !75, metadata !184, i32 0, i32 0} ; [ DW_TAG_array_type ]
!184 = metadata !{metadata !185}
!185 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!186 = metadata !{i32 786445, metadata !178, metadata !"global_id", metadata !179, i32 125, i64 96, i64 32, i64 128, i32 0, metadata !183} ; [ DW_TAG_member ]
!187 = metadata !{i32 786445, metadata !178, metadata !"local_size", metadata !179, i32 127, i64 96, i64 32, i64 224, i32 0, metadata !183} ; [ DW_TAG_member ]
!188 = metadata !{i32 786445, metadata !178, metadata !"local_id", metadata !179, i32 128, i64 96, i64 32, i64 320, i32 0, metadata !183} ; [ DW_TAG_member ]
!189 = metadata !{i32 786445, metadata !178, metadata !"num_groups", metadata !179, i32 130, i64 96, i64 32, i64 416, i32 0, metadata !183} ; [ DW_TAG_member ]
!190 = metadata !{i32 786445, metadata !178, metadata !"group_id", metadata !179, i32 131, i64 96, i64 32, i64 512, i32 0, metadata !183} ; [ DW_TAG_member ]
!191 = metadata !{i32 786445, metadata !178, metadata !"global_offset", metadata !179, i32 132, i64 96, i64 32, i64 608, i32 0, metadata !183} ; [ DW_TAG_member ]
!192 = metadata !{i32 786445, metadata !178, metadata !"pthread_barrier", metadata !179, i32 135, i64 32, i64 32, i64 704, i32 0, metadata !193} ; [ DW_TAG_member ]
!193 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!194 = metadata !{i32 786445, metadata !178, metadata !"barriertoscheduler", metadata !179, i32 138, i64 8, i64 8, i64 736, i32 0, metadata !195} ; [ DW_TAG_member ]
!195 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !196} ; [ DW_TAG_volatile_type ]
!196 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!197 = metadata !{i32 786445, metadata !178, metadata !"scheduler_context", metadata !179, i32 139, i64 32, i64 32, i64 768, i32 0, metadata !193} ; [ DW_TAG_member ]
!198 = metadata !{i32 786445, metadata !178, metadata !"pe_context", metadata !179, i32 140, i64 32, i64 32, i64 800, i32 0, metadata !193} ; [ DW_TAG_member ]
!199 = metadata !{i32 786445, metadata !178, metadata !"printf_buffer", metadata !179, i32 142, i64 64, i64 64, i64 832, i32 0, metadata !200} ; [ DW_TAG_member ]
!200 = metadata !{i32 786468, null, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!201 = metadata !{i32 786478, i32 0, metadata !178, metadata !"__spir_rt_info_tT", metadata !"__spir_rt_info_tT", metadata !"", metadata !179, i32 120, metadata !202, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !89, i32 120} ; [ DW_TAG_subprogram ]
!202 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !203, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!203 = metadata !{null, metadata !204}
!204 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !178} ; [ DW_TAG_pointer_type ]
!205 = metadata !{i32 786689, metadata !173, metadata !"gmem", metadata !70, i32 16777268, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!206 = metadata !{i32 790531, metadata !207, metadata !"args.bias", null, i32 52, metadata !123, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!207 = metadata !{i32 786689, metadata !173, metadata !"args", metadata !70, i32 50331700, metadata !94, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!208 = metadata !{i32 52, i32 149, metadata !173, null}
!209 = metadata !{i32 790531, metadata !207, metadata !"args.Layer1_Neurons_GPU", null, i32 52, metadata !128, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!210 = metadata !{i32 790531, metadata !207, metadata !"args.Layer1_Weights_GPU", null, i32 52, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!211 = metadata !{i32 790531, metadata !207, metadata !"args.Layer2_Neurons_GPU", null, i32 52, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!212 = metadata !{i32 790531, metadata !207, metadata !"args.r_offset", null, i32 52, metadata !140, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!213 = metadata !{i32 790531, metadata !207, metadata !"args.c_offset", null, i32 52, metadata !144, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!214 = metadata !{i32 54, i32 116, metadata !215, null}
!215 = metadata !{i32 786443, metadata !173, i32 53, i32 1, metadata !70, i32 0} ; [ DW_TAG_lexical_block ]
!216 = metadata !{i32 55, i32 144, metadata !215, null}
!217 = metadata !{i32 56, i32 144, metadata !215, null}
!218 = metadata !{i32 57, i32 144, metadata !215, null}
!219 = metadata !{i32 58, i32 45, metadata !215, null}
!220 = metadata !{i32 786688, metadata !215, metadata !"arg_r_offset", metadata !70, i32 58, metadata !75, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!221 = metadata !{i32 59, i32 45, metadata !215, null}
!222 = metadata !{i32 786688, metadata !215, metadata !"arg_c_offset", metadata !70, i32 59, metadata !75, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!223 = metadata !{i32 23, i32 13, metadata !224, null}
!224 = metadata !{i32 786443, metadata !225, i32 22, i32 9, metadata !230, i32 4} ; [ DW_TAG_lexical_block ]
!225 = metadata !{i32 786443, metadata !226, i32 21, i32 9, metadata !230, i32 3} ; [ DW_TAG_lexical_block ]
!226 = metadata !{i32 786443, metadata !227, i32 20, i32 5, metadata !230, i32 2} ; [ DW_TAG_lexical_block ]
!227 = metadata !{i32 786443, metadata !228, i32 19, i32 5, metadata !230, i32 1} ; [ DW_TAG_lexical_block ]
!228 = metadata !{i32 786443, metadata !229, i32 5, i32 1, metadata !230, i32 0} ; [ DW_TAG_lexical_block ]
!229 = metadata !{i32 786478, i32 0, metadata !230, metadata !"executeFirstLayer", metadata !"executeFirstLayer", metadata !"", metadata !230, i32 2, metadata !231, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !89, i32 5} ; [ DW_TAG_subprogram ]
!230 = metadata !{i32 786473, metadata !"Alexnet_dev/layer1.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS", null} ; [ DW_TAG_file_type ]
!231 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !232, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!232 = metadata !{null, metadata !233, metadata !233, metadata !233, metadata !233, metadata !235, metadata !235}
!233 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !234} ; [ DW_TAG_pointer_type ]
!234 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!235 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!236 = metadata !{i32 31, i32 5, metadata !228, null}
!237 = metadata !{i32 11, i32 15, metadata !228, null}
!238 = metadata !{i32 12, i32 15, metadata !228, null}
!239 = metadata !{i32 17, i32 5, metadata !228, null}
!240 = metadata !{i32 19, i32 18, metadata !227, null}
!241 = metadata !{i32 19, i32 28, metadata !227, null}
!242 = metadata !{i32 21, i32 22, metadata !225, null}
!243 = metadata !{i32 21, i32 32, metadata !225, null}
!244 = metadata !{i32 28, i32 5, metadata !228, null}
!245 = metadata !{i32 29, i32 5, metadata !228, null}
!246 = metadata !{i32 81, i32 1, metadata !247, null}
!247 = metadata !{i32 786443, metadata !152, metadata !70} ; [ DW_TAG_lexical_block ]
