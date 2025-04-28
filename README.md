Question 1 answer:

1- The script first checks if the user uses --help and shows the usage instructions, then exits.
Next, it reads options like -n or -v in a simple while loop and sets flags for them.
Then, it checks if both the search string and filename are provided.
Finally, it builds the correct grep command based on the options and runs it to display the matching lines.


2-If I wanted to add regex support, I would update the script to use grep -E for extended patterns.
The -i option (ignore case) is already handled with grep -i, so I would just adjust how options are read if needed.
For -c (count matches) and -l (list matching files), I would change how the grep command is built by adding -c or -l based on the user's input, and update the output without chhecking lines one by one.


3-The hardest part was using -v (invert match) with -n (show line numbers).
When I tried -vn, the results looked normal, so it was hard to figure out what was wrong.
I realized later that the grep command wasn't fully inverting the matches the way I expected.
At first, it was confusing to see how combining options changed the output, but after more testing, I understood it.


Question 2 answer:

- Performed DNS verification using dig (both local server and 8.8.8.8).
- Tested service reachability with curl and telnet.
- Identified potential causes.
- Implemented fixes for DNS settings, firewall rules, and web services.
- Configured /etc/hosts and updated DNS settings with systemd-resolve.

 DNS CHECK

- Used nslookup to test DNS locally and with 8.8.8.8.
- Found that local DNS couldn't resolve the domain.
- The problem is likely with internal DNS settings or the network.


 POSSIBLE CAUSES

- DNS Issues: Wrong /etc/resolv.conf settings, DNS server offline, or domain only available internally.
- Network Issues: Firewall blocking required ports or incorrect routing configurations.
- Service Issues: Web server is down or configured to bind only to 127.0.0.1 instead of an external IP.


 SOLUTION APPLIED

- DNS - Incorrect Server → Checked with cat /etc/resolv.conf, then updated to the correct DNS IP.
- Service Not Listening → Verified with ss -tuln, updated the server configuration,and restarted the web service.

