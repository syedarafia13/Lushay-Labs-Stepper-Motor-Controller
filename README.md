# Lushay-Labs-Stepper-Motor-Controller

This repository contains the Verilog design and testbench files for a Stepper Motor Controller implemented on the Tang Nano 9k FPGA.

## Design Description

The Stepper Motor Controller is designed to control the operation of a stepper motor using the Tang Nano 9k FPGA. It provides functionalities such as start/stop control, direction control (clockwise or anticlockwise), and speed control (high or low speed).

The top-level module top implements the Stepper Motor Controller. It takes inputs for clock signal (clk), start/stop button (btn_start_stop), direction control button (btn_direction_control), and speed control button (btn_speed). It generates step signals (in1, in2, in3, in4) to generate pulses for the stepper motor, and LED signals (led, led1, led2, led3) to indicate the state of the buttons.

## Testbench

The testbench module test is provided to verify the functionality of the Stepper Motor Controller. It instantiates the top-level module top and provides stimulus to the inputs (clk, btn_start_stop, btn_direction_control, btn_speed) to simulate different scenarios.

## User Guide Manuals
- [User Manual - Installation and Setup](https://docs.google.com/document/d/1TX2oJPWYm67gMV9igFQdw7Wp_Rzij6VKOEPoPlz9OsE/edit?usp=sharing)

- [Project Guide - Stepper Motor Controller](https://drive.google.com/file/d/1Tv7TGZVl_kCm1oaaesbhbn4ivcFDBUSN/view?usp=sharing)

## Circuit Diagram
![circuit_diagram](https://github.com/syedarafia13/Lushay-Labs-Stepper-Motor-Controller/assets/81455748/2f20e9e0-c876-49b7-86a3-84fc36db22d6)

![image1](https://github.com/syedarafia13/Lushay-Labs-Stepper-Motor-Controller/assets/81455748/f3e45a42-564a-4f8c-b38e-fa2557cba4b1)

![image2](https://github.com/syedarafia13/Lushay-Labs-Stepper-Motor-Controller/assets/81455748/f11ff8c0-532a-415f-89ff-c637d7212594)

## Simulation
![simulation](https://github.com/syedarafia13/Lushay-Labs-Stepper-Motor-Controller/assets/81455748/ccfb6a03-dbc3-4cbb-a382-b916212b9e7d)

## Getting Started

To use the Stepper Motor Controller design:

1. Clone this repository to your local machine.
2. Open the Verilog files in a suitable development environment (e.g., OSS-CAD-Suite Toolchain).
3. Simulate the design using the provided testbench to verify its functionality.
4. Modify the design as per your requirements, if needed.
5. Implement the design on the Tang Nano 9k FPGA using your preferred toolchain.
6. Connect the stepper motor to the appropriate output pins of the FPGA.
7. Power up the FPGA and test the Stepper Motor Controller.

## Contributor

- Syeda Rafia Fizza Naveed
