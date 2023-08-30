//////////////////////////////////////////////////////////////////////////////////
// Company:  MicroElectronics Research Lab
// Author: Syeda Rafia Fizza Naveed
// 
// Create Date:    17:20:18 30/08/2023
// Module Name:    Stepper Motor Controller (Testbench)
// Project Name:   Stepper Controller
// Target Devices: Tang Nano 9k FPGA
// Tool versions:  OSS-CAD-Suite Toolchain (Version 2023-02-10)
// Description:    Stepper Motor Controller using Tang Nano 9K FPGA
//////////////////////////////////////////////////////////////////////////////////
module test;
    reg clk;
    reg btn_start_stop;
    reg btn_direction_control;
    reg btn_speed;
    wire in1;
    wire in2;
    wire in3;
    wire in4;
    wire led;
    wire led1;
    wire led2;
    wire led3;
    
    //Instantiate the Top Module 
    top top_i (
        .clk(clk),
        .btn_start_stop(btn_start_stop),
        .btn_direction_control(btn_direction_control),
        .btn_speed(btn_speed),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .led(led),
        .led1(led1),
        .led2(led2),
        .led3(led3)
    );

    // Initialize signals
    initial begin
        clk = 0;
        btn_start_stop = 0;
        btn_direction_control = 0;
        btn_speed = 0;
        #10;

        // Set start/stop button to 1
        btn_start_stop = 1;
        btn_direction_control = 0;
        btn_speed = 0;
        #3000000;

        // Set direction control button to 1
        btn_start_stop = 1;
        btn_direction_control = 1;
        btn_speed = 0;
        #3000000;

        // Set speed button to 1
        btn_start_stop = 1;
        btn_direction_control = 1;
        btn_speed = 1;
        #1000000;
        
        $finish;
    end

    // Toggle clock every 2 time units
    always #2 clk = ~clk;

    // Dump waveform to VCD file
    initial begin
    $dumpfile("smc.vcd");
    $dumpvars(0, test);
  end
endmodule
