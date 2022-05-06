//Exams/m2014 q4h
module top_module (
    input in,
    output out);
    assign out = in;
endmodule

//Exams/m2014 q4i
module top_module (
    output out);
    assign out = 1'b0;
endmodule

//Exams/m2014 q4e
module top_module (
    input in1,
    input in2,
    output out);
    assign out = ~(in1|in2);
endmodule

//Exams/m2014 q4f
module top_module (
    input in1,
    input in2,
    output out);
    assign out = in1&(~in2);
endmodule

//Exams/m2014 q4g
module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    assign out = ~(in1^in2) ^ in3;
endmodule

//gates
module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    assign out_and = a&b;
    assign out_or = a|b;
    assign out_xor = a^b;
    assign out_nand = ~(a&b);
    assign out_nor = ~(a|b);
    assign out_xnor = ~(a^b);
    assign out_anotb = a&(~b);
endmodule

//7420
module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    assign p1y = ~(p1a & p1b & p1c & p1d);
    assign p2y = ~(p2a & p2b & p2c & p2d);

endmodule

//truth table1
module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    assign f = x1&x3 | (~x3)&x2;
endmodule

//Mt2015 eq2
module top_module ( input [1:0] A, input [1:0] B, output z ); 

    always@(*)begin
        if(A == B)
            z = 1'b1;
        else
            z = 1'b0; 
    end
endmodule

//Mt2015 q4a
module top_module (input x, input y, output z);
    assign z = (x^y)&x;
endmodule

//Mt2015 q4b
module top_module ( input x, input y, output z );
    assign z = ~(x^y);
endmodule

//Mt2015 q4
module top_module (input x, input y, output z);
    wire z1,z2,z3,z4;
    A IA1(x,y,z1);
    B IB1(x,y,z2);
    A IA2(x,y,z3);
    B IB2(x,y,z4);
    assign z = (z1|z2) ^ (z3&z4);
endmodule

module A(input x, input y, output z);
    assign z = (x^y)&x;
endmodule

module B( input x, input y, output z );
    assign z = ~(x^y);
endmodule

//ringer
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    assign ringer = ring & (~vibrate_mode);
    assign motor = ring & vibrate_mode;
endmodule

//Thermostat
module top_module
(
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
);

assign heater = mode  & too_cold;
assign aircon = !mode & too_hot;
assign fan    = (mode & too_cold) | (!mode & too_hot) | fan_on;

endmodule

//popcount3
module top_module( 
    input [2:0] in,
    output [1:0] out );

    integer i;
    always@(*)begin
        out = 0;
        for (i = 0;i < 3 ;i++ ) begin
            out = out + in[i];
        end
    end

endmodule

//gatesv
module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );

    always@(*)begin
        for(int i = 0;i < 3;i++)begin
            out_both[i] = in[i] & in[i+1];
        end

        for(int j = 3;j > 0;j--)begin
            out_any[j] = in[j] | in[j-1];
        end

        out_different[3] = in[3] ^ in[0];
        for(int k = 0;k < 3;k++)begin
            out_different[k] = in[k] ^ in[k+1];
        end
    end

endmodule

//gatesv100
module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    always@(*)begin
        for(int i = 0;i < 99;i++)begin
            out_both[i] = in[i] & in[i+1];
        end

        for(int j = 99;j > 0;j--)begin
            out_any[j] = in[j] | in[j-1];
        end

        out_different[99] = in[99] ^ in[0];
        for(int k = 0;k < 99;k++)begin
            out_different[k] = in[k] ^ in[k+1];
        end
    end
endmodule

