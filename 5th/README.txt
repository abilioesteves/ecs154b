Abilio Esteves Calegario de Oliveira, 999550263
Boris Poutivski, 996730895

========
Issues:
========
      
No issues to report, CPU works on all tests.

======================================
How the Exception Support was tested?:
======================================



===================================
Exception detection implementation:
===================================

Basically, Exception = Overflow OR UndefInstr.
The cause, then, is shoved into a MUX, where its selector is simply a concatenation of UndefInstr and overflow signals.
The exception signal is also shoved to the EPC latch, so EPC only changes when exception is high. 
When we are at 0x194, we clear Exception and instruct the circuit to get into a Infinite loop, hence remaining the states for the EPC and Cause.