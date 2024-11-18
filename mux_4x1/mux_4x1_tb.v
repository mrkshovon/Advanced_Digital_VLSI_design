module testbench;

   // Parameters
   parameter WIDTH = 4; // Data width
   parameter SEL_WIDTH = 2; // Select signal width

   // Signals
   reg [WIDTH-1:0] data_in_0, data_in_1, data_in_2, data_in_3;
   reg [SEL_WIDTH-1:0] sel;
   wire [WIDTH-1:0] out;

   // Instantiate the mux
   mux_4x1 #(WIDTH, SEL_WIDTH) dut (
      .data_in_0(data_in_0),
      .data_in_1(data_in_1),
      .data_in_2(data_in_2),
      .data_in_3(data_in_3),
      .sel(sel),
      .out(out)
   );

   // Stimulus
   initial begin
      // Test case 0: sel = 00
      data_in_0 = 4'b0001;
      data_in_1 = 4'b0010;
      data_in_2 = 4'b0100;
      data_in_3 = 4'b1000;
      sel = 2'b00;
      #10; // Wait for 10 time units
      // Test case 1: sel = 01
      data_in_0 = 4'b1111;
      data_in_1 = 4'b0000;
      data_in_2 = 4'b0000;
      data_in_3 = 4'b1111;
      sel = 2'b01;
      #10; // Wait for 10 time units
      // Test case 2: sel = 10
      data_in_0 = 4'b1010;
      data_in_1 = 4'b0101;
      data_in_2 = 4'b1010;
      data_in_3 = 4'b0101;
      sel = 2'b10;
      #10; // Wait for 10 time units
      // Test case 3: sel = 11
      data_in_0 = 4'b1111;
      data_in_1 = 4'b1111;
      data_in_2 = 4'b0000;
      data_in_3 = 4'b0000;
      sel = 2'b11;
      #10; // Wait for 10 time units
      $finish; // End simulation
   end

endmodule
