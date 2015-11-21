module Parser (  
      -- * Funciones exportadas.
      -- ** Analizador Sintáctico con Análisis de Contexto Estático.
      parser 

) where
  
import Lexer
import Abstract
import qualified Data.Map as TS

-- parser produced by Happy Version 1.17

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20
	= HappyTerminal Token
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20

action_0 (24) = happyShift action_3
action_0 (38) = happyShift action_4
action_0 (66) = happyShift action_5
action_0 (4) = happyGoto action_6
action_0 _ = happyFail

action_1 (24) = happyShift action_3
action_1 (38) = happyShift action_4
action_1 (66) = happyShift action_5
action_1 (4) = happyGoto action_2
action_1 _ = happyFail

action_2 (24) = happyShift action_7
action_2 (38) = happyShift action_8
action_2 (66) = happyShift action_9
action_2 _ = happyFail

action_3 (68) = happyShift action_12
action_3 _ = happyFail

action_4 (68) = happyShift action_11
action_4 _ = happyFail

action_5 (68) = happyShift action_10
action_5 _ = happyFail

action_6 (24) = happyShift action_7
action_6 (38) = happyShift action_8
action_6 (66) = happyShift action_9
action_6 (69) = happyAccept
action_6 _ = happyFail

action_7 (68) = happyShift action_37
action_7 _ = happyFail

action_8 (68) = happyShift action_36
action_8 _ = happyFail

action_9 (68) = happyShift action_35
action_9 _ = happyFail

action_10 (67) = happyShift action_34
action_10 _ = happyFail

action_11 (40) = happyShift action_24
action_11 (43) = happyShift action_25
action_11 (45) = happyShift action_26
action_11 (47) = happyShift action_27
action_11 (49) = happyShift action_28
action_11 (50) = happyShift action_29
action_11 (51) = happyShift action_30
action_11 (52) = happyShift action_31
action_11 (53) = happyShift action_32
action_11 (68) = happyShift action_33
action_11 (17) = happyGoto action_22
action_11 (18) = happyGoto action_23
action_11 _ = happyFail

action_12 (26) = happyShift action_18
action_12 (27) = happyShift action_19
action_12 (30) = happyShift action_20
action_12 (32) = happyShift action_21
action_12 (5) = happyGoto action_13
action_12 (6) = happyGoto action_14
action_12 (7) = happyGoto action_15
action_12 (8) = happyGoto action_16
action_12 (9) = happyGoto action_17
action_12 _ = happyFail

action_13 (25) = happyShift action_80
action_13 (27) = happyShift action_19
action_13 (30) = happyShift action_20
action_13 (9) = happyGoto action_79
action_13 _ = happyFail

action_14 (26) = happyShift action_78
action_14 (27) = happyShift action_19
action_14 (30) = happyShift action_20
action_14 (9) = happyGoto action_77
action_14 _ = happyFail

action_15 (27) = happyShift action_19
action_15 (30) = happyShift action_20
action_15 (32) = happyShift action_76
action_15 (9) = happyGoto action_75
action_15 _ = happyFail

action_16 (26) = happyShift action_73
action_16 (27) = happyShift action_19
action_16 (30) = happyShift action_20
action_16 (32) = happyShift action_74
action_16 (9) = happyGoto action_72
action_16 _ = happyFail

action_17 _ = happyReduce_17

action_18 (23) = happyShift action_60
action_18 (10) = happyGoto action_71
action_18 _ = happyFail

action_19 (34) = happyShift action_67
action_19 (35) = happyShift action_68
action_19 (36) = happyShift action_69
action_19 (37) = happyShift action_70
action_19 (12) = happyGoto action_64
action_19 (13) = happyGoto action_65
action_19 (14) = happyGoto action_66
action_19 _ = happyFail

action_20 (23) = happyShift action_63
action_20 (15) = happyGoto action_61
action_20 (16) = happyGoto action_62
action_20 _ = happyFail

action_21 (23) = happyShift action_60
action_21 (10) = happyGoto action_59
action_21 _ = happyFail

action_22 (39) = happyShift action_58
action_22 _ = happyFail

