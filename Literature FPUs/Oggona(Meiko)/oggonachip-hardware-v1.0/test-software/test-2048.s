! Test program for debug mdct core
	
        .data

bitrev: .word 4088,0,2040,2048,3064,1024,1016,3072,3576,512,1528,2560,2552,1536,504,3584,3832,256,1784,2304,2808,1280,760,3328,3320,768,1272,2816,2296,1792,248,3840,3960,128,1912,2176,2936,1152,888,3200,3448,640,1400,2688,2424,1664,376,3712,3704,384,1656,2432,2680,1408,632,3456,3192,896,1144,2944,2168,1920,120,3968,4024,64,1976,2112,3000,1088,952,3136,3512,576,1464,2624,2488,1600,440,3648,3768,320,1720,2368,2744,1344,696,3392,3256,832,1208,2880,2232,1856,184,3904,3896,192,1848,2240,2872,1216,824,3264,3384,704,1336,2752,2360,1728,312,3776,3640,448,1592,2496,2616,1472,568,3520,3128,960,1080,3008,2104,1984,56,4032,4056,32,2008,2080,3032,1056,984,3104,3544,544,1496,2592,2520,1568,472,3616,3800,288,1752,2336,2776,1312,728,3360,3288,800,1240,2848,2264,1824,216,3872,3928,160,1880,2208,2904,1184,856,3232,3416,672,1368,2720,2392,1696,344,3744,3672,416,1624,2464,2648,1440,600,3488,3160,928,1112,2976,2136,1952,88,4000,3992,96,1944,2144,2968,1120,920,3168,3480,608,1432,2656,2456,1632,408,3680,3736,352,1688,2400,2712,1376,664,3424,3224,864,1176,2912,2200,1888,152,3936,3864,224,1816,2272,2840,1248,792,3296,3352,736,1304,2784,2328,1760,280,3808,3608,480,1560,2528,2584,1504,536,3552,3096,992,1048,3040,2072,2016,24,4064,4072,16,2024,2064,3048,1040,1000,3088,3560,528,1512,2576,2536,1552,488,3600,3816,272,1768,2320,2792,1296,744,3344,3304,784,1256,2832,2280,1808,232,3856,3944,144,1896,2192,2920,1168,872,3216,3432,656,1384,2704,2408,1680,360,3728,3688,400,1640,2448,2664,1424,616,3472,3176,912,1128,2960,2152,1936,104,3984,4008,80,1960,2128,2984,1104,936,3152,3496,592,1448,2640,2472,1616,424,3664,3752,336,1704,2384,2728,1360,680,3408,3240,848,1192,2896,2216,1872,168,3920,3880,208,1832,2256,2856,1232,808,3280,3368,720,1320,2768,2344,1744,296,3792,3624,464,1576,2512,2600,1488,552,3536,3112,976,1064,3024,2088,2000,40,4048,4040,48,1992,2096,3016,1072,968,3120,3528,560,1480,2608,2504,1584,456,3632,3784,304,1736,2352,2760,1328,712,3376,3272,816,1224,2864,2248,1840,200,3888,3912,176,1864,2224,2888,1200,840,3248,3400,688,1352,2736,2376,1712,328,3760,3656,432,1608,2480,2632,1456,584,3504,3144,944,1096,2992,2120,1968,72,4016,3976,112,1928,2160,2952,1136,904,3184,3464,624,1416,2672,2440,1648,392,3696,3720,368,1672,2416,2696,1392,648,3440,3208,880,1160,2928,2184,1904,136,3952,3848,240,1800,2288,2824,1264,776,3312,3336,752,1288,2800,2312,1776,264,3824,3592,496,1544,2544,2568,1520,520,3568,3080,1008,1032,3056,2056,2032,8,4080
	
