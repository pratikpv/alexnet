; ModuleID = 'C:/Users/RA_prof_Jeon/siddharth/HLS/layer1_con_p3/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-linux-gnu"

@executeFirstLayer1_p = internal unnamed_addr constant [22 x i8] c"executeFirstLayer1_p3\00"
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

define void @executeFirstLayer1_p3(i32 addrspace(1)* %gmem, i32* %group_id_x, i32* %group_id_y, i32* %group_id_z, i32* %bias, i32* %Layer1_Neurons_GPU, i32* %Layer1_Weights_GPU, i32* %Layer2_Neurons_GPU) {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 addrspace(1)* %gmem), !map !26
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id_x), !map !30
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id_y), !map !34
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %group_id_z), !map !38
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %bias), !map !42
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer1_Neurons_GPU), !map !46
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer1_Weights_GPU), !map !50
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %Layer2_Neurons_GPU), !map !54
  call void (...)* @_ssdm_op_SpecTopModule([22 x i8]* @executeFirstLayer1_p)
  call void (...)* @_ssdm_op_SpecInterface(i32 addrspace(1)* %gmem, [6 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 128, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %group_id_x, i32* %group_id_y, i32* %group_id_z, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [8 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [8 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %bias, i32* %Layer1_Neurons_GPU, i32* %Layer1_Weights_GPU, i32* %Layer2_Neurons_GPU, [10 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [8 x i8]* @p_str3, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %group_id_x_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %group_id_x)
  %tmp_6 = trunc i32 %group_id_x_read to i30
  %bias_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %bias)
  %tmp_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %bias_read, i32 2, i32 31)
  %tmp_2_cast = zext i30 %tmp_1 to i31
  %Layer1_Neurons_GPU_r = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %Layer1_Neurons_GPU)
  %tmp_2 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %Layer1_Neurons_GPU_r, i32 2, i32 31)
  %tmp_3_cast = zext i30 %tmp_2 to i31
  %Layer1_Weights_GPU_r = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %Layer1_Weights_GPU)
  %tmp_3 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %Layer1_Weights_GPU_r, i32 2, i32 31)
  %tmp_4_cast = zext i30 %tmp_3 to i31
  %Layer2_Neurons_GPU_r = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %Layer2_Neurons_GPU)
  %tmp_4 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %Layer2_Neurons_GPU_r, i32 2, i32 31)
  %tmp_5_cast = zext i30 %tmp_4 to i31
  %gep_idx_i_i_cast = zext i30 %tmp_6 to i31
  %arg_bias_i_0_sum = add i31 %gep_idx_i_i_cast, %tmp_2_cast
  %arg_bias_i_0_sum_cas = zext i31 %arg_bias_i_0_sum to i32
  %gmem_addr = getelementptr i32 addrspace(1)* %gmem, i32 %arg_bias_i_0_sum_cas
  %tmp_s = mul i30 363, %tmp_6
  %tmp_5 = mul i30 3025, %tmp_6
  br label %for.header.i.i

for.header.i.i:                                   ; preds = %0, %._crit_edge.i.i
  %indvar_flatten = phi i10 [ 0, %0 ], [ %indvar_flatten_next, %._crit_edge.i.i ]
  %indvar59_reg2mem71 = phi i6 [ 0, %0 ], [ %indvar59_reg2mem71_0_1, %._crit_edge.i.i ]
  %indvar_reg2mem69_0_i = phi i5 [ 0, %0 ], [ %indvar_inc_reg2mem, %._crit_edge.i.i ]
  %exitcond_flatten = icmp eq i10 %indvar_flatten, -288
  %indvar_flatten_next = add i10 %indvar_flatten, 1
  br i1 %exitcond_flatten, label %__AESL_call_work_item_NA4.exit, label %for.body58.i.i

