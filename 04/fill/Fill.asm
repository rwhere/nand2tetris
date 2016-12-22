// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//optimization: no need to blacken or unblacken if already done => keep track of state

(LOOP)
@24576
D=M
@UNBLACKEN
D;JEQ
@BLACKEN
0;JMP

(UNBLACKEN)
@24575
D=A
@5
M=D
@16384
D=A
@6
M=D
(LOOP1)
@5
D=M
@6
D=D-M
@LOOP
D;JEQ
@6
A=M
M=0
@1
D=A
@6
M=M+D
@LOOP1
0;JMP

(BLACKEN)
@24575
D=A
@5
M=D
@16384
D=A
@6
M=D
(LOOP2)
@5
D=M
@6
D=D-M
@LOOP
D;JEQ
@6
A=M
M=-1
@1
D=A
@6
M=M+D
@LOOP2
0;JMP