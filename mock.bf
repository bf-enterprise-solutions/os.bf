[]
;; MOCK MEMORY:
>>>+++++ +++++ +++++ +++++ +++++ +++++ +++ ; file name
>- ; 225 beacon
;; File contents
>+++++ +++++ +++++ +++++ +++++ +++++ +++
>+++++ +++++ +++++ +++++ +++++ +++++ +++
>>+ ; exit flag
>>+ ; case flag
>>+++++ +++++ +++++ +++++ +++++ +++++ ++ ; space
>+++++ +++++ +++++ +++++ +++++ +++++ +++ ; name
[<]< ; to case flag
;; CODE STARTS HERE:

[-]<<[-]>>>>[-] ; kill the case & exit flags & the space after command
>[[<<<+>>>-]>] ; copy the search name closer to the file area
<<<<[<]> ; to the search name

<<<<
+[-<+] ; until the 255 beacon
<[<]> ; to the file name
;; swap dot bf from https://github dot com/aartaka/str dot bf
[>]<[[>>[>]>+<<[<]<-]>>[[<+>-]>]<<[<]<]>>[[<+>-]>]>>[[<<+>>-]>]<<<[<]<[<]>
[>]>[>]< ; to the swapped file name
[[>+<-]<] ; move swapped name closer
>>>>>[[<+>-]>] ; move the search name closer
<<[<]<[<]> ; to the file name
;; equal dot min dot  bf from https://github dot com/aartaka/str dot bf
[+>]+>[+>]<[<]>[>]<[[>+>+<<-]>[>]<[[>+<-]<]<]>>>[[<<+>>-]>]<<<[<]>[>[>>]<<[[>>+<<-]<<]>>>]>[>>]<<[>>[[<+>-]>]<<[<]<]<[>>[[<+>-]>]>[[<+>-]>]<<[<]<<[<]<]>>[>]>[>]<[[>>+<<-]<]>>>[>]<[-<]>[>]>[>]<[[>>+<<-]<]>>>[>]<[[[>+<-]<]>>[<+>-]>[>]<]<[<<]<<[>->>>[[<<+>>-]>>]+[-<+]<[>+<-]>[>]>[[>+<-]>>]<[<<]<[[>+<-]<]<]->>>[[<<+>>-]>]>[[<<+>>-]>>]+[-<+]><<+>>[[>-<-]>[[-]<<<[-]>>>]>[[<<+>>-]>]>[[>>]<<[[-]<<]<<[[-]<]<[-]>>>>>]<<<<[<]>]<<[<+>-]<<[-[>>+<<-]>[<+>-]<<]>
[-] ; kill equality flag
>>[[<<<+>>>-]>] ; move file name closer to file contents
<<<<[<]<[<]> ; to file contents
;; swap dot bf from https://github dot com/aartaka/str dot bf
[>]<[[>>[>]>+<<[<]<-]>>[[<+>-]>]<<[<]<]>>[[<+>-]>]>>[[<<+>>-]>]<<<[<]<[<]>
[>]-[>]>>>> ; back to search name (if any)
[ ; file shuffling loop (if need to search more)
 [>]<[[>+<-]<] ; copy the search name to the left
 <<<< ; to file end
 [[>+<-]<] ; copy the whole file to the right (free space for shuffling)
 >> ; to file beginning
 [[<<<[[<]<]<+>>>[[>]>]>-] ; copy the first file cell before all files
  <<<[[[>+<-]<]<] ; shift all other files right
  >>>[[>]>]>] ; to the next cell of the file and loop
 <<< ; to the files
 [[<]<]<< ; to the shuffled file
 [[>>+<<-]<] ; copy shuffled file closer
 >>>[[>]>]<< ; to the files again
 [[[>+<-]<]<] ; copy all files to the right
 >>>[[>]>]>>>> ; to the former search name cell (now empty)
]