for.body58.i.i:                                   ; preds = %for.header.i.i
  %empty = call i32 (...)* @_ssdm_op_SpecLoopName([26 x i8]* @XCL_WG_DIM_Y_XCL_WG_s)
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 736, i64 736, i64 736)
  %tmp_9 = icmp eq i5 %indvar_reg2mem69_0_i, -9
  %indvar_reg2mem69_0_i_1 = select i1 %tmp_9, i5 0, i5 %indvar_reg2mem69_0_i
  %row_0_reg2mem_0_i_i_s = add i6 %indvar59_reg2mem71, -31
  %row_0_reg2mem_0_i_i5 = xor i6 %indvar59_reg2mem71, -32
  %p_reg2mem31_0_i_i_mid = select i1 %tmp_9, i6 %row_0_reg2mem_0_i_i_s, i6 %row_0_reg2mem_0_i_i5
  %p_reg2mem31_0_i_i_mid_1 = zext i6 %p_reg2mem31_0_i_i_mid to i18
  %p_reg2mem31_0_i_i_mid_2 = mul i18 %p_reg2mem31_0_i_i_mid_1, 2724
  %tmp_cast_mid2_v = or i18 %p_reg2mem31_0_i_i_mid_2, 1
  %tmp_cast_mid2 = zext i18 %tmp_cast_mid2_v to i20
  %tmp_1_cast_mid2_v = or i18 %p_reg2mem31_0_i_i_mid_2, 2
  %tmp_1_cast_mid2 = zext i18 %tmp_1_cast_mid2_v to i20
  %tmp_28_mid2_v_v = zext i6 %p_reg2mem31_0_i_i_mid to i13
  %tmp_28_mid2_v = mul i13 %tmp_28_mid2_v_v, 55
  %tmp_28_mid2 = zext i13 %tmp_28_mid2_v to i30
  %indvar_inc60_reg2mem = add i6 %indvar59_reg2mem71, 1
  %indvar59_reg2mem71_0_1 = select i1 %tmp_9, i6 %indvar_inc60_reg2mem, i6 %indvar59_reg2mem71
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_X_str) nounwind
  %p_shl = call i9 @_ssdm_op_BitConcatenate.i9.i5.i4(i5 %indvar_reg2mem69_0_i_1, i4 0)
  %p_shl_cast = zext i9 %p_shl to i10
  %p_shl1 = call i7 @_ssdm_op_BitConcatenate.i7.i5.i2(i5 %indvar_reg2mem69_0_i_1, i2 0)
  %p_shl1_cast = zext i7 %p_shl1 to i10
  %p_reg2mem27_0_i_i = sub i10 %p_shl_cast, %p_shl1_cast
  %p_reg2mem27_0_i_i_cas = sext i10 %p_reg2mem27_0_i_i to i20
  %p_reg2mem27_0_i_i_cas_1 = sext i10 %p_reg2mem27_0_i_i to i18
  %tmp = add i18 %p_reg2mem27_0_i_i_cas_1, %p_reg2mem31_0_i_i_mid_2
  %tmp3 = add i20 %p_reg2mem27_0_i_i_cas, %tmp_cast_mid2
  %tmp7 = add i20 %p_reg2mem27_0_i_i_cas, %tmp_1_cast_mid2
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %for.body58.i.i
  %i_0_reg2mem47_0_i_i = phi i4 [ 0, %for.body58.i.i ], [ %p_reg2mem5_0_i_i, %.loopexit.loopexit ]
  %product_0_reg2mem49_s = phi float [ 0.000000e+00, %for.body58.i.i ], [ %product_1_reg2mem45_s, %.loopexit.loopexit ]
  %phi_mul = phi i13 [ 0, %for.body58.i.i ], [ %next_mul, %.loopexit.loopexit ]
  %phi_mul2 = phi i7 [ 0, %for.body58.i.i ], [ %next_mul3, %.loopexit.loopexit ]
  %phi_mul_cast = zext i13 %phi_mul to i14
  %next_mul3 = add i7 %phi_mul2, 11
  %next_mul = add i13 %phi_mul, 681
  %exitcond5 = icmp eq i4 %i_0_reg2mem47_0_i_i, -5
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11)
  %p_reg2mem5_0_i_i = add i4 %i_0_reg2mem47_0_i_i, 1
  br i1 %exitcond5, label %._crit_edge.i.i, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.loopexit
  %tmp_16 = zext i7 %phi_mul2 to i30
  %tmp_17 = add i30 %tmp_16, %tmp_s
  br label %.preheader

.preheader:                                       ; preds = %1, %.preheader.preheader
  %j_0_reg2mem43_0_i_i = phi i4 [ %p_reg2mem7_0_i_i, %1 ], [ 0, %.preheader.preheader ]
  %product_1_reg2mem45_s = phi float [ %p_reg2mem9_0_i_i, %1 ], [ %product_0_reg2mem49_s, %.preheader.preheader ]
  %j_0_reg2mem43_0_i_i_s = zext i4 %j_0_reg2mem43_0_i_i to i8
  %j_0_reg2mem43_0_i_i_1 = zext i4 %j_0_reg2mem43_0_i_i to i5
  %j_0_reg2mem43_0_i_i_2 = zext i4 %j_0_reg2mem43_0_i_i to i7
  %exitcond = icmp eq i4 %j_0_reg2mem43_0_i_i, -5
  %empty_7 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11)
  %p_reg2mem7_0_i_i = add i4 %j_0_reg2mem43_0_i_i, 1
  br i1 %exitcond, label %.loopexit.loopexit, label %1

