; ModuleID = 'C:/Users/RA_prof_Jeon/siddharth/HLS/Alexnet_dev/solution1/.autopilot/db/a.cl.0.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-linux-gnu"

%struct.__spir_rt_info_tT = type { i32, [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], i8*, i8, i8*, i8*, i64 }
%struct.__spir_rt_info_tT.1 = type { i32, [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], i8*, i1, i8*, i8*, i64 }
%struct.three_tuple_t = type { i32, i32, i32 }
%struct.executeFirstLayer_args_t = type { i32, i32, i32, i32, i32, i32 }

@__spir_rt_info = global %struct.__spir_rt_info_tT* null, align 4 ; [#uses=0 type=%struct.__spir_rt_info_tT**]
@XCL_WG_DIM_X.str = internal unnamed_addr constant [13 x i8] c"XCL_WG_DIM_X\00" ; [#uses=1 type=[13 x i8]*]
@str = internal constant [1 x i8] zeroinitializer ; [#uses=1 type=[1 x i8]*]
@XCL_WG_DIM_Y.str = internal unnamed_addr constant [13 x i8] c"XCL_WG_DIM_Y\00" ; [#uses=1 type=[13 x i8]*]
@.str = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=1 type=[6 x i8]*]
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str2 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1 ; [#uses=1 type=[10 x i8]*]
@.str3 = private unnamed_addr constant [8 x i8] c"control\00", align 1 ; [#uses=1 type=[8 x i8]*]
@rt_info = internal global %struct.__spir_rt_info_tT.1 zeroinitializer, align 8 ; [#uses=35 type=%struct.__spir_rt_info_tT.1*]
@.str4 = private unnamed_addr constant [12 x i8] c"member_name\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str5 = private unnamed_addr constant [5 x i8] c"bias\00", align 1 ; [#uses=1 type=[5 x i8]*]
@.str6 = private unnamed_addr constant [19 x i8] c"Layer1_Neurons_GPU\00", align 1 ; [#uses=1 type=[19 x i8]*]
@.str7 = private unnamed_addr constant [19 x i8] c"Layer1_Weights_GPU\00", align 1 ; [#uses=1 type=[19 x i8]*]
@.str8 = private unnamed_addr constant [19 x i8] c"Layer2_Neurons_GPU\00", align 1 ; [#uses=1 type=[19 x i8]*]
@.str9 = private unnamed_addr constant [9 x i8] c"r_offset\00", align 1 ; [#uses=1 type=[9 x i8]*]
@.str10 = private unnamed_addr constant [9 x i8] c"c_offset\00", align 1 ; [#uses=1 type=[9 x i8]*]
@.str11 = private unnamed_addr constant [11 x i8] c"group_id.x\00", align 1 ; [#uses=1 type=[11 x i8]*]
@.str12 = private unnamed_addr constant [11 x i8] c"group_id.y\00", align 1 ; [#uses=1 type=[11 x i8]*]
@.str13 = private unnamed_addr constant [11 x i8] c"group_id.z\00", align 1 ; [#uses=1 type=[11 x i8]*]

; [#uses=0]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=2]
declare i32 @_ssdm_op_SpecLoopName(...)

; [#uses=1]
declare i32 @_ssdm_SpecLoopFlatten(...)

; [#uses=4]
declare  void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=1]
declare  void @_ssdm_InlineRegion(...) nounwind

; [#uses=9]
declare  void @_ssdm_op_SpecExt(...) nounwind

; [#uses=0]
define  void @executeFirstLayer(i32 addrspace(1)* %gmem, %struct.three_tuple_t* %group_id, %struct.executeFirstLayer_args_t* %args) {
  %tid71.i.i = alloca [3 x i32], align 4          ; [#uses=7 type=[3 x i32]*]
  %.cast.i = alloca %struct.__spir_rt_info_tT     ; [#uses=16 type=%struct.__spir_rt_info_tT*]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !101), !dbg !102 ; [debug line = 65:84] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !{%struct.three_tuple_t* %group_id}, i64 0, metadata !103), !dbg !104 ; [debug line = 65:105] [debug variable = group_id]
  call void @llvm.dbg.value(metadata !{%struct.executeFirstLayer_args_t* %args}, i64 0, metadata !105), !dbg !106 ; [debug line = 65:141] [debug variable = args]
  call void @llvm.dbg.value(metadata !{%struct.three_tuple_t* %group_id}, i64 0, metadata !107), !dbg !108 ; [debug line = 30:44@71:1] [debug variable = group_id]
  %1 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 0, !dbg !111 ; [#uses=1 type=i32*] [debug line = 31:5@71:1]
  call  void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str11, i32 0, i32 0), i32* %1) nounwind, !dbg !111 ; [debug line = 31:5@71:1]
  %2 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 1, !dbg !113 ; [#uses=1 type=i32*] [debug line = 32:5@71:1]
  call  void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str12, i32 0, i32 0), i32* %2) nounwind, !dbg !113 ; [debug line = 32:5@71:1]
  %3 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 2, !dbg !114 ; [#uses=1 type=i32*] [debug line = 33:5@71:1]
  call  void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str13, i32 0, i32 0), i32* %3) nounwind, !dbg !114 ; [debug line = 33:5@71:1]
  call void @llvm.dbg.value(metadata !{%struct.executeFirstLayer_args_t* %args}, i64 0, metadata !115), !dbg !116 ; [debug line = 36:51@72:1] [debug variable = args]
  %4 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 0, !dbg !118 ; [#uses=1 type=i32*] [debug line = 37:5@72:1]
  call  void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str5, i32 0, i32 0), i32* %4) nounwind, !dbg !118 ; [debug line = 37:5@72:1]
  %5 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 1, !dbg !120 ; [#uses=1 type=i32*] [debug line = 38:5@72:1]
  call  void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i32* %5) nounwind, !dbg !120 ; [debug line = 38:5@72:1]
  %6 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 2, !dbg !121 ; [#uses=1 type=i32*] [debug line = 39:5@72:1]
  call  void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @.str7, i32 0, i32 0), i32* %6) nounwind, !dbg !121 ; [debug line = 39:5@72:1]
  %7 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 3, !dbg !122 ; [#uses=1 type=i32*] [debug line = 40:5@72:1]
  call  void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @.str8, i32 0, i32 0), i32* %7) nounwind, !dbg !122 ; [debug line = 40:5@72:1]
  %8 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 4, !dbg !123 ; [#uses=1 type=i32*] [debug line = 41:5@72:1]
  call  void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0), i32* %8) nounwind, !dbg !123 ; [debug line = 41:5@72:1]
  %9 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 5, !dbg !124 ; [#uses=1 type=i32*] [debug line = 42:5@72:1]
  call  void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0), i32* %9) nounwind, !dbg !124 ; [debug line = 42:5@72:1]
  call  void (...)* @_ssdm_op_SpecInterface(i32 addrspace(1)* %gmem, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 128, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !125 ; [debug line = 73:1]
  call  void (...)* @_ssdm_op_SpecInterface(%struct.three_tuple_t* %group_id, i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !126 ; [debug line = 74:1]
  call  void (...)* @_ssdm_op_SpecInterface(i32 0, i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !127 ; [debug line = 75:1]
  call  void (...)* @_ssdm_op_SpecInterface(%struct.executeFirstLayer_args_t* %args, i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !128 ; [debug line = 76:1]
  call  void (...)* @_ssdm_InlineRegion(i32 1, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !129 ; [debug line = 46:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 0), align 4, !dbg !131 ; [debug line = 54:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 1, i32 0), align 4, !dbg !132 ; [debug line = 63:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 1, i32 1), align 4, !dbg !133 ; [debug line = 64:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 1, i32 2), align 4, !dbg !134 ; [debug line = 65:3]
  store i32 32, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 3, i32 0), align 4, !dbg !135 ; [debug line = 70:3]
  store i32 32, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 3, i32 1), align 4, !dbg !136 ; [debug line = 79:3]
  store i32 1, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 3, i32 2), align 4, !dbg !137 ; [debug line = 88:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 4, i32 0), align 4, !dbg !138 ; [debug line = 103:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 4, i32 1), align 4, !dbg !139 ; [debug line = 104:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 4, i32 2), align 4, !dbg !140 ; [debug line = 105:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 5, i32 0), align 4, !dbg !141 ; [debug line = 114:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 5, i32 1), align 4, !dbg !142 ; [debug line = 115:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 5, i32 2), align 4, !dbg !143 ; [debug line = 116:3]
  %10 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 0, !dbg !144 ; [#uses=1 type=i32*] [debug line = 121:3]
  %11 = load i32* %10, align 4, !dbg !144         ; [#uses=1 type=i32] [debug line = 121:3]
  store i32 %11, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 6, i32 0), align 4, !dbg !144 ; [debug line = 121:3]
  %12 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 1, !dbg !145 ; [#uses=1 type=i32*] [debug line = 122:3]
  %13 = load i32* %12, align 4, !dbg !145         ; [#uses=1 type=i32] [debug line = 122:3]
  store i32 %13, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 6, i32 1), align 4, !dbg !145 ; [debug line = 122:3]
  %14 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 2, !dbg !146 ; [#uses=1 type=i32*] [debug line = 123:3]
  %15 = load i32* %14, align 4, !dbg !146         ; [#uses=1 type=i32] [debug line = 123:3]
  store i32 %15, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 6, i32 2), align 4, !dbg !146 ; [debug line = 123:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 7, i32 0), align 4, !dbg !147 ; [debug line = 136:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 7, i32 1), align 4, !dbg !148 ; [debug line = 137:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 7, i32 2), align 4, !dbg !149 ; [debug line = 138:3]
  %16 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 6, i32 0), align 4, !dbg !150 ; [#uses=1 type=i32] [debug line = 147:3]
  %17 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 3, i32 0), align 4, !dbg !150 ; [#uses=1 type=i32] [debug line = 147:3]
  %18 = mul i32 %16, %17, !dbg !150               ; [#uses=1 type=i32] [debug line = 147:3]
  %19 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 7, i32 0), align 4, !dbg !150 ; [#uses=1 type=i32] [debug line = 147:3]
  %20 = add i32 %18, %19, !dbg !150               ; [#uses=1 type=i32] [debug line = 147:3]
  store i32 %20, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 2, i32 0), align 4, !dbg !150 ; [debug line = 147:3]
  %21 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 6, i32 1), align 4, !dbg !151 ; [#uses=1 type=i32] [debug line = 148:3]
  %22 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 3, i32 1), align 4, !dbg !151 ; [#uses=1 type=i32] [debug line = 148:3]
  %23 = mul i32 %21, %22, !dbg !151               ; [#uses=1 type=i32] [debug line = 148:3]
  %24 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 7, i32 1), align 4, !dbg !151 ; [#uses=1 type=i32] [debug line = 148:3]
  %25 = add i32 %23, %24, !dbg !151               ; [#uses=1 type=i32] [debug line = 148:3]
  store i32 %25, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 2, i32 1), align 4, !dbg !151 ; [debug line = 148:3]
  %26 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 6, i32 2), align 4, !dbg !152 ; [#uses=1 type=i32] [debug line = 149:3]
  %27 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 3, i32 2), align 4, !dbg !152 ; [#uses=1 type=i32] [debug line = 149:3]
  %28 = mul i32 %26, %27, !dbg !152               ; [#uses=1 type=i32] [debug line = 149:3]
  %29 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 7, i32 2), align 4, !dbg !152 ; [#uses=1 type=i32] [debug line = 149:3]
  %30 = add i32 %28, %29, !dbg !152               ; [#uses=1 type=i32] [debug line = 149:3]
  store i32 %30, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 2, i32 2), align 4, !dbg !152 ; [debug line = 149:3]
  %31 = bitcast %struct.__spir_rt_info_tT* %.cast.i to i8* ; [#uses=0 type=i8*]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !153), !dbg !154 ; [debug line = 52:90] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !155, i64 0, metadata !156), !dbg !157 ; [debug line = 52:114] [debug variable = rt_info]
  call void @llvm.dbg.value(metadata !{%struct.executeFirstLayer_args_t* %args}, i64 0, metadata !158), !dbg !159 ; [debug line = 52:149] [debug variable = args]
  %32 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 0, !dbg !160 ; [#uses=1 type=i32*] [debug line = 54:116]
  %33 = load i32* %32, align 4, !dbg !160         ; [#uses=1 type=i32] [debug line = 54:116]
  %34 = lshr i32 %33, 2, !dbg !160                ; [#uses=1 type=i32] [debug line = 54:116]
  %arg_bias.i.0 = getelementptr inbounds i32 addrspace(1)* %gmem, i32 %34, !dbg !160 ; [#uses=1 type=i32 addrspace(1)*] [debug line = 54:116]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %arg_bias.i.0}, i64 0, metadata !162), !dbg !160 ; [debug line = 54:116] [debug variable = arg_bias]
  %35 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 1, !dbg !163 ; [#uses=1 type=i32*] [debug line = 55:144]
  %36 = load i32* %35, align 4, !dbg !163         ; [#uses=1 type=i32] [debug line = 55:144]
  %37 = lshr i32 %36, 2, !dbg !163                ; [#uses=1 type=i32] [debug line = 55:144]
  %arg_Layer1_Neurons_GPU.i.0 = getelementptr inbounds i32 addrspace(1)* %gmem, i32 %37, !dbg !163 ; [#uses=3 type=i32 addrspace(1)*] [debug line = 55:144]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %arg_Layer1_Neurons_GPU.i.0}, i64 0, metadata !164), !dbg !163 ; [debug line = 55:144] [debug variable = arg_Layer1_Neurons_GPU]
  %38 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 2, !dbg !165 ; [#uses=1 type=i32*] [debug line = 56:144]
  %39 = load i32* %38, align 4, !dbg !165         ; [#uses=1 type=i32] [debug line = 56:144]
  %40 = lshr i32 %39, 2, !dbg !165                ; [#uses=1 type=i32] [debug line = 56:144]
  %arg_Layer1_Weights_GPU.i.0 = getelementptr inbounds i32 addrspace(1)* %gmem, i32 %40, !dbg !165 ; [#uses=3 type=i32 addrspace(1)*] [debug line = 56:144]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %arg_Layer1_Weights_GPU.i.0}, i64 0, metadata !166), !dbg !165 ; [debug line = 56:144] [debug variable = arg_Layer1_Weights_GPU]
  %41 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 3, !dbg !167 ; [#uses=1 type=i32*] [debug line = 57:144]
  %42 = load i32* %41, align 4, !dbg !167         ; [#uses=1 type=i32] [debug line = 57:144]
  %43 = lshr i32 %42, 2, !dbg !167                ; [#uses=1 type=i32] [debug line = 57:144]
  %arg_Layer2_Neurons_GPU.i.0 = getelementptr inbounds i32 addrspace(1)* %gmem, i32 %43, !dbg !167 ; [#uses=1 type=i32 addrspace(1)*] [debug line = 57:144]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %arg_Layer2_Neurons_GPU.i.0}, i64 0, metadata !168), !dbg !167 ; [debug line = 57:144] [debug variable = arg_Layer2_Neurons_GPU]
  %44 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 4, !dbg !169 ; [#uses=1 type=i32*] [debug line = 58:45]
  %arg_r_offset.i.0 = load i32* %44, align 4, !dbg !169 ; [#uses=1 type=i32] [debug line = 58:45]
  call void @llvm.dbg.value(metadata !{i32 %arg_r_offset.i.0}, i64 0, metadata !170), !dbg !169 ; [debug line = 58:45] [debug variable = arg_r_offset]
  %45 = getelementptr inbounds %struct.executeFirstLayer_args_t* %args, i32 0, i32 5, !dbg !171 ; [#uses=1 type=i32*] [debug line = 59:45]
  %arg_c_offset.i.0 = load i32* %45, align 4, !dbg !171 ; [#uses=1 type=i32] [debug line = 59:45]
  call void @llvm.dbg.value(metadata !{i32 %arg_c_offset.i.0}, i64 0, metadata !172), !dbg !171 ; [debug line = 59:45] [debug variable = arg_c_offset]
  %46 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 0 ; [#uses=1 type=i32*]
  %47 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 0 ; [#uses=1 type=i32*]
  %48 = load i32* %46                             ; [#uses=1 type=i32]
  %49 = bitcast i32 %48 to i32                    ; [#uses=1 type=i32]
  store volatile i32 %49, i32* %47
  %50 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 1 ; [#uses=3 type=[3 x i32]*]
  %51 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 1 ; [#uses=3 type=[3 x i32]*]
  %52 = getelementptr [3 x i32]* %50, i32 0, i32 0 ; [#uses=1 type=i32*]
  %53 = getelementptr [3 x i32]* %51, i32 0, i32 0 ; [#uses=1 type=i32*]
  %54 = load i32* %52                             ; [#uses=1 type=i32]
  store volatile i32 %54, i32* %53
  %55 = getelementptr [3 x i32]* %50, i32 0, i32 1 ; [#uses=1 type=i32*]
  %56 = getelementptr [3 x i32]* %51, i32 0, i32 1 ; [#uses=1 type=i32*]
  %57 = load i32* %55                             ; [#uses=1 type=i32]
  store volatile i32 %57, i32* %56
  %58 = getelementptr [3 x i32]* %50, i32 0, i32 2 ; [#uses=1 type=i32*]
  %59 = getelementptr [3 x i32]* %51, i32 0, i32 2 ; [#uses=1 type=i32*]
  %60 = load i32* %58                             ; [#uses=1 type=i32]
  store volatile i32 %60, i32* %59
  %61 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 2 ; [#uses=3 type=[3 x i32]*]
  %62 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 2 ; [#uses=3 type=[3 x i32]*]
  %63 = getelementptr [3 x i32]* %61, i32 0, i32 0 ; [#uses=1 type=i32*]
  %64 = getelementptr [3 x i32]* %62, i32 0, i32 0 ; [#uses=1 type=i32*]
  %65 = load i32* %63                             ; [#uses=1 type=i32]
  store volatile i32 %65, i32* %64
  %66 = getelementptr [3 x i32]* %61, i32 0, i32 1 ; [#uses=1 type=i32*]
  %67 = getelementptr [3 x i32]* %62, i32 0, i32 1 ; [#uses=1 type=i32*]
  %68 = load i32* %66                             ; [#uses=1 type=i32]
  store volatile i32 %68, i32* %67
  %69 = getelementptr [3 x i32]* %61, i32 0, i32 2 ; [#uses=1 type=i32*]
  %70 = getelementptr [3 x i32]* %62, i32 0, i32 2 ; [#uses=1 type=i32*]
  %71 = load i32* %69                             ; [#uses=1 type=i32]
  store volatile i32 %71, i32* %70
  %72 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 3 ; [#uses=3 type=[3 x i32]*]
  %73 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 3 ; [#uses=3 type=[3 x i32]*]
  %74 = getelementptr [3 x i32]* %72, i32 0, i32 0 ; [#uses=1 type=i32*]
  %75 = getelementptr [3 x i32]* %73, i32 0, i32 0 ; [#uses=1 type=i32*]
  %76 = load i32* %74                             ; [#uses=1 type=i32]
  store volatile i32 %76, i32* %75
  %77 = getelementptr [3 x i32]* %72, i32 0, i32 1 ; [#uses=1 type=i32*]
  %78 = getelementptr [3 x i32]* %73, i32 0, i32 1 ; [#uses=1 type=i32*]
  %79 = load i32* %77                             ; [#uses=1 type=i32]
  store volatile i32 %79, i32* %78
  %80 = getelementptr [3 x i32]* %72, i32 0, i32 2 ; [#uses=1 type=i32*]
  %81 = getelementptr [3 x i32]* %73, i32 0, i32 2 ; [#uses=1 type=i32*]
  %82 = load i32* %80                             ; [#uses=1 type=i32]
  store volatile i32 %82, i32* %81
  %83 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 4 ; [#uses=3 type=[3 x i32]*]
  %84 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 4 ; [#uses=3 type=[3 x i32]*]
  %85 = getelementptr [3 x i32]* %83, i32 0, i32 0 ; [#uses=1 type=i32*]
  %86 = getelementptr [3 x i32]* %84, i32 0, i32 0 ; [#uses=1 type=i32*]
  %87 = load i32* %85                             ; [#uses=1 type=i32]
  store volatile i32 %87, i32* %86
  %88 = getelementptr [3 x i32]* %83, i32 0, i32 1 ; [#uses=1 type=i32*]
  %89 = getelementptr [3 x i32]* %84, i32 0, i32 1 ; [#uses=1 type=i32*]
  %90 = load i32* %88                             ; [#uses=1 type=i32]
  store volatile i32 %90, i32* %89
  %91 = getelementptr [3 x i32]* %83, i32 0, i32 2 ; [#uses=1 type=i32*]
  %92 = getelementptr [3 x i32]* %84, i32 0, i32 2 ; [#uses=1 type=i32*]
  %93 = load i32* %91                             ; [#uses=1 type=i32]
  store volatile i32 %93, i32* %92
  %94 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 5 ; [#uses=3 type=[3 x i32]*]
  %95 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 5 ; [#uses=3 type=[3 x i32]*]
  %96 = getelementptr [3 x i32]* %94, i32 0, i32 0 ; [#uses=1 type=i32*]
  %97 = getelementptr [3 x i32]* %95, i32 0, i32 0 ; [#uses=1 type=i32*]
  %98 = load i32* %96                             ; [#uses=1 type=i32]
  store volatile i32 %98, i32* %97
  %99 = getelementptr [3 x i32]* %94, i32 0, i32 1 ; [#uses=1 type=i32*]
  %100 = getelementptr [3 x i32]* %95, i32 0, i32 1 ; [#uses=1 type=i32*]
  %101 = load i32* %99                            ; [#uses=1 type=i32]
  store volatile i32 %101, i32* %100
  %102 = getelementptr [3 x i32]* %94, i32 0, i32 2 ; [#uses=1 type=i32*]
  %103 = getelementptr [3 x i32]* %95, i32 0, i32 2 ; [#uses=1 type=i32*]
  %104 = load i32* %102                           ; [#uses=1 type=i32]
  store volatile i32 %104, i32* %103
  %105 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 6 ; [#uses=3 type=[3 x i32]*]
  %106 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 6 ; [#uses=3 type=[3 x i32]*]
  %107 = getelementptr [3 x i32]* %105, i32 0, i32 0 ; [#uses=1 type=i32*]
  %108 = getelementptr [3 x i32]* %106, i32 0, i32 0 ; [#uses=1 type=i32*]
  %109 = load i32* %107                           ; [#uses=1 type=i32]
  store volatile i32 %109, i32* %108
  %110 = getelementptr [3 x i32]* %105, i32 0, i32 1 ; [#uses=1 type=i32*]
  %111 = getelementptr [3 x i32]* %106, i32 0, i32 1 ; [#uses=1 type=i32*]
  %112 = load i32* %110                           ; [#uses=1 type=i32]
  store volatile i32 %112, i32* %111
  %113 = getelementptr [3 x i32]* %105, i32 0, i32 2 ; [#uses=1 type=i32*]
  %114 = getelementptr [3 x i32]* %106, i32 0, i32 2 ; [#uses=1 type=i32*]
  %115 = load i32* %113                           ; [#uses=1 type=i32]
  store volatile i32 %115, i32* %114
  %116 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 7 ; [#uses=3 type=[3 x i32]*]
  %117 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 7 ; [#uses=3 type=[3 x i32]*]
  %118 = getelementptr [3 x i32]* %116, i32 0, i32 0 ; [#uses=1 type=i32*]
  %119 = getelementptr [3 x i32]* %117, i32 0, i32 0 ; [#uses=1 type=i32*]
  %120 = load i32* %118                           ; [#uses=1 type=i32]
  store volatile i32 %120, i32* %119
  %121 = getelementptr [3 x i32]* %116, i32 0, i32 1 ; [#uses=1 type=i32*]
  %122 = getelementptr [3 x i32]* %117, i32 0, i32 1 ; [#uses=1 type=i32*]
  %123 = load i32* %121                           ; [#uses=1 type=i32]
  store volatile i32 %123, i32* %122
  %124 = getelementptr [3 x i32]* %116, i32 0, i32 2 ; [#uses=1 type=i32*]
  %125 = getelementptr [3 x i32]* %117, i32 0, i32 2 ; [#uses=1 type=i32*]
  %126 = load i32* %124                           ; [#uses=1 type=i32]
  store volatile i32 %126, i32* %125
  %127 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 8 ; [#uses=1 type=i8**]
  %128 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 8 ; [#uses=1 type=i8**]
  %129 = load i8** %127                           ; [#uses=1 type=i8*]
  %130 = bitcast i8* %129 to i8*                  ; [#uses=1 type=i8*]
  store volatile i8* %130, i8** %128
  %131 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 9 ; [#uses=1 type=i1*]
  %132 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 9 ; [#uses=1 type=i8*]
  %133 = load i1* %131                            ; [#uses=1 type=i1]
  %134 = zext i1 %133 to i8                       ; [#uses=1 type=i8]
  store volatile i8 %134, i8* %132
  %135 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 10 ; [#uses=1 type=i8**]
  %136 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 10 ; [#uses=1 type=i8**]
  %137 = load i8** %135                           ; [#uses=1 type=i8*]
  %138 = bitcast i8* %137 to i8*                  ; [#uses=1 type=i8*]
  store volatile i8* %138, i8** %136
  %139 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 11 ; [#uses=1 type=i8**]
  %140 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 11 ; [#uses=1 type=i8**]
  %141 = load i8** %139                           ; [#uses=1 type=i8*]
  %142 = bitcast i8* %141 to i8*                  ; [#uses=1 type=i8*]
  store volatile i8* %142, i8** %140
  %143 = getelementptr %struct.__spir_rt_info_tT.1* @rt_info, i32 0, i32 12 ; [#uses=1 type=i64*]
  %144 = getelementptr %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 12 ; [#uses=1 type=i64*]
  %145 = load i64* %143                           ; [#uses=1 type=i64]
  %146 = bitcast i64 %145 to i64                  ; [#uses=1 type=i64]
  store volatile i64 %146, i64* %144
  %147 = bitcast [3 x i32]* %tid71.i.i to i8*     ; [#uses=0 type=i8*]
  %tid71.sub.i.i = getelementptr inbounds [3 x i32]* %tid71.i.i, i32 0, i32 0 ; [#uses=3 type=i32*]
  store i32 0, i32* %tid71.sub.i.i, align 4
  %tid50.i.i = getelementptr [3 x i32]* %tid71.i.i, i32 0, i32 1 ; [#uses=1 type=i32*]
  store i32 0, i32* %tid50.i.i, align 4
  %tid51.i.i = getelementptr [3 x i32]* %tid71.i.i, i32 0, i32 2 ; [#uses=1 type=i32*]
  store i32 0, i32* %tid51.i.i, align 4
  br label %for.header55.i.i

for.header55.i.i:                                 ; preds = %for.body56.i.i, %0
  %indvar57.reg2mem69.0.i.i = phi i32 [ 0, %0 ], [ %indvar.inc58.reg2mem.0.i.i, %for.body56.i.i ] ; [#uses=3 type=i32]
  %gtid.0.i.i = phi i32 [ 0, %0 ], [ %gtid.1.i.i, %for.body56.i.i ] ; [#uses=1 type=i32]
  %tid59.i.i = getelementptr [3 x i32]* %tid71.i.i, i32 0, i32 1 ; [#uses=1 type=i32*]
  store i32 %indvar57.reg2mem69.0.i.i, i32* %tid59.i.i, align 4
  %148 = call  i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_Y.str) nounwind ; [#uses=0 type=i32]
  %149 = icmp eq i32 %indvar57.reg2mem69.0.i.i, 32 ; [#uses=1 type=i1]
  br i1 %149, label %__AESL_call_work_item_NA4.exit, label %for.header.i.i

for.header.i.i:                                   ; preds = %._crit_edge.i.i, %for.header55.i.i
  %indvar.reg2mem67.0.i.i = phi i32 [ %indvar.inc.reg2mem.0.i.i, %._crit_edge.i.i ], [ 0, %for.header55.i.i ] ; [#uses=3 type=i32]
  %gtid.1.i.i = phi i32 [ %223, %._crit_edge.i.i ], [ %gtid.0.i.i, %for.header55.i.i ] ; [#uses=2 type=i32]
  store i32 %indvar.reg2mem67.0.i.i, i32* %tid71.sub.i.i, align 4
  %150 = call  i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_X.str) nounwind ; [#uses=0 type=i32]
  %151 = icmp eq i32 %indvar.reg2mem67.0.i.i, 32  ; [#uses=1 type=i1]
  br i1 %151, label %for.body56.i.i, label %.split.i.i

for.body56.i.i:                                   ; preds = %for.header.i.i
  %indvar.inc58.reg2mem.0.i.i = add i32 %indvar57.reg2mem69.0.i.i, 1 ; [#uses=1 type=i32]
  br label %for.header55.i.i

.split.i.i:                                       ; preds = %for.header.i.i
  %152 = getelementptr inbounds %struct.__spir_rt_info_tT* %.cast.i, i32 0, i32 6, i32 0 ; [#uses=1 type=i32*]
  %output.0.reg2mem.0.i.i = load i32* %152, align 4 ; [#uses=5 type=i32]
  %tid.gep.i.i = getelementptr [3 x i32]* %tid71.i.i, i32 0, i32 1 ; [#uses=1 type=i32*]
  %tid.dim.i.i = load i32* %tid.gep.i.i, align 4  ; [#uses=1 type=i32]
  %row.0.reg2mem.0.i.i = add i32 %tid.dim.i.i, %arg_r_offset.i.0, !dbg !173 ; [#uses=2 type=i32] [debug line = 11:15]
  %tid.dim61.i.i = load i32* %tid71.sub.i.i, align 4 ; [#uses=1 type=i32]
  %col.0.reg2mem.0.i.i = add i32 %tid.dim61.i.i, %arg_c_offset.i.0, !dbg !175 ; [#uses=2 type=i32] [debug line = 12:15]
  %.reg2mem31.0.i.i = mul i32 %row.0.reg2mem.0.i.i, 2724, !dbg !176 ; [#uses=3 type=i32] [debug line = 14:5]
  %.reg2mem27.0.i.i = mul i32 %col.0.reg2mem.0.i.i, 12, !dbg !177 ; [#uses=3 type=i32] [debug line = 17:5]
  br label %153, !dbg !178                        ; [debug line = 19:18]

; <label>:153                                     ; preds = %212, %.split.i.i
  %i.0.reg2mem45.0.i.i = phi i32 [ 0, %.split.i.i ], [ %.reg2mem5.0.i.i, %212 ] ; [#uses=8 type=i32]
  %product.0.reg2mem47.0.i.i = phi float [ 0.000000e+00, %.split.i.i ], [ %product.1.reg2mem43.0.i.i, %212 ] ; [#uses=2 type=float]
  %154 = icmp slt i32 %i.0.reg2mem45.0.i.i, 11, !dbg !178 ; [#uses=1 type=i1] [debug line = 19:18]
  br i1 %154, label %155, label %._crit_edge.i.i, !dbg !178 ; [debug line = 19:18]

; <label>:155                                     ; preds = %157, %153
  %j.0.reg2mem41.0.i.i = phi i32 [ %.reg2mem7.0.i.i, %157 ], [ 0, %153 ] ; [#uses=8 type=i32]
  %product.1.reg2mem43.0.i.i = phi float [ %.reg2mem9.0.i.i, %157 ], [ %product.0.reg2mem47.0.i.i, %153 ] ; [#uses=2 type=float]
  %156 = icmp slt i32 %j.0.reg2mem41.0.i.i, 11, !dbg !180 ; [#uses=1 type=i1] [debug line = 21:22]
  br i1 %156, label %157, label %212, !dbg !180   ; [debug line = 21:22]

; <label>:157                                     ; preds = %155
  %158 = mul i32 %i.0.reg2mem45.0.i.i, 681, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %159 = mul nsw i32 %j.0.reg2mem41.0.i.i, 3, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %160 = add nsw i32 %158, %159, !dbg !183        ; [#uses=1 type=i32] [debug line = 23:13]
  %161 = add nsw i32 %160, %.reg2mem27.0.i.i, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %162 = add nsw i32 %161, %.reg2mem31.0.i.i, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %gep_idx20.i.i = and i32 %162, 1073741823       ; [#uses=1 type=i32]
  %163 = getelementptr i32 addrspace(1)* %arg_Layer1_Neurons_GPU.i.0, i32 %gep_idx20.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %164 = load i32 addrspace(1)* %163, align 4     ; [#uses=1 type=i32]
  %165 = bitcast i32 %164 to float                ; [#uses=1 type=float]
  %166 = mul nsw i32 %i.0.reg2mem45.0.i.i, 11, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %167 = add nsw i32 %166, %j.0.reg2mem41.0.i.i, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %168 = mul i32 %output.0.reg2mem.0.i.i, 363, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %169 = add nsw i32 %167, %168, !dbg !183        ; [#uses=1 type=i32] [debug line = 23:13]
  %gep_idx28.i.i = and i32 %169, 1073741823       ; [#uses=1 type=i32]
  %170 = getelementptr i32 addrspace(1)* %arg_Layer1_Weights_GPU.i.0, i32 %gep_idx28.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %171 = load i32 addrspace(1)* %170, align 4     ; [#uses=1 type=i32]
  %172 = bitcast i32 %171 to float                ; [#uses=1 type=float]
  %173 = fmul float %165, %172, !dbg !183         ; [#uses=1 type=float] [debug line = 23:13]
  %174 = mul i32 %i.0.reg2mem45.0.i.i, 681, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %175 = mul nsw i32 %j.0.reg2mem41.0.i.i, 3, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %176 = add nsw i32 %174, %175, !dbg !183        ; [#uses=1 type=i32] [debug line = 23:13]
  %177 = add nsw i32 %176, 1, !dbg !183           ; [#uses=1 type=i32] [debug line = 23:13]
  %178 = add nsw i32 %177, %.reg2mem27.0.i.i, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %179 = add nsw i32 %178, %.reg2mem31.0.i.i, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %gep_idx36.i.i = and i32 %179, 1073741823       ; [#uses=1 type=i32]
  %180 = getelementptr i32 addrspace(1)* %arg_Layer1_Neurons_GPU.i.0, i32 %gep_idx36.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %181 = load i32 addrspace(1)* %180, align 4     ; [#uses=1 type=i32]
  %182 = bitcast i32 %181 to float                ; [#uses=1 type=float]
  %183 = mul nsw i32 %i.0.reg2mem45.0.i.i, 11, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %184 = add nsw i32 %183, 121, !dbg !183         ; [#uses=1 type=i32] [debug line = 23:13]
  %185 = add nsw i32 %184, %j.0.reg2mem41.0.i.i, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %186 = mul i32 %output.0.reg2mem.0.i.i, 363, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %187 = add nsw i32 %185, %186, !dbg !183        ; [#uses=1 type=i32] [debug line = 23:13]
  %gep_idx44.i.i = and i32 %187, 1073741823       ; [#uses=1 type=i32]
  %188 = getelementptr i32 addrspace(1)* %arg_Layer1_Weights_GPU.i.0, i32 %gep_idx44.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %189 = load i32 addrspace(1)* %188, align 4     ; [#uses=1 type=i32]
  %190 = bitcast i32 %189 to float                ; [#uses=1 type=float]
  %191 = fmul float %182, %190, !dbg !183         ; [#uses=1 type=float] [debug line = 23:13]
  %192 = fadd float %173, %191, !dbg !183         ; [#uses=1 type=float] [debug line = 23:13]
  %193 = mul i32 %i.0.reg2mem45.0.i.i, 681, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %194 = mul nsw i32 %j.0.reg2mem41.0.i.i, 3, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %195 = add nsw i32 %193, %194, !dbg !183        ; [#uses=1 type=i32] [debug line = 23:13]
  %196 = add nsw i32 %195, 2, !dbg !183           ; [#uses=1 type=i32] [debug line = 23:13]
  %197 = add nsw i32 %196, %.reg2mem27.0.i.i, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %198 = add nsw i32 %197, %.reg2mem31.0.i.i, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %gep_idx52.i.i = and i32 %198, 1073741823       ; [#uses=1 type=i32]
  %199 = getelementptr i32 addrspace(1)* %arg_Layer1_Neurons_GPU.i.0, i32 %gep_idx52.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %200 = load i32 addrspace(1)* %199, align 4     ; [#uses=1 type=i32]
  %201 = bitcast i32 %200 to float                ; [#uses=1 type=float]
  %202 = mul nsw i32 %i.0.reg2mem45.0.i.i, 11, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %203 = add nsw i32 %202, 242, !dbg !183         ; [#uses=1 type=i32] [debug line = 23:13]
  %204 = add nsw i32 %203, %j.0.reg2mem41.0.i.i, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %205 = mul i32 %output.0.reg2mem.0.i.i, 363, !dbg !183 ; [#uses=1 type=i32] [debug line = 23:13]
  %206 = add nsw i32 %204, %205, !dbg !183        ; [#uses=1 type=i32] [debug line = 23:13]
  %gep_idx60.i.i = and i32 %206, 1073741823       ; [#uses=1 type=i32]
  %207 = getelementptr i32 addrspace(1)* %arg_Layer1_Weights_GPU.i.0, i32 %gep_idx60.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %208 = load i32 addrspace(1)* %207, align 4     ; [#uses=1 type=i32]
  %209 = bitcast i32 %208 to float                ; [#uses=1 type=float]
  %210 = fmul float %201, %209, !dbg !183         ; [#uses=1 type=float] [debug line = 23:13]
  %211 = fadd float %192, %210, !dbg !183         ; [#uses=1 type=float] [debug line = 23:13]
  %.reg2mem9.0.i.i = fadd float %product.1.reg2mem43.0.i.i, %211, !dbg !183 ; [#uses=1 type=float] [debug line = 23:13]
  %.reg2mem7.0.i.i = add nsw i32 %j.0.reg2mem41.0.i.i, 1, !dbg !185 ; [#uses=1 type=i32] [debug line = 21:32]
  br label %155, !dbg !185                        ; [debug line = 21:32]

; <label>:212                                     ; preds = %155
  %.reg2mem5.0.i.i = add nsw i32 %i.0.reg2mem45.0.i.i, 1, !dbg !186 ; [#uses=1 type=i32] [debug line = 19:28]
  br label %153, !dbg !186                        ; [debug line = 19:28]

._crit_edge.i.i:                                  ; preds = %153
  %gep_idx.i.i = and i32 %output.0.reg2mem.0.i.i, 1073741823 ; [#uses=1 type=i32]
  %213 = getelementptr i32 addrspace(1)* %arg_bias.i.0, i32 %gep_idx.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %214 = load i32 addrspace(1)* %213, align 4     ; [#uses=1 type=i32]
  %215 = bitcast i32 %214 to float                ; [#uses=1 type=float]
  %.reg2mem.0.i.i = fadd float %product.0.reg2mem47.0.i.i, %215, !dbg !187 ; [#uses=2 type=float] [debug line = 28:5]
  %216 = fcmp olt float %.reg2mem.0.i.i, 0.000000e+00, !dbg !188 ; [#uses=1 type=i1] [debug line = 29:5]
  %product.2.reg2mem.0.i.i = select i1 %216, float 0.000000e+00, float %.reg2mem.0.i.i, !dbg !188 ; [#uses=1 type=float] [debug line = 29:5]
  %217 = mul i32 %output.0.reg2mem.0.i.i, 3025, !dbg !189 ; [#uses=1 type=i32] [debug line = 31:5]
  %218 = mul nsw i32 %row.0.reg2mem.0.i.i, 55, !dbg !189 ; [#uses=1 type=i32] [debug line = 31:5]
  %219 = add nsw i32 %217, %218, !dbg !189        ; [#uses=1 type=i32] [debug line = 31:5]
  %220 = add nsw i32 %219, %col.0.reg2mem.0.i.i, !dbg !189 ; [#uses=1 type=i32] [debug line = 31:5]
  %gep_idx12.i.i = and i32 %220, 1073741823       ; [#uses=1 type=i32]
  %221 = getelementptr i32 addrspace(1)* %arg_Layer2_Neurons_GPU.i.0, i32 %gep_idx12.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %val.i.i = bitcast float %product.2.reg2mem.0.i.i to i32 ; [#uses=1 type=i32]
  store i32 %val.i.i, i32 addrspace(1)* %221, align 4
  %indvar.inc.reg2mem.0.i.i = add i32 %indvar.reg2mem67.0.i.i, 1 ; [#uses=1 type=i32]
  %222 = call  i32 (...)* @_ssdm_SpecLoopFlatten(i32 0, [1 x i8]* @str) nounwind ; [#uses=0 type=i32]
  %223 = add i32 %gtid.1.i.i, 1                   ; [#uses=1 type=i32]
  br label %for.header.i.i

__AESL_call_work_item_NA4.exit:                   ; preds = %for.header55.i.i
  %224 = bitcast [3 x i32]* %tid71.i.i to i8*, !dbg !190 ; [#uses=0 type=i8*] [debug line = 33:1]
  %225 = bitcast %struct.__spir_rt_info_tT* %.cast.i to i8*, !dbg !191 ; [#uses=0 type=i8*] [debug line = 61:3]
  ret void, !dbg !192                             ; [debug line = 81:1]
}

; [#uses=14]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.cu = !{!0, !14}
!hls.encrypted.func = !{}
!xcl.libspir = !{!90}
!xcl.reqd_rt_info = !{!91}
!xcl.portmap = !{!92, !94, !95, !96, !97, !99}
!axi4.master.portmap = !{!100}
!xcl.portlist = !{!93, !98}
!xcl.lmem_info = !{}
!xcl.progvar_info = !{}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"C:/Users/RA_prof_Jeon/siddharth/HLS/Alexnet_dev/solution1/.autopilot/db/layer1.pragma.2.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"executeFirstLayer", metadata !"executeFirstLayer", metadata !"", metadata !6, i32 2, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !12, i32 5} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"Alexnet_dev/layer1.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9, metadata !9, metadata !11, metadata !11}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!14 = metadata !{i32 786449, i32 0, i32 4, metadata !"aesl_gen-tmpA.cpp", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !15, metadata !86} ; [ DW_TAG_compile_unit ]
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !17, metadata !81, metadata !84, metadata !85}
!17 = metadata !{i32 786478, i32 0, metadata !18, metadata !"__AESL_call_work_item_NA", metadata !"__AESL_call_work_item_NA", metadata !"", metadata !18, i32 52, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !12, i32 53} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 786473, metadata !"executeFirstLayer_compute_unit", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!19 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{null, metadata !21, metadata !24, metadata !53}
!21 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!22 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_volatile_type ]
!23 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!24 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ]
!25 = metadata !{i32 786454, null, metadata !"__spir_rt_info_t", metadata !18, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !26} ; [ DW_TAG_typedef ]
!26 = metadata !{i32 786434, null, metadata !"__spir_rt_info_tT", metadata !27, i32 120, i64 896, i64 64, i32 0, i32 0, null, metadata !28, i32 0, null, null} ; [ DW_TAG_class_type ]
!27 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl/libspir_types.h", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!28 = metadata !{metadata !29, metadata !30, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40, metadata !42, metadata !45, metadata !46, metadata !47, metadata !49}
!29 = metadata !{i32 786445, metadata !26, metadata !"work_dim", metadata !27, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !23} ; [ DW_TAG_member ]
!30 = metadata !{i32 786445, metadata !26, metadata !"global_size", metadata !27, i32 124, i64 96, i64 32, i64 32, i32 0, metadata !31} ; [ DW_TAG_member ]
!31 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !23, metadata !32, i32 0, i32 0} ; [ DW_TAG_array_type ]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!34 = metadata !{i32 786445, metadata !26, metadata !"global_id", metadata !27, i32 125, i64 96, i64 32, i64 128, i32 0, metadata !31} ; [ DW_TAG_member ]
!35 = metadata !{i32 786445, metadata !26, metadata !"local_size", metadata !27, i32 127, i64 96, i64 32, i64 224, i32 0, metadata !31} ; [ DW_TAG_member ]
!36 = metadata !{i32 786445, metadata !26, metadata !"local_id", metadata !27, i32 128, i64 96, i64 32, i64 320, i32 0, metadata !31} ; [ DW_TAG_member ]
!37 = metadata !{i32 786445, metadata !26, metadata !"num_groups", metadata !27, i32 130, i64 96, i64 32, i64 416, i32 0, metadata !31} ; [ DW_TAG_member ]
!38 = metadata !{i32 786445, metadata !26, metadata !"group_id", metadata !27, i32 131, i64 96, i64 32, i64 512, i32 0, metadata !31} ; [ DW_TAG_member ]
!39 = metadata !{i32 786445, metadata !26, metadata !"global_offset", metadata !27, i32 132, i64 96, i64 32, i64 608, i32 0, metadata !31} ; [ DW_TAG_member ]
!40 = metadata !{i32 786445, metadata !26, metadata !"pthread_barrier", metadata !27, i32 135, i64 32, i64 32, i64 704, i32 0, metadata !41} ; [ DW_TAG_member ]
!41 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!42 = metadata !{i32 786445, metadata !26, metadata !"barriertoscheduler", metadata !27, i32 138, i64 8, i64 8, i64 736, i32 0, metadata !43} ; [ DW_TAG_member ]
!43 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_volatile_type ]
!44 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!45 = metadata !{i32 786445, metadata !26, metadata !"scheduler_context", metadata !27, i32 139, i64 32, i64 32, i64 768, i32 0, metadata !41} ; [ DW_TAG_member ]
!46 = metadata !{i32 786445, metadata !26, metadata !"pe_context", metadata !27, i32 140, i64 32, i64 32, i64 800, i32 0, metadata !41} ; [ DW_TAG_member ]
!47 = metadata !{i32 786445, metadata !26, metadata !"printf_buffer", metadata !27, i32 142, i64 64, i64 64, i64 832, i32 0, metadata !48} ; [ DW_TAG_member ]
!48 = metadata !{i32 786468, null, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!49 = metadata !{i32 786478, i32 0, metadata !26, metadata !"__spir_rt_info_tT", metadata !"__spir_rt_info_tT", metadata !"", metadata !27, i32 120, metadata !50, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !12, i32 120} ; [ DW_TAG_subprogram ]
!50 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!51 = metadata !{null, metadata !52}
!52 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !26} ; [ DW_TAG_pointer_type ]
!53 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !54} ; [ DW_TAG_pointer_type ]
!54 = metadata !{i32 786454, null, metadata !"executeFirstLayer_args_t", metadata !18, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !55} ; [ DW_TAG_typedef ]
!55 = metadata !{i32 786434, null, metadata !"", metadata !18, i32 17, i64 192, i64 32, i32 0, i32 0, null, metadata !56, i32 0, null, null} ; [ DW_TAG_class_type ]
!56 = metadata !{metadata !57, metadata !59, metadata !60, metadata !61, metadata !62, metadata !63, metadata !64}
!57 = metadata !{i32 786445, metadata !55, metadata !"bias", metadata !18, i32 18, i64 32, i64 32, i64 0, i32 0, metadata !58} ; [ DW_TAG_member ]
!58 = metadata !{i32 786454, null, metadata !"__spir_size_t", metadata !18, i32 108, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!59 = metadata !{i32 786445, metadata !55, metadata !"Layer1_Neurons_GPU", metadata !18, i32 19, i64 32, i64 32, i64 32, i32 0, metadata !58} ; [ DW_TAG_member ]
!60 = metadata !{i32 786445, metadata !55, metadata !"Layer1_Weights_GPU", metadata !18, i32 20, i64 32, i64 32, i64 64, i32 0, metadata !58} ; [ DW_TAG_member ]
!61 = metadata !{i32 786445, metadata !55, metadata !"Layer2_Neurons_GPU", metadata !18, i32 21, i64 32, i64 32, i64 96, i32 0, metadata !58} ; [ DW_TAG_member ]
!62 = metadata !{i32 786445, metadata !55, metadata !"r_offset", metadata !18, i32 22, i64 32, i64 32, i64 128, i32 0, metadata !23} ; [ DW_TAG_member ]
!63 = metadata !{i32 786445, metadata !55, metadata !"c_offset", metadata !18, i32 23, i64 32, i64 32, i64 160, i32 0, metadata !23} ; [ DW_TAG_member ]
!64 = metadata !{i32 786474, metadata !55, null, metadata !18, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_friend ]
!65 = metadata !{i32 786434, null, metadata !"aesl_keep_name_class", metadata !18, i32 27, i64 8, i64 8, i32 0, i32 0, null, metadata !66, i32 0, null, null} ; [ DW_TAG_class_type ]
!66 = metadata !{metadata !67, metadata !78}
!67 = metadata !{i32 786478, i32 0, metadata !65, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !18, i32 30, metadata !68, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 30} ; [ DW_TAG_subprogram ]
!68 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !69, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!69 = metadata !{null, metadata !70}
!70 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !71} ; [ DW_TAG_pointer_type ]
!71 = metadata !{i32 786454, null, metadata !"three_tuple_t", metadata !18, i32 15, i64 0, i64 0, i64 0, i32 0, metadata !72} ; [ DW_TAG_typedef ]
!72 = metadata !{i32 786434, null, metadata !"", metadata !18, i32 10, i64 96, i64 32, i32 0, i32 0, null, metadata !73, i32 0, null, null} ; [ DW_TAG_class_type ]
!73 = metadata !{metadata !74, metadata !75, metadata !76, metadata !77}
!74 = metadata !{i32 786445, metadata !72, metadata !"x", metadata !18, i32 11, i64 32, i64 32, i64 0, i32 0, metadata !23} ; [ DW_TAG_member ]
!75 = metadata !{i32 786445, metadata !72, metadata !"y", metadata !18, i32 12, i64 32, i64 32, i64 32, i32 0, metadata !23} ; [ DW_TAG_member ]
!76 = metadata !{i32 786445, metadata !72, metadata !"z", metadata !18, i32 13, i64 32, i64 32, i64 64, i32 0, metadata !23} ; [ DW_TAG_member ]
!77 = metadata !{i32 786474, metadata !72, null, metadata !18, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_friend ]
!78 = metadata !{i32 786478, i32 0, metadata !65, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP24executeFirstLayer_args_t", metadata !18, i32 36, metadata !79, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !12, i32 36} ; [ DW_TAG_subprogram ]
!79 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!80 = metadata !{null, metadata !53}
!81 = metadata !{i32 786478, i32 0, metadata !18, metadata !"__AESL_work_groupA", metadata !"__AESL_work_groupA", metadata !"", metadata !18, i32 65, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !12, i32 66} ; [ DW_TAG_subprogram ]
!82 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !83, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!83 = metadata !{null, metadata !21, metadata !70, metadata !53}
!84 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP24executeFirstLayer_args_t", metadata !18, i32 36, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !78, metadata !12, i32 36} ; [ DW_TAG_subprogram ]
!85 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !18, i32 30, metadata !68, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !67, metadata !12, i32 30} ; [ DW_TAG_subprogram ]
!86 = metadata !{metadata !87}
!87 = metadata !{metadata !88}
!88 = metadata !{i32 786484, i32 0, metadata !81, metadata !"rt_info", metadata !"rt_info", metadata !"", metadata !89, i32 49, metadata !25, i32 1, i32 1, %struct.__spir_rt_info_tT.1* @rt_info} ; [ DW_TAG_variable ]
!89 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl\5Caesl_gen_cu_body.inc", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CAlexnet_dev\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!90 = metadata !{metadata !"C:/Xilinx/Vivado_HLS/2016.4/win64/lib/libspir-hls.a"}
!91 = metadata !{metadata !"executeFirstLayer", metadata !"group_id"}
!92 = metadata !{metadata !"executeFirstLayer", i32 0, metadata !93}
!93 = metadata !{metadata !"executeFirstLayer", metadata !"gmem", metadata !"addressable", metadata !"master", i32 32}
!94 = metadata !{metadata !"executeFirstLayer", i32 1, metadata !93}
!95 = metadata !{metadata !"executeFirstLayer", i32 2, metadata !93}
!96 = metadata !{metadata !"executeFirstLayer", i32 3, metadata !93}
!97 = metadata !{metadata !"executeFirstLayer", i32 4, metadata !98}
!98 = metadata !{metadata !"executeFirstLayer", metadata !"control", metadata !"addressable", metadata !"slave", i32 32}
!99 = metadata !{metadata !"executeFirstLayer", i32 5, metadata !98}
!100 = metadata !{metadata !"gmem", metadata !"bias", metadata !"", metadata !"Layer1_Neurons_GPU", metadata !"", metadata !"Layer1_Weights_GPU", metadata !"", metadata !"Layer2_Neurons_GPU", metadata !""}
!101 = metadata !{i32 786689, metadata !81, metadata !"gmem", metadata !18, i32 16777281, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!102 = metadata !{i32 65, i32 84, metadata !81, null}
!103 = metadata !{i32 786689, metadata !81, metadata !"group_id", metadata !18, i32 33554497, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!104 = metadata !{i32 65, i32 105, metadata !81, null}
!105 = metadata !{i32 786689, metadata !81, metadata !"args", metadata !18, i32 50331713, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!106 = metadata !{i32 65, i32 141, metadata !81, null}
!107 = metadata !{i32 786689, metadata !85, metadata !"group_id", metadata !18, i32 16777246, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!108 = metadata !{i32 30, i32 44, metadata !85, metadata !109}
!109 = metadata !{i32 71, i32 1, metadata !110, null}
!110 = metadata !{i32 786443, metadata !81, i32 66, i32 1, metadata !18, i32 1} ; [ DW_TAG_lexical_block ]
!111 = metadata !{i32 31, i32 5, metadata !112, metadata !109}
!112 = metadata !{i32 786443, metadata !85, i32 30, i32 54, metadata !18, i32 3} ; [ DW_TAG_lexical_block ]
!113 = metadata !{i32 32, i32 5, metadata !112, metadata !109}
!114 = metadata !{i32 33, i32 5, metadata !112, metadata !109}
!115 = metadata !{i32 786689, metadata !84, metadata !"args", metadata !18, i32 16777252, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!116 = metadata !{i32 36, i32 51, metadata !84, metadata !117}
!117 = metadata !{i32 72, i32 1, metadata !110, null}
!118 = metadata !{i32 37, i32 5, metadata !119, metadata !117}
!119 = metadata !{i32 786443, metadata !84, i32 36, i32 57, metadata !18, i32 2} ; [ DW_TAG_lexical_block ]
!120 = metadata !{i32 38, i32 5, metadata !119, metadata !117}
!121 = metadata !{i32 39, i32 5, metadata !119, metadata !117}
!122 = metadata !{i32 40, i32 5, metadata !119, metadata !117}
!123 = metadata !{i32 41, i32 5, metadata !119, metadata !117}
!124 = metadata !{i32 42, i32 5, metadata !119, metadata !117}
!125 = metadata !{i32 73, i32 1, metadata !110, null}
!126 = metadata !{i32 74, i32 1, metadata !110, null}
!127 = metadata !{i32 75, i32 1, metadata !110, null}
!128 = metadata !{i32 76, i32 1, metadata !110, null}
!129 = metadata !{i32 46, i32 3, metadata !130, null}
!130 = metadata !{i32 786443, metadata !110, metadata !89} ; [ DW_TAG_lexical_block ]
!131 = metadata !{i32 54, i32 3, metadata !130, null}
!132 = metadata !{i32 63, i32 3, metadata !130, null}
!133 = metadata !{i32 64, i32 3, metadata !130, null}
!134 = metadata !{i32 65, i32 3, metadata !130, null}
!135 = metadata !{i32 70, i32 3, metadata !130, null}
!136 = metadata !{i32 79, i32 3, metadata !130, null}
!137 = metadata !{i32 88, i32 3, metadata !130, null}
!138 = metadata !{i32 103, i32 3, metadata !130, null}
!139 = metadata !{i32 104, i32 3, metadata !130, null}
!140 = metadata !{i32 105, i32 3, metadata !130, null}
!141 = metadata !{i32 114, i32 3, metadata !130, null}
!142 = metadata !{i32 115, i32 3, metadata !130, null}
!143 = metadata !{i32 116, i32 3, metadata !130, null}
!144 = metadata !{i32 121, i32 3, metadata !130, null}
!145 = metadata !{i32 122, i32 3, metadata !130, null}
!146 = metadata !{i32 123, i32 3, metadata !130, null}
!147 = metadata !{i32 136, i32 3, metadata !130, null}
!148 = metadata !{i32 137, i32 3, metadata !130, null}
!149 = metadata !{i32 138, i32 3, metadata !130, null}
!150 = metadata !{i32 147, i32 3, metadata !130, null}
!151 = metadata !{i32 148, i32 3, metadata !130, null}
!152 = metadata !{i32 149, i32 3, metadata !130, null}
!153 = metadata !{i32 786689, metadata !17, metadata !"gmem", metadata !18, i32 16777268, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!154 = metadata !{i32 52, i32 90, metadata !17, null}
!155 = metadata !{%struct.__spir_rt_info_tT.1* @rt_info}
!156 = metadata !{i32 786689, metadata !17, metadata !"rt_info", metadata !18, i32 33554484, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!157 = metadata !{i32 52, i32 114, metadata !17, null}
!158 = metadata !{i32 786689, metadata !17, metadata !"args", metadata !18, i32 50331700, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!159 = metadata !{i32 52, i32 149, metadata !17, null}
!160 = metadata !{i32 54, i32 116, metadata !161, null}
!161 = metadata !{i32 786443, metadata !17, i32 53, i32 1, metadata !18, i32 0} ; [ DW_TAG_lexical_block ]
!162 = metadata !{i32 786688, metadata !161, metadata !"arg_bias", metadata !18, i32 54, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!163 = metadata !{i32 55, i32 144, metadata !161, null}
!164 = metadata !{i32 786688, metadata !161, metadata !"arg_Layer1_Neurons_GPU", metadata !18, i32 55, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!165 = metadata !{i32 56, i32 144, metadata !161, null}
!166 = metadata !{i32 786688, metadata !161, metadata !"arg_Layer1_Weights_GPU", metadata !18, i32 56, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!167 = metadata !{i32 57, i32 144, metadata !161, null}
!168 = metadata !{i32 786688, metadata !161, metadata !"arg_Layer2_Neurons_GPU", metadata !18, i32 57, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!169 = metadata !{i32 58, i32 45, metadata !161, null}
!170 = metadata !{i32 786688, metadata !161, metadata !"arg_r_offset", metadata !18, i32 58, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!171 = metadata !{i32 59, i32 45, metadata !161, null}
!172 = metadata !{i32 786688, metadata !161, metadata !"arg_c_offset", metadata !18, i32 59, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!173 = metadata !{i32 11, i32 15, metadata !174, null}
!174 = metadata !{i32 786443, metadata !5, i32 5, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!175 = metadata !{i32 12, i32 15, metadata !174, null}
!176 = metadata !{i32 14, i32 5, metadata !174, null}
!177 = metadata !{i32 17, i32 5, metadata !174, null}
!178 = metadata !{i32 19, i32 18, metadata !179, null}
!179 = metadata !{i32 786443, metadata !174, i32 19, i32 5, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!180 = metadata !{i32 21, i32 22, metadata !181, null}
!181 = metadata !{i32 786443, metadata !182, i32 21, i32 9, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!182 = metadata !{i32 786443, metadata !179, i32 20, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!183 = metadata !{i32 23, i32 13, metadata !184, null}
!184 = metadata !{i32 786443, metadata !181, i32 22, i32 9, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!185 = metadata !{i32 21, i32 32, metadata !181, null}
!186 = metadata !{i32 19, i32 28, metadata !179, null}
!187 = metadata !{i32 28, i32 5, metadata !174, null}
!188 = metadata !{i32 29, i32 5, metadata !174, null}
!189 = metadata !{i32 31, i32 5, metadata !174, null}
!190 = metadata !{i32 33, i32 1, metadata !174, null}
!191 = metadata !{i32 61, i32 3, metadata !161, null}
!192 = metadata !{i32 81, i32 1, metadata !193, null}
!193 = metadata !{i32 786443, metadata !110, metadata !18} ; [ DW_TAG_lexical_block ]