action_23 (42) = happyShift action_57
action_23 _ = happyReduce_33

action_24 (54) = happyShift action_45
action_24 (55) = happyShift action_46
action_24 (56) = happyShift action_47
action_24 (57) = happyShift action_48
action_24 (58) = happyShift action_49
action_24 (59) = happyShift action_50
action_24 (60) = happyShift action_51
action_24 (61) = happyShift action_52
action_24 (62) = happyShift action_53
action_24 (63) = happyShift action_54
action_24 (20) = happyGoto action_56
action_24 _ = happyFail

action_25 (23) = happyShift action_55
action_25 _ = happyFail

action_26 (54) = happyShift action_45
action_26 (55) = happyShift action_46
action_26 (56) = happyShift action_47
action_26 (57) = happyShift action_48
action_26 (58) = happyShift action_49
action_26 (59) = happyShift action_50
action_26 (60) = happyShift action_51
action_26 (61) = happyShift action_52
action_26 (62) = happyShift action_53
action_26 (63) = happyShift action_54
action_26 (20) = happyGoto action_44
action_26 _ = happyFail

action_27 (40) = happyShift action_24
action_27 (43) = happyShift action_25
action_27 (45) = happyShift action_26
action_27 (47) = happyShift action_27
action_27 (49) = happyShift action_28
action_27 (50) = happyShift action_29
action_27 (51) = happyShift action_30
action_27 (52) = happyShift action_31
action_27 (53) = happyShift action_32
action_27 (68) = happyShift action_33
action_27 (17) = happyGoto action_42
action_27 (18) = happyGoto action_23
action_27 (19) = happyGoto action_43
action_27 _ = happyFail

action_28 _ = happyReduce_37

action_29 _ = happyReduce_38

action_30 _ = happyReduce_39

action_31 _ = happyReduce_40

action_32 _ = happyReduce_41

action_33 _ = happyReduce_42

action_34 (40) = happyShift action_24
action_34 (43) = happyShift action_25
action_34 (45) = happyShift action_26
action_34 (47) = happyShift action_27
action_34 (49) = happyShift action_28
action_34 (50) = happyShift action_29
action_34 (51) = happyShift action_30
action_34 (52) = happyShift action_31
action_34 (53) = happyShift action_32
action_34 (68) = happyShift action_33
action_34 (17) = happyGoto action_41
action_34 (18) = happyGoto action_23
action_34 _ = happyFail

action_35 (67) = happyShift action_40
action_35 _ = happyFail

action_36 (40) = happyShift action_24
action_36 (43) = happyShift action_25
action_36 (45) = happyShift action_26
action_36 (47) = happyShift action_27
action_36 (49) = happyShift action_28
action_36 (50) = happyShift action_29
action_36 (51) = happyShift action_30
action_36 (52) = happyShift action_31
action_36 (53) = happyShift action_32
action_36 (68) = happyShift action_33
action_36 (17) = happyGoto action_39
action_36 (18) = happyGoto action_23
action_36 _ = happyFail

action_37 (26) = happyShift action_18
action_37 (27) = happyShift action_19
action_37 (30) = happyShift action_20
action_37 (32) = happyShift action_21
action_37 (5) = happyGoto action_38
action_37 (6) = happyGoto action_14
action_37 (7) = happyGoto action_15
action_37 (8) = happyGoto action_16
action_37 (9) = happyGoto action_17
action_37 _ = happyFail

action_38 (25) = happyShift action_103
action_38 (27) = happyShift action_19
action_38 (30) = happyShift action_20
action_38 (9) = happyGoto action_79
action_38 _ = happyFail

action_39 (39) = happyShift action_102
action_39 _ = happyFail

action_40 (40) = happyShift action_24
action_40 (43) = happyShift action_25
action_40 (45) = happyShift action_26
action_40 (47) = happyShift action_27
action_40 (49) = happyShift action_28
action_40 (50) = happyShift action_29
action_40 (51) = happyShift action_30
action_40 (52) = happyShift action_31
action_40 (53) = happyShift action_32
action_40 (68) = happyShift action_33
action_40 (17) = happyGoto action_101
action_40 (18) = happyGoto action_23
action_40 _ = happyFail

