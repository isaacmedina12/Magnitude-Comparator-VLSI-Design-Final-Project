* Timing for 2-bit Magnitude Comparator with Buffer Insertion
* Made by: Isaac Medina
* EE103 VLSI Design Final Project Fall 2025
* Date: 30 Novemeber 2025
* Description: Timing of the worst case delays with optimal gate sizing and buffer
*              insertion. The worst case transition occurs on the critical path as
*              as described in Figure 32 on p.20 of my report.

* Initial sizing based on p.19-20 of my report. The topology was swapped to have the 
* buffers at the beginning of the circuit not the end. 

* Rigorous simulation, manual resizing, and the optimization tool created new sizing
* in the netlist below.

* The math said that 7 stages was optimal with 2 inverters inserted.

* SCALE FACTORS (initial, these DID NOT WORK WELL):
*      First inverter: Size 1 LOCKED
*      Second inverter: Size = 1.6
*      Inverter buffer 1: Size = 40.2
*      Inverter buffer 2: Size = 12.64
*      XOR Gate: Size = 5
*      Custom Complex Gate: Size = 4
*      NOR Gate: Size = 6.4

* Worst case vectors (always when E is rising or falling, given B1_in or A1_in is rising/falling)
* There are 16 total times to measure:


*      E = 0000 cases
*      Case 1: 0000 --> 1000 (falling E, rising A1_in); 1000 --> 0000 (rising E, falling A1_in)
*      Case 2: 0000 --> 0010 (falling E, rising B1_in); 0010 --> 0000 (rising E, falling B1_in)

*      E = 0101 cases
*      Case 3: 0101 --> 1101 (falling E, rising A1_in); 1101 --> 0101 (rising E, falling A1_in)
*      Case 4: 0101 --> 0111 (falling E, rising B1_in); 0111 --> 0101 (rising E, falling B1_in)

*      E = 1010 cases
*      Case 5: 1010 --> 0010 (falling E, falling A1_in); 1101 --> 0101 (rising E, rising A1_in) 
*      Case 6: 1010 --> 1000 (falling E, falling B1_in); 1000 --> 1010 (rising E, rising B1_in)


*      E = 1111 cases
*      Case 7: 1111 --> 0111 (falling E, falling A1_in); 0111 --> 1111 (rising E, rising A1_in) 
*      Case 8: 1111 --> 1101 (falling E, falling B1_in); 1101 --> 1111 (rising E, rising B1_in)



* ======================= THE SPICE SCRIPT BEGINS HERE ======================= *

* Include Libraries:
.lib '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/tech/hspice/saed32nm.lib' TT
.include '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/lib/stdcell_rvt/hspice/saed32nm_rvt.spf'

* Post results to .lis file:
.option post

* Define transistor models:
.model n105 nmos level=54
.model p105 pmos level=54

* Comparator subcircuit netlist from Synopsys Custom Compiler:
.subckt comparator_v2 a0 a0_in a0_not a1 a1_in a1_not b0 b0_in b0_not b1 b1_in
+ b1_not e g gnd_1 l vdd xor_out a1_not_1 a1_1 b1_not_1 b1_1

* First A1 inverter:
xm0 a1_not a1_in vdd vdd p105 w=0.48u l=100n nf=1 m=1s
xm1 a1_not a1_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1

* First A0 inverter:
xm2 a0_not a0_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm3 a0_not a0_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1

* First B1 inverter:
xm4 b1_not b1_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm5 b1_not b1_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1

* First B0 inverter:
xm6 b0_not b0_in vdd vdd p105 w=0.48u l=100n nf=1 m=1
xm7 b0_not b0_in gnd_1 gnd_1 n105 w=0.3u l=100n nf=1 m=1

* Second A1 inverter: 
xm8 a1 a1_not vdd vdd p105 w=2000n l=100n nf=1 m=1
xm9 a1 a1_not gnd_1 gnd_1 n105 w=1000n l=100n nf=1 m=1

* Second A0 inverter: 
xm10 a0 a0_not vdd vdd p105 w=5000n l=100n nf=1 m=1
xm11 a0 a0_not gnd_1 gnd_1 n105 w=2500n l=100n nf=1 m=1

* Second B1 inverter: 
xm12 b1 b1_not vdd vdd p105 w=1000n l=100n nf=1 m=1
xm13 b1 b1_not gnd_1 gnd_1 n105 w=500n l=100n nf=1 m=1

* Second B0 inverter: 
xm14 b0 b0_not vdd vdd p105 w=5000n l=100n nf=1 m=1
xm15 b0 b0_not gnd_1 gnd_1 n105 w=2500n l=100n nf=1 m=1


