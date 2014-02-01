Abilio Esteves Calegario de Oliveira, 999550263
Boris Poutivski, *********

------------------------------------------------------------------------
      
No issues to report.

------------------------------------------------------------------------

Boolean equations for ALUControl:

o0 = (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 i0 + ~i31 ~i30
i29 i28 ~i27 i26 + ~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 i3 ~i2 i1 ~i0)
~(~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 ~i1 ~i0 + ~i31 ~i30 i29
~i28 ~i27 ~i26 + ~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 i1 ~i0 +
i31 ~i30 ~i29 ~i28 i27 i26 + i31 ~i30 i29 ~i28 i27 i26 + ~i31 ~i30
~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 ~i0 + ~i31 ~i30 ~i29 ~i28 ~i27
~i26 i5 ~i4 ~i3 i2 i1 i0 + ~i31 ~i30 i29 i28 ~i27 ~i26 + ~i31 ~i30
~i29 i28 ~i27 ~i26)

o1 = (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 ~i1 ~i0 + ~i31 ~i30
i29 ~i28 ~i27 ~i26 + ~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 i1
~i0 + i31 ~i30 ~i29 ~i28 i27 i26 + i31 ~i30 i29 ~i28 i27 i26 + ~i31
~i30 ~i29 i28 ~i27 ~i26 + ~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 i3 ~i2
i1 ~i0) ~(~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 ~i0 + ~i31
~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 i0 + ~i31 ~i30 ~i29 ~i28
~i27 ~i26 i5 ~i4 ~i3 i2 i1 i0 + ~i31 ~i30 i29 i28 ~i27 ~i26 + ~i31
~i30 i29 i28 ~i27 i26)

o2  = (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 i1 ~i0 + ~i31 ~i30
~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 i1 i0 + ~i31 ~i30 ~i29 i28 ~i27 ~i26
+ ~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 i3 ~i2 i1 ~i0) ~(~i31 ~i30 ~i29
~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 ~i1 ~i0 + ~i31 ~i30 i29 ~i28 ~i27 ~i26 +
i31 ~i30 ~i29 ~i28 i27 i26 + i31 ~i30 i29 ~i28 i27 i26 + ~i31 ~i30
~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 ~i0 + ~i31 ~i30 ~i29 ~i28 ~i27
~i26 i5 ~i4 ~i3 i2 ~i1 i0 + ~i31 ~i30 i29 i28 ~i27 ~i26 + ~i31 ~i30
i29 i28 ~i27 i26)

o3 = ~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 i1 i0 ~(~i31 ~i30
~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 ~i1 ~i0 + ~i31 ~i30 i29 ~i28 ~i27
~i26 + i31 ~i30 ~i29 ~i28 i27 i26 + i31 ~i30 i29 ~i28 i27 i26 + ~i31
~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 ~i0 + ~i31 ~i30 ~i29 ~i28
~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 i0 + ~i31 ~i30 i29 i28 ~i27 ~i26 + ~i31
~i30 i29 i28 ~i27 i26 + ~i31 ~i30 ~i29 i28 ~i27 ~i26 + ~i31 ~i30 ~i29
~i28 ~i27 ~i26 i5 ~i4 i3 ~i2 i1 ~i0)

------------------------------------------------------------------------

Boolean equations for Control:

RegDst = In26 + In29

RegWrite = ~In31 ~In30 ~In28 ~In27 ~In26 + ~In31 ~In30 In29 In28 ~In27
+ In31 ~In30 ~In29 ~In28 In27 In26

ALUSrc = ~In31 ~In30 In29 ~In27 ~In26 + ~In31 ~In30 In29 In28 ~In27 +
In31 ~In30 ~In28 In27 In26

TristateBuffer = In31 ~In30 In29 ~In28 In27 In26

ReadMem = In31 ~In30 ~In29 ~In28 In27 In26

Beq = ~In31 ~In30 ~In29 In28 ~In27 ~In26

Jump = ~In31 ~In30 ~In29 ~In28 In27 ~In26

------------------------------------------------------------------------

Description:

Input signals In31 to In26 correspond to the opcode;
Input siganil In5 to In0 correspond to the funct and is only used to
define the ALU Control.

To reduce the complexity of Control, we choose to make ALUControl a
function also of the opcodes. The Output signals from ALUControl
select which operation the ALU will execute.

The Output signals from Control select the datapath:

-RegDst selects which operand from the instruction will be the
destination register;
-RegWrite determines if the instruction will write data in the
RegisterFile or not;
-ALUSrc selects which value to input in the ALUB - a value from a
register, or a value from the instruction itself (which passes
through the sign extend);
-TristateBuffer controls if the instruction will write or read from
the MEM. By default, the TristateBuffer will always activate memory
reading;
-ReadMem controls if the data to be written in the RegisterFile will
come from the ALU or from the MEM;
-Beq, when active, indicates that the instruction is actually a
Branch if Equals;
-Jump, when active, indicates that the instruction is actually a jump.
