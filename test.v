`timescale 1ns / 1ps
`include "decode.v"
module test;

	reg [7:0]data[0:197];
	wire [0:197]data_out;
	reg clk, rst;
	reg [7:0] Mem [0:197]; 
	reg data_in_en;
	integer i;
	//connect design under test
	decode decoder(clk, rst, data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11],data[12],data[13],data[14],data[15],data[16],data[17],data[18],data[19],data[20],data[21],data[22],data[23],data[24],data[25],data[26],data[27],data[28],data[29],data[30],data[31],data[32],data[33],data[34],data[35],data[36],data[37],data[38],data[39],data[40],data[41],data[42],data[43],data[44],data[45],data[46],data[47],data[48],data[49],data[50],data[51],data[52],data[53],data[54],data[55],data[56],data[57],data[58],data[59],data[60],data[61],data[62],data[63],data[64],data[65],data[66],data[67],data[68],data[69],data[70],data[71],data[72],data[73],data[74],data[75],data[76],data[77],data[78],data[79],data[80],data[81],data[82],data[83],data[84],data[85],data[86],data[87],data[88],data[89],data[90],data[91],data[92],data[93],data[94],data[95],data[96],data[97],data[98],data[99],data[100],data[101],data[102],data[103],data[104],data[105],data[106],data[107],data[108],data[109],data[110],data[111],data[112],data[113],data[114],data[115],data[116],data[117],data[118],data[119],data[120],data[121],data[122],data[123],data[124],data[125],data[126],data[127],data[128],data[129],data[130],data[131],data[132],data[133],data[134],data[135],data[136],data[137],data[138],data[139],data[140],data[141],data[142],data[143],data[144],data[145],data[146],data[147],data[148],data[149],data[150],data[151],data[152],data[153],data[154],data[155],data[156],data[157],data[158],data[159],data[160],data[161],data[162],data[163],data[164],data[165],data[166],data[167],data[168],data[169],data[170],data[171],data[172],data[173],data[174],data[175],data[176],data[177],data[178],data[179],data[180],data[181],data[182],data[183],data[184],data[185],data[186],data[187],data[188],data[189],data[190],data[191],data[192],data[193],data[194],data[195],data[196],data[197],data_out);

	always #100000000 clk = ~clk;

	initial begin 
		clk = 0;
		#2 rst = 0;
		#10 rst = 1;
		#10 clk = 1;
		//$readmemh("data_to_decoder.txt",Mem);
		

		$display("%b",data[0]);
		i =0;
		#1000000000000;
		$finish;



	end

	//always @(posedge clk) begin
		//for (i =0; i<198; i=i+1) begin
			//data[i] = Mem[i];
		//end
		//data_in_en = 1;
		//#10 vnu_en = 1;
		//#10 cnu_en = 1;
	initial begin
		data[0] = 1.536965;
		data[1] = 0.031025;
		data[2] = 2.815383;
		data[3] = 1.822669;
		data[4] = -1.096912;
		data[5] = 1.814890;
		data[6] = -0.068844;
		data[7] = 3.571525;
		data[8] = -1.129642;
		data[9] = -1.720107;
		data[10] = 3.428216;
		data[11] = 0.275285;
		data[12] = 0.541984;
		data[13] = 1.513647;
		data[14] = 0.017109;
		data[15] = 1.153916;
		data[16] = 4.105256;
		data[17] = 0.994761;
		data[18] = 1.003353;
		data[19] = -0.496185;
		data[20] = -0.114108;
		data[21] = 0.294689;
		data[22] = 3.158689;
		data[23] = 2.977190;
		data[24] = 0.209942;
		data[25] = -1.024611;
		data[26] = -0.144041;
		data[27] = 2.505352;
		data[28] = -3.492407;
		data[29] = 0.389530;
		data[30] = 3.160497;
		data[31] = 0.103203;
		data[32] = 1.694748;
		data[33] = 2.262596;
		data[34] = 0.600807;
		data[35] = 0.459298;
		data[36] = 1.864164;
		data[37] = 3.005143;
		data[38] = -0.592141;
		data[39] = 2.801037;
		data[40] = -0.448687;
		data[41] = 3.390276;
		data[42] = 0.412618;
		data[43] = -0.554307;
		data[44] = 1.413269;
		data[45] = 1.332473;
		data[46] = 2.217977;
		data[47] = 2.341267;
		data[48] = 0.720545;
		data[49] = 1.171538;
		data[50] = 2.880231;
		data[51] = 1.885307;
		data[52] = -0.116190;
		data[53] = 2.959779;
		data[54] = 0.242909;
		data[55] = 0.490929;
		data[56] = 1.093728;
		data[57] = 0.316014;
		data[58] = -0.422427;
		data[59] = 0.326434;
		data[60] = 1.217317;
		data[61] = 2.610349;
		data[62] = 0.211443;
		data[63] = -0.751377;
		data[64] = 0.542005;
		data[65] = 0.061417;
		data[66] = 2.511718;
		data[67] = 1.346735;
		data[68] = 0.390467;
		data[69] = 0.396001;
		data[70] = 2.147463;
		data[71] = 1.632370;
		data[72] = 1.855467;
		data[73] = 2.448658;
		data[74] = 0.593451;
		data[75] = -0.709174;
		data[76] = 3.989103;
		data[77] = -0.184864;
		data[78] = 2.241901;
		data[79] = 0.517886;
		data[80] = 0.046754;
		data[81] = 2.177424;
		data[82] = -0.405768;
		data[83] = -0.375772;
		data[84] = 2.366986;
		data[85] = 0.212258;
		data[86] = 0.530728;
		data[87] = -0.249833;
		data[88] = -0.562718;
		data[89] = 2.410196;
		data[90] = 2.466615;
		data[91] = -1.056023;
		data[92] = 1.322270;
		data[93] = 1.488454;
		data[94] = 1.974284;
		data[95] = 1.175778;
		data[96] = -0.032067;
		data[97] = 2.057277;
		data[98] = 2.148550;
		data[99] = 2.508722;
		data[100] = 2.306534;
		data[101] = 2.135293;
		data[102] = 3.187361;
		data[103] = -2.445148;
		data[104] = 0.690299;
		data[105] = -0.316031;
		data[106] = 0.671398;
		data[107] = -0.486446;
		data[108] = 2.327305;
		data[109] = 2.055336;
		data[110] = 1.896470;
		data[111] = 3.525784;
		data[112] = 1.729105;
		data[113] = 0.617723;
		data[114] = 0.770792;
		data[115] = -0.258788;
		data[116] = 0.333010;
		data[117] = 0.795351;
		data[118] = -0.210526;
		data[119] = 1.320251;
		data[120] = -1.068280;
		data[121] = -0.352478;
		data[122] = 2.013650;
		data[123] = 1.164111;
		data[124] = 1.328729;
		data[125] = -0.134508;
		data[126] = -0.243259;
		data[127] = 1.850879;
		data[128] = 4.152255;
		data[129] = 0.791067;
		data[130] = 2.599794;
		data[131] = 0.004405;
		data[132] = 1.121124;
		data[133] = 0.542621;
		data[134] = 1.483929;
		data[135] = -0.392937;
		data[136] = 1.400470;
		data[137] = -0.655020;
		data[138] = 2.367438;
		data[139] = 0.224893;
		data[140] = -0.169757;
		data[141] = -0.309757;
		data[142] = 0.262339;
		data[143] = 2.824082;
		data[144] = 0.187060;
		data[145] = 1.457765;
		data[146] = 0.134210;
		data[147] = 2.214738;
		data[148] = 4.207590;
		data[149] = -0.729122;
		data[150] = 2.851716;
		data[151] = -0.628742;
		data[152] = 2.666389;
		data[153] = 1.238156;
		data[154] = 0.694581;
		data[155] = 2.692575;
		data[156] = 0.061422;
		data[157] = 0.111450;
		data[158] = 2.187063;
		data[159] = 1.468803;
		data[160] = 1.502677;
		data[161] = 2.030854;
		data[162] = -1.252190;
		data[163] = -0.372732;
		data[164] = 1.551209;
		data[165] = -0.653449;
		data[166] = 1.774908;
		data[167] = 0.188613;
		data[168] = 1.169482;
		data[169] = 1.212670;
		data[170] = 1.628267;
		data[171] = 2.696539;
		data[172] = 2.990773;
		data[173] = 1.011634;
		data[174] = -0.091601;
		data[175] = 1.190621;
		data[176] = 2.121274;
		data[177] = -0.492694;
		data[178] = 2.954919;
		data[179] = 1.297398;
		data[180] = 0.381311;
		data[181] = 0.007397;
		data[182] = 0.064403;
		data[183] = 0.068137;
		data[184] = -0.667790;
		data[185] = 2.493990;
		data[186] = 2.033168;
		data[187] = -1.551904;
		data[188] = 1.541313;
		data[189] = 1.859949;
		data[190] = 1.075904;
		data[191] = 0.433274;
		data[192] = 0.238294;
		data[193] = 3.426994;
		data[194] = -1.486419;
		data[195] = 0.409503;
		data[196] = 4.253968;
		data[197] = 0.354961;
		
	end

	initial begin
		for(i = 0 ; i<198 ; i = i+1) begin
			$monitor("%b data_out_%d\n", data_out[i],i);
		end
	end

	always @(get_output) begin
		if(get_output == 1) begin
			//store outputs
		end
	end



endmodule