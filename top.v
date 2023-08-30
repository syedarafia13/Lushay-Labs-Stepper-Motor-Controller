//////////////////////////////////////////////////////////////////////////////////
// Company:  MicroElectronics Research Lab
// Author: Syeda Rafia Fizza Naveed
// 
// Create Date:    17:20:18 30/08/2023
// Module Name:    Stepper Motor Controller (Top Module)
// Project Name:   Stepper Controller
// Target Devices: Tang Nano 9k FPGA
// Tool versions:  OSS-CAD-Suite Toolchain (Version 2023-02-10)
// Description:    Stepper Motor Controller using Tang Nano 9K FPGA
//////////////////////////////////////////////////////////////////////////////////
module top(
    input wire clk,                    // Clock signal
    input wire btn_start_stop,         // Button 1: Start/Stop motor
    input wire btn_direction_control,  // Button 2: Direction control (0 - Clockwise, 1 - Anti-clockwise)
    input wire btn_speed,              // Button 3: Speed control (0 - Speed [high], 1 - Speed [low])
    
    // step signals to generate pulses
    output wire in1,
    output wire in2,
    output wire in3,
    output wire in4,

    // leds to mapped with buttons    
    output wire led,
    output wire led1,
    output wire led2,
    output wire led3
    );

reg [14:0] counter_speed1 = 0;    // 15 bits counter for high speed
reg [19:0] counter_speed2 = 0;    // 20 bits counter for low

reg led_state = 0;               // led_state variable for counter
reg [3:0]motor_out = 0;          // motor_out variable for clockwise and anti-clockwise direction
reg [2:0]step = 0;               // step variable for direction signal

always @(posedge clk) begin
    if(btn_speed) begin
        if (counter_speed1 == 1000) begin
            counter_speed1 <= 0;
            led_state <= ~led_state; // Toggle the LED state
        end
        else begin
            counter_speed1 <= counter_speed1 + 1;
        end
    end
    else begin
        if (counter_speed2 == 67500) begin
            counter_speed2 <= 0;
            led_state <= ~led_state; // Toggle the LED state
        end
        else begin
            counter_speed2 <= counter_speed2 + 1;
        end
    end
    
end

    assign led = (counter_speed1 < 1000) ? led_state : 1'b0;

    always @(posedge led_state)
    begin
        if(btn_start_stop == 1)begin
            if(step < 3'd5)begin
                if(btn_direction_control)begin
                    case(step)
                        0 : motor_out <= 4'b0001;     // Motor output for step 0 (Clockwise direction)
                        1 : motor_out <= 4'b0010;     // Motor output for step 1 (Clockwise direction)
                        2 : motor_out <= 4'b0100;     // Motor output for step 2 (Clockwise direction)
                        3 : motor_out <= 4'b1000;     // Motor output for step 3 (Clockwise direction)
                    endcase
                end
                else begin
                    case(step)
                        0 : motor_out <= 4'b1000;     // Motor output for step 0 (Anticlockwise direction)
                        1 : motor_out <= 4'b0100;     // Motor output for step 1 (Anticlockwise direction)
                        2 : motor_out <= 4'b0010;     // Motor output for step 2 (Anticlockwise direction)
                        3 : motor_out <= 4'b0001;     // Motor output for step 3 (Anticlockwise direction)
                     endcase
                 end
                step <= step + 1;          // Increment step counter     
            end
             else begin
                 step <= 'b0;              // Reset step counter
             end
        end
         else begin
             motor_out <= 'b0;              // Turn off motor output
         end
    end

    assign in1 = motor_out[0];              // Assign motor output 4
    assign in2 = motor_out[1];              // Assign motor output 2
    assign in3 = motor_out[2];              // Assign motor output 3
    assign in4 = motor_out[3];              // Assign motor output 4
    assign led1 = btn_start_stop;           // Assign start/stop button input to LED 1 output      
    assign led2 = btn_direction_control;    // Assign direction control button input to LED 2 output
    assign led3 = btn_speed;                // Assign speed button input to LED 3 output

endmodule
