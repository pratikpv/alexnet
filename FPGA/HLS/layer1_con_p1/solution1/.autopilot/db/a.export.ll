; ModuleID = 'C:/Users/RA_prof_Jeon/siddharth/HLS/Alexnet_dev/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-linux-gnu"

@executeFirstLayer_st = internal unnamed_addr constant [18 x i8] c"executeFirstLayer\00"
@p_spir_rt_info_9 = global i8* null
@p_spir_rt_info_8 = global i8** null
@p_spir_rt_info_7 = global [3 x i32]* null
@p_spir_rt_info_6 = global [3 x i32]* null
@p_spir_rt_info_5 = global [3 x i32]* null
@p_spir_rt_info_4 = global [3 x i32]* null
@p_spir_rt_info_3 = global [3 x i32]* null
@p_spir_rt_info_2 = global [3 x i32]* null
@p_spir_rt_info_12 = global i64* null
@p_spir_rt_info_11 = global i8** null
@p_spir_rt_info_10 = global i8** null
@p_spir_rt_info_1 = global [3 x i32]* null
@p_spir_rt_info_0 = global i32* null
@XCL_WG_DIM_Y_XCL_WG_s = internal unnamed_addr constant [26 x i8] c"XCL_WG_DIM_Y_XCL_WG_DIM_X\00"
@XCL_WG_DIM_X_str = internal unnamed_addr constant [13 x i8] c"XCL_WG_DIM_X\00"
@p_str3 = private unnamed_addr constant [8 x i8] c"control\00", align 1
@p_str2 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

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
  call void (...)* @_ssdm_op_SpecInterface(i32 addrspace(1)* %gmem, [6 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 128, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %group_id_x, i32* %group_id_y, i32* %group_id_z, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [8 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [8 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %bias, i32* %Layer1_Neurons_GPU, i32* %Layer1_Weights_GPU, i32* %Layer2_Neurons_GPU, i32* %r_offset, i32* %c_offset, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [8 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %group_id_x_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %group_id_x)
  %tmp_4 = trunc i32 %group_id_x_read to i30
  %bias_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %bias)
  %tmp = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %bias_read, i32 2, i32 31)
  %tmp_2_cast = zext i30 %tmp to i31
  %Layer1_Neurons_GPU_r = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %Layer1_Neurons_GPU)
  %tmp_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %Layer1_Neurons_GPU_r, i32 2, i32 31)
  %tmp_3_cast = zext i30 %tmp_1 to i31
  %Layer1_Weights_GPU_r = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %Layer1_Weights_GPU)
  %tmp_2 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %Layer1_Weights_GPU_r, i32 2, i32 31)
  %tmp_4_cast = zext i30 %tmp_2 to i31
  %Layer2_Neurons_GPU_r = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %Layer2_Neurons_GPU)
  %tmp_3 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %Layer2_Neurons_GPU_r, i32 2, i32 31)
  %tmp_5_cast = zext i30 %tmp_3 to i31
  %arg_r_offset = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %r_offset)
  %arg_c_offset = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %c_offset)
  %gep_idx_i_i_cast = zext i30 %tmp_4 to i31
  %arg_bias_i_0_sum = add i31 %gep_idx_i_i_cast, %tmp_2_cast
  %arg_bias_i_0_sum_cas = zext i31 %arg_bias_i_0_sum to i32
  %gmem_addr = getelementptr i32 addrspace(1)* %gmem, i32 %arg_bias_i_0_sum_cas
  %tmp_7 = trunc i32 %arg_c_offset to i30
  %tmp_5 = mul i30 363, %tmp_4
  %tmp_6 = mul i30 3025, %tmp_4
  br label %for.header.i.i

for.header.i.i:                                   ; preds = %0, %._crit_edge.i.i
  %indvar_flatten = phi i11 [ 0, %0 ], [ %indvar_flatten_next, %._crit_edge.i.i ]
  %indvar57_reg2mem69 = phi i6 [ 0, %0 ], [ %indvar57_reg2mem69_0_3, %._crit_edge.i.i ]
  %indvar_reg2mem67_0_i = phi i6 [ 0, %0 ], [ %indvar_inc_reg2mem, %._crit_edge.i.i ]
  %tmp_8 = trunc i32 %arg_r_offset to i30
  %tmp_12 = zext i6 %indvar57_reg2mem69 to i30
  %exitcond_flatten = icmp eq i11 %indvar_flatten, -1024
  %indvar_flatten_next = add i11 1, %indvar_flatten
  br i1 %exitcond_flatten, label %__AESL_call_work_item_NA4.exit, label %for.body56.i.i