action_41 _ = happyReduce_5

action_42 _ = happyReduce_45

action_43 (21) = happyShift action_99
action_43 (48) = happyShift action_100
action_43 _ = happyFail

action_44 (46) = happyShift action_98
action_44 (64) = happyShift action_94
action_44 (65) = happyShift action_95
action_44 _ = happyFail

action_45 _ = happyReduce_49

action_46 _ = happyReduce_50

action_47 _ = happyReduce_51

action_48 _ = happyReduce_52

action_49 _ = happyReduce_54

action_50 _ = happyReduce_55

action_51 _ = happyReduce_53

action_52 _ = happyReduce_56

action_53 _ = happyReduce_57

action_54 (54) = happyShift action_45
action_54 (55) = happyShift action_46
action_54 (56) = happyShift action_47
action_54 (57) = happyShift action_48
action_54 (58) = happyShift action_49
action_54 (59) = happyShift action_50
action_54 (60) = happyShift action_51
action_54 (61) = happyShift action_52
action_54 (62) = happyShift action_53
action_54 (63) = happyShift action_54
action_54 (20) = happyGoto action_97
action_54 _ = happyFail

action_55 (44) = happyShift action_96
action_55 _ = happyFail

action_56 (41) = happyShift action_93
action_56 (64) = happyShift action_94
action_56 (65) = happyShift action_95
action_56 _ = happyFail

action_57 (40) = happyShift action_24
action_57 (43) = happyShift action_25
action_57 (45) = happyShift action_26
action_57 (47) = happyShift action_27
action_57 (49) = happyShift action_28
action_57 (50) = happyShift action_29
action_57 (51) = happyShift action_30
action_57 (52) = happyShift action_31
action_57 (53) = happyShift action_32
action_57 (68) = happyShift action_33
action_57 (17) = happyGoto action_92
action_57 (18) = happyGoto action_23
action_57 _ = happyFail

action_58 _ = happyReduce_6

action_59 (23) = happyShift action_86
action_59 (11) = happyGoto action_91
action_59 _ = happyFail

action_60 _ = happyReduce_20

action_61 (22) = happyShift action_90
action_61 _ = happyReduce_19

action_62 _ = happyReduce_30

action_63 (31) = happyShift action_89
action_63 _ = happyFail

action_64 (28) = happyShift action_88
action_64 _ = happyFail

action_65 (22) = happyShift action_87
action_65 _ = happyReduce_18

action_66 _ = happyReduce_27

action_67 _ = happyReduce_22

action_68 _ = happyReduce_23

action_69 _ = happyReduce_24

action_70 _ = happyReduce_25

action_71 (23) = happyShift action_86
action_71 (11) = happyGoto action_85
action_71 _ = happyFail

action_72 _ = happyReduce_16

action_73 (23) = happyShift action_60
action_73 (10) = happyGoto action_84
action_73 _ = happyFail

action_74 (23) = happyShift action_60
action_74 (10) = happyGoto action_83
action_74 _ = happyFail

action_75 _ = happyReduce_14

action_76 (23) = happyShift action_60
action_76 (10) = happyGoto action_82
action_76 _ = happyFail

action_77 _ = happyReduce_11

action_78 (23) = happyShift action_60
action_78 (10) = happyGoto action_81
action_78 _ = happyFail

action_79 _ = happyReduce_9

action_80 _ = happyReduce_4

action_81 (23) = happyShift action_86
action_81 (11) = happyGoto action_118
action_81 _ = happyFail

action_82 (23) = happyShift action_86
action_82 (11) = happyGoto action_117
action_82 _ = happyFail

action_83 (23) = happyShift action_86
action_83 (11) = happyGoto action_116
action_83 _ = happyFail

action_84 (23) = happyShift action_86
action_84 (11) = happyGoto action_115
action_84 _ = happyFail

action_85 _ = happyReduce_15

action_86 _ = happyReduce_21

action_87 (34) = happyShift action_67
action_87 (35) = happyShift action_68
action_87 (36) = happyShift action_69
action_87 (37) = happyShift action_70
action_87 (12) = happyGoto action_64
action_87 (14) = happyGoto action_114
action_87 _ = happyFail

