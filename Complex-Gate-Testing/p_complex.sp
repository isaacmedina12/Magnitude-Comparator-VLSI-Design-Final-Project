
.lib '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/tech/hspice/saed32nm.lib' TT
.include '/usr/cots/synopsys/UniversityLibrary/SAED32_EDK/lib/stdcell_rvt/hspice/saed32nm_rvt.spf'
.option post
.model n105 nmos level=54
.model p105 pmos level=54

.subckt testing_p_complex a0_not a1_not b0 b1 g gnd_1 vdd xor_out
xm4 g b1 net2 vdd p105 w=0.96u l=100n nf=1 m=1
xm3 net2 a1_not vdd vdd p105 w=0.96u l=100n nf=1 m=1
xm2 g b0 net4 vdd p105 w=1.44u l=100n nf=1 m=1
xm1 net4 a0_not net3 vdd p105 w=1.44u l=100n nf=1 m=1
xm0 net3 xor_out vdd vdd p105 w=1.44u l=100n nf=1 m=1
xm32 net1 b1 gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm12 net1 a1_not gnd_1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm11 g b0 net1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm10 g a0_not net1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
xm9 g xor_out net1 gnd_1 n105 w=0.6u l=100n nf=1 m=1
.ends testing_p_complex

.param vdd=1.05


Vdd     vdd     0   vdd
Vgnd    gnd_1   0   0

M1 out in gnd_1 gnd_1 n105 W=300n L=100n nf=1 m=1
M2 out in vdd vdd p105 W=480n L=100n nf=1 m=1

* === WORST CASE RISING & FALLING (toggle A1_in) ===
Vb1     b1      0   0
Va0not  a0_not  0   vdd
Vb0     b0      0   0
Vx      xor_out 0   vdd

* Stimulus (6 ps rise/fall per assignment)
.param trf=6p  del=2u  per=10u  pw=5u
vinput in gnd_1 pulse 0 vdd del trf trf pw per
Va1not a1_not gnd_1 pulse vdd 0 del trf trf pw per


Xdut a0_not a1_not b0 b1 g gnd_1 vdd xor_out testing_p_complex


.tran 1p 30u

.measure tran tplh_complex  \
   TRIG v(a1_not) VAL=0.525 fall=2 \
   TARG v(g)       VAL=0.525 rise=2

.measure tran tphl_complex  \
   TRIG v(a1_not) VAL=0.525 rise=2 \
   TARG v(g)       VAL=0.525 fall=2

.measure tran tp_complex param='(tphl_complex + tplh_complex)/2'

.measure tran tphl_inv  \
   TRIG v(in) VAL=0.525 RISE=2 \
   TARG v(out)       VAL=0.525 FALL=2

.measure tran tplh_inv  \
   TRIG v(in) VAL=0.525 FALL=2 \
   TARG v(out)       VAL=0.525 RISE=2

.measure tran tp_inv param='(tphl_inv + tplh_inv)/2'

.end