; <label>:1                                       ; preds = %.preheader
  %p_shl2 = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %j_0_reg2mem43_0_i_i, i2 0)
  %p_shl2_cast = zext i6 %p_shl2 to i7
  %tmp_18 = sub i7 %p_shl2_cast, %j_0_reg2mem43_0_i_i_2
  %tmp_18_cast = sext i7 %tmp_18 to i14
  %tmp1 = add i14 %tmp_18_cast, %phi_mul_cast
  %tmp1_cast = sext i14 %tmp1 to i18
  %tmp_19 = add i18 %tmp, %tmp1_cast
  %gep_idx20_i_i_cast = zext i18 %tmp_19 to i31
  %arg_Layer1_Neurons_G = add i31 %gep_idx20_i_i_cast, %tmp_3_cast
  %arg_Layer1_Neurons_G_1 = zext i31 %arg_Layer1_Neurons_G to i32
  %gmem_addr_2 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_G_1
  %gmem_load_1_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_2, i32 1)
  %gmem_addr_2_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_2)
  %tmp_20 = bitcast i32 %gmem_addr_2_read to float
  %tmp2 = add i7 %j_0_reg2mem43_0_i_i_2, %phi_mul2
  %tmp_21 = zext i7 %tmp2 to i30
  %tmp_24_cast = add i30 %tmp_s, %tmp_21
  %gep_idx28_i_i_cast = zext i30 %tmp_24_cast to i31
  %arg_Layer1_Weights_G = add i31 %gep_idx28_i_i_cast, %tmp_4_cast
  %arg_Layer1_Weights_G_1 = zext i31 %arg_Layer1_Weights_G to i32
  %gmem_addr_3 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_G_1
  %gmem_load_2_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_3, i32 1)
  %gmem_addr_3_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_3)
  %tmp_22 = bitcast i32 %gmem_addr_3_read to float
  %tmp_23 = fmul float %tmp_20, %tmp_22
  %tmp4_cast = sext i14 %tmp1 to i20
  %tmp_24 = add i20 %tmp3, %tmp4_cast
  %gep_idx36_i_i_cast1 = sext i20 %tmp_24 to i30
  %gep_idx36_i_i_cast = zext i30 %gep_idx36_i_i_cast1 to i31
  %arg_Layer1_Neurons_G_2 = add i31 %gep_idx36_i_i_cast, %tmp_3_cast
  %arg_Layer1_Neurons_G_3 = zext i31 %arg_Layer1_Neurons_G_2 to i32
  %gmem_addr_4 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_G_3
  %gmem_load_3_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_4, i32 1)
  %gmem_addr_4_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_4)
  %tmp_25 = bitcast i32 %gmem_addr_4_read to float
  %tmp6 = add i8 %j_0_reg2mem43_0_i_i_s, 121
  %tmp_26 = zext i8 %tmp6 to i30
  %tmp_33_cast = add i30 %tmp_17, %tmp_26
  %gep_idx44_i_i_cast = zext i30 %tmp_33_cast to i31
  %arg_Layer1_Weights_G_2 = add i31 %gep_idx44_i_i_cast, %tmp_4_cast
  %arg_Layer1_Weights_G_3 = zext i31 %arg_Layer1_Weights_G_2 to i32
  %gmem_addr_5 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_G_3
  %gmem_load_4_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_5, i32 1)
  %gmem_addr_5_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_5)
  %tmp_27 = bitcast i32 %gmem_addr_5_read to float
  %tmp_28 = fmul float %tmp_25, %tmp_27
  %tmp_29 = fadd float %tmp_23, %tmp_28
  %tmp_30 = add i20 %tmp7, %tmp4_cast
  %gep_idx52_i_i_cast1 = sext i20 %tmp_30 to i30
  %gep_idx52_i_i_cast = zext i30 %gep_idx52_i_i_cast1 to i31
  %arg_Layer1_Neurons_G_4 = add i31 %gep_idx52_i_i_cast, %tmp_3_cast
  %arg_Layer1_Neurons_G_5 = zext i31 %arg_Layer1_Neurons_G_4 to i32
  %gmem_addr_6 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Neurons_G_5
  %gmem_load_5_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_6, i32 1)
  %gmem_addr_6_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_6)
  %tmp_31 = bitcast i32 %gmem_addr_6_read to float
  %tmp5 = add i5 %j_0_reg2mem43_0_i_i_1, -14
  %tmp10_cast = sext i5 %tmp5 to i8
  %tmp_32 = zext i8 %tmp10_cast to i30
  %tmp_43_cast = add i30 %tmp_17, %tmp_32
  %gep_idx60_i_i_cast = zext i30 %tmp_43_cast to i31
  %arg_Layer1_Weights_G_4 = add i31 %gep_idx60_i_i_cast, %tmp_4_cast
  %arg_Layer1_Weights_G_5 = zext i31 %arg_Layer1_Weights_G_4 to i32
  %gmem_addr_7 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer1_Weights_G_5
  %gmem_load_6_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_7, i32 1)
  %gmem_addr_7_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr_7)
  %tmp_33 = bitcast i32 %gmem_addr_7_read to float
  %tmp_34 = fmul float %tmp_31, %tmp_33
  %tmp_35 = fadd float %tmp_29, %tmp_34
  %p_reg2mem9_0_i_i = fadd float %product_1_reg2mem45_s, %tmp_35
  br label %.preheader