action_88 (23) = happyShift action_60
action_88 (10) = happyGoto action_113
action_88 _ = happyFail

action_89 (23) = happyShift action_60
action_89 (10) = happyGoto action_112
action_89 _ = happyFail

action_90 (23) = happyShift action_63
action_90 (16) = happyGoto action_111
action_90 _ = happyFail

action_91 (33) = happyShift action_110
action_91 _ = happyFail

action_92 _ = happyReduce_34

action_93 (40) = happyShift action_24
action_93 (43) = happyShift action_25
action_93 (45) = happyShift action_26
action_93 (47) = happyShift action_27
action_93 (49) = happyShift action_28
action_93 (50) = happyShift action_29
action_93 (51) = happyShift action_30
action_93 (52) = happyShift action_31
action_93 (53) = happyShift action_32
action_93 (68) = happyShift action_33
action_93 (17) = happyGoto action_109
action_93 (18) = happyGoto action_23
action_93 _ = happyFail

action_94 (54) = happyShift action_45
action_94 (55) = happyShift action_46
action_94 (56) = happyShift action_47
action_94 (57) = happyShift action_48
action_94 (58) = happyShift action_49
action_94 (59) = happyShift action_50
action_94 (60) = happyShift action_51
action_94 (61) = happyShift action_52
action_94 (62) = happyShift action_53
action_94 (63) = happyShift action_54
action_94 (20) = happyGoto action_108
action_94 _ = happyFail

action_95 (54) = happyShift action_45
action_95 (55) = happyShift action_46
action_95 (56) = happyShift action_47
action_95 (57) = happyShift action_48
action_95 (58) = happyShift action_49
action_95 (59) = happyShift action_50
action_95 (60) = happyShift action_51
action_95 (61) = happyShift action_52
action_95 (62) = happyShift action_53
action_95 (63) = happyShift action_54
action_95 (20) = happyGoto action_107
action_95 _ = happyFail

action_96 (40) = happyShift action_24
action_96 (43) = happyShift action_25
action_96 (45) = happyShift action_26
action_96 (47) = happyShift action_27
action_96 (49) = happyShift action_28
action_96 (50) = happyShift action_29
action_96 (51) = happyShift action_30
action_96 (52) = happyShift action_31
action_96 (53) = happyShift action_32
action_96 (68) = happyShift action_33
action_96 (17) = happyGoto action_106
action_96 (18) = happyGoto action_23
action_96 _ = happyFail

action_97 _ = happyReduce_48

action_98 (40) = happyShift action_24
action_98 (43) = happyShift action_25
action_98 (45) = happyShift action_26
action_98 (47) = happyShift action_27
action_98 (49) = happyShift action_28
action_98 (50) = happyShift action_29
action_98 (51) = happyShift action_30
action_98 (52) = happyShift action_31
action_98 (53) = happyShift action_32
action_98 (68) = happyShift action_33
action_98 (17) = happyGoto action_105
action_98 (18) = happyGoto action_23
action_98 _ = happyFail

action_99 (40) = happyShift action_24
action_99 (43) = happyShift action_25
action_99 (45) = happyShift action_26
action_99 (47) = happyShift action_27
action_99 (49) = happyShift action_28
action_99 (50) = happyShift action_29
action_99 (51) = happyShift action_30
action_99 (52) = happyShift action_31
action_99 (53) = happyShift action_32
action_99 (68) = happyShift action_33
action_99 (17) = happyGoto action_104
action_99 (18) = happyGoto action_23
action_99 _ = happyFail

action_100 _ = happyReduce_32

action_101 _ = happyReduce_2

action_102 _ = happyReduce_3

action_103 _ = happyReduce_1

action_104 _ = happyReduce_44

action_105 _ = happyReduce_36

action_106 _ = happyReduce_35

action_107 (64) = happyShift action_94
action_107 _ = happyReduce_46

action_108 _ = happyReduce_47

action_109 _ = happyReduce_43

action_110 (34) = happyShift action_67
action_110 (35) = happyShift action_68
action_110 (36) = happyShift action_69
action_110 (37) = happyShift action_70
action_110 (12) = happyGoto action_123
action_110 _ = happyFail