trig:	.word 16384,0,16384,-100,16383,-200,16381,-301,16379,-401,16376,-502,16373,-602,16369,-703,16364,-803,16359,-903,16353,-1004,16347,-1104,16340,-1204,16332,-1305,16324,-1405,16315,-1505,16305,-1605,16295,-1705,16284,-1805,16273,-1905,16261,-2005,16248,-2104,16235,-2204,16221,-2304,16207,-2403,16192,-2502,16176,-2602,16160,-2701,16143,-2800,16125,-2899,16107,-2998,16088,-3097,16069,-3195,16049,-3294,16029,-3392,16008,-3491,15986,-3589,15964,-3687,15941,-3785,15917,-3882,15893,-3980,15868,-4077,15843,-4175,15817,-4272,15791,-4369,15763,-4466,15736,-4562,15707,-4659,15679,-4755,15649,-4851,15619,-4947,15588,-5043,15557,-5138,15525,-5234,15493,-5329,15460,-5424,15426,-5519,15392,-5613,15357,-5707,15322,-5802,15286,-5896,15250,-5989,15213,-6083,15175,-6176,15137,-6269,15098,-6362,15059,-6454,15019,-6546,14978,-6638,14937,-6730,14896,-6822,14854,-6913,14811,-7004,14768,-7095,14724,-7185,14680,-7275,14635,-7365,14589,-7455,14543,-7544,14497,-7634,14449,-7722,14402,-7811,14354,-7899,14305,-7987,14256,-8075,14206,-8162,14155,-8249,14104,-8336,14053,-8422,14001,-8508,13949,-8594,13896,-8679,13842,-8764,13788,-8849,13733,-8934,13678,-9018,13623,-9101,13567,-9185,13510,-9268,13453,-9351,13395,-9433,13337,-9515,13279,-9597,13219,-9678,13160,-9759,13100,-9840,13039,-9920,12978,-10000,12916,-10079,12854,-10158,12792,-10237,12729,-10315,12665,-10393,12601,-10470,12537,-10548,12472,-10624,12406,-10701,12340,-10777,12274,-10852,12207,-10927,12140,-11002,12072,-11076,12004,-11150,11935,-11223,11866,-11296,11797,-11369,11727,-11441,11656,-11513,11585,-11584,11514,-11655,11442,-11726,11370,-11796,11297,-11865,11224,-11934,11151,-12003,11077,-12071,11003,-12139,10928,-12206,10853,-12273,10778,-12339,10702,-12405,10625,-12471,10549,-12536,10471,-12600,10394,-12664,10316,-12728,10238,-12791,10159,-12853,10080,-12915,10001,-12977,9921,-13038,9841,-13099,9760,-13159,9679,-13218,9598,-13278,9516,-13336,9434,-13394,9352,-13452,9269,-13509,9186,-13566,9102,-13622,9019,-13677,8935,-13732,8850,-13787,8765,-13841,8680,-13895,8595,-13948,8509,-14000,8423,-14052,8337,-14103,8250,-14154,8163,-14205,8076,-14255,7988,-14304,7900,-14353,7812,-14401,7723,-14448,7635,-14496,7545,-14542,7456,-14588,7366,-14634,7276,-14679,7186,-14723,7096,-14767,7005,-14810,6914,-14853,6823,-14895,6731,-14936,6639,-14977,6547,-15018,6455,-15058,6363,-15097,6270,-15136,6177,-15174,6084,-15212,5990,-15249,5897,-15285,5803,-15321,5708,-15356,5614,-15391,5520,-15425,5425,-15459,5330,-15492,5235,-15524,5139,-15556,5044,-15587,4948,-15618,4852,-15648,4756,-15678,4660,-15706,4563,-15735,4467,-15762,4370,-15790,4273,-15816,4176,-15842,4078,-15867,3981,-15892,3883,-15916,3786,-15940,3688,-15963,3590,-15985,3492,-16007,3393,-16028,3295,-16048,3196,-16068,3098,-16087,2999,-16106,2900,-16124,2801,-16142,2702,-16159,2603,-16175,2503,-16191,2404,-16206,2305,-16220,2205,-16234,2105,-16247,2006,-16260,1906,-16272,1806,-16283,1706,-16294,1606,-16304,1506,-16314,1406,-16323,1306,-16331,1205,-16339,1105,-16346,1005,-16352,904,-16358,804,-16363,704,-16368,603,-16372,503,-16375,402,-16378,302,-16380,201,-16382,101,-16383,0,-16383,-100,-16383,-200,-16382,-301,-16380,-401,-16378,-502,-16375,-602,-16372,-703,-16368,-803,-16363,-903,-16358,-1004,-16352,-1104,-16346,-1204,-16339,-1305,-16331,-1405,-16323,-1505,-16314,-1605,-16304,-1705,-16294,-1805,-16283,-1905,-16272,-2005,-16260,-2104,-16247,-2204,-16234,-2304,-16220,-2403,-16206,-2502,-16191,-2602,-16175,-2701,-16159,-2800,-16142,-2899,-16124,-2998,-16106,-3097,-16087,-3195,-16068,-3294,-16048,-3392,-16028,-3491,-16007,-3589,-15985,-3687,-15963,-3785,-15940,-3882,-15916,-3980,-15892,-4077,-15867,-4175,-15842,-4272,-15816,-4369,-15790,-4466,-15762,-4562,-15735,-4659,-15706,-4755,-15678,-4851,-15648,-4947,-15618,-5043,-15587,-5138,-15556,-5234,-15524,-5329,-15492,-5424,-15459,-5519,-15425,-5613,-15391,-5707,-15356,-5802,-15321,-5896,-15285,-5989,-15249,-6083,-15212,-6176,-15174,-6269,-15136,-6362,-15097,-6454,-15058,-6546,-15018,-6638,-14977,-6730,-14936,-6822,-14895,-6913,-14853,-7004,-14810,-7095,-14767,-7185,-14723,-7275,-14679,-7365,-14634,-7455,-14588,-7544,-14542,-7634,-14496,-7722,-14448,-7811,-14401,-7899,-14353,-7987,-14304,-8075,-14255,-8162,-14205,-8249,-14154,-8336,-14103,-8422,-14052,-8508,-14000,-8594,-13948,-8679,-13895,-8764,-13841,-8849,-13787,-8934,-13732,-9018,-13677,-9101,-13622,-9185,-13566,-9268,-13509,-9351,-13452,-9433,-13394,-9515,-13336,-9597,-13278,-9678,-13218,-9759,-13159,-9840,-13099,-9920,-13038,-10000,-12977,-10079,-12915,-10158,-12853,-10237,-12791,-10315,-12728,-10393,-12664,-10470,-12600,-10548,-12536,-10624,-12471,-10701,-12405,-10777,-12339,-10852,-12273,-10927,-12206,-11002,-12139,-11076,-12071,-11150,-12003,-11223,-11934,-11296,-11865,-11369,-11796,-11441,-11726,-11513,-11655,-11584,-11584,-11655,-11513,-11726,-11441,-11796,-11369,-11865,-11296,-11934,-11223,-12003,-11150,-12071,-11076,-12139,-11002,-12206,-10927,-12273,-10852,-12339,-10777,-12405,-10701,-12471,-10624,-12536,-10548,-12600,-10470,-12664,-10393,-12728,-10315,-12791,-10237,-12853,-10158,-12915,-10079,-12977,-10000,-13038,-9920,-13099,-9840,-13159,-9759,-13218,-9678,-13278,-9597,-13336,-9515,-13394,-9433,-13452,-9351,-13509,-9268,-13566,-9185,-13622,-9101,-13677,-9018,-13732,-8934,-13787,-8849,-13841,-8764,-13895,-8679,-13948,-8594,-14000,-8508,-14052,-8422,-14103,-8336,-14154,-8249,-14205,-8162,-14255,-8075,-14304,-7987,-14353,-7899,-14401,-7811,-14448,-7722,-14496,-7634,-14542,-7544,-14588,-7455,-14634,-7365,-14679,-7275,-14723,-7185,-14767,-7095,-14810,-7004,-14853,-6913,-14895,-6822,-14936,-6730,-14977,-6638,-15018,-6546,-15058,-6454,-15097,-6362,-15136,-6269,-15174,-6176,-15212,-6083,-15249,-5989,-15285,-5896,-15321,-5802,-15356,-5707,-15391,-5613,-15425,-5519,-15459,-5424,-15492,-5329,-15524,-5234,-15556,-5138,-15587,-5043,-15618,-4947,-15648,-4851,-15678,-4755,-15706,-4659,-15735,-4562,-15762,-4466,-15790,-4369,-15816,-4272,-15842,-4175,-15867,-4077,-15892,-3980,-15916,-3882,-15940,-3785,-15963,-3687,-15985,-3589,-16007,-3491,-16028,-3392,-16048,-3294,-16068,-3195,-16087,-3097,-16106,-2998,-16124,-2899,-16142,-2800,-16159,-2701,-16175,-2602,-16191,-2502,-16206,-2403,-16220,-2304,-16234,-2204,-16247,-2104,-16260,-2005,-16272,-1905,-16283,-1805,-16294,-1705,-16304,-1605,-16314,-1505,-16323,-1405,-16331,-1305,-16339,-1204,-16346,-1104,-16352,-1004,-16358,-903,-16363,-803,-16368,-703,-16372,-602,-16375,-502,-16378,-401,-16380,-301,-16382,-200,-16383,-100,16384,13,16384,38,16384,63,16384,88,16384,113,16383,138,16383,163,16383,188,16383,214,16382,239,16382,264,16381,289,16381,314,16380,339,16380,364,16379,390,16379,415,16378,440,16377,465,16377,490,16376,515,16375,540,16374,565,16373,590,16372,616,16371,641,16370,666,16369,691,16368,716,16367,741,16366,766,16365,791,16364,816,16362,842,16361,867,16360,892,16358,917,16357,942,16355,967,16354,992,16352,1017,16351,1042,16349,1067,16348,1092,16346,1118,16344,1143,16342,1168,16341,1193,16339,1218,16337,1243,16335,1268,16333,1293,16331,1318,16329,1343,16327,1368,16325,1393,16323,1418,16320,1443,16318,1468,16316,1493,16313,1518,16311,1543,16309,1568,16306,1593,16304,1618,16301,1643,16299,1668,16296,1693,16294,1718,16291,1743,16288,1768,16286,1793,16283,1818,16280,1843,16277,1868,16274,1893,16271,1918,16268,1943,16265,1968,16262,1993,16259,2018,16256,2043,16253,2068,16250,2093,16247,2118,16243,2143,16240,2168,16237,2193,16233,2217,16230,2242,16226,2267,16223,2292,16219,2317,16216,2342,16212,2367,16209,2392,16205,2416,16201,2441,16197,2466,16194,2491,16190,2516,16186,2541,16182,2566,16178,2590,16174,2615,16170,2640,16166,2665,16162,2690,16158,2714,16153,2739,16149,2764,16145,2789,16141,2813,16136,2838,16132,2863,16128,2888,16123,2912,16119,2937,16114,2962,16109,2987,16105,3011,16100,3036,16096,3061,16091,3085,16086,3110,16081,3135,16076,3159,16072,3184,16067,3209,16062,3233,16057,3258,16052,3283,16047,3307,16042,3332,16037,3356,16031,3381,16026,3406,16021,3430,16016,3455,16010,3479,16005,3504,16000,3528,15994,3553,15989,3577,15983,3602,15978,3627,15972,3651,15966,3676,15961,3700,15955,3724,15949,3749,15944,3773,15938,3798,15932,3822,15926,3847,15920,3871,15914,3896,15908,3920,15902,3944,15896,3969,15890,3993,15884,4018,15878,4042,15871,4066,15865,4091,15859,4115,15853,4139,15846,4164,15840,4188,15833,4212,15827,4236,15820,4261,15814,4285,15807,4309,15801,4333,15794,4358,15787,4382,15780,4406,15774,4430,15767,4455,15760,4479,15753,4503,15746,4527,15739,4551,15732,4575,15725,4599,15718,4624,15711,4648,15704,4672,15697,4696,15689,4720,15682,4744,15675,4768,15668,4792,15660,4816,15653,4840,15645,4864,15638,4888,15630,4912,15623,4936,15615,4960,15608,4984,15600,5008,15592,5032,15584,5056,15577,5080,15569,5104,15561,5127,15553,5151,15545,5175,15537,5199,15529,5223,15521,5247,15513,5270,15505,5294,15497,5318,15489,5342,15481,5366,15472,5389,15464,5413,15456,5437,15447,5460,15439,5484,15430,5508,15422,5531,15414,5555,15405,5579,15396,5602,15388,5626,15379,5650,15370,5673,15362,5697,15353,5720,15344,5744,15335,5767,15326,5791,15318,5814,15309,5838,15300,5861,15291,5885,15282,5908,15273,5932,15263,5955,15254,5979,15245,6002,15236,6025,15227,6049,15217,6072,15208,6095,15199,6119,15189,6142,15180,6165,15170,6189,15161,6212,15151,6235,15142,6258,15132,6281,15122,6305,15113,6328,15103,6351,15093,6374,15083,6397,15074,6420,15064,6444,15054,6467,15044,6490,15034,6513,15024,6536,15014,6559,15004,6582,14994,6605,14984,6628,14973,6651,14963,6674,14953,6697,14943,6720,14932,6743,14922,6766,14911,6788,14901,6811,14891,6834,14880,6857,14870,6880,14859,6903,14848,6925,14838,6948,14827,6971,14816,6994,14806,7016,14795,7039,14784,7062,14773,7084,14762,7107,14751,7130,14740,7152,14729,7175,14718,7198,14707,7220,14696,7243,14685,7265,14674,7288,14663,7310,14651,7333,14640,7355,14629,7378,14618,7400,14606,7423,14595,7445,14583,7467,14572,7490,14560,7512,14549,7534,14537,7557,14526,7579,14514,7601,14502,7623,14491,7646,14479,7668,14467,7690,14455,7712,14443,7734,14432,7757,14420,7779,14408,7801,14396,7823,14384,7845,14372,7867,14360,7889,14347,7911,14335,7933,14323,7955,14311,7977,14299,7999,14286,8021,14274,8043,14262,8065,14249,8087,14237,8108,14224,8130,14212,8152,14199,8174,14187,8196,14174,8217,14162,8239,14149,8261,14136,8283,14124,8304,14111,8326,14098,8347,14085,8369,14072,8391,14059,8412,14047,8434,14034,8455,14021,8477,14008,8498,13995,8520,13981,8541,13968,8563,13955,8584,13942,8606,13929,8627,13916,8648,13902,8670,13889,8691,13876,8712,13862,8734,13849,8755,13835,8776,13822,8797,13808,8818,13795,8840,13781,8861,13768,8882,13754,8903,13740,8924,13727,8945,13713,8966,13699,8987,13685,9008,13671,9029,13658,9050,13644,9071,13630,9092,13616,9113,13602,9134,13588,9155,13574,9175,13560,9196,13546,9217,13531,9238,13517,9259,13503,9279,13489,9300,13474,9321,13460,9341,13446,9362,13431,9383,13417,9403,13403,9424,13388,9444,13374,9465,13359,9485,13344,9506,13330,9526,13315,9547,13301,9567,13286,9588,13271,9608,13256,9628,13242,9649,13227,9669,13212,9689,13197,9709,13182,9730,13167,9750,13152,9770,13137,9790,13122,9810,13107,9830,13092,9851,13077,9871,13062,9891,13047,9911,13031,9931,13016,9951,13001,9971,12986,9991,12970,10010,12955,10030,12939,10050,12924,10070,12909,10090,12893,10110,12878,10129,12862,10149,12846,10169,12831,10189,12815,10208,12799,10228,12784,10248,12768,10267,12752,10287,12736,10306,12721,10326,12705,10345,12689,10365,12673,10384,12657,10404,12641,10423,12625,10442,12609,10462,12593,10481,12577,10500,12561,10520,12545,10539,12528,10558,12512,10577,12496,10597,12480,10616,12463,10635,12447,10654,12431,10673,12414,10692,12398,10711,12381,10730,12365,10749,12348,10768,12332,10787,12315,10806,12299,10825,12282,10844,12266,10862,12249,10881,12232,10900,12215,10919,12199,10937,12182,10956,12165,10975,12148,10994,12131,11012,12114,11031,12097,11049,12080,11068,12064,11086,12046,11105,12029,11123,12012,11142,11995,11160,11978,11179,11961,11197,11944,11215,11927,11234,11909,11252,11892,11270,11875,11288,11857,11307,11840,11325,11823,11343,11805,11361,11788,11379,11770,11397,11753,11415,11735,11433,11718,11451,11700,11469,11683,11487,11665,11505,11647,11523,11630,11541,11612,11559,11594,11576,8192,-24,8192,-74,8191,-125,8190,-175,8189,-225,8187,-275,8185,-326,8183,-376,8181,-426,8178,-476,8175,-526,8172,-577,8168,-627,8164,-677,8160,-727,8155,-777,8150,-827,8145,-877,8139,-927,8133,-977,8127,-1027,8121,-1077,8114,-1126,8107,-1176,8100,-1226,8092,-1276,8084,-1325,8076,-1375,8067,-1424,8058,-1474,8049,-1523,8039,-1573,8030,-1622,8020,-1671,8009,-1720,7998,-1769,7987,-1818,7976,-1867,7964,-1916,7953,-1965,7940,-2014,7928,-2063,7915,-2111,7902,-2160,7889,-2208,7875,-2256,7861,-2305,7847,-2353,7832,-2401,7817,-2449,7802,-2497,7786,-2545,7771,-2593,7755,-2640,7738,-2688,7722,-2735,7705,-2782,7687,-2830,7670,-2877,7652,-2924,7634,-2971,7616,-3017,7597,-3064,7578,-3111,7559,-3157,7539,-3203,7519,-3250,7499,-3296,7479,-3342,7458,-3388,7437,-3433,7416,-3479,7395,-3524,7373,-3570,7351,-3615,7329,-3660,7306,-3705,7283,-3749,7260,-3794,7237,-3838,7213,-3883,7189,-3927,7165,-3971,7140,-4015,7115,-4059,7090,-4102,7065,-4146,7039,-4189,7014,-4232,6987,-4275,6961,-4318,6934,-4360,6908,-4403,6880,-4445,6853,-4487,6825,-4529,6797,-4571,6769,-4613,6741,-4654,6712,-4695,6683,-4737,6654,-4777,6625,-4818,6595,-4859,6565,-4899,6535,-4939,6504,-4979,6474,-5019,6443,-5059,6411,-5098,6380,-5137,6348,-5176,6317,-5215,6284,-5254,6252,-5292,6219,-5331,6187,-5369,6154,-5407,6120,-5444,6087,-5482,6053,-5519,6019,-5556,5985,-5593,5950,-5629,5916,-5666,5881,-5702,5846,-5738,5810,-5774,5775,-5809,5739,-5845,5703,-5880,5667,-5915,5630,-5949,5594,-5984,5557,-6018,5520,-6052,5483,-6086,5445,-6119,5408,-6153,5370,-6186,5332,-6218,5293,-6251,5255,-6283,5216,-6316,5177,-6347,5138,-6379,5099,-6410,5060,-6442,5020,-6473,4980,-6503,4940,-6534,4900,-6564,4860,-6594,4819,-6624,4778,-6653,4738,-6682,4696,-6711,4655,-6740,4614,-6768,4572,-6796,4530,-6824,4488,-6852,4446,-6879,4404,-6907,4361,-6933,4319,-6960,4276,-6986,4233,-7013,4190,-7038,4147,-7064,4103,-7089,4060,-7114,4016,-7139,3972,-7164,3928,-7188,3884,-7212,3839,-7236,3795,-7259,3750,-7282,3706,-7305,3661,-7328,3616,-7350,3571,-7372,3525,-7394,3480,-7415,3434,-7436,3389,-7457,3343,-7478,3297,-7498,3251,-7518,3204,-7538,3158,-7558,3112,-7577,3065,-7596,3018,-7615,2972,-7633,2925,-7651,2878,-7669,2831,-7686,2783,-7704,2736,-7721,2689,-7737,2641,-7754,2594,-7770,2546,-7785,2498,-7801,2450,-7816,2402,-7831,2354,-7846,2306,-7860,2257,-7874,2209,-7888,2161,-7901,2112,-7914,2064,-7927,2015,-7939,1966,-7952,1917,-7963,1868,-7975,1819,-7986,1770,-7997,1721,-8008,1672,-8019,1623,-8029,1574,-8038,1524,-8048,1475,-8057,1425,-8066,1376,-8075,1326,-8083,1277,-8091,1227,-8099,1177,-8106,1127,-8113,1078,-8120,1028,-8126,978,-8132,928,-8138,878,-8144,828,-8149,778,-8154,728,-8159,678,-8163,628,-8167,578,-8171,527,-8174,477,-8177,427,-8180,377,-8182,327,-8184,276,-8186,226,-8188,176,-8189,126,-8190,75,-8191,25,-8191
	
 arr: .word 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,743,744,745,746,747,748,749,750,751,752,753,754,755,756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,773,774,775,776,777,778,779,780,781,782,783,784,785,786,787,788,789,790,791,792,793,794,795,796,797,798,799,800,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,861,862,863,864,865,866,867,868,869,870,871,872,873,874,875,876,877,878,879,880,881,882,883,884,885,886,887,888,889,890,891,892,893,894,895,896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950,951,952,953,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,971,972,973,974,975,976,977,978,979,980,981,982,983,984,985,986,987,988,989,990,991,992,993,994,995,996,997,998,999,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1147,1148,1149,1150,1151,1152,1153,1154,1155,1156,1157,1158,1159,1160,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1172,1173,1174,1175,1176,1177,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188,1189,1190,1191,1192,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1238,1239,1240,1241,1242,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,1254,1255,1256,1257,1258,1259,1260,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271,1272,1273,1274,1275,1276,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,1396,1397,1398,1399,1400,1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450,1451,1452,1453,1454,1455,1456,1457,1458,1459,1460,1461,1462,1463,1464,1465,1466,1467,1468,1469,1470,1471,1472,1473,1474,1475,1476,1477,1478,1479,1480,1481,1482,1483,1484,1485,1486,1487,1488,1489,1490,1491,1492,1493,1494,1495,1496,1497,1498,1499,1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542,1543,1544,1545,1546,1547,1548,1549,1550,1551,1552,1553,1554,1555,1556,1557,1558,1559,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1570,1571,1572,1573,1574,1575,1576,1577,1578,1579,1580,1581,1582,1583,1584,1585,1586,1587,1588,1589,1590,1591,1592,1593,1594,1595,1596,1597,1598,1599,1600,1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614,1615,1616,1617,1618,1619,1620,1621,1622,1623,1624,1625,1626,1627,1628,1629,1630,1631,1632,1633,1634,1635,1636,1637,1638,1639,1640,1641,1642,1643,1644,1645,1646,1647,1648,1649,1650,1651,1652,1653,1654,1655,1656,1657,1658,1659,1660,1661,1662,1663,1664,1665,1666,1667,1668,1669,1670,1671,1672,1673,1674,1675,1676,1677,1678,1679,1680,1681,1682,1683,1684,1685,1686,1687,1688,1689,1690,1691,1692,1693,1694,1695,1696,1697,1698,1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1728,1729,1730,1731,1732,1733,1734,1735,1736,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1762,1763,1764,1765,1766,1767,1768,1769,1770,1771,1772,1773,1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849,1850,1851,1852,1853,1854,1855,1856,1857,1858,1859,1860,1861,1862,1863,1864,1865,1866,1867,1868,1869,1870,1871,1872,1873,1874,1875,1876,1877,1878,1879,1880,1881,1882,1883,1884,1885,1886,1887,1888,1889,1890,1891,1892,1893,1894,1895,1896,1897,1898,1899,1900,1901,1902,1903,1904,1905,1906,1907,1908,1909,1910,1911,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,1925,1926,1927,1928,1929,1930,1931,1932,1933,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,1944,1945,1946,1947,1948,1949,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966,1967,1968,1969,1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047	