//Mux2to1
module top_module( 
    input a, b, sel,
    output out ); 
    always@(*)
    begin
        if(sel == 1'b0)
            out = a;
        else
            out = b;
    end
endmodule

//Mux2to1v
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
    always@(*)
    begin
        if(sel == 1'b0)
            out = a;
        else
            out = b;
    end
endmodule

//Mux9to1v
module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    always@(*)
    begin
        case(sel)
        0:out = a;
        1:out = b;
        2:out = c;
        3:out = d;
        4:out = e;
        5:out = f;
        6:out = g;
        7:out = h;
        8:out = i;
        default:out = 16'hffff;
        endcase
    end

endmodule

//Mux256to1
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

    always@(*)
    begin
        out = in[sel];
    end

endmodule

//Mux256to1v wrong
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    always@(*)
    begin
        out = in[sel*4+:4];
        //out = in[sel*4+3-:4];
    end

endmodule

//Hadd
module top_module( 
    input a, b,
    output cout, sum );
    assign {cout,sum} = a + b;
endmodule

//Fadd
module top_module( 
    input a, b, cin,
    output cout, sum );
    assign sum = a^b^cin;
    assign cout = a&b | b&cin | a&cin;
endmodule

//add3
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    fadd inst1(a[0],b[0],cin,cout[0],sum[0]);
    fadd inst2(a[1],b[1],cout[0],cout[1],sum[1]);
    fadd inst3(a[2],b[2],cout[1],cout[2],sum[2]);

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    assign sum = a^b^cin;
    assign cout = a&b | b&cin | a&cin;
endmodule

//Exams/m2014 q4j
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire [3:0] cout;
    fadd inst1(x[0],y[0],0,cout[0],sum[0]);
    fadd inst2(x[1],y[1],cout[0],cout[1],sum[1]);
    fadd inst3(x[2],y[2],cout[1],cout[2],sum[2]);
    fadd inst4(x[3],y[3],cout[2],cout[3],sum[3]);
    assign sum[4] = cout[3];

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    assign sum = a^b^cin;
    assign cout = a&b | b&cin | a&cin;
endmodule

//Exams/ece241 2014 q1c
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    assign s = a+b;
    assign overflow = a[7]&b[7]&~s[7] | ~a[7]&~b[7]&s[7];

endmodule

//Adder100
module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    wire [99:0] cout1;
    fadd inst0(a[0],b[0],cin,cout1[0],sum[0]);

    genvar i;
    generate
        for(i=1;i<100;i++)
        begin:add100
            fadd inst(a[i],b[i],cout1[i-1],cout1[i],sum[i]);
        end
    endgenerate
    assign cout = cout1[99];

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
    assign sum = a^b^cin;
    assign cout = a&b | b&cin | a&cin;
endmodule

//Bcdadd4
module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [3:0] cout1; 

    bcd_fadd inst0(a[3:0],b[3:0],cin,cout1[0],sum[3:0]);
    genvar i;
    generate
        for(i=1;i<4;i++)
        begin:bcd_fadd_1_3
            bcd_fadd inst(a[i*4+:4],b[i*4+:4],cout1[i-1],cout1[i],sum[i*4+:4]);
        end
    endgenerate

    assign cout = cout1[3];

endmodule

//Kmap1
module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    assign out = a | b | c;
endmodule

//Kmap2
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = ~a&~b&~d | ~a&b&~c&~d | ~a&b&c | a&c&d | a&~b&~c | ~a&~b&~c&d;
endmodule

//kmap3
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = a | ~a&~b&c;
endmodule

//kmap4
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = ~(b^d)&(a^c) | ~(a^c)&(b^d);
endmodule

//Exams/ece241 2013 q2
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
	assign out_sop = (~a & ~b & c) | (c & d); 
    assign out_pos = ~((~c) | (b & ~d) | (a & ~d));
endmodule

//Exams/m2014 q3
module top_module (
    input [4:1] x, 
    output f );
    assign f = x[1]&x[2]&~x[3] | ~x[1]&x[3];
endmodule

//Exams/2012 q1g
module top_module (
    input [4:1] x,
    output f
); 
    assign f = ~x[2]&~x[3]&~x[4] | ~x[1]&x[3] | x[1]&x[3]&(~(x[2]^x[4]));
endmodule

//Exams/ece241 2014 q3
module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    always@(*)
    begin
        case({c,d})
            2'b00:mux_in = 4'b0100;
            2'b01:mux_in = 4'b0001;
            2'b10:mux_in = 4'b0101;
            2'b11:mux_in = 4'b1001;
        endcase
    end

endmodule

//dff
module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//

    // Use a clocked always block
    //   copy d to q at every positive edge of clk
    //   Clocked always blocks should use non-blocking assignments
    always@(posedge clk)
        q <= d;
endmodule

//dff8
module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always@(posedge clk)
        q <= d;
endmodule

//dff8r
module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
always@(posedge clk)
    if(~reset)
        q <= d;
    else
        q <= 8'd0;
endmodule

//dff8p
module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
always@(negedge clk)
    if(~reset)
        q <= d;
    else
        q <= 8'h34;
endmodule

//dff8ar wrong

module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
always@(posedge clk or posedge areset)
    if(areset)
        q <= 8'h0;
    else
        q <= d;
endmodule

//dff16e
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        if(~resetn)
           q <= 16'd0;
        else if(byteena[0] || byteena[1]) begin
            if(byteena[1])  
                q[15:8] <= d[15:8];
            if(byteena[0])  
                q[7:0] <= d[7:0];
        end
    end
endmodule

//latch Exams/m2014 q4a
module top_module (
    input d, 
    input ena,
    output q);
    always@(*)
    begin
        if(ena)
            q = d;
        else
    end

endmodule

//Exams/m2014 q4b
module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);

    always@(posedge clk or posedge ar)
    begin
        if(ar)
            q <= 0;
        else
            q <= d;
    end
endmodule

//Exams/m2014 q4c
module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
    always@(posedge clk)
    begin
        if(r)
            q <= 0;
        else
            q <= d;
    end

endmodule

//Exams/m2014 q4d wrong
/*module top_module (
    input clk,
    input in, 
    output out);
    wire in1;
    assign in1 = in^out;
    always@(posedge clk)
        out = in1;
    
endmodule*/
module top_module (
    input clk,
    input in, 
    output out);
    always@(posedge clk)
        out = in^out;
endmodule

//Mt2015 muxdff
module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q);
    wire temp;
    assign temp=L?r_in:q_in;
    always@(posedge clk)begin
        Q=temp;
    end
 endmodule

