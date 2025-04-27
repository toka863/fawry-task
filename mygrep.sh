#!/bin/bash


print_usage() {
    echo "Usage: $0 [options] search_string filename"
    echo "Options:"
    echo "  -n    Show line numbers"
    echo "  -v    Invert match"
    echo "  --help Show this help message"
}

#Handle --help

if [[ "$1" == "--help" ]]; then
    print_usage
    exit 0
fi

#Initialize option

  show_line_numbers=false
  invert_match=false


#Parse options

 while [[ "$1" == -* ]]; do
     case "$1" in
	 -n) show_line_numbers=true ;;
	 -v) invert_match=true ;;
	 -vn|-nv)
	     show_line_numbers=true
	     invert_match=true
	     ;;
          *)
              echo "Unknown option: $1"
              print_usage
	      exit 1
	      ;;
      esac
      shift
 done

# Check if there are enough arguments left

 if [ "$#" -lt 2 ]; then
     echo "Error: Missing search string or filename."
     print_usage
     exit 1
 fi
                                                                                                                                                                 search_string="$1"																		 filename="$2"
                                                                                                                                                                # Check if file exists
																				 if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
																			       	 fi
                                                                                                                                                                # Main logic
 line_nmber=0
   while IFS= read -r line
   do
       ((line_number++))
       if echo "$line" | grep -iq "$search_string"; then	
	   match=true 
       else			    	  
           match=false
       fi

       if $invert_match; then
	   if $match; then
               match=false
           else
               match=true
	   fi
        fi


        if $match; then
            if $show_line_numbers; then
	        echo "$line_number:$line"
            else
	        echo "$line"
            fi
        fi
   done  < "$filename"