ini:	.word   7,6,5   
sum:	.word   7,6,5,4,3,2,1,0

        .text

start: 
        set     0x80000204, %r3     ! %r3 is  start address register
	set	ini, %r6	    ! %r6 is starting read address
	st	%r6,[%r3]	    ! trig start address is set

        set     0x80000208, %r3     ! %r3 is  stop address register
	set	sum, %r6	    ! %r6 is stop  address
	st	%r6,[%r3]	    ! arr stop address is set

        set     0x80000090, %r3     ! %r3 is  stop address register
	set	30720, %r6	    ! %r6 enables user interrupts
	st	%r6,[%r3]	    ! set user interrupts			
		
	set     arr, %r2            ! %r2 is the base address
	set	0x80000200,%r2	    ! %r2 has ddm control register
	set	25,%r5		    ! %r5 is the control value for ddm
				    ! interrumpt enabled, interruptrequest & ddm enabled

	st	%r5,[%r2]	    ! enables ddm
		
        set     0x80000304, %r3     ! %r3 is size register
	set	1, %r6              ! set 2048 size array
	st	%r6,[%r3]	    ! write size to core register

        set     0x80000308, %r3     ! %r3 is trig start address register
	set	trig, %r6	    ! %r6 is trig starting read address
	st	%r6,[%r3]	    ! trig start address is set

		
        set     0x8000030c, %r3     ! %r3 is mdct read start address register
	set	arr, %r6	    ! %r6 is the starting read address
	st	%r6,[%r3]	    ! start read address is set
	
        set     0x80000310, %r3     ! %r3 is mdct write start address register
	set	sum, %r6	    ! %r6 is the starting write address
	st	%r6,[%r3]	    ! start write address is set	

        set     0x80000300, %r3     ! %r3 is mdct write start address register
	set	1, %r6		    ! %r6 holds the enable value of mdct
				    ! and size of 256 points. '0' -> 256 points					                             ! '1'->2048 points
	st	%r6,[%r3]	    ! go mdct

!	set	3, %r6		    ! %r6 holds the stop value of mdct
!	st	%r6,[%r3]	    ! stop mdct


		
	set	425,%r5		    ! %r5 repeats the following loop in order
				    ! in order to give more time to mdct
	



loop:   ld     [%r2+%r3], %r6       ! fetch the next element
        add    %r4, %r6, %r4        ! add it to the running sum
	subcc  %r5, 1, %r5          ! one fewer element
        bne    loop                 ! if %r5 > 0 get next element
        add    %r3, 4, %r3          ! increment the index (DELAY SLOT)



        sethi  %hi(sum), %r1        ! store the result in sum
        st     %r4, [%r1+%lo(sum)]
end:    ta      0