** Buffers:
xm48 a1_not_1 a1 vdd vdd p105 w=2000n l=100n nf=1 m=1
xm49 a1_not_1 a1 gnd_1 gnd_1 n105 w=1000n l=100n nf=1 m=1

xm50 b1_not_1 b1 vdd vdd p105 w=2000n l=100n nf=1 m=1
xm51 b1_not_1 b1 gnd_1 gnd_1 n105 w=1000n l=100n nf=1 m=1

xm52 a1_1 a1_not_1 vdd vdd p105 w=4000n l=100n nf=1 m=1
xm53 a1_1 a1_not_1 gnd_1 gnd_1 n105 w=2000n l=100n nf=1 m=1

xm54 b1_1 b1_not_1 vdd vdd p105 w=4000n l=100n nf=1 m=1
xm55 b1_1 b1_not_1 gnd_1 gnd_1 n105 w=2000n l=100n nf=1 m=1
**

* XOR Gate:
xm16 net4 a1_1 vdd vdd p105 w=8000n l=100n nf=1 m=1
xm17 xor_out b1_not net4 vdd p105 w=8000n l=100n nf=1 m=1
xm23 net2 a1_not vdd vdd p105 w=8000n l=100n nf=1 m=1
xm24 xor_out b1_1 net2 vdd p105 w=8000n l=100n nf=1 m=1

xm18 xor_out a1_1 net5 gnd_1 n105 w=4000n l=100n nf=1 m=1
xm19 net5 b1_1 gnd_1 gnd_1 n105 w=4000n l=100n nf=1 m=1
xm25 xor_out a1_not net3 gnd_1 n105 w=4000n l=100n nf=1 m=1
xm26 net3 b1_not gnd_1 gnd_1 n105 w=4000n l=100n nf=1 m=1

* Custom Gate for G:
xm28 net10 xor_out vdd vdd p105 w=25000n l=100n nf=1 m=1
xm29 net14 a0_not net10 vdd p105 w=25000n l=100n nf=1 m=1
xm30 g b0 net14 vdd p105 w=25000n l=100n nf=1 m=1
xm34 net22 a1_not vdd vdd p105 w=20000n l=100n nf=1 m=1
xm35 g b1 net22 vdd p105 w=20000n l=100n nf=1 m=1

*xm31 g xor_out net42 gnd_1 n105 w=15000n l=100n nf=1 m=1
*xm32 net42 a1_not gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1
*xm33 g a0_not net42 gnd_1 n105 w=15000n l=100n nf=1 m=1
*xm36 net42 b1 gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1
*xm37 g b0 net42 gnd_1 n105 w=15000n l=100n nf=1 m=1

* Switched NMOS topology for less output cap:
xm31 net42 xor_out gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1
xm32 g a1_not net42 gnd_1 n105 w=15000n l=100n nf=1 m=1
xm33 net42 a0_not gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1
xm36 g b1 gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1
xm37 net42 b0 gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1

* Custom Gate for L: 
xm38 net56 xor_out vdd vdd p105 w=25000n l=100n nf=1 m=1
xm39 net58 b0_not net56 vdd p105 w=25000n l=100n nf=1 m=1
xm40 l a0 net58 vdd p105 w=25000n l=100n nf=1 m=1
xm44 net54 b1_not vdd vdd p105 w=20000n l=100n nf=1 m=1
xm45 l a1 net54 vdd p105 w=20000n l=100n nf=1 m=1

*xm41 l xor_out net53 gnd_1 n105 w=15000n l=100n nf=1 m=1
*xm43 l b0_not net53 gnd_1 n105 w=15000n l=100n nf=1 m=1
*xm47 l a0 net53 gnd_1 n105 w=15000n l=100n nf=1 m=1
*xm42 net53 b1_not gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1
*xm46 net53 a1 gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1

* Switched NMOS topology for less output cap:
xm41 net53  xor_out gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1
xm43 net53 b0_not gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1
xm47 net53 a0 gnd_1 gnd_1 n105 w=15000n l=100n nf=1 m=1
xm42 l b1_not net53 gnd_1 n105 w=15000n l=100n nf=1 m=1
xm46 l a1 net53 gnd_1 n105 w=15000n l=100n nf=1 m=1

* NOR Gate:
xm20 e g gnd_1 gnd_1 n105 w=20000n l=100n nf=1 m=1
xm22 e l net1 vdd p105 w=30000n l=100n nf=1 m=1
xm21 net1 g vdd vdd p105 w=30000n l=100n nf=1 m=1
xm27 e l gnd_1 gnd_1 n105 w=20000n l=100n nf=1 m=1


