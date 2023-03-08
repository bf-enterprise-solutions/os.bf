[os.bf -- the source code of OS.bf, Brainfuck-based operating system.

 Commands:
 d file = delete the FILE.
 l = list existing files.
 p file = print FILE content.
 q = quit OS.bf.
 r script file = run the code in SCRIPT on the contents of FILE.
 s file contents = store the CONTENTS in FILE.

 Working memory layout:
 [exit flag][0][case flag][command...]

 File layout:
 [name...][255][contents...]

 Filesystem layout:
 [0] [0] [0] [0] [file] [0] ... [file] [0] [file] [0] [0] [working memory]

 Code starts here:]

>>>>>+ ; set the exit flag
[ ; main loop
 >>>,----- ----- [+++++ +++++>,----- -----] ; read a text until a newline
 <[<] ; to the command text start
 +> ; set the case flag and get back to the command text
 ;;; switch
 [ ; if exists
  ;; 'd' (100)
  ----- ----- ----- -----
  ----- ----- ----- -----
  ----- ----- ----- -----
  ----- ----- ----- -----
  ----- ----- ----- -----
  [ ; 'l' (108)
   ----- ---
   [ ; 'p' (112)
    ----
    [ ; 'q' (113)
     -
     [ ; 'r' (114)
      -
      [ ; 's' (115)
       -
       [ ; default case:
        <->[-] ; empty the flag
        ;; error
        ;; question mark
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++++ +++++
        +++++ +++++ +++.[-]
        +++++ +++++.[-]
       ]
       <
       [ ; case 's'
        [-]<<[-]>> ; kill the case flag AND exit flag
        >>[-] ; kill the space between 's' and file name
        > ; file name
        ;; separate the next two arguments by space (32)
        ----- -----
        ----- -----
        ----- ----- --
        [ ; find next space loop
         +++++ +++++ +++++
         +++++ +++++ +++++ ++
         >  -- ----- -----
         ----- ----- ----- -----]
        - ; set the byte between the name and contents to 255 (beacon)
        [<] ; to file start
        >[[<<<<<<+>>>>>>-]>] ; copy the contents six cells to the left
        <<<<+ ; set new exit flag
        >> ; to new case flag (empty)
       ]
       >
      ]
      <
      [ ; case 'r'
       [-] ; kill the case flag
       ;; TODO: File search
       ;; TODO: Embed MBF
      ]
      >
     ]
     ;; case 'q': kill the case flag AND exit flag
     <[[-]<<[-]>>]>
    ]
    <
    [ ; case 'p':
     [-]<<[-]>>>>[-] ; kill the case & exit flags & the space after command
     >[[<<<+>>>-]>] ; copy the search name closer to the file area
     <<<<[<]> ; to the search name
     [ ; file search loop
      <<<<< ; move to the file
      +[-<+] ; until the 255 beacon
      <[<]> ; to the file name
      ;; swap dot bf from https://github dot com/aartaka/str dot bf
      [>]<[[>>[>]>+<<[<]<-]>>[[<+>-]>]<<[<]<]>>[[<+>-]>]>>[[<<+>>-]>]<<<[<]<[<]>
      [>]>[>]< ; to the swapped file name
      [[>+<-]<] ; move swapped name closer (bc equal consumes 2 cells to the left)
      >>[>]>>>[[<<+>>-]>] ; move the search name closer
      <<<[<]<[<]> ; to the file name
      ;; equal dot min dot  bf from https://github dot com/aartaka/str dot bf
      [+>]+>[+>]<[<]>[>]<[[>+>+<<-]>[>]<[[>+<-]<]<]>>>[[<<+>>-]>]<<<[<]>[>[>>]<<[[>>+<<-]<<]>>>]>[>>]<<[>>[[<+>-]>]<<[<]<]<[>>[[<+>-]>]>[[<+>-]>]<<[<]<<[<]<]>>[>]>[>]<[[>>+<<-]<]>>>[>]<[-<]>[>]>[>]<[[>>+<<-]<]>>>[>]<[[[>+<-]<]>>[<+>-]>[>]<]<[<<]<<[>->>>[[<<+>>-]>>]+[-<+]<[>+<-]>[>]>[[>+<-]>>]<[<<]<[[>+<-]<]<]->>>[[<<+>>-]>]>[[<<+>>-]>>]+[-<+]><<+>>[[>-<-]>[[-]<<<[-]>>>]>[[<<+>>-]>]>[[>>]<<[[-]<<]<<[[-]<]<[-]>>>>>]<<<<[<]>]<<[<+>-]<<[-[>>+<<-]>[<+>-]<<]>
      [ ; if equal
       [-] ; kill equality flag
       >>[>]>[>]< ; to the end of the search name
       [[-]<] ; kill the search name
       <[<]<] ; back to (empty) equality flag and exit
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
       [; actual file movement loop
        [<<<[[<]<]<+>>>[[>]>]>-] ; copy the first file cell before all files
        <<<[[[>+<-]<]<] ; shift all other files right
        >>>[[>]>]>] ; to the next cell of the file and loop
       <<< ; to the files
       [[<]<]<< ; to the shuffled file
       [[>>+<<-]<] ; copy shuffled file closer
       >>>[[>]>]<< ; to the files again
       [[[>+<-]<]<] ; copy all files to the right
       >>>[[>]>]>>> ; to the former search name cell (now empty)
      ] ; file shuffling loop ends
      >[[<+>-]>] ; copy the search name back
      <<[<]> ; back to the search name
     ] ; file search loop ends
     <<<<<+[-<+] ; to the file contents (via 255 beacon)
     - ; restore beacon
     >[.>] ; print out all the file
     +++++ +++++.[-] ; newline
     >>+ ; set exit flag
     >> ; to case flag (empty)
    ]
    >
   ]
   <
   [ ; case 'l':
    [-] ; kill the case flag
    <<<<< ; move to file area
    [ ; file listing loop
     [<]> ; move to file name
     +[-.>+] ; print the file name until 255 beacon
     +++++ +++++.[-] ; print a newline
     - ; turn it back into 255 beacon
     [<] ; back to file beginning
     <] ; to next file
    >> ; to the last file beginning
    [[>]>] ; move through the files
    >>> ; to case flag
   ]
   >
  ]
  <
  [ ; case 'd':
   [-]<<[-]>>>>[-] ; kill the case & exit flags & the space after command
     >[[<<<+>>>-]>] ; copy the search name closer to the file area
     <<<<[<]> ; to the search name
     [ ; file search loop
      <<<<< ; move to the file
      +[-<+] ; until the 255 beacon
      <[<]> ; to the file name
      ;; swap dot bf from https://github dot com/aartaka/str dot bf
      [>]<[[>>[>]>+<<[<]<-]>>[[<+>-]>]<<[<]<]>>[[<+>-]>]>>[[<<+>>-]>]<<<[<]<[<]>
      [>]>[>]< ; to the swapped file name
      [[>+<-]<] ; move swapped name closer (bc equal consumes 2 cells to the left)
      >>[>]>>>[[<<+>>-]>] ; move the search name closer
      <<<[<]<[<]> ; to the file name
      ;; equal dot min dot  bf from https://github dot com/aartaka/str dot bf
      [+>]+>[+>]<[<]>[>]<[[>+>+<<-]>[>]<[[>+<-]<]<]>>>[[<<+>>-]>]<<<[<]>[>[>>]<<[[>>+<<-]<<]>>>]>[>>]<<[>>[[<+>-]>]<<[<]<]<[>>[[<+>-]>]>[[<+>-]>]<<[<]<<[<]<]>>[>]>[>]<[[>>+<<-]<]>>>[>]<[-<]>[>]>[>]<[[>>+<<-]<]>>>[>]<[[[>+<-]<]>>[<+>-]>[>]<]<[<<]<<[>->>>[[<<+>>-]>>]+[-<+]<[>+<-]>[>]>[[>+<-]>>]<[<<]<[[>+<-]<]<]->>>[[<<+>>-]>]>[[<<+>>-]>>]+[-<+]><<+>>[[>-<-]>[[-]<<<[-]>>>]>[[<<+>>-]>]>[[>>]<<[[-]<<]<<[[-]<]<[-]>>>>>]<<<<[<]>]<<[<+>-]<<[-[>>+<<-]>[<+>-]<<]>
      [ ; if equal
       [-] ; kill equality flag
       >>[>]>[>]< ; to the end of the search name
       [[-]<] ; kill the search name
       <[<]<] ; back to (empty) equality flag and exit
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
       [; actual file movement loop
        [<<<[[<]<]<+>>>[[>]>]>-] ; copy the first file cell before all files
        <<<[[[>+<-]<]<] ; shift all other files right
        >>>[[>]>]>] ; to the next cell of the file and loop
       <<< ; to the files
       [[<]<]<< ; to the shuffled file
       [[>>+<<-]<] ; copy shuffled file closer
       >>>[[>]>]<< ; to the files again
       [[[>+<-]<]<] ; copy all files to the right
       >>>[[>]>]>>> ; to the former search name cell (now empty)
      ] ; file shuffling loop ends
      >[[<+>-]>] ; copy the search name back
      <<[<]> ; back to the search name
     ] ; file search loop ends
     <<<<< ; to the file
     [[-]<]
     >>+ ; set exit flag
     >> ; to case flag (empty)
  ]
  >
 ]
 <
 [ ; case '\n':
  [-] ; kill the flag and noop
 ]
 >>[>]<[[-]<] ; zero the command contents and move to command beginning
 <<< ; back to exit flag and loop if not zeroed
] ; main loop
<<<[[[-]<]<]<< ; to the initial cell
