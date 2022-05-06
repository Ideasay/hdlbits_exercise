//simple wire
module top_module( input in, output out );
	
	assign out = in;
	// Note that wires are directional, so "assign in = out" is not equivalent.
	
endmodule

//four wires
module top_module( 
    input a,b,c,
    output w,x,y,z );

    assign {w,x,y,z} = {a,b,b,c};
endmodule

//notgate
module top_module( input in, output out );
    assign out = ~in;
endmodule

//Andgate
module top_module( 
    input a, 
    input b, 
    output out );

    assign out = a&b;
endmodule

//norgate
module top_module( 
    input a, 
    input b, 
    output out );

    assign out = ~(a|b);
endmodule

//xnorgate
module top_module( 
    input a, 
    input b, 
    output out );

    assign out = ~(a^b);
endmodule

//wire declaration
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

    wire ab,cd;
    assign ab = a&b;
    assign cd = c&d;
    assign out = ab|cd;
    assign out_n = ~out;
endmodule

//7458
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire p1_abc,p1_def;
    wire p2_ab,p2_cd;

    assign p1_abc = p1a & p1b & p1c;
    assign p1_def = p1d & p1e & p1f;
    assign p2_ab = p2a & p2b;
    assign p2_cd = p2c & p2d;

    assign p1y = p1_abc | p1_def;
    assign p2y = p2_ab | p2_cd;
endmodule

//vector0
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
    assign  outv = vec;
    assign {o2,o1,o0} = {vec[2],vec[1],vec[0]};
endmodule

//vector1
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );

    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
endmodule

//vector2
module top_module( 
    input [31:0] in,
    output [31:0] out );//

    // assign out[31:24] = ...;
    assign  out = {in[7:0],in[15:8],in[23:16],in[31:24]};
endmodule

//vectorgates
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    
    assign out_or_bitwise = a | b;
    assign out_or_logical = a || b;
    
    //assign out_not = ~{b,a};
    assign out_not[2:0] = ~a;
    assign out_not[5:3] = ~b;
endmodule

//gates4
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    assign out_and = &in;
    assign out_or = |in;
    assign out_xor = ^in;
endmodule

//vector3
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    assign {w,x,y,z} = {a,b,c,d,e,f,2'b11};
endmodule

//vectorr
module top_module( 
    input [7:0] in,
    output [7:0] out
);
    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};
endmodule

//vector4
module top_module (
    input [7:0] in,
    output [31:0] out );//

    // assign out = { replicate-sign-bit , the-input };
    assign out = in[7]?{{24{1'b1}},in}:{{24{1'b0}},in};
endmodule

//vector5
module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    assign out = ~{{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}}^{5{a,b,c,d,e}};
endmodule

//module
module top_module ( input a, input b, output out );
    mod_a instance2(.in1(a),.in2(b),.out(out));
endmodule

//Moduel pos
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a inst(out1,out2,a,b,c,d);
endmodule

//module name
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    mod_a inst(
        .out1(out1),
        .out2(out2),
        .in1(a),
        .in2(b),
        .in3(c),
        .in4(d)
    );
endmodule

//module shift
module top_module ( input clk, input d, output q );
    wire q_1,q_2;
    my_dff inst1(clk,d,q_1);
    my_dff inst2(clk,q_1,q_2);
    my_dff inst3(clk,q_2,q);
endmodule

//module and vectors
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] q1,q2,q3;
    my_dff8 inst1(clk,d,q1);
    my_dff8 inst2(clk,q1,q2);
    my_dff8 inst3(clk,q2,q3);

    always @(*) begin
        case (sel)
            2'b00: q = d;
            2'b01: q = q1;
            2'b10: q = q2;
            2'b11: q = q3;
        endcase
    end
endmodule

//module add
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cout1;
    add16 inst1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .cout(cout1),
        .sum(sum[15:0]),
    );
    add16 inst2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout1),
        .sum(sum[31:16]),
    );
endmodule

//module fadd
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cout1;
    add16 inst1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .cout(cout1),
        .sum(sum[15:0])
    );
    add16 inst2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout1),
        .sum(sum[31:16])
    );

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign {cout,sum} = a + b + cin;

/*full add1 v1
    assign sum = a^b^cin;
    assign cout = a&b | (a^b)&cin;
*/
/*full add1 v2
    assign sum = a^b^cin;
    assign cout = a&b | (a^b)&cin;   
*/
endmodule

//module cseladd
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1;
    wire [15:0] sumtmp[1:0];
    add16 inst1(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .cout(cout1),
        .sum(sum[15:0])
    );
    add16 inst2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sumtmp[0])
    );
    add16 inst3(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sumtmp[1])
    );
    always@(*)
    begin
        case(cout1)
            1'b0:sum[31:16] = sumtmp[0];
            1'b1:sum[31:16] = sumtmp[1];
        endcase
    end
