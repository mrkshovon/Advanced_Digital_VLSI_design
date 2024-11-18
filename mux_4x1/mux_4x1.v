module mux_4x1(input [3:0] data_in_0,
               input [3:0] data_in_1,
               input [3:0] data_in_2,
               input [3:0] data_in_3,
               input [1:0] sel,
               output reg [3:0] out);

   always @* begin
      case(sel)
         2'b00: out = data_in_0;
         2'b01: out = data_in_1;
         2'b10: out = data_in_2;
         2'b11: out = data_in_3;
         default: out = 4'bxxxx; // Default case for safety
      endcase
   end

endmodule