._crit_edge.i.i:                                  ; preds = %.loopexit
  %gmem_load_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr, i32 1)
  %gmem_addr_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32 addrspace(1)* %gmem_addr)
  %tmp_7 = bitcast i32 %gmem_addr_read to float
  %p_reg2mem_0_i_i = fadd float %product_0_reg2mem49_s, %tmp_7
  %p_reg2mem_0_i_i_to_in = bitcast float %p_reg2mem_0_i_i to i32
  %tmp_8 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %p_reg2mem_0_i_i_to_in, i32 23, i32 30)
  %tmp_15 = trunc i32 %p_reg2mem_0_i_i_to_in to i23
  %notlhs = icmp ne i8 %tmp_8, -1
  %notrhs = icmp eq i23 %tmp_15, 0
  %tmp_10 = or i1 %notrhs, %notlhs
  %tmp_11 = fcmp olt float %p_reg2mem_0_i_i, 0.000000e+00
  %tmp_12 = and i1 %tmp_10, %tmp_11
  %tmp_13 = zext i5 %indvar_reg2mem69_0_i_1 to i30
  %tmp_14 = add i30 %tmp_5, %tmp_13
  %tmp_14_cast = add i30 %tmp_14, %tmp_28_mid2
  %gep_idx12_i_i_cast = zext i30 %tmp_14_cast to i31
  %arg_Layer2_Neurons_G = add i31 %gep_idx12_i_i_cast, %tmp_5_cast
  %arg_Layer2_Neurons_G_1 = zext i31 %arg_Layer2_Neurons_G to i32
  %gmem_addr_1 = getelementptr i32 addrspace(1)* %gmem, i32 %arg_Layer2_Neurons_G_1
  %val_i_i = select i1 %tmp_12, i32 0, i32 %p_reg2mem_0_i_i_to_in
  %gmem_addr_1_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32 addrspace(1)* %gmem_addr_1, i32 1)
  call void @_ssdm_op_Write.m_axi.i32P(i32 addrspace(1)* %gmem_addr_1, i32 %val_i_i, i4 -1)
  %gmem_addr_1_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32 addrspace(1)* %gmem_addr_1)
  %indvar_inc_reg2mem = add i5 1, %indvar_reg2mem69_0_i_1
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

declare i23 @_ssdm_op_PartSelect.i23.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i9 @_ssdm_op_BitConcatenate.i9.i5.i4(i5, i4) nounwind readnone {
entry:
  %empty = zext i5 %0 to i9
  %empty_10 = zext i4 %1 to i9
  %empty_11 = shl i9 %empty, 4
  %empty_12 = or i9 %empty_11, %empty_10
  ret i9 %empty_12
}

define weak i7 @_ssdm_op_BitConcatenate.i7.i5.i2(i5, i2) nounwind readnone {
entry:
  %empty = zext i5 %0 to i7
  %empty_13 = zext i2 %1 to i7
  %empty_14 = shl i7 %empty, 2
  %empty_15 = or i7 %empty_14, %empty_13
  ret i7 %empty_15
}

define weak i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4, i2) nounwind readnone {
entry:
  %empty = zext i4 %0 to i6
  %empty_16 = zext i2 %1 to i6
  %empty_17 = shl i6 %empty, 2
  %empty_18 = or i6 %empty_17, %empty_16
  ret i6 %empty_18
}