endmodule

//module addsub
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout1;
    add16 inst1(
        .a(a[15:0]),
        .b(b[15:0] ^ {16{sub}}),
        .cin(sub),
        .cout(cout1),
        .sum(sum[15:0])
    );
    add16 inst2(
        .a(a[31:16]),
        .b(b[31:16] ^ {16{sub}}),
        .cin(cout1),
        .sum(sum[31:16])
    );
endmodule

//alwaysblock1
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    assign out_assign = a&b;
    always@(*) out_alwaysblock = a&b;
endmodule

//alwaysblock2
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );

    assign out_assign = a^b;
    always@(*) out_always_comb = a^b;
    always@(posedge clk) out_always_ff = a^b;
endmodule

//if statement
// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 

    assign out_assign = sel_b1&sel_b2?b:a;
    always@(*)
    begin
        if(sel_b1 & sel_b2 == 1'b1)
        begin
            out_always = b;
        end
        else
        begin
            out_always = a;
        end
    end
endmodule

//always if2
//how to avoid making latch,use if and else together!
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
           shut_off_computer = 0;
    end

    always @(*) begin
        if ((~arrived)&(~gas_tank_empty))
           keep_driving = 1;
        else
           keep_driving = 0;     
    end

endmodule

//always case
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
            3'd0:out = data0;
            3'd1:out = data1;
            3'd2:out = data2;
            3'd3:out = data3;
            3'd4:out = data4;
            3'd5:out = data5;
            default:out = 4'd0;
        endcase
    end

endmodule

//always case2 wrong 
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );

    always@(*)
    begin
        casez(in)
            4'bzzz1: pos = 0;
            4'bzz1z: pos = 1;
            4'bz1zz: pos = 2;
            4'b1zzz: pos = 3;
            default: pos = 0;
        endcase
    end
endmodule

//always_casez
// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );

    always@(*)begin
        casez(in)
            8'bzzzzzzz1: pos = 0;
            8'bzzzzzz1z: pos = 1;
            8'bzzzzz1zz: pos = 2;
            8'bzzzz1zzz: pos = 3;
            8'bzzz1zzzz: pos = 4;
            8'bzz1zzzzz: pos = 5;
            8'bz1zzzzzz: pos = 6;
            8'b1zzzzzzz: pos = 7;
            default:pos = 0;
        endcase
    end
endmodule

//always nolatches
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    
    always @(*) begin
    up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
    case (scancode)
        // Set to 1 as necessary.
        16'he06b:left = 1'b1;
        16'he072:down = 1'b1;
        16'he074:right = 1'b1;
        16'he075:up = 1'b1;
        default:    ;
    endcase
end
endmodule

//conditional
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);

    wire [7:0] tmp_result1,tmp_result2;
    // assign intermediate_result1 = compare? true: false;
    assign tmp_result1 = (a<b)?a:b;
    assign tmp_result2 = (c<d)?c:d;
    assign min = (tmp_result1<tmp_result2)?tmp_result1:tmp_result2;

endmodule

//reduction
module top_module (
    input [7:0] in,
    output parity); 
    assign parity = ^in;
endmodule

//Gates100
module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    assign out_and = &in;
    assign out_or = |in;
    assign out_xor = ^in;
endmodule

//vector100r wrong
module top_module( 
    input [99:0] in,
    output [99:0] out
);
    always@(*)
    begin
        integer i;
        for(i=0;i<100;i++)
        begin
            out[i] = in[99-i];
        end
    end
endmodule

//popcount255
module top_module( 
    input [254:0] in,
    output [7:0] out );
    //cannot assign outside
    //assign out = 0;

    integer i;
    always@(*)
    begin
        out = 0;
        for(i=0;i<255;i++)
        begin
            out = out+in[i];
        end
    end
endmodule

//Adder100i
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    integer i;
    always@(*)
    begin
        for(i=0;i<100;i++)
        begin
            if(i==0)
                {cout[i],sum[i]} = a[i]+b[i]+cin;
            else
                {cout[i],sum[i]} = a[i]+b[i]+cout[i-1];
        end
    end
endmodule

//Bcdadd100
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire[99:0] cout1;
    bcd_fadd add0(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(cout1[0]),
        .sum(sum[3:0])
    );    
    genvar i;
    generate
        for( i = 1 ; i<=99 ; i = i + 1)begin:bcd_fadder
            bcd_fadd inst(
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(cout1[i-1]),
                .sum(sum[4*i+3:4*i]),
                .cout(cout1[i])
            );
        end
    endgenerate
    assign cout = cout1[99];
endmodule