//Exams/2014 q4a
module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire w1,w2;
    assign w1 = E?w:Q;
    assign w2 = L?R:w1;
    always@(posedge clk)begin
        Q=w2;
    end
endmodule

//Exams/ece241 2014 q4
module top_module (
    input clk,
    input x,
    output z
); 
    wire w1,w2,w3;
    wire Q1,Q2,Q3;

    assign w1 = x^Q1;
    assign w2 = x&(~Q2);
    assign w3 = x|(~Q3);
    always@(posedge clk)
    begin
        Q1 = w1;
        Q2 = w2;
        Q3 = w3;
    end
    assign z = ~(Q1|Q2|Q3);
endmodule

//Exams/ece241 2013 q7
module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    always@(posedge clk)
    begin
        if(~j & k)
            Q = 0;
        else if(j & ~k)
            Q = 1;
        else if(j & k)
            Q = ~Q;
    end

endmodule

//Edgedetect
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] temp;
    
    initial temp = 16'd0;
    
    always@(posedge clk)
        temp <= in;
    always@(posedge clk)
        pedge <= in & ~temp;//仅检测上升沿

endmodule

//Edgedetect2
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] temp;
    
    initial temp = 16'd0;
    
    always@(posedge clk)
        temp <= in;
    always@(posedge clk)
        anyedge <= in ^ temp;
endmodule

//Edgecapture wrong
module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]	in_reg;
    
    always@(posedge clk)begin
        in_reg <= in;
    end
    
    always@(posedge clk)begin
        if(reset)begin
            out <= 32'd0;
        end
        else begin
            out <= ~in & in_reg | out;
        end
    end
endmodule

//dual edge wrong
module top_module (
    input clk,
    input d,
    output q
);
    reg p,n;

    always@(posedge clk)
        p <= d^n;

    always@(negedge clk)
        n <= d^p;

    assign q = p^n;
endmodule

//Count15
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    always@(posedge clk)
    begin
        if(reset)
            q <= 4'h0;
        else
        begin
            //if(q == 4'hf) //useless
            //    q <= 4'h0;
            //else
                q <= q + 1;
        end
    end

endmodule

