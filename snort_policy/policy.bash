# SYN Flooding
alert tcp any any -> 192.168.182.138 80 (msg:"SYN-Flooding-Detection"; flags: S; threshold: type threshold, track by_dst, count 5, seconds 10; sid: 1000004;)

# UDP Flooding
alert udp any any -> 192.168.182.138 any (msg:"UDP-Flooding-Detection"; threshold: type threshold, track by_dst, count 10, seconds 1; sid: 1000002;)

# ICMP Flooding
alert icmp any any -> 192.168.182.138 any (msg:"ICMP-Flooding-Detection"; threshold: type threshold, track by_dst, count 10, seconds 1; sid: 1000003;)