for.body56.i.i:                                   ; preds = %for.header.i.i
  %empty = call i32 (...)* @_ssdm_op_SpecLoopName([26 x i8]* @XCL_WG_DIM_Y_XCL_WG_s)
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1024, i64 1024, i64 1024)
  %tmp_s = icmp eq i6 %indvar_reg2mem67_0_i, -32
  %indvar_reg2mem67_0_i_1 = select i1 %tmp_s, i6 0, i6 %indvar_reg2mem67_0_i
  %indvar_inc58_reg2mem = add i6 1, %indvar57_reg2mem69
  %tmp_14 = zext i6 %indvar_inc58_reg2mem to i30
  %tmp_15 = trunc i32 %arg_r_offset to i30
  %tmp_16 = add i30 %tmp_15, %tmp_14
  %tmp_17 = add i30 %tmp_12, %tmp_8
  %tmp_9 = select i1 %tmp_s, i30 %tmp_16, i30 %tmp_17
  %tmp_1_mid2 = mul i30 2724, %tmp_9
  %tmp_39_mid2 = or i30 %tmp_1_mid2, 1
  %tmp_51_mid2 = or i30 %tmp_1_mid2, 2
  %tmp_28_mid2 = mul i30 55, %tmp_9
  %indvar57_reg2mem69_0_3 = select i1 %tmp_s, i6 %indvar_inc58_reg2mem, i6 %indvar57_reg2mem69
  %indvar_reg2mem67_0_i_2 = zext i6 %indvar_reg2mem67_0_i_1 to i32
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_X_str) nounwind
  %tmp_10 = zext i6 %indvar_reg2mem67_0_i_1 to i30
  %col_0_reg2mem_0_i_i = add i32 %arg_c_offset, %indvar_reg2mem67_0_i_2
  %tmp_24 = shl i32 %col_0_reg2mem_0_i_i, 4
  %tmp_45 = shl i32 %col_0_reg2mem_0_i_i, 2
  %p_reg2mem27_0_i_i = sub i32 %tmp_24, %tmp_45
  %tmp_46 = trunc i32 %p_reg2mem27_0_i_i to i30
  %tmp_28 = add i30 %tmp_46, %tmp_1_mid2
  %tmp_29 = add i30 %tmp_46, %tmp_39_mid2
  %tmp_31 = add i30 %tmp_46, %tmp_51_mid2
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %for.body56.i.i
  %i_0_reg2mem45_0_i_i = phi i4 [ 0, %for.body56.i.i ], [ %p_reg2mem5_0_i_i, %.loopexit.loopexit ]
  %product_0_reg2mem47_s = phi float [ 0.000000e+00, %for.body56.i.i ], [ %product_1_reg2mem43_s, %.loopexit.loopexit ]
  %phi_mul = phi i13 [ 0, %for.body56.i.i ], [ %next_mul, %.loopexit.loopexit ]
  %phi_mul2 = phi i7 [ 0, %for.body56.i.i ], [ %next_mul3, %.loopexit.loopexit ]
  %phi_mul_cast = zext i13 %phi_mul to i14
  %next_mul3 = add i7 %phi_mul2, 11
  %next_mul = add i13 %phi_mul, 681
  %exitcond5 = icmp eq i4 %i_0_reg2mem45_0_i_i, -5
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11)
  %p_reg2mem5_0_i_i = add i4 %i_0_reg2mem45_0_i_i, 1
  br i1 %exitcond5, label %._crit_edge.i.i, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.loopexit
  %tmp_33 = zext i7 %phi_mul2 to i30
  %tmp_38 = add i30 %tmp_33, %tmp_5
  br label %.preheader

.preheader:                                       ; preds = %1, %.preheader.preheader
  %j_0_reg2mem41_0_i_i = phi i4 [ %p_reg2mem7_0_i_i, %1 ], [ 0, %.preheader.preheader ]
  %product_1_reg2mem43_s = phi float [ %p_reg2mem9_0_i_i, %1 ], [ %product_0_reg2mem47_s, %.preheader.preheader ]
  %j_0_reg2mem41_0_i_i_s = zext i4 %j_0_reg2mem41_0_i_i to i8
  %j_0_reg2mem41_0_i_i_1 = zext i4 %j_0_reg2mem41_0_i_i to i5
  %j_0_reg2mem41_0_i_i_2 = zext i4 %j_0_reg2mem41_0_i_i to i7
  %exitcond = icmp eq i4 %j_0_reg2mem41_0_i_i, -5
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11)
  %p_reg2mem7_0_i_i = add i4 %j_0_reg2mem41_0_i_i, 1
  br i1 %exitcond, label %.loopexit.loopexit, label %1

