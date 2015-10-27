# Java GC stuff 

 **Print java GC stats like TenuringDistribution**

 * JVM option: -XX:+PrintGCDetails
 * JVM option: -XX:+PrintTenuringDistribution
 * JVM option: -verbose:gc
 * JVM option: -Xloggc:${com.sun.aas.instanceRoot}/logs/gc.log
 * output should look like:
 >  [Times: user=0.08 sys=0.00, real=0.02 secs] 
 > 1992.259: [GC 1992.259: [ParNew
 > Desired survivor size 67108864 bytes, new threshold 10 (max 10)
 > - age   1:    6618672 bytes,    6618672 total
 > - age   2:     172224 bytes,    6790896 total
 > - age   3:      44808 bytes,    6835704 total
 > - age   4:     772584 bytes,    7608288 total
 > - age   5:     275968 bytes,    7884256 total
 > - age   6:     133384 bytes,    8017640 total
 > - age   7:     112312 bytes,    8129952 total
 > - age   8:     264024 bytes,    8393976 total
 > - age   9:     619736 bytes,    9013712 total
 > - age  10:       7632 bytes,    9021344 total
 > : 1060662K->10664K(1179648K), 0.0245050 secs] 1356639K->306745K(5111808K), 0.0246780 secs]


***
 **-XX:MaxTenuringThreshold=10**

 * this option will allow the existance of 10 young genetations before promoting to old generation
