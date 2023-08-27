               JOB  CARD 1 OF DUMP FROM GERMANY
               CTL  6611
     * SET WORD MARKS
               ORG  1
               SW   A1,A2
     A1        SW   A3
     A2        SW   A4
     A3        SW   A5,A6
     A4        SW   A7,A8
     A5        SW   A9
     A6        SW   A10,A11
     A7        SW   BLOOP,A13
     A8        SW
     A9        SW   A14,A15
     A10       SW   A16,A12
     A11       CW   A4
     A12       SW   B1
               W
     A13          2)
     A14          N0
     A15       R    BSTART
     a16       NOP
               JOB  CARD 2 OF DUMP FROM GERMANY
               ORG  1
     BDOTS2    DCW  @..@
               DC   @..5..@
     BADDR     DCW  210
               DC   @ @
     BSTART    CS   332              MAKE SURE 330 IS NOT ZERO
                  N00
               NOP
     BLOOP     LCA  BADDR,210
     B1        LCA
               CW   A8
               A    BREAD+1,BADDR
               BCE  BDONE,330,0
               A    BREAD+1,Bloop+6
               LCA  BDOTS2,332
               B    BLOOP
     BDONE     CW   B1
               W
                  N0
                  N0
     BREAD     R    CSTART
               DCW  #1
               JOB  CARD 3 OF DUMP FROM GERMANY
               ORG  1
     CGOTWM    MCW  CNOP,CDONE
               B    CCONT
     CSTART    SW   C1
               NOP
     C1        CS   332
               NOP
               BW   CGOTWM,101
               SW   101
     CCONT     LCA  101,201
               BCE  CDONE,CCONT+4,3
               A    CREAD,CCONT+3
               A    CREAD,CCONT+6
               B    CCONT
     CDONE     CW   201
               W
                  2)
                  N0
     CREAD     R    DSTART
     CNOP      NOP
               JOB  CARD 4 OF DUMP FROM GERMANY
               ORG  1
               DCW  @....5..@
     DADDR     DCW  110
               DC   #1
     DSTART    CS   300              MAKE SURE 300 IS NOT ZERO
               NOP
               SW   D1
               NOP
     DLOOP     LCA  DADDR,210
     D1        LCA
               NOP  0
               A    DREAD+1,DADDR
               BCE  DDONE,300,0
               A    DREAD+1,DLOOP+6
               NOP  0,0
               B    DLOOP
     DDONE     CW   D1
               W
                  N0
                  N0
     DREAD     R    ESTART
               NOP
               JOB  CARD 5 OF DUMP FROM GERMANY
               ORG  1
     EGOTWM    MCW  ENOP,EDONE
               B    ECONT
               DCW  #4
               DCW  #1
     ESTART    CS   300
               CS
               BW   EGOTWM,81
               SW   81
     ECONT     LCA  81,281
               BCE  EDONE,ECONT+4,3
               A    EREAD,ECONT+3
               A    EREAD,ECONT+6
               B    ECONT
     EDONE     CW   281
               W
                  2)
                  N0
     EREAD     R    FSTART
     ENOP      NOP
               JOB  CARD 6 OF DUMP FROM GERMANY
               ORG  1
     FDOTS     DCW  @......*1*..*2*..*3*.@
               DC   #9
     FSTART    SW   F1
               CW   A1,A2
               CW   BLOOP,C1
     F1        CW
               LCA  FDOTS,300
               SW   GINDEX-4,GAUS-2
               R    GSTART
               DCW  #4
               DCW  #1
               DCW  #2
               DCW  #2
               DCW  #4
               DCW  #1
               JOB  CARD 7 OF DUMP FROM GERMANY
               ORG  1
     GUMS      DCW  @UMSCHALTER EIN@
               DC   #1
     GAUS      DCW  @AUS@
               DCW  #4
     GINDEX    DCW  @INDEX@
               DC   #2
               DCW  #4
     GSTART    LCA  GINDEX,280
               LCA  GINDEX,305
               NOP
               LCA  GUMS,214
               LCA  GAUS,234
               CW   A14
               CW   A12
               NOP
               SW   HLOOP
               R    HLOOP
               DCW  #1
               JOB  CARD 8 OF DUMP FROM GERMANY
               ORG  1
     HINC      DCW  2
               DC   #9
     HLOOP     BSS  HON,B
     HOFF      MCW  HSWICH,236
               A    HINC,HOFF+6
               B    HCONT
     HON       MCW  HSWICH,216
               A    HINC,HON+6
               NOP
     HCONT     A    HREAD,HLOOP+4 
               A    HREAD,HSWICH
               BCE  HREAD,HSWICH,H
               NOP
               B    HLOOP
     HREAD     R    ISTART
     HSWICH    DCW  @B@
               JOB  CARD 9 OF DUMP FROM GERMANY
               ORG  101
     * CLEAR CORE AT 299, THEN AT 80, SET A WORD MARK AT 1, READ AND
     * BRANCH TO 1.  LOADED FROM 16 6O 116
     ICLR1     CS   299
     ICLR2     CS   80
     ICLR3     SW   JSTART
     ICLR4     R    JSTART 
     * START OF THE CARD...
               ORG  1
     ILOAD     DCW  @/299/080,0011001@
               DC   #6
               DCW  #7
               DCW  #4
     ISTART    SW   I1,I2
               CW   HLOOP,HOFF
               CW
               LCA  ILOAD,ICLR4+3
               SW   ICLR4+4,ICLR4
               SW   ICLR3
     I1        SW   ICLR2
               W
                  N0
     I2        CC   K
               B    ICLR1
               JOB  CARD 10 OF DUMP FROM GERMANY
     *         
               ORG  75
               MCW  175,105
               MCW
               MCW  172,114
               MCW  175,119
               SW   245
               MCW  333,245
               BW   120,331
               CW   245
               A    168,175
               MA
               C    175,179
               BU   068
               W
                  2)
                  N0
               MN   14,173
               C    51,191
               BU   1
               R    PSTART
               DCW  1
               DCW  1
               DCW  333
               DCW  245
               DCW  22
               DCW  12
               DCW  @.....5..@
               DCW  39
               DCW  00400
     ZONE      DC   @-ZONE @
               ORG  1
     JSTART    SW   J1,J2
     J1        SW   J3,J4
     J2        SW   J5,J6
     J3        NOP
     J4        SW   J7
     J5        SW   J8
     J6        LCA  JCODE,ZONE
     J7        R    KSTART
     J8        EQU  *+1
     JCODE     DCW  @1001113332452212.....5..3900400-ZONE @
               JOB  CARD 11 OF DUMP FROM GERMANY
               ORG  1
     KSTART    LCA  KCODE,119
               SW   190,188
               SW   170,83
               SW
               SW   180
               SW   178
               SW   176,68 
               R    LSTART
     KCODE     DCW  @7MM172114M175119,245M333245V1203331)245@
               JOB  CARD 12 OF DUMP FROM GERMANY
               ORG  1
     LSTART    LCA  LCODE2,163
               LCA  LCODE1,144
               SW   141,64
               SW
               SW   180
               SW   178
               SW   176,68
               R    MSTART
     LCODE1    DCW  @A168175#C175179B068/22)N0@
               DC   #1
     LCODE2    DCW  @C051191B001/@
               JOB  CARD 13 OF DUMP FROM GERMANY
               ORG  1
     MSTART    LCA  MCODE+6,151
               SW   173,168
               SW   159,143
               NOP
               SW   135,128
               CW   42,81
               SW   127,116
               SW   108
               SW   101,97
               SW   90,90
               NOP
               R    NSTART
     MCODE     MN   14,173
               JOB  CARD 14 OF DUMP FROM GERMANY
               ORG  1
     NSTART    MCS  200,211
               MCW  172,205
               LCA  37,251
               NOP
               B    NCONT
               DCW  #4
               DCW  @,,5,,39@
     NCONT     CW   27,27
               R    OSTART
               JOB  CARD 15 OF DUMP FROM GERMANY
               ORG  1
               MCS  200,211
               A    169,192
               LCA  189,251
               LCA
     OSTART    BCE  49,188,9
               A    169,188
               A    169,20
               B    15
               MN   80,188
               MCW  177,20
               W
               CW   299
               MCW  175,100
               MCW  175,107
               JOB  CARD 16 OF DUMP FROM GERMANY
               ORG  1
     PSTART    SW   27,35
               SW   36,54
               NOP  0,0
               NOP
               SW   65
               CW   75
               CS   332
               CS
                  N0
               LCA  PUMSCH,213
               NOP  0
               BLC  63
                  N0
               LCA  PAUS,213
               H
     PAUS      DCW  @AUS@
               DC   #1
     PUMSCH    DCW  @UMSCH. A EIN@
               END