action_111 _ = happyReduce_29

action_112 (23) = happyShift action_86
action_112 (11) = happyGoto action_122
action_112 _ = happyFail

action_113 (23) = happyShift action_86
action_113 (11) = happyGoto action_121
action_113 _ = happyFail

action_114 _ = happyReduce_26

action_115 _ = happyReduce_13

action_116 (33) = happyShift action_120
action_116 _ = happyFail

action_117 (33) = happyShift action_119
action_117 _ = happyFail

action_118 _ = happyReduce_7

action_119 (34) = happyShift action_67
action_119 (35) = happyShift action_68
action_119 (36) = happyShift action_69
action_119 (37) = happyShift action_70
action_119 (12) = happyGoto action_126
action_119 _ = happyFail

action_120 (34) = happyShift action_67
action_120 (35) = happyShift action_68
action_120 (36) = happyShift action_69
action_120 (37) = happyShift action_70
action_120 (12) = happyGoto action_125
action_120 _ = happyFail

action_121 (29) = happyShift action_124
action_121 _ = happyFail

action_122 _ = happyReduce_31

action_123 _ = happyReduce_12

action_124 (23) = happyShift action_60
action_124 (10) = happyGoto action_127
action_124 _ = happyFail

action_125 _ = happyReduce_10

action_126 _ = happyReduce_8

action_127 (23) = happyShift action_86
action_127 (11) = happyGoto action_128
action_127 _ = happyFail

action_128 _ = happyReduce_28