; <label>:1                                       ; preds = %.preheader
  %p_shl2 = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %j_0_reg2mem41_0_i_i, i2 0)
  %p_shl2_cast = zext i6 %p_shl2 to i7
  %tmp_18 = sub i7 %p_shl2_cast, %j_0_reg2mem41_0_i_i_2
  %tmp_18_cast = sext i7 %tmp_18 to i14
  %tmp1 = add i14 %tmp_18_cast, %phi_mul_cast
  %tmp_32 = sext i14 %tmp1 to i30
  %tmp_21_cast = add i30 %tmp_28, %tmp_32
  %gep_idx20_i_i_cast = zext i30 %tmp_21_cast to i31
  %arg_Layer1_Neurons_G = add i31 %gep_idx20_i_i_cast, %tmp_3_cast
  %arg_Layer1_Neurons_G_1 = zext i31 %arg_Layer1_Neurons_G to i32
  %gmem_addr_2 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_G_1
  %gmem_load_1_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_2, i32 1)
  %gmem_addr_2_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_2)
  %tmp_22 = bitcast i32 %gmem_addr_2_read to float
  %tmp2 = add i7 %j_0_reg2mem41_0_i_i_2, %phi_mul2
  %tmp_37 = zext i7 %tmp2 to i30
  %tmp_24_cast = add i30 %tmp_5, %tmp_37
  %gep_idx28_i_i_cast = zext i30 %tmp_24_cast to i31
  %arg_Layer1_Weights_G = add i31 %gep_idx28_i_i_cast, %tmp_4_cast
  %arg_Layer1_Weights_G_1 = zext i31 %arg_Layer1_Weights_G to i32
  %gmem_addr_3 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_G_1
  %gmem_load_2_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_3, i32 1)
  %gmem_addr_3_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_3)
  %tmp_25 = bitcast i32 %gmem_addr_3_read to float
  %tmp_26 = fmul float %tmp_22, %tmp_25
  %tmp_29_cast = add i30 %tmp_29, %tmp_32
  %gep_idx36_i_i_cast = zext i30 %tmp_29_cast to i31
  %arg_Layer1_Neurons_G_2 = add i31 %gep_idx36_i_i_cast, %tmp_3_cast
  %arg_Layer1_Neurons_G_3 = zext i31 %arg_Layer1_Neurons_G_2 to i32
  %gmem_addr_4 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_G_3
  %gmem_load_3_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_4, i32 1)
  %gmem_addr_4_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_4)
  %tmp_30 = bitcast i32 %gmem_addr_4_read to float
  %tmp6 = add i8 %j_0_reg2mem41_0_i_i_s, 121
  %tmp_39 = zext i8 %tmp6 to i30
  %tmp_33_cast = add i30 %tmp_38, %tmp_39
  %gep_idx44_i_i_cast = zext i30 %tmp_33_cast to i31
  %arg_Layer1_Weights_G_2 = add i31 %gep_idx44_i_i_cast, %tmp_4_cast
  %arg_Layer1_Weights_G_3 = zext i31 %arg_Layer1_Weights_G_2 to i32
  %gmem_addr_5 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_G_3
  %gmem_load_4_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_5, i32 1)
  %gmem_addr_5_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_5)
  %tmp_34 = bitcast i32 %gmem_addr_5_read to float
  %tmp_35 = fmul float %tmp_30, %tmp_34
  %tmp_36 = fadd float %tmp_26, %tmp_35
  %tmp_39_cast = add i30 %tmp_31, %tmp_32
  %gep_idx52_i_i_cast = zext i30 %tmp_39_cast to i31
  %arg_Layer1_Neurons_G_4 = add i31 %gep_idx52_i_i_cast, %tmp_3_cast
  %arg_Layer1_Neurons_G_5 = zext i31 %arg_Layer1_Neurons_G_4 to i32
  %gmem_addr_6 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_G_5
  %gmem_load_5_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_6, i32 1)
  %gmem_addr_6_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_6)
  %tmp_40 = bitcast i32 %gmem_addr_6_read to float
  %tmp10 = add i5 %j_0_reg2mem41_0_i_i_1, -14
  %tmp10_cast = sext i5 %tmp10 to i8
  %tmp_41 = zext i8 %tmp10_cast to i30
  %tmp_43_cast = add i30 %tmp_38, %tmp_41
  %gep_idx60_i_i_cast = zext i30 %tmp_43_cast to i31
  %arg_Layer1_Weights_G_4 = add i31 %gep_idx60_i_i_cast, %tmp_4_cast
  %arg_Layer1_Weights_G_5 = zext i31 %arg_Layer1_Weights_G_4 to i32
  %gmem_addr_7 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_G_5
  %gmem_load_6_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_7, i32 1)
  %gmem_addr_7_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_7)
  %tmp_42 = bitcast i32 %gmem_addr_7_read to float
  %tmp_43 = fmul float %tmp_40, %tmp_42
  %tmp_44 = fadd float %tmp_36, %tmp_43
  %p_reg2mem9_0_i_i = fadd float %product_1_reg2mem43_s, %tmp_44
  br label %.preheader

