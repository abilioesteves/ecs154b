Abilio Esteves Calegario de Oliveira, 999550263
Boris Poutivski, 996730895

========
Issues:
========
      
No issues to report, CPU works on all tests.

===============================================
Control unit and ALU Control unit explanation:
===============================================

SAME AS LAB 3 for ALU Control and same as Lab 2 for Control.

Boolean not simplified to make debugging easier, but can be easily simplified with the provided software.

Boolean equations for ALUControl:

o0 = ~((~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 ~i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 i1 ~i0) + (i31 ~i30 ~i29 ~i28 i27 i26) + (~i31 ~i30 i29 ~i28 i27 i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 ~i0) + (~i31 ~i30 ~i29 i28 ~i27 ~i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 i1 i0) + (~i31 ~i30 i29 ~i28 ~i27 ~i26) + (~i31 ~i30 i29 i28 ~i27 ~i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 ~i5 ~i4 ~i3 ~i2 ~i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 ~i5 ~i4 ~i3 ~i2 i1 ~i0)) ((~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 i3 ~i2 i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 i0))

o1 = ~((~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 i1 i0) + (~i31 ~i30 i29 i28 ~i27 ~i26)) ((~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 ~i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 i1 ~i0) + (i31 ~i30 ~i29 ~i28 i27 i26) + (i31 ~i30 i29 ~i28 i27 i26) + (~i31 ~i30 ~i29 i28 ~i27 ~i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 i3 ~i2 i1 ~i0) + (~i31 ~i30 i29 ~i28 ~i27 ~i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 ~i5 ~i4 ~i3 ~i2 ~i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 ~i5 ~i4 ~i3 ~i2 i1 ~i0))

o2  = ~((~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 ~i1 ~i0) + (i31 ~i30 ~i29 ~i28 i27 i26) + (~i31 ~i30 i29 ~i28 i27 i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 i0) + (~i31 ~i30 i29 ~i28 ~i27 ~i26) + (~i31 ~i30 i29 i28 ~i27 ~i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 ~i5 ~i4 ~i3 ~i2 ~i1 ~i0)) ((~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 i1 i0) + (~i31 ~i30 ~i29 i28 ~i27 ~i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 i3 ~i2 i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 ~i5 ~i4 ~i3 ~i2 i1 ~i0))

o3 = ~((~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 ~i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 ~i2 i1 ~i0) + (i31 ~i30 ~i29 ~i28 i27 i26) + (~i31 ~i30 i29 ~i28 i27 i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 ~i1 i0) + (~i31 ~i30 ~i29 i28 ~i27 ~i26) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 i3 ~i2 i1 ~i0) + (~i31 ~i30 i29 ~i28 ~i27 ~i26) + (~i31 ~i30 i29 i28 ~i27 ~i26)) ((~i31 ~i30 ~i29 ~i28 ~i27 ~i26 i5 ~i4 ~i3 i2 i1 i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 ~i5 ~i4 ~i3 ~i2 ~i1 ~i0) + (~i31 ~i30 ~i29 ~i28 ~i27 ~i26 ~i5 ~i4 ~i3 ~i2 i1 ~i0))

===============
Forwarding:
===============

Forward A = (Ex/Mem.RegWrite AND Ex/Mem.Rd == ID/EX.rs AND Ex/Mem.Rd != ZERO)  concatenated with (Ex/Mem.RegWrite AND Mem/WB.Rd == ID/Ex.rs AND Mem/WB.Rd != ZERO)

Forward A then selects the correct value for the selector of MUX A: Rs, MEM or WB;

Forward B = MUX 1 = (Ex/Mem.RegWrite AND Ex/Mem.Rd == ID/EX.rt AND Ex/Mem.Rd != ZERO)  concatenated with (Ex/Mem.RegWrite AND Mem/WB.Rd == ID/Ex.rt AND Mem/WB.Rd != ZERO)

Forward B then selects the correct value for the selector of MUX B: Rt, MEM or WB;

===============
SW Forwarding:
===============

MEM/WB_ForwardMem = (SW AND (MEM/WB.RegisterRd == EX/MEM.RegisterRd)AND MEM/WB.RegWrite) concatenated with (SW AND (MEM/WB.RegisterRd == EX/MEM.RegisterRd)AND MEM/WB.ReadMem) 

where SW is true if a SW operation is identified in the EX/MEM stage;

MEM/WB_ForwardMem is then used to select the proper value for the MUX in the MEM stage.


