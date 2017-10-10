RATE_US_JPN = 112.494 #1ドル=112.494円を示す
TUITION_UT_YEN = 535800
TUITION_US_DOL = 16329

printf("The tuition of Stanford University is %d dollar", TUITION_US_DOL)
printf("The tuition of the University of Tokyo is \%d yen", TUITION_UT_YEN)
print( TUITION_UT_YEN < TUITION_US_DOL * RATE_US_JPN ? "the tuition of Stanford is more expensive" : "the tuition of the UT is more expensive")