._crit_edge.i.i:                                  ; preds = %.loopexit
  %gmem_load_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr, i32 1)
  %gmem_addr_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr)
  %tmp_11 = bitcast i32 %gmem_addr_read to float
  %p_reg2mem_0_i_i = fadd float %product_0_reg2mem47_s, %tmp_11
  %p_reg2mem_0_i_i_to_in = bitcast float %p_reg2mem_0_i_i to i32
  %tmp_13 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %p_reg2mem_0_i_i_to_in, i32 23, i32 30)
  %tmp_47 = trunc i32 %p_reg2mem_0_i_i_to_in to i23
  %notlhs = icmp ne i8 %tmp_13, -1
  %notrhs = icmp eq i23 %tmp_47, 0
  %tmp_19 = or i1 %notrhs, %notlhs
  %tmp_20 = fcmp olt float %p_reg2mem_0_i_i, 0.000000e+00
  %tmp_21 = and i1 %tmp_19, %tmp_20
  %tmp_23 = add i30 %tmp_10, %tmp_7
  %tmp_27 = add i30 %tmp_6, %tmp_23
  %tmp_14_cast = add i30 %tmp_27, %tmp_28_mid2
  %gep_idx12_i_i_cast = zext i30 %tmp_14_cast to i31
  %arg_Layer2_Neurons_G = add i31 %tmp_5_cast, %gep_idx12_i_i_cast
  %arg_Layer2_Neurons_G_1 = zext i31 %arg_Layer2_Neurons_G to i32
  %gmem_addr_1 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer2_Neurons_G_1
  %val_i_i = select i1 %tmp_21, i32 0, i32 %p_reg2mem_0_i_i_to_in
  %gmem_addr_1_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_1, i32 1)
  call void @_ssdm_op_Write.m_axi.i32P(i32 addrspace(1)* %gmem_addr_1, i32 %val_i_i, i4 -1)
  %gmem_addr_1_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32 addrspace(1)* %gmem_addr_1)
  %indvar_inc_reg2mem = add i6 1, %indvar_reg2mem67_0_i_1
  br label %for.header.i.i

__AESL_call_work_item_NA4.exit:                   ; preds = %for.header.i.i
  ret void
}

define weak i1 @_ssdm_op_WriteResp.m_axi.i32P(i32 addrspace(1)*) {
entry:
  ret i1 true
}

define weak i1 @_ssdm_op_WriteReq.m_axi.i32P(i32 addrspace(1)*, i32) {
entry:
  ret i1 true
}

define weak void @_ssdm_op_Write.m_axi.i32P(i32 addrspace(1)*, i32, i4) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecLoopName(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)*, i32) {
entry:
  ret i1 true
}

define weak i32 @_ssdm_op_Read.s_axilite.i32P(i32*) {
entry:
  %empty = load i32* %0
  ret i32 %empty
}

define weak i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)*) {
entry:
  %empty = load i32 addrspace(1)* %0
  ret i32 %empty
}

define weak i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_8 = trunc i32 %empty to i8
  ret i8 %empty_8
}

define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_9 = trunc i32 %empty to i30
  ret i30 %empty_9
}

declare i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i23 @_ssdm_op_PartSelect.i23.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4, i2) nounwind readnone {
entry:
  %empty = zext i4 %0 to i6
  %empty_10 = zext i2 %1 to i6
  %empty_11 = shl i6 %empty, 2
  %empty_12 = or i6 %empty_11, %empty_10
  ret i6 %empty_12
}

declare i32 @_ssdm_op_BitConcatenate.i32.i30.i2(i30, i2) nounwind readnone

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
