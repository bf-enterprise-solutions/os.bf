[bfos.bf -- the source code of BfOS, Brainfuck-based operating system.

 Commands:
 d file = delete the FILE.
 l = list existing files.
 p file = print FILE content.
 q = quit BfOS.
 r script file = run the code in SCRIPT on the contents of FILE.
 s file contents = store the CONTENTS in FILE.

 Working memory layout:
 [exit flag][0][case flag][command...]

 File layout:
 [name...][255][contents...]

 Filesystem layout:
 ... [file] [0][0][0][0][0] [0][0][0][0][0] [file] [0][working memory]

 Code starts here:]

;; TODO: File shuffling to the back of the filesystem
;; TODO: string comparison for file names
;; TODO: File content movement

>+ ; set the exit flag
[ ; main loop
 >>>,----- ----- [>,----- -----] ; read a text until a newline
 <[+++++ +++++<] ; restore the original text
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
        [ ; find next space
         >  -- -----
         ----- -----
         ----- ----- -----]
        <
        [ ; restore the contents that are not space
         +++++ +++++
         +++++ +++++
         +++++ +++++ ++ <]
        >[>] ; move to file beginning
        - ; set the byte between the name and contents to 255
        [>] ; to file end
        <[[>>>+<<<-]<] ; copy the contents three cells to the left
        >>>> [>] ; to file end
        >+ ; set new exit flag
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
     [-] ; kill the case flag
     ;; TODO: File search
    ]
    >
   ]
   <
   [ ; case 'l':
    [-] ; kill the case flag
    <<<< ; move to file area
    [ ; file listing loop
     [<]> ; move to file name
     +[-.>+] ; print the file name
     +++++ +++++.[-] ; print a newline
     - ; turn it back into 255
     [<] ; back to file beginning
     <<<<< <<<<<] ; to next file
    >>>>> >>>>> > ; to the last file
    [[>] >>>>> >>>>>] ; move through the files
    <<<<< <<<<< < ; back to last file end
    >>>> ; to case flag
   ]
   >
  ]
  <
  [ ; case 'd':
   [-] ; kill the flag
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
