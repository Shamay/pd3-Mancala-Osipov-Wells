Shamay Osipov and Malcolm Wells (Period 3)

Description: We will be creating a functional game of Oware. It will include both two p\
layer and single player (AI) modes. The AI will be subdivided into easy mode and hard m\
ode, with increasing levels of complexity in the algorithms used. We will be using a do\
uble linked list with two root nodes (one for each player), to hold the circle of "pits\
" central to the game. Using mouse controls, the user can "sow" the pits (explained in \
the instructions) and begin to score points.

Instructions:
- Open any of the .pde files and all of them will open in processing.
- Run driver.pde through processing and enjoy!
- Although instructions are included in the game, here is a link to official rules: htt\
p://en.wikipedia.org/wiki/Oware

What Works:
- two player game interface is fully functional
- AI computer algorithms in two modes (easy and hard) in place for single player play
- implemented double linked list
- visual displays and animations
- mouse input
- basic rules of Oware are followed

Features to Add:
- saved scores
- highlighted possible moves
- highlighted last opponent's move
- possible keyboard input

What Doesn't:
- Everything works.

Data Structure Highlights:
- the prominent data structure used is the Double Linked List
- intially, we used a single linked list to connect the pits on the board since the mov\
ement of the seeds is strictly counter-clockwise, meaning that only a point to the next\
 pit is needed.
- as we decided on the variation of Mancala to use, having a pointer to the previous pi\
t was necessary, leading us to use a double linked list
- the Pit.pde file contains the majority of the Double Linked List code
- The hard AI also uses an array of values (somewhat similar to a hash table) to calculate optimal next moves.

Background Picture attributed to Thomas Moore: http://parktownprawn.com/?attachment_id=\
6