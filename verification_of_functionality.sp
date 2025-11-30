
* Include Libraries:
.lib '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/tech/hspice/saed32nm.lib' TT
.include '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/lib/stdcell_rvt/hspice/saed32nm_rvt.spf'

* Post results to .lis file:
.option post

* Define transistor models:
.model n105 nmos level=54
.model p105 pmos level=54

.subckt comparator_v3 a0 a0_in a0_not a1 a1_in a1_not b0 b0_in b0_not b1 b1_in
+ b1_not e g gnd_1 l vdd xor_out
xm18 xor_out a1 net13 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm25 xor_out a1_not net10 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm19 net13 b1 gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm26 net10 b1_not gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm31 net21 xor_out gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm33 net21 a0_not gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm37 net21 b0 gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm32 g a1_not net21 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm36 g b1 net21 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm46 l a1 net29 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm42 l b1_not net29 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm47 net29 a0 gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm43 net29 b0_not gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm41 net29 xor_out gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm11 a0 a0_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm3 a0_not a0_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm9 a1 a1_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm1 a1_not a1_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm5 b1_not b1_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm7 b0_not b0_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm13 b1 b1_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm15 b0 b0_not gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm20 e g gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm27 e l gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1
xm2 a0_not a0_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm8 a1 a1_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm10 a0 a0_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm0 a1_not a1_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm4 b1_not b1_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm6 b0_not b0_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm14 b0 b0_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm12 b1 b1_not vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm21 net11 g vdd vdd p105 w=0.96u l=100n nf=1 m=1
xm22 e l net11 vdd p105 w=0.96u l=100n nf=1 m=1
xm16 net12 a1 vdd vdd p105 w=0.96u l=100n nf=1 m=1
xm23 net9 a1_not vdd vdd p105 w=0.96u l=100n nf=1 m=1
xm24 xor_out b1 net9 vdd p105 w=0.96u l=100n nf=1 m=1
xm17 xor_out b1_not net12 vdd p105 w=0.96u l=100n nf=1 m=1
xm28 net7 xor_out vdd vdd p105 w=1.44u l=100n nf=1 m=1
xm29 net8 a0_not net7 vdd p105 w=1.44u l=100n nf=1 m=1
xm30 g b0 net8 vdd p105 w=1.44u l=100n nf=1 m=1
xm34 net6 a1_not vdd vdd p105 w=0.96u l=100n nf=1 m=1
xm35 g b1 net6 vdd p105 w=0.96u l=100n nf=1 m=1
xm45 l a1 net2 vdd p105 w=0.96u l=100n nf=1 m=1
xm44 net2 b1_not vdd vdd p105 w=0.96u l=100n nf=1 m=1
xm40 l a0 net4 vdd p105 w=1.44u l=100n nf=1 m=1
xm39 net4 b0_not net3 vdd p105 w=1.44u l=100n nf=1 m=1
xm38 net3 xor_out vdd vdd p105 w=1.44u l=100n nf=1 m=1
.ends comparator_v3

.param VDDVAL = 1.05

VDD   vdd   0  DC VDDVAL
* tie ground net in subckt to node 0
Rgnd  gnd_1 0  0


* --- 4-bit binary counter on A1,A0,B1,B0 via *_in pins ---

* LSB: B0_in
Vb0in b0_in 0 PULSE(VDDVAL 0  0 1p 1p 10n 20n)

* Next bit: B1_in 
Vb1in b1_in 0 PULSE(VDDVAL 0  0 1p 1p 20n 40n)

* Next bit: A0_in 
Va0in a0_in 0 PULSE(VDDVAL 0  0 1p 1p 40n 80n)

* MSB: A1_in 
Va1in a1_in 0 PULSE(VDDVAL 0 0 1p 1p 80n 160n)

* --- instantiate the comparator ---
* external nodes a0, a0_not, etc. are just exposed; we don’t need extra sources on them

XUcmp  a0 a0_in a0_not a1 a1_in a1_not b0 b0_in b0_not b1 b1_in
+ b1_not e g gnd_1 l vdd xor_out  comparator_v3

* --- transient analysis across all 16 input combinations ---
.tran 0.1n 160n

* --- save / probe signals ---
.probe v(a1_in) v(a0_in) v(b1_in) v(b0_in) v(g) v(e) v(l) 

.end