happyReduce_1 = happyReduce 5 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (insertIdMundo (toString happy_var_3) happy_var_4 happy_var_1
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 5 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (insertIdProc (toString happy_var_3) happy_var_5 happy_var_1
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 5 4 happyReduction_3
happyReduction_3 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (checkIdWork (toString happy_var_3) happy_var_1
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (insertIdMundo (toString happy_var_2) happy_var_3 TS.empty
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 ((HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (insertIdProc (toString happy_var_2) happy_var_4 TS.empty
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 4 happyReduction_6
happyReduction_6 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (checkIdWork (toString happy_var_2) TS.empty
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 5 happyReduction_7
happyReduction_7 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (World1 happy_var_3 happy_var_4 happy_var_1
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 6 5 happyReduction_8
happyReduction_8 ((HappyAbsSyn12  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Startat1 happy_var_3 happy_var_4 happy_var_6 happy_var_1
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_2  5 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (WallorPlace1 happy_var_2 happy_var_1
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 6 6 happyReduction_10
happyReduction_10 ((HappyAbsSyn12  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Startat2 happy_var_3 happy_var_4 happy_var_6 happy_var_1
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_2  6 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (SeenWorld happy_var_2 happy_var_1
	)
happyReduction_11 _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 5 6 happyReduction_12
happyReduction_12 ((HappyAbsSyn12  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Startat3 happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 7 happyReduction_13
happyReduction_13 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (World2 happy_var_3 happy_var_4 happy_var_1
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_2  7 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (SeenStart happy_var_2 happy_var_1
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  7 happyReduction_15
happyReduction_15 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (World3 happy_var_2 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  8 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (SeenStartandWorld happy_var_2 happy_var_1
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  8 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (WallorPlace2 happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  9 happyReduction_18
happyReduction_18 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Wall happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  9 happyReduction_19
happyReduction_19 (HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Garbage happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  10 happyReduction_20
happyReduction_20 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (EjeX (toInt happy_var_1)
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (EjeY (toInt happy_var_1)
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  12 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn12
		 (North
	)

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn12
		 (South
	)

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn12
		 (East
	)

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn12
		 (West
	)

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happyReduce 7 14 happyReduction_28
happyReduction_28 ((HappyAbsSyn11  happy_var_7) `HappyStk`
	(HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Wall1 happy_var_1 happy_var_3 happy_var_4 happy_var_6 happy_var_7
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_3  15 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  15 happyReduction_30
happyReduction_30 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 ([happy_var_1]
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happyReduce 4 16 happyReduction_31
happyReduction_31 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Garbage1 (toInt happy_var_1) happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_3  17 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (Begin happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  17 happyReduction_33
happyReduction_33 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (NoElse happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  17 happyReduction_34
happyReduction_34 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (Else happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 4 17 happyReduction_35
happyReduction_35 ((HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Repeat (toInt happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 4 17 happyReduction_36
happyReduction_36 ((HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (While happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_1  17 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn17
		 (Move
	)

happyReduce_38 = happySpecReduce_1  17 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn17
		 (Turnleft
	)

happyReduce_39 = happySpecReduce_1  17 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn17
		 (Picktrash
	)

happyReduce_40 = happySpecReduce_1  17 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn17
		 (Droptrash
	)

happyReduce_41 = happySpecReduce_1  17 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn17
		 (Shutdown
	)

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn17
		 (IdProc (toString happy_var_1)
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happyReduce 4 18 happyReduction_43
happyReduction_43 ((HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (IfThen happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_3  19 happyReduction_44
happyReduction_44 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  19 happyReduction_45
happyReduction_45 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn19
		 ([happy_var_1]
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  20 happyReduction_46
happyReduction_46 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (Or happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  20 happyReduction_47
happyReduction_47 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (And happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  20 happyReduction_48
happyReduction_48 (HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (Not happy_var_2
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  20 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn20
		 (Frontisclear
	)

happyReduce_50 = happySpecReduce_1  20 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn20
		 (Leftisclear
	)

happyReduce_51 = happySpecReduce_1  20 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn20
		 (Rightisclear
	)

happyReduce_52 = happySpecReduce_1  20 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn20
		 (Lookingnorth
	)

happyReduce_53 = happySpecReduce_1  20 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn20
		 (Lookingsouth
	)

happyReduce_54 = happySpecReduce_1  20 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn20
		 (Lookingeast
	)

happyReduce_55 = happySpecReduce_1  20 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn20
		 (Lookingwest
	)

happyReduce_56 = happySpecReduce_1  20 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn20
		 (Foundtrash
	)

happyReduce_57 = happySpecReduce_1  20 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn20
		 (Carryingtrash
	)

happyNewToken action sts stk [] =
	action 69 69 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TkPuntoyComa p -> cont 21;
	TkComa p -> cont 22;
	TkNum p s -> cont 23;
	Tkbeginworld p -> cont 24;
	Tkendworld p -> cont 25;
	TkWorld p -> cont 26;
	TkWall p -> cont 27;
	Tkof p -> cont 28;
	Tkto p -> cont 29;
	TkPlace p -> cont 30;
	Tkgarbage p -> cont 31;
	Tkstart p -> cont 32;
	Tkheading p -> cont 33;
	Tknorth p -> cont 34;
	Tksouth p -> cont 35;
	Tkeast p -> cont 36;
	Tkwest p -> cont 37;
	Tkbeginwork p -> cont 38;
	Tkendwork p -> cont 39;
	Tkif p -> cont 40;
	Tkthen p -> cont 41;
	Tkelse p -> cont 42;
	Tkrepeat p -> cont 43;
	Tktimes p -> cont 44;
	Tkwhile p -> cont 45;
	Tkdo p -> cont 46;
	Tkbegin p -> cont 47;
	Tkend p -> cont 48;
	Tkmove p -> cont 49;
	Tkturnleft p -> cont 50;
	Tkpicktrash p -> cont 51;
	Tkdroptrash p -> cont 52;
	Tkshutdown p -> cont 53;
	Tkfrontisclear p -> cont 54;
	Tkleftisclear p -> cont 55;
	Tkrightisclear p -> cont 56;
	Tklookingnorth p -> cont 57;
	Tklookingeast p -> cont 58;
	Tklookingwest p -> cont 59;
	Tklookingsouth p -> cont 60;
	Tkfoundtrash p -> cont 61;
	Tkcarryingtrash p -> cont 62;
	Tknot p -> cont 63;
	Tkand p -> cont 64;
	Tkor p -> cont 65;
	Tkdefineinstruction p -> cont 66;
	Tkas p -> cont 67;
	TkId p s -> cont 68;
	_ -> happyError' (tk:tks)
	}

happyError_ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [Token] -> HappyIdentity a
happyError' = HappyIdentity . parserError

parser tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


{-
	La funcion @insertIdMundo@ permite agregar un identificador del Mundo
	a la tabla de simbolos. Recibe el String que representa el identificador,
	un tipo de dato WORLD y la tabla de simbolos. Retorna la tabla de simbolos
	con el nuevo identificador. En caso de que el identificador exista, 
	la funcion retorna un mensaje de error, indicando que el identificador 
	ya fue declarado
-}

insertIdMundo :: String -> WORLD -> TS.Map String Symbol -> TS.Map String Symbol
insertIdMundo id w t  =
	if TS.member id t
	then error ("Error: Variable " ++ id ++ " ha sido redefinida!")
	else TS.insert id (Just w,Nothing) t		

{-
     La funcion @insertIdProc@ permite insertar un identificador de un
     procedimiento. Recibe un String que represente al identificador,
     un tipo de dato INSTRUCTION y la tabla de simbolos. Retorna la 
     tabla de simbolos con el nuevo identificador. En caso de que el
     identificador exista, la funcion retorna un mensaje de error, 
     indicando que el identificador ya fue declarado

-}
insertIdProc :: String -> INSTRUCTION -> TS.Map String Symbol -> TS.Map String Symbol
insertIdProc id inst t  =
	if TS.member id t
	then error ("Error: Variable " ++ id ++ " ha sido redefinida!")
	else TS.insert id (Nothing,Just inst) t

{-
     La funcion @checkIdWork@ permite verificar si un identificador de un
     Mundo existe ya declarado en la tabla de simbolos. 
     Recibe un String que represente al identificador, y la tabla de simbolos. 
     Retorna la misma tabla de simbolos. En caso de que el
     identificador ya exista, la funcion retorna un mensaje de error, 
     indicando que el identificador del Mundo no ha sido declarado aun.

-}	
checkIdWork :: String -> TS.Map String Symbol -> TS.Map String Symbol
checkIdWork id t =
    if TS.member id t 
    then t
    else error ("Error: La variable "++ id ++" no ha sido declarada!")

{-
     La funcion @checkIdInst@ permite verificar si un identificador de un
     Procedimiento existe ya declarado en la tabla de simbolos. 
     Recibe un String que represente al identificador, y la tabla de simbolos. 
     Retorna la misma tabla de simbolos. En caso de que el
     identificador ya exista, la funcion retorna un mensaje de error, 
     indicando que el identificador del Procedimiento no ha sido declarado aun.

-}   
checkIdInst :: String -> TS.Map String Symbol -> TS.Map String Symbol
checkIdInst id t =
    if TS.member id t 
    then t
    else error ("Error: La variable "++ id ++" no ha sido declarada!")

{-
     La funcion @toString@ permite convertir un Token en un String.
     Recibe el tipo Token y devuelve el String correspondiente

-}
toString :: Token -> String
toString (TkId p s) = s

{-
     La funcion @toInt@ permite convertir un Token en un Int.
     Recibe el tipo Token y devuelve el Int correspondiente

-}
toInt :: Token -> Int
toInt (TkNum p s) = s	

{-
     La funcion @parserError@ indica cuando en el programa escrito
     existe un error de sintaxis. Es decir, que la utilizacion de los
     tokens, o palabras reservadas no estan en un orden correcto, de
     acuerdo con las especificaciones del lenguaje.

-}
parserError :: [Token] -> a
parserError (t:ts) = error $ 
                       "Error de sintaxis en el Token " ++ (show t) ++ "\n"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 28 "templates/GenericTemplate.hs" #-}








{-# LINE 49 "templates/GenericTemplate.hs" #-}

{-# LINE 59 "templates/GenericTemplate.hs" #-}

{-# LINE 68 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where sts1@(((st1@(HappyState (action))):(_))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where sts1@(((st1@(HappyState (action))):(_))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk





             new_state = action


happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 253 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail  (1) tk old_st _ stk =
--	trace "failing" $ 
    	happyError_ tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 317 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