!hls.encrypted.func = !{}
!xcl.libspir = !{!0}
!xcl.reqd_rt_info = !{!1}
!xcl.portmap = !{!2, !4, !5, !6}
!axi4.master.portmap = !{!7}
!xcl.portlist = !{!3, !8}
!xcl.lmem_info = !{}
!xcl.progvar_info = !{}
!llvm.map.gv = !{!9, !16, !21}

!0 = metadata !{metadata !"C:/Xilinx/Vivado_HLS/2016.4/win64/lib/libspir-hls.a"}
!1 = metadata !{metadata !"executeFirstLayer1_p3", metadata !"group_id"}
!2 = metadata !{metadata !"executeFirstLayer1_p3", i32 0, metadata !3}
!3 = metadata !{metadata !"executeFirstLayer1_p3", metadata !"gmem", metadata !"addressable", metadata !"master", i32 32}
!4 = metadata !{metadata !"executeFirstLayer1_p3", i32 1, metadata !3}
!5 = metadata !{metadata !"executeFirstLayer1_p3", i32 2, metadata !3}
!6 = metadata !{metadata !"executeFirstLayer1_p3", i32 3, metadata !3}
!7 = metadata !{metadata !"gmem", metadata !"bias", metadata !"", metadata !"Layer1_Neurons_GPU", metadata !"", metadata !"Layer1_Weights_GPU", metadata !"", metadata !"Layer2_Neurons_GPU", metadata !""}
!8 = metadata !{metadata !"executeFirstLayer1_p3", metadata !"control", metadata !"addressable", metadata !"slave", i32 32}
!9 = metadata !{metadata !10, i8** @p_spir_rt_info_9}
!10 = metadata !{metadata !11}
!11 = metadata !{i32 0, i32 7, metadata !12}
!12 = metadata !{metadata !13}
!13 = metadata !{metadata !"__spir_rt_info.9", metadata !14, metadata !"", i32 0, i32 7}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 0, i32 0, i32 1}
!16 = metadata !{metadata !17, i64** @p_spir_rt_info_12}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 63, metadata !19}
!19 = metadata !{metadata !20}
!20 = metadata !{metadata !"__spir_rt_info.12", metadata !14, metadata !"", i32 0, i32 63}
!21 = metadata !{metadata !22, i32** @p_spir_rt_info_0}
!22 = metadata !{metadata !23}
!23 = metadata !{i32 0, i32 31, metadata !24}
!24 = metadata !{metadata !25}
!25 = metadata !{metadata !"__spir_rt_info.0", metadata !14, metadata !"", i32 0, i32 31}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 0, i32 31, metadata !28}
!28 = metadata !{metadata !29}
!29 = metadata !{metadata !"gmem", metadata !14, metadata !"", i32 0, i32 31}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 31, metadata !32}
!32 = metadata !{metadata !33}
!33 = metadata !{metadata !"group_id.x", metadata !14, metadata !"", i32 0, i32 31}
!34 = metadata !{metadata !35}
!35 = metadata !{i32 0, i32 31, metadata !36}
!36 = metadata !{metadata !37}
!37 = metadata !{metadata !"group_id.y", metadata !14, metadata !"", i32 0, i32 31}
!38 = metadata !{metadata !39}
!39 = metadata !{i32 0, i32 31, metadata !40}
!40 = metadata !{metadata !41}
!41 = metadata !{metadata !"group_id.z", metadata !14, metadata !"", i32 0, i32 31}
!42 = metadata !{metadata !43}
!43 = metadata !{i32 0, i32 31, metadata !44}
!44 = metadata !{metadata !45}
!45 = metadata !{metadata !"bias", metadata !14, metadata !"", i32 0, i32 31}
!46 = metadata !{metadata !47}
!47 = metadata !{i32 0, i32 31, metadata !48}
!48 = metadata !{metadata !49}
!49 = metadata !{metadata !"Layer1_Neurons_GPU", metadata !14, metadata !"", i32 0, i32 31}
!50 = metadata !{metadata !51}
!51 = metadata !{i32 0, i32 31, metadata !52}
!52 = metadata !{metadata !53}
!53 = metadata !{metadata !"Layer1_Weights_GPU", metadata !14, metadata !"", i32 0, i32 31}
!54 = metadata !{metadata !55}
!55 = metadata !{i32 0, i32 31, metadata !56}
!56 = metadata !{metadata !57}
!57 = metadata !{metadata !"Layer2_Neurons_GPU", metadata !14, metadata !"", i32 0, i32 31}
