Nicolas Corfmat

Project: Monte Carlo Approximations

--------------------
DESCRIPTION

This shell program produces two graphs as separate PDFs. The first half generates 100 random Monte Carlo estimations and plots their respective (x,y) values on a graph, highlighting points that fall within the circle as blue and red otherwise. The second plot consists of 4 independent Monte Carlo pi estimation graphs, each consisting of 70,000 random points.

BUILD

To build, run 'make' or 'make all' on the terminal command line within the project directory. This creates a 'monte_carlo' executable file which can then be run.

CLEAN

Running 'make clean' will remove the 'monte_carlo' executable and the .io files from the project directory.

RUNNING

Simply running './plot.sh' in the command line will output two PDFs of the described plots in project directory.

---------------------
