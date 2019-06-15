; ModuleID = 'C:/Users/RA_prof_Jeon/siddharth/HLS/executeFirstLayer1_p4/solution1/.autopilot/db/a.cl.0.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-linux-gnu"

%struct.__spir_rt_info_tT.1 = type { i32, [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], i8*, i8, i8*, i8*, i64 }
%struct.__spir_rt_info_tT.3 = type { i32, [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], [3 x i32], i8*, i1, i8*, i8*, i64 }
%struct.three_tuple_t = type { i32, i32, i32 }
%struct.executeFirstLayer1_p4_args_t = type { i32, i32, i32, i32 }

@__spir_rt_info = global %struct.__spir_rt_info_tT.1* null, align 4 ; [#uses=0 type=%struct.__spir_rt_info_tT.1**]
@XCL_WG_DIM_X.str = internal unnamed_addr constant [13 x i8] c"XCL_WG_DIM_X\00" ; [#uses=1 type=[13 x i8]*]
@str = internal constant [1 x i8] zeroinitializer ; [#uses=1 type=[1 x i8]*]
@XCL_WG_DIM_Y.str = internal unnamed_addr constant [13 x i8] c"XCL_WG_DIM_Y\00" ; [#uses=1 type=[13 x i8]*]
@.str = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=1 type=[6 x i8]*]
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str2 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1 ; [#uses=1 type=[10 x i8]*]
@.str3 = private unnamed_addr constant [8 x i8] c"control\00", align 1 ; [#uses=1 type=[8 x i8]*]
@rt_info = internal global %struct.__spir_rt_info_tT.3 zeroinitializer, align 8 ; [#uses=35 type=%struct.__spir_rt_info_tT.3*]
@.str4 = private unnamed_addr constant [12 x i8] c"member_name\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str5 = private unnamed_addr constant [5 x i8] c"bias\00", align 1 ; [#uses=1 type=[5 x i8]*]
@.str6 = private unnamed_addr constant [19 x i8] c"Layer1_Neurons_GPU\00", align 1 ; [#uses=1 type=[19 x i8]*]
@.str7 = private unnamed_addr constant [19 x i8] c"Layer1_Weights_GPU\00", align 1 ; [#uses=1 type=[19 x i8]*]
@.str8 = private unnamed_addr constant [19 x i8] c"Layer2_Neurons_GPU\00", align 1 ; [#uses=1 type=[19 x i8]*]
@.str9 = private unnamed_addr constant [11 x i8] c"group_id.x\00", align 1 ; [#uses=1 type=[11 x i8]*]
@.str10 = private unnamed_addr constant [11 x i8] c"group_id.y\00", align 1 ; [#uses=1 type=[11 x i8]*]
@.str11 = private unnamed_addr constant [11 x i8] c"group_id.z\00", align 1 ; [#uses=1 type=[11 x i8]*]

; [#uses=0]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=2]
declare i32 @_ssdm_op_SpecLoopName(...)

; [#uses=1]
declare i32 @_ssdm_SpecLoopFlatten(...)

; [#uses=4]
declare spir_func void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=1]
declare spir_func void @_ssdm_InlineRegion(...) nounwind

; [#uses=7]
declare spir_func void @_ssdm_op_SpecExt(...) nounwind

; [#uses=0]
define spir_func void @executeFirstLayer1_p4(i32 addrspace(1)* %gmem, %struct.three_tuple_t* %group_id, %struct.executeFirstLayer1_p4_args_t* %args) {
  %tid71.i.i = alloca [3 x i32], align 4          ; [#uses=7 type=[3 x i32]*]
  %.cast.i = alloca %struct.__spir_rt_info_tT.1   ; [#uses=16 type=%struct.__spir_rt_info_tT.1*]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !96), !dbg !97 ; [debug line = 59:84] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !{%struct.three_tuple_t* %group_id}, i64 0, metadata !98), !dbg !99 ; [debug line = 59:105] [debug variable = group_id]
  call void @llvm.dbg.value(metadata !{%struct.executeFirstLayer1_p4_args_t* %args}, i64 0, metadata !100), !dbg !101 ; [debug line = 59:145] [debug variable = args]
  call void @llvm.dbg.value(metadata !{%struct.three_tuple_t* %group_id}, i64 0, metadata !102), !dbg !103 ; [debug line = 28:44@65:1] [debug variable = group_id]
  %1 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 0, !dbg !106 ; [#uses=1 type=i32*] [debug line = 29:5@65:1]
  call spir_func void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str9, i32 0, i32 0), i32* %1) nounwind, !dbg !106 ; [debug line = 29:5@65:1]
  %2 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 1, !dbg !108 ; [#uses=1 type=i32*] [debug line = 30:5@65:1]
  call spir_func void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str10, i32 0, i32 0), i32* %2) nounwind, !dbg !108 ; [debug line = 30:5@65:1]
  %3 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 2, !dbg !109 ; [#uses=1 type=i32*] [debug line = 31:5@65:1]
  call spir_func void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str11, i32 0, i32 0), i32* %3) nounwind, !dbg !109 ; [debug line = 31:5@65:1]
  call void @llvm.dbg.value(metadata !{%struct.executeFirstLayer1_p4_args_t* %args}, i64 0, metadata !110), !dbg !111 ; [debug line = 34:55@66:1] [debug variable = args]
  %4 = getelementptr inbounds %struct.executeFirstLayer1_p4_args_t* %args, i32 0, i32 0, !dbg !113 ; [#uses=1 type=i32*] [debug line = 35:5@66:1]
  call spir_func void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str5, i32 0, i32 0), i32* %4) nounwind, !dbg !113 ; [debug line = 35:5@66:1]
  %5 = getelementptr inbounds %struct.executeFirstLayer1_p4_args_t* %args, i32 0, i32 1, !dbg !115 ; [#uses=1 type=i32*] [debug line = 36:5@66:1]
  call spir_func void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i32* %5) nounwind, !dbg !115 ; [debug line = 36:5@66:1]
  %6 = getelementptr inbounds %struct.executeFirstLayer1_p4_args_t* %args, i32 0, i32 2, !dbg !116 ; [#uses=1 type=i32*] [debug line = 37:5@66:1]
  call spir_func void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @.str7, i32 0, i32 0), i32* %6) nounwind, !dbg !116 ; [debug line = 37:5@66:1]
  %7 = getelementptr inbounds %struct.executeFirstLayer1_p4_args_t* %args, i32 0, i32 3, !dbg !117 ; [#uses=1 type=i32*] [debug line = 38:5@66:1]
  call spir_func void (...)* @_ssdm_op_SpecExt(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8]* @.str8, i32 0, i32 0), i32* %7) nounwind, !dbg !117 ; [debug line = 38:5@66:1]
  call spir_func void (...)* @_ssdm_op_SpecInterface(i32 addrspace(1)* %gmem, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 128, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !118 ; [debug line = 67:1]
  call spir_func void (...)* @_ssdm_op_SpecInterface(%struct.three_tuple_t* %group_id, i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !119 ; [debug line = 68:1]
  call spir_func void (...)* @_ssdm_op_SpecInterface(i32 0, i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !120 ; [debug line = 69:1]
  call spir_func void (...)* @_ssdm_op_SpecInterface(%struct.executeFirstLayer1_p4_args_t* %args, i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !121 ; [debug line = 70:1]
  call spir_func void (...)* @_ssdm_InlineRegion(i32 1, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !122 ; [debug line = 46:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 0), align 4, !dbg !124 ; [debug line = 54:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 1, i32 0), align 4, !dbg !125 ; [debug line = 63:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 1, i32 1), align 4, !dbg !126 ; [debug line = 64:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 1, i32 2), align 4, !dbg !127 ; [debug line = 65:3]
  store i32 23, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 3, i32 0), align 4, !dbg !128 ; [debug line = 70:3]
  store i32 23, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 3, i32 1), align 4, !dbg !129 ; [debug line = 79:3]
  store i32 1, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 3, i32 2), align 4, !dbg !130 ; [debug line = 88:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 4, i32 0), align 4, !dbg !131 ; [debug line = 103:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 4, i32 1), align 4, !dbg !132 ; [debug line = 104:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 4, i32 2), align 4, !dbg !133 ; [debug line = 105:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 5, i32 0), align 4, !dbg !134 ; [debug line = 114:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 5, i32 1), align 4, !dbg !135 ; [debug line = 115:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 5, i32 2), align 4, !dbg !136 ; [debug line = 116:3]
  %8 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 0, !dbg !137 ; [#uses=1 type=i32*] [debug line = 121:3]
  %9 = load i32* %8, align 4, !dbg !137           ; [#uses=1 type=i32] [debug line = 121:3]
  store i32 %9, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 6, i32 0), align 4, !dbg !137 ; [debug line = 121:3]
  %10 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 1, !dbg !138 ; [#uses=1 type=i32*] [debug line = 122:3]
  %11 = load i32* %10, align 4, !dbg !138         ; [#uses=1 type=i32] [debug line = 122:3]
  store i32 %11, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 6, i32 1), align 4, !dbg !138 ; [debug line = 122:3]
  %12 = getelementptr inbounds %struct.three_tuple_t* %group_id, i32 0, i32 2, !dbg !139 ; [#uses=1 type=i32*] [debug line = 123:3]
  %13 = load i32* %12, align 4, !dbg !139         ; [#uses=1 type=i32] [debug line = 123:3]
  store i32 %13, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 6, i32 2), align 4, !dbg !139 ; [debug line = 123:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 7, i32 0), align 4, !dbg !140 ; [debug line = 136:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 7, i32 1), align 4, !dbg !141 ; [debug line = 137:3]
  store i32 0, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 7, i32 2), align 4, !dbg !142 ; [debug line = 138:3]
  %14 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 6, i32 0), align 4, !dbg !143 ; [#uses=1 type=i32] [debug line = 147:3]
  %15 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 3, i32 0), align 4, !dbg !143 ; [#uses=1 type=i32] [debug line = 147:3]
  %16 = mul i32 %14, %15, !dbg !143               ; [#uses=1 type=i32] [debug line = 147:3]
  %17 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 7, i32 0), align 4, !dbg !143 ; [#uses=1 type=i32] [debug line = 147:3]
  %18 = add i32 %16, %17, !dbg !143               ; [#uses=1 type=i32] [debug line = 147:3]
  store i32 %18, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 2, i32 0), align 4, !dbg !143 ; [debug line = 147:3]
  %19 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 6, i32 1), align 4, !dbg !144 ; [#uses=1 type=i32] [debug line = 148:3]
  %20 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 3, i32 1), align 4, !dbg !144 ; [#uses=1 type=i32] [debug line = 148:3]
  %21 = mul i32 %19, %20, !dbg !144               ; [#uses=1 type=i32] [debug line = 148:3]
  %22 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 7, i32 1), align 4, !dbg !144 ; [#uses=1 type=i32] [debug line = 148:3]
  %23 = add i32 %21, %22, !dbg !144               ; [#uses=1 type=i32] [debug line = 148:3]
  store i32 %23, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 2, i32 1), align 4, !dbg !144 ; [debug line = 148:3]
  %24 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 6, i32 2), align 4, !dbg !145 ; [#uses=1 type=i32] [debug line = 149:3]
  %25 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 3, i32 2), align 4, !dbg !145 ; [#uses=1 type=i32] [debug line = 149:3]
  %26 = mul i32 %24, %25, !dbg !145               ; [#uses=1 type=i32] [debug line = 149:3]
  %27 = load i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 7, i32 2), align 4, !dbg !145 ; [#uses=1 type=i32] [debug line = 149:3]
  %28 = add i32 %26, %27, !dbg !145               ; [#uses=1 type=i32] [debug line = 149:3]
  store i32 %28, i32* getelementptr inbounds (%struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 2, i32 2), align 4, !dbg !145 ; [debug line = 149:3]
  %29 = bitcast %struct.__spir_rt_info_tT.1* %.cast.i to i8* ; [#uses=0 type=i8*]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %gmem}, i64 0, metadata !146), !dbg !147 ; [debug line = 48:90] [debug variable = gmem]
  call void @llvm.dbg.value(metadata !148, i64 0, metadata !149), !dbg !150 ; [debug line = 48:114] [debug variable = rt_info]
  call void @llvm.dbg.value(metadata !{%struct.executeFirstLayer1_p4_args_t* %args}, i64 0, metadata !151), !dbg !152 ; [debug line = 48:153] [debug variable = args]
  %30 = getelementptr inbounds %struct.executeFirstLayer1_p4_args_t* %args, i32 0, i32 0, !dbg !153 ; [#uses=1 type=i32*] [debug line = 50:116]
  %31 = load i32* %30, align 4, !dbg !153         ; [#uses=1 type=i32] [debug line = 50:116]
  %32 = lshr i32 %31, 2, !dbg !153                ; [#uses=1 type=i32] [debug line = 50:116]
  %arg_bias.i.0 = getelementptr inbounds i32 addrspace(1)* %gmem, i32 %32, !dbg !153 ; [#uses=1 type=i32 addrspace(1)*] [debug line = 50:116]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %arg_bias.i.0}, i64 0, metadata !155), !dbg !153 ; [debug line = 50:116] [debug variable = arg_bias]
  %33 = getelementptr inbounds %struct.executeFirstLayer1_p4_args_t* %args, i32 0, i32 1, !dbg !156 ; [#uses=1 type=i32*] [debug line = 51:144]
  %34 = load i32* %33, align 4, !dbg !156         ; [#uses=1 type=i32] [debug line = 51:144]
  %35 = lshr i32 %34, 2, !dbg !156                ; [#uses=1 type=i32] [debug line = 51:144]
  %arg_Layer1_Neurons_GPU.i.0 = getelementptr inbounds i32 addrspace(1)* %gmem, i32 %35, !dbg !156 ; [#uses=3 type=i32 addrspace(1)*] [debug line = 51:144]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %arg_Layer1_Neurons_GPU.i.0}, i64 0, metadata !157), !dbg !156 ; [debug line = 51:144] [debug variable = arg_Layer1_Neurons_GPU]
  %36 = getelementptr inbounds %struct.executeFirstLayer1_p4_args_t* %args, i32 0, i32 2, !dbg !158 ; [#uses=1 type=i32*] [debug line = 52:144]
  %37 = load i32* %36, align 4, !dbg !158         ; [#uses=1 type=i32] [debug line = 52:144]
  %38 = lshr i32 %37, 2, !dbg !158                ; [#uses=1 type=i32] [debug line = 52:144]
  %arg_Layer1_Weights_GPU.i.0 = getelementptr inbounds i32 addrspace(1)* %gmem, i32 %38, !dbg !158 ; [#uses=3 type=i32 addrspace(1)*] [debug line = 52:144]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %arg_Layer1_Weights_GPU.i.0}, i64 0, metadata !159), !dbg !158 ; [debug line = 52:144] [debug variable = arg_Layer1_Weights_GPU]
  %39 = getelementptr inbounds %struct.executeFirstLayer1_p4_args_t* %args, i32 0, i32 3, !dbg !160 ; [#uses=1 type=i32*] [debug line = 53:144]
  %40 = load i32* %39, align 4, !dbg !160         ; [#uses=1 type=i32] [debug line = 53:144]
  %41 = lshr i32 %40, 2, !dbg !160                ; [#uses=1 type=i32] [debug line = 53:144]
  %arg_Layer2_Neurons_GPU.i.0 = getelementptr inbounds i32 addrspace(1)* %gmem, i32 %41, !dbg !160 ; [#uses=1 type=i32 addrspace(1)*] [debug line = 53:144]
  call void @llvm.dbg.value(metadata !{i32 addrspace(1)* %arg_Layer2_Neurons_GPU.i.0}, i64 0, metadata !161), !dbg !160 ; [debug line = 53:144] [debug variable = arg_Layer2_Neurons_GPU]
  %42 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 0 ; [#uses=1 type=i32*]
  %43 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 0 ; [#uses=1 type=i32*]
  %44 = load i32* %42                             ; [#uses=1 type=i32]
  %45 = bitcast i32 %44 to i32                    ; [#uses=1 type=i32]
  store volatile i32 %45, i32* %43
  %46 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 1 ; [#uses=3 type=[3 x i32]*]
  %47 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 1 ; [#uses=3 type=[3 x i32]*]
  %48 = getelementptr [3 x i32]* %46, i32 0, i32 0 ; [#uses=1 type=i32*]
  %49 = getelementptr [3 x i32]* %47, i32 0, i32 0 ; [#uses=1 type=i32*]
  %50 = load i32* %48                             ; [#uses=1 type=i32]
  store volatile i32 %50, i32* %49
  %51 = getelementptr [3 x i32]* %46, i32 0, i32 1 ; [#uses=1 type=i32*]
  %52 = getelementptr [3 x i32]* %47, i32 0, i32 1 ; [#uses=1 type=i32*]
  %53 = load i32* %51                             ; [#uses=1 type=i32]
  store volatile i32 %53, i32* %52
  %54 = getelementptr [3 x i32]* %46, i32 0, i32 2 ; [#uses=1 type=i32*]
  %55 = getelementptr [3 x i32]* %47, i32 0, i32 2 ; [#uses=1 type=i32*]
  %56 = load i32* %54                             ; [#uses=1 type=i32]
  store volatile i32 %56, i32* %55
  %57 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 2 ; [#uses=3 type=[3 x i32]*]
  %58 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 2 ; [#uses=3 type=[3 x i32]*]
  %59 = getelementptr [3 x i32]* %57, i32 0, i32 0 ; [#uses=1 type=i32*]
  %60 = getelementptr [3 x i32]* %58, i32 0, i32 0 ; [#uses=1 type=i32*]
  %61 = load i32* %59                             ; [#uses=1 type=i32]
  store volatile i32 %61, i32* %60
  %62 = getelementptr [3 x i32]* %57, i32 0, i32 1 ; [#uses=1 type=i32*]
  %63 = getelementptr [3 x i32]* %58, i32 0, i32 1 ; [#uses=1 type=i32*]
  %64 = load i32* %62                             ; [#uses=1 type=i32]
  store volatile i32 %64, i32* %63
  %65 = getelementptr [3 x i32]* %57, i32 0, i32 2 ; [#uses=1 type=i32*]
  %66 = getelementptr [3 x i32]* %58, i32 0, i32 2 ; [#uses=1 type=i32*]
  %67 = load i32* %65                             ; [#uses=1 type=i32]
  store volatile i32 %67, i32* %66
  %68 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 3 ; [#uses=3 type=[3 x i32]*]
  %69 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 3 ; [#uses=3 type=[3 x i32]*]
  %70 = getelementptr [3 x i32]* %68, i32 0, i32 0 ; [#uses=1 type=i32*]
  %71 = getelementptr [3 x i32]* %69, i32 0, i32 0 ; [#uses=1 type=i32*]
  %72 = load i32* %70                             ; [#uses=1 type=i32]
  store volatile i32 %72, i32* %71
  %73 = getelementptr [3 x i32]* %68, i32 0, i32 1 ; [#uses=1 type=i32*]
  %74 = getelementptr [3 x i32]* %69, i32 0, i32 1 ; [#uses=1 type=i32*]
  %75 = load i32* %73                             ; [#uses=1 type=i32]
  store volatile i32 %75, i32* %74
  %76 = getelementptr [3 x i32]* %68, i32 0, i32 2 ; [#uses=1 type=i32*]
  %77 = getelementptr [3 x i32]* %69, i32 0, i32 2 ; [#uses=1 type=i32*]
  %78 = load i32* %76                             ; [#uses=1 type=i32]
  store volatile i32 %78, i32* %77
  %79 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 4 ; [#uses=3 type=[3 x i32]*]
  %80 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 4 ; [#uses=3 type=[3 x i32]*]
  %81 = getelementptr [3 x i32]* %79, i32 0, i32 0 ; [#uses=1 type=i32*]
  %82 = getelementptr [3 x i32]* %80, i32 0, i32 0 ; [#uses=1 type=i32*]
  %83 = load i32* %81                             ; [#uses=1 type=i32]
  store volatile i32 %83, i32* %82
  %84 = getelementptr [3 x i32]* %79, i32 0, i32 1 ; [#uses=1 type=i32*]
  %85 = getelementptr [3 x i32]* %80, i32 0, i32 1 ; [#uses=1 type=i32*]
  %86 = load i32* %84                             ; [#uses=1 type=i32]
  store volatile i32 %86, i32* %85
  %87 = getelementptr [3 x i32]* %79, i32 0, i32 2 ; [#uses=1 type=i32*]
  %88 = getelementptr [3 x i32]* %80, i32 0, i32 2 ; [#uses=1 type=i32*]
  %89 = load i32* %87                             ; [#uses=1 type=i32]
  store volatile i32 %89, i32* %88
  %90 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 5 ; [#uses=3 type=[3 x i32]*]
  %91 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 5 ; [#uses=3 type=[3 x i32]*]
  %92 = getelementptr [3 x i32]* %90, i32 0, i32 0 ; [#uses=1 type=i32*]
  %93 = getelementptr [3 x i32]* %91, i32 0, i32 0 ; [#uses=1 type=i32*]
  %94 = load i32* %92                             ; [#uses=1 type=i32]
  store volatile i32 %94, i32* %93
  %95 = getelementptr [3 x i32]* %90, i32 0, i32 1 ; [#uses=1 type=i32*]
  %96 = getelementptr [3 x i32]* %91, i32 0, i32 1 ; [#uses=1 type=i32*]
  %97 = load i32* %95                             ; [#uses=1 type=i32]
  store volatile i32 %97, i32* %96
  %98 = getelementptr [3 x i32]* %90, i32 0, i32 2 ; [#uses=1 type=i32*]
  %99 = getelementptr [3 x i32]* %91, i32 0, i32 2 ; [#uses=1 type=i32*]
  %100 = load i32* %98                            ; [#uses=1 type=i32]
  store volatile i32 %100, i32* %99
  %101 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 6 ; [#uses=3 type=[3 x i32]*]
  %102 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 6 ; [#uses=3 type=[3 x i32]*]
  %103 = getelementptr [3 x i32]* %101, i32 0, i32 0 ; [#uses=1 type=i32*]
  %104 = getelementptr [3 x i32]* %102, i32 0, i32 0 ; [#uses=1 type=i32*]
  %105 = load i32* %103                           ; [#uses=1 type=i32]
  store volatile i32 %105, i32* %104
  %106 = getelementptr [3 x i32]* %101, i32 0, i32 1 ; [#uses=1 type=i32*]
  %107 = getelementptr [3 x i32]* %102, i32 0, i32 1 ; [#uses=1 type=i32*]
  %108 = load i32* %106                           ; [#uses=1 type=i32]
  store volatile i32 %108, i32* %107
  %109 = getelementptr [3 x i32]* %101, i32 0, i32 2 ; [#uses=1 type=i32*]
  %110 = getelementptr [3 x i32]* %102, i32 0, i32 2 ; [#uses=1 type=i32*]
  %111 = load i32* %109                           ; [#uses=1 type=i32]
  store volatile i32 %111, i32* %110
  %112 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 7 ; [#uses=3 type=[3 x i32]*]
  %113 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 7 ; [#uses=3 type=[3 x i32]*]
  %114 = getelementptr [3 x i32]* %112, i32 0, i32 0 ; [#uses=1 type=i32*]
  %115 = getelementptr [3 x i32]* %113, i32 0, i32 0 ; [#uses=1 type=i32*]
  %116 = load i32* %114                           ; [#uses=1 type=i32]
  store volatile i32 %116, i32* %115
  %117 = getelementptr [3 x i32]* %112, i32 0, i32 1 ; [#uses=1 type=i32*]
  %118 = getelementptr [3 x i32]* %113, i32 0, i32 1 ; [#uses=1 type=i32*]
  %119 = load i32* %117                           ; [#uses=1 type=i32]
  store volatile i32 %119, i32* %118
  %120 = getelementptr [3 x i32]* %112, i32 0, i32 2 ; [#uses=1 type=i32*]
  %121 = getelementptr [3 x i32]* %113, i32 0, i32 2 ; [#uses=1 type=i32*]
  %122 = load i32* %120                           ; [#uses=1 type=i32]
  store volatile i32 %122, i32* %121
  %123 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 8 ; [#uses=1 type=i8**]
  %124 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 8 ; [#uses=1 type=i8**]
  %125 = load i8** %123                           ; [#uses=1 type=i8*]
  %126 = bitcast i8* %125 to i8*                  ; [#uses=1 type=i8*]
  store volatile i8* %126, i8** %124
  %127 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 9 ; [#uses=1 type=i1*]
  %128 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 9 ; [#uses=1 type=i8*]
  %129 = load i1* %127                            ; [#uses=1 type=i1]
  %130 = zext i1 %129 to i8                       ; [#uses=1 type=i8]
  store volatile i8 %130, i8* %128
  %131 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 10 ; [#uses=1 type=i8**]
  %132 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 10 ; [#uses=1 type=i8**]
  %133 = load i8** %131                           ; [#uses=1 type=i8*]
  %134 = bitcast i8* %133 to i8*                  ; [#uses=1 type=i8*]
  store volatile i8* %134, i8** %132
  %135 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 11 ; [#uses=1 type=i8**]
  %136 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 11 ; [#uses=1 type=i8**]
  %137 = load i8** %135                           ; [#uses=1 type=i8*]
  %138 = bitcast i8* %137 to i8*                  ; [#uses=1 type=i8*]
  store volatile i8* %138, i8** %136
  %139 = getelementptr %struct.__spir_rt_info_tT.3* @rt_info, i32 0, i32 12 ; [#uses=1 type=i64*]
  %140 = getelementptr %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 12 ; [#uses=1 type=i64*]
  %141 = load i64* %139                           ; [#uses=1 type=i64]
  %142 = bitcast i64 %141 to i64                  ; [#uses=1 type=i64]
  store volatile i64 %142, i64* %140
  %143 = bitcast [3 x i32]* %tid71.i.i to i8*     ; [#uses=0 type=i8*]
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
  %144 = call spir_func i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_Y.str) nounwind ; [#uses=0 type=i32]
  %145 = icmp eq i32 %indvar57.reg2mem69.0.i.i, 23 ; [#uses=1 type=i1]
  br i1 %145, label %__AESL_call_work_item_NA4.exit, label %for.header.i.i

for.header.i.i:                                   ; preds = %._crit_edge.i.i, %for.header55.i.i
  %indvar.reg2mem67.0.i.i = phi i32 [ %indvar.inc.reg2mem.0.i.i, %._crit_edge.i.i ], [ 0, %for.header55.i.i ] ; [#uses=3 type=i32]
  %gtid.1.i.i = phi i32 [ %219, %._crit_edge.i.i ], [ %gtid.0.i.i, %for.header55.i.i ] ; [#uses=2 type=i32]
  store i32 %indvar.reg2mem67.0.i.i, i32* %tid71.sub.i.i, align 4
  %146 = call spir_func i32 (...)* @_ssdm_op_SpecLoopName([13 x i8]* @XCL_WG_DIM_X.str) nounwind ; [#uses=0 type=i32]
  %147 = icmp eq i32 %indvar.reg2mem67.0.i.i, 23  ; [#uses=1 type=i1]
  br i1 %147, label %for.body56.i.i, label %.split.i.i

for.body56.i.i:                                   ; preds = %for.header.i.i
  %indvar.inc58.reg2mem.0.i.i = add i32 %indvar57.reg2mem69.0.i.i, 1 ; [#uses=1 type=i32]
  br label %for.header55.i.i

.split.i.i:                                       ; preds = %for.header.i.i
  %148 = getelementptr inbounds %struct.__spir_rt_info_tT.1* %.cast.i, i32 0, i32 6, i32 0 ; [#uses=1 type=i32*]
  %output.0.reg2mem.0.i.i = load i32* %148, align 4 ; [#uses=5 type=i32]
  %tid.gep.i.i = getelementptr [3 x i32]* %tid71.i.i, i32 0, i32 1 ; [#uses=1 type=i32*]
  %tid.dim.i.i = load i32* %tid.gep.i.i, align 4  ; [#uses=1 type=i32]
  %row.0.reg2mem.0.i.i = add i32 %tid.dim.i.i, 32, !dbg !162 ; [#uses=2 type=i32] [debug line = 14:15]
  %tid.dim61.i.i = load i32* %tid71.sub.i.i, align 4 ; [#uses=1 type=i32]
  %col.0.reg2mem.0.i.i = add i32 %tid.dim61.i.i, 32, !dbg !164 ; [#uses=2 type=i32] [debug line = 15:15]
  %.reg2mem31.0.i.i = mul i32 %row.0.reg2mem.0.i.i, 2724, !dbg !165 ; [#uses=3 type=i32] [debug line = 17:5]
  %.reg2mem27.0.i.i = mul i32 %col.0.reg2mem.0.i.i, 12, !dbg !166 ; [#uses=3 type=i32] [debug line = 20:5]
  br label %149, !dbg !167                        ; [debug line = 22:18]

; <label>:149                                     ; preds = %208, %.split.i.i
  %i.0.reg2mem45.0.i.i = phi i32 [ 0, %.split.i.i ], [ %.reg2mem5.0.i.i, %208 ] ; [#uses=8 type=i32]
  %product.0.reg2mem47.0.i.i = phi float [ 0.000000e+00, %.split.i.i ], [ %product.1.reg2mem43.0.i.i, %208 ] ; [#uses=2 type=float]
  %150 = icmp slt i32 %i.0.reg2mem45.0.i.i, 11, !dbg !167 ; [#uses=1 type=i1] [debug line = 22:18]
  br i1 %150, label %151, label %._crit_edge.i.i, !dbg !167 ; [debug line = 22:18]

; <label>:151                                     ; preds = %153, %149
  %j.0.reg2mem41.0.i.i = phi i32 [ %.reg2mem7.0.i.i, %153 ], [ 0, %149 ] ; [#uses=8 type=i32]
  %product.1.reg2mem43.0.i.i = phi float [ %.reg2mem9.0.i.i, %153 ], [ %product.0.reg2mem47.0.i.i, %149 ] ; [#uses=2 type=float]
  %152 = icmp slt i32 %j.0.reg2mem41.0.i.i, 11, !dbg !169 ; [#uses=1 type=i1] [debug line = 24:22]
  br i1 %152, label %153, label %208, !dbg !169   ; [debug line = 24:22]

; <label>:153                                     ; preds = %151
  %154 = mul i32 %i.0.reg2mem45.0.i.i, 681, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %155 = mul nsw i32 %j.0.reg2mem41.0.i.i, 3, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %156 = add nsw i32 %154, %155, !dbg !172        ; [#uses=1 type=i32] [debug line = 26:13]
  %157 = add nsw i32 %156, %.reg2mem27.0.i.i, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %158 = add nsw i32 %157, %.reg2mem31.0.i.i, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %gep_idx20.i.i = and i32 %158, 1073741823       ; [#uses=1 type=i32]
  %159 = getelementptr i32 addrspace(1)* %arg_Layer1_Neurons_GPU.i.0, i32 %gep_idx20.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %160 = load i32 addrspace(1)* %159, align 4     ; [#uses=1 type=i32]
  %161 = bitcast i32 %160 to float                ; [#uses=1 type=float]
  %162 = mul nsw i32 %i.0.reg2mem45.0.i.i, 11, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %163 = add nsw i32 %162, %j.0.reg2mem41.0.i.i, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %164 = mul i32 %output.0.reg2mem.0.i.i, 363, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %165 = add nsw i32 %163, %164, !dbg !172        ; [#uses=1 type=i32] [debug line = 26:13]
  %gep_idx28.i.i = and i32 %165, 1073741823       ; [#uses=1 type=i32]
  %166 = getelementptr i32 addrspace(1)* %arg_Layer1_Weights_GPU.i.0, i32 %gep_idx28.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %167 = load i32 addrspace(1)* %166, align 4     ; [#uses=1 type=i32]
  %168 = bitcast i32 %167 to float                ; [#uses=1 type=float]
  %169 = fmul float %161, %168, !dbg !172         ; [#uses=1 type=float] [debug line = 26:13]
  %170 = mul i32 %i.0.reg2mem45.0.i.i, 681, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %171 = mul nsw i32 %j.0.reg2mem41.0.i.i, 3, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %172 = add nsw i32 %170, %171, !dbg !172        ; [#uses=1 type=i32] [debug line = 26:13]
  %173 = add nsw i32 %172, 1, !dbg !172           ; [#uses=1 type=i32] [debug line = 26:13]
  %174 = add nsw i32 %173, %.reg2mem27.0.i.i, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %175 = add nsw i32 %174, %.reg2mem31.0.i.i, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %gep_idx36.i.i = and i32 %175, 1073741823       ; [#uses=1 type=i32]
  %176 = getelementptr i32 addrspace(1)* %arg_Layer1_Neurons_GPU.i.0, i32 %gep_idx36.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %177 = load i32 addrspace(1)* %176, align 4     ; [#uses=1 type=i32]
  %178 = bitcast i32 %177 to float                ; [#uses=1 type=float]
  %179 = mul nsw i32 %i.0.reg2mem45.0.i.i, 11, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %180 = add nsw i32 %179, 121, !dbg !172         ; [#uses=1 type=i32] [debug line = 26:13]
  %181 = add nsw i32 %180, %j.0.reg2mem41.0.i.i, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %182 = mul i32 %output.0.reg2mem.0.i.i, 363, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %183 = add nsw i32 %181, %182, !dbg !172        ; [#uses=1 type=i32] [debug line = 26:13]
  %gep_idx44.i.i = and i32 %183, 1073741823       ; [#uses=1 type=i32]
  %184 = getelementptr i32 addrspace(1)* %arg_Layer1_Weights_GPU.i.0, i32 %gep_idx44.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %185 = load i32 addrspace(1)* %184, align 4     ; [#uses=1 type=i32]
  %186 = bitcast i32 %185 to float                ; [#uses=1 type=float]
  %187 = fmul float %178, %186, !dbg !172         ; [#uses=1 type=float] [debug line = 26:13]
  %188 = fadd float %169, %187, !dbg !172         ; [#uses=1 type=float] [debug line = 26:13]
  %189 = mul i32 %i.0.reg2mem45.0.i.i, 681, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %190 = mul nsw i32 %j.0.reg2mem41.0.i.i, 3, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %191 = add nsw i32 %189, %190, !dbg !172        ; [#uses=1 type=i32] [debug line = 26:13]
  %192 = add nsw i32 %191, 2, !dbg !172           ; [#uses=1 type=i32] [debug line = 26:13]
  %193 = add nsw i32 %192, %.reg2mem27.0.i.i, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %194 = add nsw i32 %193, %.reg2mem31.0.i.i, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %gep_idx52.i.i = and i32 %194, 1073741823       ; [#uses=1 type=i32]
  %195 = getelementptr i32 addrspace(1)* %arg_Layer1_Neurons_GPU.i.0, i32 %gep_idx52.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %196 = load i32 addrspace(1)* %195, align 4     ; [#uses=1 type=i32]
  %197 = bitcast i32 %196 to float                ; [#uses=1 type=float]
  %198 = mul nsw i32 %i.0.reg2mem45.0.i.i, 11, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %199 = add nsw i32 %198, 242, !dbg !172         ; [#uses=1 type=i32] [debug line = 26:13]
  %200 = add nsw i32 %199, %j.0.reg2mem41.0.i.i, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %201 = mul i32 %output.0.reg2mem.0.i.i, 363, !dbg !172 ; [#uses=1 type=i32] [debug line = 26:13]
  %202 = add nsw i32 %200, %201, !dbg !172        ; [#uses=1 type=i32] [debug line = 26:13]
  %gep_idx60.i.i = and i32 %202, 1073741823       ; [#uses=1 type=i32]
  %203 = getelementptr i32 addrspace(1)* %arg_Layer1_Weights_GPU.i.0, i32 %gep_idx60.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %204 = load i32 addrspace(1)* %203, align 4     ; [#uses=1 type=i32]
  %205 = bitcast i32 %204 to float                ; [#uses=1 type=float]
  %206 = fmul float %197, %205, !dbg !172         ; [#uses=1 type=float] [debug line = 26:13]
  %207 = fadd float %188, %206, !dbg !172         ; [#uses=1 type=float] [debug line = 26:13]
  %.reg2mem9.0.i.i = fadd float %product.1.reg2mem43.0.i.i, %207, !dbg !172 ; [#uses=1 type=float] [debug line = 26:13]
  %.reg2mem7.0.i.i = add nsw i32 %j.0.reg2mem41.0.i.i, 1, !dbg !174 ; [#uses=1 type=i32] [debug line = 24:32]
  br label %151, !dbg !174                        ; [debug line = 24:32]

; <label>:208                                     ; preds = %151
  %.reg2mem5.0.i.i = add nsw i32 %i.0.reg2mem45.0.i.i, 1, !dbg !175 ; [#uses=1 type=i32] [debug line = 22:28]
  br label %149, !dbg !175                        ; [debug line = 22:28]

._crit_edge.i.i:                                  ; preds = %149
  %gep_idx.i.i = and i32 %output.0.reg2mem.0.i.i, 1073741823 ; [#uses=1 type=i32]
  %209 = getelementptr i32 addrspace(1)* %arg_bias.i.0, i32 %gep_idx.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %210 = load i32 addrspace(1)* %209, align 4     ; [#uses=1 type=i32]
  %211 = bitcast i32 %210 to float                ; [#uses=1 type=float]
  %.reg2mem.0.i.i = fadd float %product.0.reg2mem47.0.i.i, %211, !dbg !176 ; [#uses=2 type=float] [debug line = 31:5]
  %212 = fcmp olt float %.reg2mem.0.i.i, 0.000000e+00, !dbg !177 ; [#uses=1 type=i1] [debug line = 32:5]
  %product.2.reg2mem.0.i.i = select i1 %212, float 0.000000e+00, float %.reg2mem.0.i.i, !dbg !177 ; [#uses=1 type=float] [debug line = 32:5]
  %213 = mul i32 %output.0.reg2mem.0.i.i, 3025, !dbg !178 ; [#uses=1 type=i32] [debug line = 34:5]
  %214 = mul nsw i32 %row.0.reg2mem.0.i.i, 55, !dbg !178 ; [#uses=1 type=i32] [debug line = 34:5]
  %215 = add nsw i32 %213, %214, !dbg !178        ; [#uses=1 type=i32] [debug line = 34:5]
  %216 = add nsw i32 %215, %col.0.reg2mem.0.i.i, !dbg !178 ; [#uses=1 type=i32] [debug line = 34:5]
  %gep_idx12.i.i = and i32 %216, 1073741823       ; [#uses=1 type=i32]
  %217 = getelementptr i32 addrspace(1)* %arg_Layer2_Neurons_GPU.i.0, i32 %gep_idx12.i.i ; [#uses=1 type=i32 addrspace(1)*]
  %val.i.i = bitcast float %product.2.reg2mem.0.i.i to i32 ; [#uses=1 type=i32]
  store i32 %val.i.i, i32 addrspace(1)* %217, align 4
  %indvar.inc.reg2mem.0.i.i = add i32 %indvar.reg2mem67.0.i.i, 1 ; [#uses=1 type=i32]
  %218 = call spir_func i32 (...)* @_ssdm_SpecLoopFlatten(i32 0, [1 x i8]* @str) nounwind ; [#uses=0 type=i32]
  %219 = add i32 %gtid.1.i.i, 1                   ; [#uses=1 type=i32]
  br label %for.header.i.i

__AESL_call_work_item_NA4.exit:                   ; preds = %for.header55.i.i
  %220 = bitcast [3 x i32]* %tid71.i.i to i8*, !dbg !179 ; [#uses=0 type=i8*] [debug line = 36:1]
  %221 = bitcast %struct.__spir_rt_info_tT.1* %.cast.i to i8*, !dbg !180 ; [#uses=0 type=i8*] [debug line = 55:3]
  ret void, !dbg !181                             ; [debug line = 75:1]
}

; [#uses=12]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.cu = !{!0, !13}
!hls.encrypted.func = !{}
!xcl.libspir = !{!87}
!xcl.reqd_rt_info = !{!88}
!xcl.portmap = !{!89, !91, !92, !93}
!axi4.master.portmap = !{!94}
!xcl.portlist = !{!90, !95}
!xcl.lmem_info = !{}
!xcl.progvar_info = !{}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"C:/Users/RA_prof_Jeon/siddharth/HLS/executeFirstLayer1_p4/solution1/.autopilot/db/executeFirstLayer1_p4.pragma.2.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"executeFirstLayer1_p4", metadata !"executeFirstLayer1_p4", metadata !"", metadata !6, i32 2, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !11, i32 4} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"executeFirstLayer1_p4/executeFirstLayer1_p4.cl", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{i32 786449, i32 0, i32 4, metadata !"aesl_gen-tmpA.cpp", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CexecuteFirstLayer1_p4\5Csolution1\5C.autopilot\5Cdb", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !14, metadata !83} ; [ DW_TAG_compile_unit ]
!14 = metadata !{metadata !15}
!15 = metadata !{metadata !16, metadata !78, metadata !81, metadata !82}
!16 = metadata !{i32 786478, i32 0, metadata !17, metadata !"__AESL_call_work_item_NA", metadata !"__AESL_call_work_item_NA", metadata !"", metadata !17, i32 48, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !11, i32 49} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 786473, metadata !"executeFirstLayer1_p4_compute_unit", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CexecuteFirstLayer1_p4\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!18 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{null, metadata !20, metadata !23, metadata !52}
!20 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ]
!21 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_volatile_type ]
!22 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!23 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ]
!24 = metadata !{i32 786454, null, metadata !"__spir_rt_info_t", metadata !17, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !25} ; [ DW_TAG_typedef ]
!25 = metadata !{i32 786434, null, metadata !"__spir_rt_info_tT", metadata !26, i32 120, i64 896, i64 64, i32 0, i32 0, null, metadata !27, i32 0, null, null} ; [ DW_TAG_class_type ]
!26 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl/libspir_types.h", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CexecuteFirstLayer1_p4\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!27 = metadata !{metadata !28, metadata !29, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !41, metadata !44, metadata !45, metadata !46, metadata !48}
!28 = metadata !{i32 786445, metadata !25, metadata !"work_dim", metadata !26, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_member ]
!29 = metadata !{i32 786445, metadata !25, metadata !"global_size", metadata !26, i32 124, i64 96, i64 32, i64 32, i32 0, metadata !30} ; [ DW_TAG_member ]
!30 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !22, metadata !31, i32 0, i32 0} ; [ DW_TAG_array_type ]
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!33 = metadata !{i32 786445, metadata !25, metadata !"global_id", metadata !26, i32 125, i64 96, i64 32, i64 128, i32 0, metadata !30} ; [ DW_TAG_member ]
!34 = metadata !{i32 786445, metadata !25, metadata !"local_size", metadata !26, i32 127, i64 96, i64 32, i64 224, i32 0, metadata !30} ; [ DW_TAG_member ]
!35 = metadata !{i32 786445, metadata !25, metadata !"local_id", metadata !26, i32 128, i64 96, i64 32, i64 320, i32 0, metadata !30} ; [ DW_TAG_member ]
!36 = metadata !{i32 786445, metadata !25, metadata !"num_groups", metadata !26, i32 130, i64 96, i64 32, i64 416, i32 0, metadata !30} ; [ DW_TAG_member ]
!37 = metadata !{i32 786445, metadata !25, metadata !"group_id", metadata !26, i32 131, i64 96, i64 32, i64 512, i32 0, metadata !30} ; [ DW_TAG_member ]
!38 = metadata !{i32 786445, metadata !25, metadata !"global_offset", metadata !26, i32 132, i64 96, i64 32, i64 608, i32 0, metadata !30} ; [ DW_TAG_member ]
!39 = metadata !{i32 786445, metadata !25, metadata !"pthread_barrier", metadata !26, i32 135, i64 32, i64 32, i64 704, i32 0, metadata !40} ; [ DW_TAG_member ]
!40 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!41 = metadata !{i32 786445, metadata !25, metadata !"barriertoscheduler", metadata !26, i32 138, i64 8, i64 8, i64 736, i32 0, metadata !42} ; [ DW_TAG_member ]
!42 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_volatile_type ]
!43 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!44 = metadata !{i32 786445, metadata !25, metadata !"scheduler_context", metadata !26, i32 139, i64 32, i64 32, i64 768, i32 0, metadata !40} ; [ DW_TAG_member ]
!45 = metadata !{i32 786445, metadata !25, metadata !"pe_context", metadata !26, i32 140, i64 32, i64 32, i64 800, i32 0, metadata !40} ; [ DW_TAG_member ]
!46 = metadata !{i32 786445, metadata !25, metadata !"printf_buffer", metadata !26, i32 142, i64 64, i64 64, i64 832, i32 0, metadata !47} ; [ DW_TAG_member ]
!47 = metadata !{i32 786468, null, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!48 = metadata !{i32 786478, i32 0, metadata !25, metadata !"__spir_rt_info_tT", metadata !"__spir_rt_info_tT", metadata !"", metadata !26, i32 120, metadata !49, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !11, i32 120} ; [ DW_TAG_subprogram ]
!49 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!50 = metadata !{null, metadata !51}
!51 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 32, i64 32, i64 0, i32 64, metadata !25} ; [ DW_TAG_pointer_type ]
!52 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ]
!53 = metadata !{i32 786454, null, metadata !"executeFirstLayer1_p4_args_t", metadata !17, i32 23, i64 0, i64 0, i64 0, i32 0, metadata !54} ; [ DW_TAG_typedef ]
!54 = metadata !{i32 786434, null, metadata !"", metadata !17, i32 17, i64 128, i64 32, i32 0, i32 0, null, metadata !55, i32 0, null, null} ; [ DW_TAG_class_type ]
!55 = metadata !{metadata !56, metadata !58, metadata !59, metadata !60, metadata !61}
!56 = metadata !{i32 786445, metadata !54, metadata !"bias", metadata !17, i32 18, i64 32, i64 32, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!57 = metadata !{i32 786454, null, metadata !"__spir_size_t", metadata !17, i32 108, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_typedef ]
!58 = metadata !{i32 786445, metadata !54, metadata !"Layer1_Neurons_GPU", metadata !17, i32 19, i64 32, i64 32, i64 32, i32 0, metadata !57} ; [ DW_TAG_member ]
!59 = metadata !{i32 786445, metadata !54, metadata !"Layer1_Weights_GPU", metadata !17, i32 20, i64 32, i64 32, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!60 = metadata !{i32 786445, metadata !54, metadata !"Layer2_Neurons_GPU", metadata !17, i32 21, i64 32, i64 32, i64 96, i32 0, metadata !57} ; [ DW_TAG_member ]
!61 = metadata !{i32 786474, metadata !54, null, metadata !17, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !62} ; [ DW_TAG_friend ]
!62 = metadata !{i32 786434, null, metadata !"aesl_keep_name_class", metadata !17, i32 25, i64 8, i64 8, i32 0, i32 0, null, metadata !63, i32 0, null, null} ; [ DW_TAG_class_type ]
!63 = metadata !{metadata !64, metadata !75}
!64 = metadata !{i32 786478, i32 0, metadata !62, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !17, i32 28, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !11, i32 28} ; [ DW_TAG_subprogram ]
!65 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!66 = metadata !{null, metadata !67}
!67 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !68} ; [ DW_TAG_pointer_type ]
!68 = metadata !{i32 786454, null, metadata !"three_tuple_t", metadata !17, i32 15, i64 0, i64 0, i64 0, i32 0, metadata !69} ; [ DW_TAG_typedef ]
!69 = metadata !{i32 786434, null, metadata !"", metadata !17, i32 10, i64 96, i64 32, i32 0, i32 0, null, metadata !70, i32 0, null, null} ; [ DW_TAG_class_type ]
!70 = metadata !{metadata !71, metadata !72, metadata !73, metadata !74}
!71 = metadata !{i32 786445, metadata !69, metadata !"x", metadata !17, i32 11, i64 32, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_member ]
!72 = metadata !{i32 786445, metadata !69, metadata !"y", metadata !17, i32 12, i64 32, i64 32, i64 32, i32 0, metadata !22} ; [ DW_TAG_member ]
!73 = metadata !{i32 786445, metadata !69, metadata !"z", metadata !17, i32 13, i64 32, i64 32, i64 64, i32 0, metadata !22} ; [ DW_TAG_member ]
!74 = metadata !{i32 786474, metadata !69, null, metadata !17, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !62} ; [ DW_TAG_friend ]
!75 = metadata !{i32 786478, i32 0, metadata !62, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP28executeFirstLayer1_p4_args_t", metadata !17, i32 34, metadata !76, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !11, i32 34} ; [ DW_TAG_subprogram ]
!76 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !77, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!77 = metadata !{null, metadata !52}
!78 = metadata !{i32 786478, i32 0, metadata !17, metadata !"__AESL_work_groupA", metadata !"__AESL_work_groupA", metadata !"", metadata !17, i32 59, metadata !79, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !11, i32 60} ; [ DW_TAG_subprogram ]
!79 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!80 = metadata !{null, metadata !20, metadata !67, metadata !52}
!81 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_args", metadata !"aesl_keep_name_0_args", metadata !"_ZN20aesl_keep_name_class21aesl_keep_name_0_argsEP28executeFirstLayer1_p4_args_t", metadata !17, i32 34, metadata !76, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !75, metadata !11, i32 34} ; [ DW_TAG_subprogram ]
!82 = metadata !{i32 786478, i32 0, null, metadata !"aesl_keep_name_0_group_id", metadata !"aesl_keep_name_0_group_id", metadata !"_ZN20aesl_keep_name_class25aesl_keep_name_0_group_idEP13three_tuple_t", metadata !17, i32 28, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !64, metadata !11, i32 28} ; [ DW_TAG_subprogram ]
!83 = metadata !{metadata !84}
!84 = metadata !{metadata !85}
!85 = metadata !{i32 786484, i32 0, metadata !78, metadata !"rt_info", metadata !"rt_info", metadata !"", metadata !86, i32 49, metadata !24, i32 1, i32 1, %struct.__spir_rt_info_tT.3* @rt_info} ; [ DW_TAG_variable ]
!86 = metadata !{i32 786473, metadata !"C:/Xilinx/Vivado_HLS/2016.4/common/technology/autopilot/opencl\5Caesl_gen_cu_body.inc", metadata !"C:\5CUsers\5CRA_prof_Jeon\5Csiddharth\5CHLS\5CexecuteFirstLayer1_p4\5Csolution1\5C.autopilot\5Cdb", null} ; [ DW_TAG_file_type ]
!87 = metadata !{metadata !"C:/Xilinx/Vivado_HLS/2016.4/win64/lib/libspir-hls.a"}
!88 = metadata !{metadata !"executeFirstLayer1_p4", metadata !"group_id"}
!89 = metadata !{metadata !"executeFirstLayer1_p4", i32 0, metadata !90}
!90 = metadata !{metadata !"executeFirstLayer1_p4", metadata !"gmem", metadata !"addressable", metadata !"master", i32 32}
!91 = metadata !{metadata !"executeFirstLayer1_p4", i32 1, metadata !90}
!92 = metadata !{metadata !"executeFirstLayer1_p4", i32 2, metadata !90}
!93 = metadata !{metadata !"executeFirstLayer1_p4", i32 3, metadata !90}
!94 = metadata !{metadata !"gmem", metadata !"bias", metadata !"", metadata !"Layer1_Neurons_GPU", metadata !"", metadata !"Layer1_Weights_GPU", metadata !"", metadata !"Layer2_Neurons_GPU", metadata !""}
!95 = metadata !{metadata !"executeFirstLayer1_p4", metadata !"control", metadata !"addressable", metadata !"slave", i32 32}
!96 = metadata !{i32 786689, metadata !78, metadata !"gmem", metadata !17, i32 16777275, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!97 = metadata !{i32 59, i32 84, metadata !78, null}
!98 = metadata !{i32 786689, metadata !78, metadata !"group_id", metadata !17, i32 33554491, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!99 = metadata !{i32 59, i32 105, metadata !78, null}
!100 = metadata !{i32 786689, metadata !78, metadata !"args", metadata !17, i32 50331707, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!101 = metadata !{i32 59, i32 145, metadata !78, null}
!102 = metadata !{i32 786689, metadata !82, metadata !"group_id", metadata !17, i32 16777244, metadata !67, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!103 = metadata !{i32 28, i32 44, metadata !82, metadata !104}
!104 = metadata !{i32 65, i32 1, metadata !105, null}
!105 = metadata !{i32 786443, metadata !78, i32 60, i32 1, metadata !17, i32 1} ; [ DW_TAG_lexical_block ]
!106 = metadata !{i32 29, i32 5, metadata !107, metadata !104}
!107 = metadata !{i32 786443, metadata !82, i32 28, i32 54, metadata !17, i32 3} ; [ DW_TAG_lexical_block ]
!108 = metadata !{i32 30, i32 5, metadata !107, metadata !104}
!109 = metadata !{i32 31, i32 5, metadata !107, metadata !104}
!110 = metadata !{i32 786689, metadata !81, metadata !"args", metadata !17, i32 16777250, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!111 = metadata !{i32 34, i32 55, metadata !81, metadata !112}
!112 = metadata !{i32 66, i32 1, metadata !105, null}
!113 = metadata !{i32 35, i32 5, metadata !114, metadata !112}
!114 = metadata !{i32 786443, metadata !81, i32 34, i32 61, metadata !17, i32 2} ; [ DW_TAG_lexical_block ]
!115 = metadata !{i32 36, i32 5, metadata !114, metadata !112}
!116 = metadata !{i32 37, i32 5, metadata !114, metadata !112}
!117 = metadata !{i32 38, i32 5, metadata !114, metadata !112}
!118 = metadata !{i32 67, i32 1, metadata !105, null}
!119 = metadata !{i32 68, i32 1, metadata !105, null}
!120 = metadata !{i32 69, i32 1, metadata !105, null}
!121 = metadata !{i32 70, i32 1, metadata !105, null}
!122 = metadata !{i32 46, i32 3, metadata !123, null}
!123 = metadata !{i32 786443, metadata !105, metadata !86} ; [ DW_TAG_lexical_block ]
!124 = metadata !{i32 54, i32 3, metadata !123, null}
!125 = metadata !{i32 63, i32 3, metadata !123, null}
!126 = metadata !{i32 64, i32 3, metadata !123, null}
!127 = metadata !{i32 65, i32 3, metadata !123, null}
!128 = metadata !{i32 70, i32 3, metadata !123, null}
!129 = metadata !{i32 79, i32 3, metadata !123, null}
!130 = metadata !{i32 88, i32 3, metadata !123, null}
!131 = metadata !{i32 103, i32 3, metadata !123, null}
!132 = metadata !{i32 104, i32 3, metadata !123, null}
!133 = metadata !{i32 105, i32 3, metadata !123, null}
!134 = metadata !{i32 114, i32 3, metadata !123, null}
!135 = metadata !{i32 115, i32 3, metadata !123, null}
!136 = metadata !{i32 116, i32 3, metadata !123, null}
!137 = metadata !{i32 121, i32 3, metadata !123, null}
!138 = metadata !{i32 122, i32 3, metadata !123, null}
!139 = metadata !{i32 123, i32 3, metadata !123, null}
!140 = metadata !{i32 136, i32 3, metadata !123, null}
!141 = metadata !{i32 137, i32 3, metadata !123, null}
!142 = metadata !{i32 138, i32 3, metadata !123, null}
!143 = metadata !{i32 147, i32 3, metadata !123, null}
!144 = metadata !{i32 148, i32 3, metadata !123, null}
!145 = metadata !{i32 149, i32 3, metadata !123, null}
!146 = metadata !{i32 786689, metadata !16, metadata !"gmem", metadata !17, i32 16777264, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!147 = metadata !{i32 48, i32 90, metadata !16, null}
!148 = metadata !{%struct.__spir_rt_info_tT.3* @rt_info}
!149 = metadata !{i32 786689, metadata !16, metadata !"rt_info", metadata !17, i32 33554480, metadata !23, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!150 = metadata !{i32 48, i32 114, metadata !16, null}
!151 = metadata !{i32 786689, metadata !16, metadata !"args", metadata !17, i32 50331696, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!152 = metadata !{i32 48, i32 153, metadata !16, null}
!153 = metadata !{i32 50, i32 116, metadata !154, null}
!154 = metadata !{i32 786443, metadata !16, i32 49, i32 1, metadata !17, i32 0} ; [ DW_TAG_lexical_block ]
!155 = metadata !{i32 786688, metadata !154, metadata !"arg_bias", metadata !17, i32 50, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!156 = metadata !{i32 51, i32 144, metadata !154, null}
!157 = metadata !{i32 786688, metadata !154, metadata !"arg_Layer1_Neurons_GPU", metadata !17, i32 51, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!158 = metadata !{i32 52, i32 144, metadata !154, null}
!159 = metadata !{i32 786688, metadata !154, metadata !"arg_Layer1_Weights_GPU", metadata !17, i32 52, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!160 = metadata !{i32 53, i32 144, metadata !154, null}
!161 = metadata !{i32 786688, metadata !154, metadata !"arg_Layer2_Neurons_GPU", metadata !17, i32 53, metadata !20, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!162 = metadata !{i32 14, i32 15, metadata !163, null}
!163 = metadata !{i32 786443, metadata !5, i32 4, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!164 = metadata !{i32 15, i32 15, metadata !163, null}
!165 = metadata !{i32 17, i32 5, metadata !163, null}
!166 = metadata !{i32 20, i32 5, metadata !163, null}
!167 = metadata !{i32 22, i32 18, metadata !168, null}
!168 = metadata !{i32 786443, metadata !163, i32 22, i32 5, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!169 = metadata !{i32 24, i32 22, metadata !170, null}
!170 = metadata !{i32 786443, metadata !171, i32 24, i32 9, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!171 = metadata !{i32 786443, metadata !168, i32 23, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!172 = metadata !{i32 26, i32 13, metadata !173, null}
!173 = metadata !{i32 786443, metadata !170, i32 25, i32 9, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!174 = metadata !{i32 24, i32 32, metadata !170, null}
!175 = metadata !{i32 22, i32 28, metadata !168, null}
!176 = metadata !{i32 31, i32 5, metadata !163, null}
!177 = metadata !{i32 32, i32 5, metadata !163, null}
!178 = metadata !{i32 34, i32 5, metadata !163, null}
!179 = metadata !{i32 36, i32 1, metadata !163, null}
!180 = metadata !{i32 55, i32 3, metadata !154, null}
!181 = metadata !{i32 75, i32 1, metadata !182, null}
!182 = metadata !{i32 786443, metadata !105, metadata !17} ; [ DW_TAG_lexical_block ]