.ends comparator_v2

* Define vdd and gnd_1:
.param vdd=1.05
VDD   vdd   0  DC vdd
Rgnd  gnd_1 0  0

* Stimulus parameters:
.param trf=6p  del=2u  per=10u  pw=5u

* Instantiate the comparator:
XUcmp  a0 a0_in a0_not  a1 a1_in a1_not  b0 b0_in b0_not  b1 b1_in b1_not \
      e  g  gnd_1 l  vdd  xor_out a1_not_1 a1_1 b1_not_1 b1_1 comparator_v2


* Define load capacitances (128Cin | H = 128 all paths):
Cload_g g 0 350f
Cload_e e 0 350f
Cload_l l 0 350f


* ============= Tests of G and L delay to confirm critical path ============== *

* G = 1 --> 0 --> 1 | 0100 --> 0110 --> 0100
*Va1in a1_in 0 0
*Va0in a0_in 0 vdd
*Vb1in b1_in 0 pulse 0 vdd del trf trf pw per
*Vb0in b0_in 0 0

*.tran 1p 30u
*.measure tran tphl_G_test  \
*       TRIG v(b1_in) val='0.5*vdd' rise=2 \
*       TARG v(g)     val='0.5*vdd' fall=2

*.measure tran tplh_G_test  \
*       TRIG v(b1_in) val='0.5*vdd' fall=2 \
*       TARG v(g)     val='0.5*vdd' rise=2

*.measure tran tp_G_test param='(tphl_G_test + tplh_G_test)/2'

* L = 1 --> 0 --> 1 | 0001 --> 1001 --> 0001
*Va1in a1_in 0 pulse 0 vdd del trf trf pw per
*Va0in a0_in 0 0
*Vb1in b1_in 0 0
*Vb0in b0_in 0 vdd

*.tran 1p 30u
*.measure tran tphl_L_test  \
*       TRIG v(a1_in) val='0.5*vdd' rise=2 \
*       TARG v(l)     val='0.5*vdd' fall=2

*.measure tran tplh_L_test  \
*       TRIG v(a1_in) val='0.5*vdd' fall=2 \
*       TARG v(l)     val='0.5*vdd' rise=2

*.measure tran tp_L_test param='(tphl_L_test + tplh_L_test)/2'




* ================= Measure all the worst case delay vectors ================= *

* Case 1: 0000 --> 1000 (falling E, rising A1_in); 1000 --> 0000 (rising E, falling A1_in)
*Va1in a1_in 0 pulse 0 vdd del trf trf pw per
*Va0in a0_in 0 0
*Vb1in b1_in 0 0
*Vb0in b0_in 0 0 

*.tran 1p 30u
*.measure tran tphl_E_0000_1000  \
*       TRIG v(a1_in) val='0.5*vdd' rise=2 \
*       TARG v(e)     val='0.5*vdd' fall=2

*.measure tran tplh_E_1000_0000  \
*       TRIG v(a1_in) val='0.5*vdd' fall=2 \
*       TARG v(e)     val='0.5*vdd' rise=2

*.measure tran tp_case_1 param='(tphl_E_0000_1000 + tplh_E_1000_0000)/2'


* Case 2: 0000 --> 0010 (falling E, rising B1_in); 0010 --> 0000 (rising E, falling B1_in)
*Va1in a1_in 0 0
*Va0in a0_in 0 0
*Vb1in b1_in 0 pulse 0 vdd del trf trf pw per
*Vb0in b0_in 0 0 

*.tran 1p 30u
*.measure tran tphl_E_0000_0010  \
*       TRIG v(b1_in) val='0.5*vdd' rise=2 \
*       TARG v(e)     val='0.5*vdd' fall=2

*.measure tran tplh_E_0010_0000  \
*       TRIG v(b1_in) val='0.5*vdd' fall=2 \
*       TARG v(e)     val='0.5*vdd' rise=2

*.measure tran tp_case_2 param='(tphl_E_0000_0010 + tplh_E_0010_0000)/2'


* Case 3: 0101 --> 1101 (falling E, rising A1_in); 1101 --> 0101 (rising E, falling A1_in)
*Va1in a1_in 0 pulse 0 vdd del trf trf pw per
*Va0in a0_in 0 vdd
*Vb1in b1_in 0 0
*Vb0in b0_in 0 vdd

*.tran 1p 30u
*.measure tran tphl_E_0101_1101  \
*       TRIG v(a1_in) val='0.5*vdd' rise=2 \
*       TARG v(e)     val='0.5*vdd' fall=2

