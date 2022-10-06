`timescale 1ns / 1ps

module tb_BCDtoFND(    );

    // ===== FND_SelectDecoder =====
    reg [1:0] i_digitSelect;
    reg i_en;
    wire [3:0] o_digit;

    // ===== BCDtoFNC_Decoder =====
    reg [3:0] i_value;
    // reg i_en;
    wire [7:0] o_font;

    //dut : design under test?
    FND_SelectDecoder dut(
        .i_digitSelect(i_digitSelect),
        .i_en(i_en),
        .o_digit(o_digit)
    );

    BCDtoFNC_Decoder dut1(
        .i_value(i_value),
        .i_en(i_en),
        .o_font(o_font)
    );

    initial begin
        // ===== FND_SelectDecoder =====
         #00 i_en = 1'b1; i_digitSelect = 2'b00;
         #10 i_en = 1'b1; i_digitSelect = 2'b01;
         #10 i_en = 1'b1; i_digitSelect = 2'b10;
         #10 i_en = 1'b1; i_digitSelect = 2'b11;

        // #10 i_en = 1'b0; i_digitSelect = 2'b00;
        // #10 i_en = 1'b0; i_digitSelect = 2'b01;
        // #10 i_en = 1'b0; i_digitSelect = 2'b10;
        // #10 i_en = 1'b0; i_digitSelect = 2'b11;

        // ===== BCDtoFNC_Decoder =====
        #00 i_en = 1'b0; i_digitSelect = 2'b00; i_value = 4'h01;
        #10 i_en = 1'b0; i_digitSelect = 2'b01; i_value = 4'h05;
        #10 i_en = 1'b0; i_digitSelect = 2'b10; i_value = 4'h0a;
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'h0f;
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'h02;
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'h03;
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'h04;
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'h05;


        #10 $finish;

    end
endmodule
