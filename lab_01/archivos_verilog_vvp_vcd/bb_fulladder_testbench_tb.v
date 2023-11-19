//  A testbench for bb_fulladder_testbench_tb
`timescale 1us/1ns

module bb_fulladder_testbench_tb;
    reg ci;
    reg a;
    reg b;
    wire s;
    wire co;

  bb_fulladder bb_fulladder0 (
    .ci(ci),
    .a(a),
    .b(b),
    .s(s),
    .co(co)
  );

    reg [4:0] patterns[0:7];
    integer i;

    initial begin
      patterns[0] = 5'b0_0_0_0_0;
      patterns[1] = 5'b0_0_1_0_1;
      patterns[2] = 5'b0_1_0_0_1;
      patterns[3] = 5'b0_1_1_1_0;
      patterns[4] = 5'b1_0_0_0_1;
      patterns[5] = 5'b1_0_1_1_0;
      patterns[6] = 5'b1_1_0_1_0;
      patterns[7] = 5'b1_1_1_1_1;

      for (i = 0; i < 8; i = i + 1)
      begin
        a = patterns[i][4];
        b = patterns[i][3];
        ci = patterns[i][2];
        #10;
        if (patterns[i][1] !== 1'hx)
        begin
          if (co !== patterns[i][1])
          begin
            $display("%d:co: (assertion error). Expected %h, found %h", i, patterns[i][1], co);
            $finish;
          end
        end
        if (patterns[i][0] !== 1'hx)
        begin
          if (s !== patterns[i][0])
          begin
            $display("%d:s: (assertion error). Expected %h, found %h", i, patterns[i][0], s);
            $finish;
          end
        end
      end
        
	begin
		$dumpfile("top.vcd");
		$dumpvars(0, bb_fulladder_testbench_tb);
	end
	
    $display("All tests passed.");
    end
    endmodule
