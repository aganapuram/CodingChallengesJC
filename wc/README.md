# wc

## Challenge 
https://codingchallenges.fyi/challenges/challenge-wc

### How To
This page contains commands on how to run the wc challenge.

##### Get the size of the file in bytes

> ruby ccwc.rb -c <filename_with_extension> <br>
> or <br>
> cat <filename_with_extension> | ruby ccwb -c
* example: <br>
  - `ruby ccwc.rb -c test.txt` <br>
  `342190 test.txt`
  - `cat test.txt | ruby ccwb.rb -c` <br>
  `342190`
  
##### Get the line count of the contents of a file 

> ruby ccwc.rb -l <filename_with_extension> <br>
> or <br>
> cat <filename_with_extension> | ruby ccwb -l
* example: <br>
  - `ruby ccwc.rb -l test.txt` <br>
  `7145 test.txt`
  - `cat test.txt | ruby ccwb.rb -l` <br>
  `7145`

##### Get the word count of the contents of a file

> ruby ccwc.rb -w <filename_with_extension> <br>
> or <br>
> cat <filename_with_extension> | ruby ccwb -w
* example: <br>
  - `ruby ccwc.rb -w test.txt` <br>
  `58164 test.txt`
  - `cat test.txt | ruby ccwb.rb -w` <br>
  `58164`

##### Get the character count of the contents of a file

> ruby ccwc.rb -c <filename_with_extension> <br>
> or <br>
> cat <filename_with_extension> | ruby ccwb -c
* example: <br>
  - `ruby ccwc.rb -c test.txt` <br>
  `339292 test.txt`
  - `cat test.txt | ruby ccwb.rb -c` <br>
  `339292`

##### Get the line count, word count of the contents and size of a file

> ruby ccwc.rb <filename_with_extension> <br>
* example: <br>
  - `ruby ccwc.rb -c test.txt` <br>
  `7145 58164 342190 test.txt`