*.measure tran tplh_E_1101_0101  \
*       TRIG v(a1_in) val='0.5*vdd' fall=2 \
*       TARG v(e)     val='0.5*vdd' rise=2

*.measure tran tp_case_3 param='(tphl_E_0101_1101 + tplh_E_1101_0101)/2'


* Case 4: 0101 --> 0111 (falling E, rising B1_in); 0111 --> 0101 (rising E, falling B1_in)
*Va1in a1_in 0 0
*Va0in a0_in 0 vdd
*Vb1in b1_in 0 pulse 0 vdd del trf trf pw per
*Vb0in b0_in 0 vdd

*.tran 1p 30u
*.measure tran tphl_E_0101_0111  \
*       TRIG v(b1_in) val='0.5*vdd' rise=2 \
*       TARG v(e)     val='0.5*vdd' fall=2

*.measure tran tplh_E_0111_0101  \
*       TRIG v(b1_in) val='0.5*vdd' fall=2 \
*       TARG v(e)     val='0.5*vdd' rise=2

*.measure tran tp_case_4 param='(tphl_E_0101_0111 + tplh_E_0111_0101)/2'


* Case 5: 1010 --> 0010 (falling E, falling A1_in); 0010 --> 1010 (rising E, rising A1_in) 
*Va1in a1_in 0 pulse vdd 0 del trf trf pw per
*Va0in a0_in 0 0
*Vb1in b1_in 0 vdd
*Vb0in b0_in 0 0

*.tran 1p 30u 
*.measure tran tphl_E_1010_0010  \
*       TRIG v(a1_in) val='0.5*vdd' fall=2 \
*       TARG v(e)     val='0.5*vdd' fall=2

*.measure tran tplh_E_0010_1010  \
*       TRIG v(a1_in) val='0.5*vdd' rise=2 \
*       TARG v(e)     val='0.5*vdd' rise=2

*.measure tran tp_case_5 param='(tphl_E_1010_0010 + tplh_E_0010_1010)/2' 


* Case 6: 1010 --> 1000 (falling E, falling B1_in); 1000 --> 1010 (rising E, rising B1_in) 
*Va1in a1_in 0 vdd
*Va0in a0_in 0 0
*Vb1in b1_in 0 pulse vdd 0 del trf trf pw per
*Vb0in b0_in 0 0

*.tran 1p 30u
*.measure tran tphl_E_1010_1000  \
*       TRIG v(b1_in) val='0.5*vdd' fall=2 \
*       TARG v(e)     val='0.5*vdd' fall=2

*.measure tran tplh_E_1000_1010  \
*       TRIG v(b1_in) val='0.5*vdd' rise=2 \
*       TARG v(e)     val='0.5*vdd' rise=2

*.measure tran tp_case_6 param='(tphl_E_1010_1000 + tplh_E_1000_1010)/2'


* Case 7: 1111 --> 0111 (falling E, falling A1_in); 0111 --> 1111 (rising E, rising A1_in) 
*Va1in a1_in 0 pulse vdd 0 del trf trf pw per
*Va0in a0_in 0 vdd
*Vb1in b1_in 0 vdd
*Vb0in b0_in 0 vdd

*.tran 1p 30u
*.measure tran tphl_E_1111_0111  \
*       TRIG v(a1_in) val='0.5*vdd' fall=2 \
*       TARG v(e)     val='0.5*vdd' fall=2

*.measure tran tplh_E_0111_1111  \
*       TRIG v(a1_in) val='0.5*vdd' rise=2 \
*       TARG v(e)     val='0.5*vdd' rise=2

*.measure tran tp_case_7 param='(tphl_E_1111_0111 + tplh_E_0111_1111)/2'


* Case 8: 1111 --> 1101 (falling E, falling B1_in); 1101 --> 1111 (rising E, rising B1_in)
Va1in a1_in 0 vdd
Va0in a0_in 0 vdd
Vb1in b1_in 0 pulse vdd 0 del trf trf pw per
Vb0in b0_in 0 vdd

.tran 1p 30u
.measure tran tphl_E_1111_1101  \
       TRIG v(b1_in) val='0.5*vdd' fall=2 \
       TARG v(e)     val='0.5*vdd' fall=2

.measure tran tplh_E_1101_1111  \
       TRIG v(b1_in) val='0.5*vdd' rise=2 \
       TARG v(e)     val='0.5*vdd' rise=2

.measure tran tp_case_8 param='(tphl_E_1111_1101 + tplh_E_1101_1111)/2'

.end
