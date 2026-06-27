module processor_tb();
reg clk;
reg reset;
wire zero;

processor a(.clk(clk), .reset(reset), .zero(zero));

// Clock period = 10ns
initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	// reset=1 TRƯỚC khi có posedge clk đầu tiên
	reset = 1;
	#20;        // giữ reset 2 chu kỳ
	reset = 0;

	// 7 instructions × 10ns = 70ns, chạy dư thêm 50ns
	#120;
	$finish;
end

// Hiển thị trạng thái sau mỗi cạnh xuống clock (giá trị đã ổn định)
always @(negedge clk) begin
	if (!reset)
		$display("t=%0t ns | PC=%0d | zero=%b",
		          $time, a.dp.pc_current, zero);
end

endmodule