//count 10
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)
    begin
        if(reset)
            q <= 4'h0;
        else
        begin
            if(q == 4'h9) 
                q <= 4'h0;
            else
                q <= q + 1;
        end
    end
endmodule

//count1to10
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)
    begin
        if(reset)
            q <= 4'h1;
        else
        begin
            if(q == 4'ha) 
                q <= 4'h1;
            else
                q <= q + 1;
        end
    end
endmodule

//countslow
module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always@(posedge clk)
    begin
        if(reset)
            q <= 4'h0;
        else if(slowena == 1)
        begin
            if(q == 4'h9) 
                q <= 4'h0;
            else
                q <= q + 1;
        end
    end
endmodule

//count 1-12 Exams/ece241 2014 q7a
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 
    assign c_enable = enable;
    assign c_load = reset | (Q == 4'd12 & enable);
    assign c_d = 4'd1;
    count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule

//counter 1000 Exams/ece241 2014 q7b
module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    reg [3:0] q0, q1, q2;

    //combination logic
    always@(*)
    begin
        if(reset)
            c_enable = 3'b000;
        else
        begin
            c_enable[0] = 1'b1;

            if(q0 == 4'h9)
                c_enable[1] = 1'b1;
            else
                c_enable[1] = 1'b0;

            if(q0 == 4'h9 && q1 == 4'h9)
                c_enable[2] = 1'b1;
            else
                c_enable[2] = 1'b0;
        end
    end

    assign OneHertz = (q0 == 4'h9 && q1 == 4'h9 && q2 == 4'h9);


    bcdcount counter0 (clk, reset, c_enable[0], q0);
    bcdcount counter1 (clk, reset, c_enable[1], q1);
    bcdcount counter2 (clk, reset, c_enable[2], q2);


endmodule

//Countbcd wrong 16bit
module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    assign ena = {q[11:8] == 4'h9 && q[7:4] == 4'h9 && q[3:0] == 4'h9,q[7:4] == 4'h9 && q[3:0] == 4'h9,q[3:0] == 4'h9};
    //instance
    bcdcount inst0(clk,reset,1'b1,q[3:0]);
    bcdcount inst1(clk,reset,ena[1],q[7:4]);
    bcdcount inst2(clk,reset,ena[2],q[11:8]);
    bcdcount inst3(clk,reset,ena[3],q[15:12]);
endmodule

module bcdcount(
    input clk,
    input reset,//sync reset
    input enable,
    output [3:0] Q
);
    always@(posedge clk)
    begin
        if(reset)
            Q <= 4'b0000;
        else
        begin
            if(enable)
            begin
                if(Q == 4'h9)
                    Q <= 4'h0;
                else
                    Q <= Q + 1;
            end
        end
    end
endmodule

//count clock wrong
module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    wire [3:0] ena_out;
    //pm
    always@(posedge clk)
    begin
        if(reset)
            pm <= 1'b0;
        else
        begin
            if(hh == 8'h11 && mm == 8'h59 && ss ==8'h59)
                pm <= ~pm;
            else 
                pm <= pm;
        end
    end
    //hour inst
    count1_12 inst2(clk,reset,ena_out[3],hh);
    //mm inst
    count0_9 inst1_0(clk,reset,ena_out[1],ena_out[2],mm[3:0]);
    count0_5 inst1_1(clk,reset,ena_out[2],ena_out[3],mm[7:4]);
    //ss inst
    count0_9 inst0_0(clk,reset,ena,ena_out[0],ss[3:0]);
    count0_5 inst0_1(clk,reset,ena_out[0],ena_out[1],ss[7:4]);
endmodule

module count1_12(
    input clk,
    input reset,
    input ena,
    output [7:0] q
);
    always@(posedge clk)
    begin
        if(reset)
            q <= 8'h12;
        else if(ena)
        begin
            if(q == 8'h12)
                q <= 8'h01;
            else if(q == 8'h09)
                q <= 8'h10;
            else
                q <= q + 8'h01;
        end
    end

endmodule
module count0_5(
    input clk,
    input reset,
    input ena,
    output ena_out,
    output [3:0] q
);
    assign ena_out = (ena && q == 4'h5);
    always@(posedge clk)
    begin
        if(reset)
            q <= 4'h0;
        else if(ena)
        begin
            if(q == 4'h5)
                q <= 4'h0;
            else
                q = q + 4'h1;
        end
    end
endmodule
module count0_9(
    input clk,
    input reset,
    input ena,
    output ena_out,
    output [3:0] q
);
    assign ena_out = (ena && q == 4'h9);
    always@(posedge clk)
    begin
        if(reset)
            q <= 4'h0;
        else if(ena)
        begin
            if(q == 4'h9)
                q <= 4'h0;
            else
                q = q + 4'h1;
        end
    end
endmodule

//shift4
module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    always@(posedge clk or posedge areset)begin
        if(areset)
            q <= 4'h0;
        else begin
            if(load)
                q <= data;
            else if(ena)begin
                q <= {1'b0,q[3:1]};
            end
        end
    end
endmodule

//rotae 100
module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

    always@(posedge clk)begin
        if(load)
            q <= data;
        else begin
            case(ena)
                2'b01: q <= {q[0],q[99:1]};
                2'b10: q <= {q[98:0],q[99]};
                default:;
            endcase
        end
    end
endmodule

//shift18 arithmetc
module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    always@(posedge clk)begin
        if(load)
            q <= data;
        else if(ena)begin
            case(amount)
                2'b00:q <= q<<1;
                2'b01:q <= q<<8;
                2'b10:q <= {q[63],q[63:1]};
                2'b11:q <= {{8{q[63]}},q[63:8]};
            endcase
        end
    end
endmodule

//Lfsr5
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0]  q
); 

    always @(posedge clk)
        begin
            if (reset)
                q<=5'h1;
            else 
                begin
                    q[4] <= q[0] ^ 1'b0;
                    q[3] <= q[4];
                    q[2] <= q[0] ^ q[3];
                    q[1] <= q[2];
                    q[0] <= q[1];
                end
        end
    
endmodule

//Mt2015 lfsr
module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    always@(posedge KEY[0])begin
        LEDR[0] <= KEY[1]?SW[0]:LEDR[2];
        LEDR[1] <= KEY[1]?SW[1]:LEDR[0];
        LEDR[2] <= KEY[1]?SW[2]:LEDR[1]^LEDR[2];
    end

endmodule

//LFSR32
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 

    always @(posedge clk)
        begin
            if (reset)
                q<=32'h1;
            else begin
                q <= {q[0],q[31:23],q[0]^q[22],q[21:3],q[0]^q[2],q[0]^q[1]};
            end
        end    
endmodule
