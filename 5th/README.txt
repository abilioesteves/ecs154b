Abilio Esteves Calegario de Oliveira, 999550263
Boris Poutivski, 996730895

========
Issues:
========
      
No issues to report, CPU works on all tests.

======================================
How the Exception Support was tested?:
======================================

Overflow excetions were tested by hand:
	Register loaded with maximum value of 0x7FFFFFFF.
	Any positive number added to it
	See if it raises the exception and squashed the instructions in the:
		ID/EX register (the instruction that raised the exception)
		IF/ID register (instruction that followed the instruction that raised the exception)
		Instruction that is about to be loaded into IF/ID, since we don't want to execute anything until we jump to our exception handling, and the PC load is delayed by one clock cycle.
		
Undefined instruction handing:
	Undefined instruction is read in from the program memory.
	Instruction raises an exception in the ID stage.
	IF/ID register flushed.
	Instruction about to be loaded into IF/ID is flushed while the PC increments to the exception address.

If we wanted to have exception handling, the trap handler would be loaded from the exception address, run through, and then we could return to the EPC address.

===================================
Exception detection implementation:
===================================

Basically, Exception = Overflow OR UndefInstr.
The cause, then, is shoved into a MUX, where its selector is simply a concatenation of UndefInstr and overflow signals.
The exception signal is also shoved to the EPC latch, so EPC only changes when exception is high. 
When we are at 0x194, we clear Exception and instruct the circuit to get into a Infinite loop, hence remaining the states for the EPC and Cause.