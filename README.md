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
At first, it was confusing to see how combining options changed the output, but after more testing, I understood it
