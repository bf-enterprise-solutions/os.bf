[OS.BF---THE OS TO LAST

 OS.bf is the project to get operating systems to an effective minimum
 of features. It's written entirely in Brainfuck, an industry standard
 in minimal, portable, architecture-independent, axiomatic
 technology. The features of OS.bf are:
 - Portability: runs everywhere Brainfuck does and requires only cell
 wrapping from the implementation it runs on.
 - Textuality: has only one interaction medium---the command line. No
 bloated GUIs, no weird keymaps, just the text.
 - Simplicity: has a small set of commands and file operations that
 cover all the needs of a modern computer user.
 - Scriptability: can run arbitrary Brainfuck code on the data it
 has, thus allowing for infinite customization.
 - Containerization: all the code of OS.bf is containerized inside
 Brainfuck image and only has access to the text you input!
 - Extensibility: just copy-paste the files and operations you need
 into the OS.bf code, restart---and you have your files always with
 you!

 [1 RATIONALE

  The operating system world is in dire need of disruption—most OSes (OS
  X, Windows), and even most Linux distributions (bundling GNOME by
  default) look alike and have bloated sets of programs that are slow,
  painful to build, and behavior-wise inconsistent across the system.

  OS.bf solves these problems by going back to the minimal set of things
  OS should have: a text UI, file system, and script execution. Using
  the merits of Brainfuck as the most embeddable and portable
  programming language, the system is easy to install and launch, having
  the Brainfuck implementation as the only dependency and being as fast
  as the implementation allows it. OS.bf is a single-user,
  single-process, and single-environment system. There's only one
  user---the one launching the system. There's only one process---the
  one OS.bf and its scripts run in. There's only one
  environment---Brainfuck image memory, shared by all the scripts.

  This radical simplicity allows OS.bf to squeeze maximal power out of a
  minimal interface. Try and see for yourself!]

 [2 GETTING STARTED

  Clone the code:
  [shell:
   git clone https://github.com/bf-enterprise-solutions/os.bf.git]

  Find the proper implementation. OS.bf work only on implementations where:
  - All cells are initially zeroed.
  - Cell wraparound works in both directions.

  Run OS.bf and enjoy the most revolutionary OS you'll never forget!]

 [3 EXAMPLE USAGE

  Here's a small session recording to get you started with the features OS.bf has:
  [shell:
   # Create a file called HELLO with contents "Hello, OS.bf!":
   s HELLO Hello, OS.bf!
   # List all the files:
   l
   HELLO
   # Print the contents of the HELLO file:
   p HELLO
   Hello, OS.bf!
   # Run a script adding 1 to every char in HELLO and printing it:
   r <<<+[-<+]->[+.>]
   Ifmmp-!PT/cg"
   # delete HELLO:
   d HELLO
   # List the files again to see if the file was actually deleted:
   l
   # Exit OS.bf:
   q]]

 [4 EXTENSIONS

  OS.bf is made to be infinitely extensible via Brainfuck startup
  code. Adding extensions to the OS.bf startup sequence is as easy as
  copy-pasting the code into the right area in the source code.

  Security-minded user, for instance, might want to set a password on
  startup, so that no one gets an access to their running OS.bf:

  [bf:
   ***************************
   PASTE YOUR EXTENSIONS HERE:
   password checking: loop if input chars are not the expected ones
   ,----- ----- ----- ----- ----- ----- ----- ----- ----- ----[] 1
   ,----- ----- ----- ----- ----- ----- ----- ----- ----- -----[] 2
   ,----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -[] 3
   ,----- ----- ----- ----- ----- ----- ----- ----- ----- ----- --[] 4
   ,----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ---[] 5
   ,----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----[] 6
   ,----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----[] 7
   ,----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -[] 8
   ,----- ----- [] newline
   ***************************]]]
