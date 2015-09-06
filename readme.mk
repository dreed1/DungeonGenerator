#Procedural Dungeon Generator demo

##Cellular Automata

####Work in progress still.

I've made a cave map generator using cellular automata heuristics. You've seen conway's game of life, right? Basically like that.

Here's basically how it works:

* Fill the map randomly with walls, based on a given percentage
* For N generations of the map: (helps to do multiple passes)
  * for each location on the map
    * if it's on the border of the map, it's a wall
    * if it's already a wall and has enough walls neighboring it... it's a wall
    * if it's not already a wall and has enough walls neihboring it is also a wall.



Here's a random generation of a 100x100 map:
```
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXX   XXXX X XX  XX  XX     X X  XX X  XX  XXXXXX X  X     XXXXX XXXX   X XX X XX  XX X    X  XX X
XX X   X X X    X XX XX   XXX X X  XX XXXX   X  XXXXXXX XXX X XXX X XXXX  X X  XXXX        XX X XXXX
X  XX XXX XXXXX X     XX XXX    X XXXXX  XXX XX   XX X  X      XX   XXXX X  XXXX XXXX   X XXXX X XXX
XX     XX X    XXX     XX XX XXX XXXXX  X    XXXXXX  XX X  XXX XX  XX X   X X  XX X XXXX XXX       X
X    XX XX  X X  XX XX      X X X    X  XX   XX  XXXXXXX X  X X    X  XX XX   X  X   X  X   XX XX  X
XXXXX  X X     XX X  X X X XX   XX   XXXXX XX   XX X  XX X X XXX  XXXX     X XX X X XX  X X XXX  XXX
XX X     XX X  XXXX  XX    X X  XXX  XX   X   X  X X X XXXX   X X X  X XX X XXXXX  XXX    XX XXX   X
X X XXXX X   XX  XX  XXXX XX      X X     X XXX X   X    XXX  XXXX XXXXXXXX  XXX     XXXXX X XX  XXX
XXX    XXX X  X XXXX XX    XX   XXXX   X X   X X  XXXX XX  X XXX X  XX    XX X  XXXX   X X  X XXX XX
X XXXX XX  X  XXX  XXX  X XXXXX X X XX   X X  XXXXX XXXXX X    XXX X   XXXX XX   X X X  XXX  X   XXX
X   X XXX      XXX XX X    X    XX X    X XXXX X  X     XX  XXXX  X  XX XXX X  X XX   X   X XXX  X X
X    XXX   XX    XX   X XXXX X X XX  XX   XX    XXX XXX   XX  X       X     XXXXXX XX    XXXX XXX  X
XXXX   XX XX     X  XXXX    XXX   X   XX X XX   X   X  XX X X X  X  XX X X    XX  X  X XX    XX   XX
XX   X XXX   XXX XX XX   X X XXXX X X X  X X  X XXXXXX    XXX X X X   XX XXXX   XXX X  X    X    XXX
X   XXX    X XXXX X XXXX XX  X  XX  X  X  X XXX  X X XX X  X  XXXX XX X  X  XXXX  XX   XX X X X    X
XXXXXXXXX XXX  XXX  X X X XXXXXXX  X    X XX X   X  XXXX    X X X  XXXX     X  XX X X  X   X X  XX X
XX XX XXXX X XX X       XX    X XXXXX XX   XXXX    X  XXX   XX    XXX  XXX XXX XXXX  X XX X  XX  X X
XX XXX  X  XXXX   XX  X XX  XX  X X  XX   XXXX XXXX    X  XX X XXXXXXX  X  X  X   X       X X   XXXX
X X X XXX   X  X   XX XXXX    XXX X X    X     X XX  X XX    X X XX XX  X  XXX  X X X X XX    XXX XX
XXX XX XX X    XXXXX XX XX X  X X     XX XXXX   XXXXX XXX      X    XX XXX  XXX    XX  X   X  XX X X
X XXXX X    X  X X    XXXXX XXX     X XX  X  XX  XX X  XXXXX    X   XXX   XX XXX XXXXXXXXX  XXXXX XX
XXX  X XX      X  XX  X  X  XXXXX  XX XX  X     X  X X XX XXX  XX  XXX  XX  X    XXX XXXXX XX X  X X
X  X  X  X  X X  XX       X XXXX XX    XX  X X X  X  XXX  X  X   X  X  X       XX X      XXX  XX   X
X X  XXXXX    XXX X     XX  X    XXX X  X XXXX X   XX X      X XXXX XXXX XXXXX X XXX X  XXXXX    X X
X X XX   XXXX XXX    X   X  XXXXXX XXX  XX  X   X X    X  X  X  XX XXXX  X X  X   X XX XX X      X X
X   XX  X  XXX    X  XX X XXXXX   X  X X     XX   X     X XXX XXXXX XXX  XXX  X   XXXXX XXX X  X   X
XXXXXXX  XXX  XXXX   XX XX  XXXX  X XXXX      XX XX  X XX    XXX X  XXX X  X   XX   X XXX X   XXX XX
XXXX   XXX X X         XXXXX  XX    X  X X    X  X  X X X X XX X X  XX  X  XX XXXXX   XXXX  XXX   XX
XXXX X   X XXX     XXXX   X XX X X XXXX   X X   X       X X     XX   X  XXX  X     XXX   X X X  X XX
XX  X  X X   X   XX   XXX  X X    X XXX X  X    X XXXX  XXXX    X X  X X X XXXXXX X XXX  X      XX X
XXX X XX X X  X    X X  XXX XXXXX   X   X      X    XX   X X   X X  XXXXX  X X   X XXX XX XXXX XX XX
XX  XXXX X  XX  X  X XXX  X   XXX X   XX  XX XX XXXX  XX X  XX XX  XXXX  XXX       X X   XX X  X   X
XX      XX XXXX  XXXX XX   X X XX XXX    X  XX  X XXXX X X X  X  XX XX X  X  XXXX      XXX XXX XXXXX
XXX X  X X XXX    X  XXXXX  X X    XXXX X XX  X   XXXX    XX XX XX    X XX XX    X   X XX XXX X    X
XX  XX    X XXX X   X       XXXXX  XX XXX XX  X XX  X    X X X     XXX X X   X  XX     X X   X   X X
XX X   X  XX   XX  X XXXX XXXXX X X XXX X X X X XXXXX X X   XX        X XX   X X   XXXX XX  X     XX
XX  XX    X     X   XX X  X X X XXXX  XX X     X   X XX XXX XX XX  X    X  X  X   XX X  X   X X    X
X XX   X X  XX  X  X     X X    XX X  X   X   XX    X XX XX XX X  X XXXXX X   XX X XXXX  X      X XX
X  X XX   X    X    X    XXXXX XXX X X X XX X  X XX X XXX  X XXX XX  X     X X X      XXXXXX      XX
X X X   X  X  X XX  X  XXX XXX X   X  XXX    XX X XXXXXXX XX  X X  X XXXXXXX   XXXX        XX XXX XX
XX  XXXXX  X  X      X XX X       X XX X X X X XXX X X   XX  X XX X XX XX    XXX XXXX      X   X   X
XXX XX  X  XXX X   X X X  X XX   XXX X    XXXX XX XXX     XX XX   X  XXX XXX  X XXXXX  X           X
X X X      X   XXXXXXX XX  XXXXX  X  XXXX XXXXX  X X  X  X   X X  XXXX X X  X X X  X   X XXXX    XXX
XX     XX   X X X X  XX XX   X  XX X    XX  X X   X X   X X   XXX X   XXX X XXX  XXXX  XXXXXXXX  XXX
X XX    X XXXXXX  X  XXX  X  X XX  X X   X XXX  XX    XX  X     XX  XX XXX    X XX X X X X X XXXXXXX
X XXXX   XXX X    X   XXXX  X  X  XXX X    X  X XX   XXXXX  X X X  XXX XXXX    X XXXX  X XX   XXX XX
X  X  XX X   XXX XXXX       XX XXXXXX XX     X XX XXXX X   X   XXX  XXX XXXXX    XX     XX  X  X  XX
XXX X    X   XX XXXXX X  XXXX XX XX X XX XX  XX    X   XXXXX XXX X  X  X X XX X XX  XXXXX X XXX XX X
X  X X X X    X X X XXX XXX          X  X  XXX  X        X   X XXX   X        XX X XX XX   XXXXXX  X
X                                                                                                  X
XXXXXX X    XXXX  XX  X X  XXXX  X     XX X  X   XX X X     X XX  X   XX  X  XXX  XX X X     X    XX
XX  XX   X XX X  XX  X XX   X     XXXXXX XXXX     XXXX XX XX  X   XXXX X  X   X X   XXX    X  X   XX
X XXX XX X     XXX XXX     X     XX X X  XX X   X  XXXX XXX     XXXX    XXX X XX X X XX    X  X  XXX
X  X X XX X XX  XX X X    XX  X X X X    XX X XX XXXX XXX X XX  X    XXXXXXXXXXX X   X  X X X    X X
XXXX    XX XXX    X  XX  XXXXXXX     X X  XXXX X X  X XX  X  XX XX  XX   X       XX  XXXX X  XX    X
X X   X     X    X X  XXXX  X X XXXX      X     X  XXXXXXXX   XXXX XX    XXX  X     XX X    X  X X X
XXXX  XXX X  X    X    XX X XX X XX  XXXXX  XX  XX XX   X  X XXXX X X XX X X X    X   X XXX  X   XXX
X XXX XXX  X   XXXXXXXXXXX  XX    X X  X     XXXXX X X    XXXX  XX X  X  X  X X XXXXX  XX       X XX
XXXX  XX  X     XX    XXXX XX  XXXXXX X  XXXXX  XXXXXXX  X  X  X XXX  XXX  X XX XX   XXX X   XXX  XX
X      XX X  X       X XX X  XX   XXXX    X  X XX   X     X XX  X X X XX X  X XXX X XX X  XX XX    X
XX   X  X X XXXX        X XX X   XX   X               XXXX X X  XX XXX XXX XXXX XX  XXX   X    X X X
XX XX   XXXX  XX     XXX XXXX X XX  XX XXX XXX X XXX X X X X X     X  X      XX XXX  XX XX      X  X
XXX  X   X  X  X   X  X  X  X  X    X    XX XX   X    X   X  X  X X     XX X  X    XXXX      XX X  X
X         X X  XXXX    XX       X X  X XXXXXXXX XX   X  X X XXX         XXX    X X   X    X XXX X  X
XX  XXXXXXX    XX   X XX XX   X X XXXXXXX X    X X   XXX   XX  XX X   X   XX    X  X    X XXXXX    X
X XXX  X    X X   XX   X   X XXX  X    XXXX  XXXX  XXXXXX    XXX    X       X   X   XXXXX X XX    XX
X    X XX XXXX   X  XX  X   XXX   XXX  X    X  X   X  X X  X X XX XXXXX XX X X X   XXXXXXXXX  X  X X
XX X     XXXXX X  X X   X   XX     XX X X X X XX XX  XXX   XX  X    X XXXXX XXXX   XX     X    X  XX
XX  XX  X XXX  XXXXX   XXXX  X   XX      XXX  XXXXX  XX X XXXX XX  X   XX XXXXX  X XXXX       XX XXX
XXX   X  X   X   X     XXX XX XX X X XXXXXXXXXX XXXXX X     XX X X XX   XXXXXX   XXX XX   X X XXXX X
X  XXX  XXX X  X    XXXXXX   XX  XX   X X  XXX  X X   X XX XX   X XX X   X XX   X  X X XX        X X
XX  XXX XXX    X    X  X    XXX XX      X   X X    X XXXXXXXX X XX XX  XX X     X XX  XX  XXXXX  X X
X   X X X X X   XXX  X X XXXXX        X  X  X X X X     X XX X  XX XX     X          X X X   XX   XX
X   XXX X XX     X X X X XX X      X  X XX  X X  X X X X   X XX X   XX X XXX X     XX X XX X XX X XX
XX  X X XX   XX    XX  XXXX XX X XX XXXXX X X X XX  X   X  X  X X        X  XX  X X XX    XXX    XXX
XX XX X XX   X    XX X      X X   XX  XX  X   XX XXXX   XXXXX X  XX XXX XX  X X X X   XXXX  XX   X X
XX   X XX X X   XXX   XXXX      XX  X  XX XX XXXXX  XXXXXX    X   X       XXXXXX  X   X   X XXXX   X
XX  XX XX XXXX XXX XXX  XXX   X   XX X   X  X   XXX  X XX   XXX X X XX XXXXX  X  X  XX      X X XX X
X XX   XXXXX X   XX  XXXX XXX X  XX  XXXXX   XXXX X   X   X  X   X  XXXXXXXX XX  X   X     X XXX   X
XXX  X X X     X XXX  X XX X  XX X  X X    XXX XXXXX   X   X X X  XX  XX X X  XXX XX   X XX  XX X  X
XX  XXXXXXX X X    XXXX XXXXX XXX   X X   XXX  XX X XX      X XX XXXX X   X X X X   X XX X    X XXXX
X   X X   XXXX X  X XX   XX   X X  XX  XX XX X   X X X XXXXXX XX X XX X X X XXX X  X       X XXX X X
X X  XXXXX XX XXX  X    XX XXX XXX  X X   XXX  X XXX    X X XXXX  X XX X        XXX   XXXXXXX X X XX
X    X XX XXXX  X       XXXXXX X X  X         XX X XX  X X XX X X X XXXXX X  X X    X X  X  XX XX  X
XX  XXXXX XX X   XX X XX  XXX X   XXXXXX X X     X  XXXXX  X XXX X XX X XX   XXX XXXXXXX  X X XX X X
XX X X X    XX XX X  XX    X   X   XXXXXXX   X XXX X   XX     X XXXXX   X  X  XXXXXXX   X  X  XX X X
X  X        X X X   XXX  XXX  X     XXXXX     X   X  X  XXXX XXXX  X X       XX     XXX   XXXXXXX  X
XX     X XX  X X  XX XXXXX  XXX   X XXXXXX XX XXX  X  XXX   X   X  X    XXX X X    X X XX  X  X XX X
XXX XXXXX  XXXX  XXXXXX X  XX X X XX  XX   X    XXXX  X XXX   XX XXX  X XXXX XXX  X   X   XX      XX
XX X X  X XXXXXXX    X X  X X     XXX  X X       X XX X X XX XXXXXX XX X   X X XXXX X  XXX XX  X X X
XX X     XXXX  X    X  XXX XXX  X XX X  XXX  X  XXX X   X XX   XXXX  XX  X XX  XXX XX  X   XXX X X X
X    XXX XX X   XX X   X XXXX X   XXXX XX X  X XX X XX XX X   X     X       X X X  XXXX X XXXXXXX XX
XXXXXX  XX  XX   XX X  XXXX       X XX X  X  XX    XX   X XXX  XX    XXXX    XXX X    XXX XX XXX  XX
X  XX X    X X XX  XXXX  XX XXXX X XX XX X X XXXX  XX  XX X X X   X      XXX   XX  XXX  X X XXXXX  X
XX   XX X X  X    X XX          XXX    XX  X XXX  XX X  X X  X  XXX       X  XX   XXXXX X X      X X
X X     XX X  X X X     XX XXXXXXX  X  X XXXX  XXX XX  X    X XXXXX  X XX  XXX X XXX   XX XX  X   XX
X XXXXX  X X        X  XXX  XXX   X XX XXXXXXXX  X  XXXX X X  X  X XXX X    XXXX    X XXXXXXX     XX
X XXX X  XX X X   XXXX  X XXX       XX X  X      XX XXXX     XXXX X X    X   X   X  XXXXX X X  X XXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```


And after the map generation it turns more like this:
```
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXX  XXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXX
XXX    XXXXXXXXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXXXXXXX
XXX     XXXXXXXXXXX     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     XXXXXXXXX
XXXX     XXXXXXXXXX      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     XXXXXXXXX
XXXX     XXXXXXXXXX       XXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX   XXXXXXXXXX
XXXX    XXXXXXXXXXXX      XXXXXXXXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXX  XXXXXXXXXXXXXX     XXXXXXXXXXX      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXX  XXXXXXXX    XXXXXXXXXXX      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXX    XXXXXXX    XXXXXXXXXX      XXXXXXXXXXXXXXXXXXXXXXX   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXX     XXXXXXXX    XXXXXXXX       XXXXXXXXXXXXXXXXXXXXXX     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXX     XXXXXXXX     XXXXXXX       XXXXXXXXXXXXXXXXXXXXXX      XXXXXXXXXXXXXXXXXXX   XXX  XXX
XXXXXXXXXX    XXXXXXXXX     XXXXXXX        XXXXXXXXXXXXXXXXXXXXXX     XXXXXXXXXXXXXXXXXX          XX
XXXXXXXXXX    XXXXXXXX      XXXXXXX        XXXXXXXXXXXXXXXXXXXXXXX   XXXXXXXXXXXXXXXX             XX
XXXXXXXXXXX  XXXXX           XXXXXXX       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX              XX
XXXXXXXXXXXXXXXXX            XXXXXXX       XXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXX              XXX
XXXXXXXXXXXXXXXXX             XXXXXX        XXXXXXXXXXXXX    XXXXXXXXXXXXXXXXXXXXXX             XXXX
XXXXXXXXXXXXXXXX              XXXXX            XXXXXXXXXX     XXXXXXXXXXXXXXXXXXXXXX           XXXXX
XXXXXXXXXXXX                 XXXXX              XXXXXXXXXX     XXXXXXXXXXXXXXXXXXXXXX         XXXXXX
XXXXXXXXXXX                 XXXXXX               XXXXXXXXX        XXXXXXXXXXXXXXXXXXXXXXX     XXXXXX
XXXXXXXXXX                  XXXXXX                XXXXXXX          XXXXXXXXXXXXXXXXXXXXXXXX    XXXXX
XXXXXXXXXX                  XXXXXXX                XXXXX           XXXXXXXXXX  XXXXXXXXXXXXX     XXX
XXXXXXXXXXX                 XXXXXXXX                XXX           XXXXXXXXXX     XXXXXXXXXXX      XX
XXXXXXXXXXXX               XXXXXXXXXX                           XXXXXXXXXXXX      XXXXXXXXXX       X
XXXXXXXXXXXXX             XXXXXXXXXXXX                         XXXXXXXXXXXXX       XXXXXXXXX       X
XXXXXXXXXXXXX            XXXXXXXXXXXXXX                        XXXXXXXXXXXXX        XXXXXXX       XX
XXXXXXXXXXXXXX           XXXXXXXXXXXXXX                        XXXXXXXXXXXXXX       XXXXXXX       XX
XXXXXXXXXXXXXX            XXXXXXXXXXXXX                         XXXXXXXXXXXXXX      XXXXXXX       XX
XXXXXXXXXXXXXX            XXXXXXXXXXXX                          XXXXXXXXXXXXXX      XXXXXXXX      XX
XXXXXXXXXXXXXX             XXXXXXXXXX                           XXXXXXXXXXXXXX       XXXXXXXX     XX
XXXXXXXXXXXXXX              XXXXXXXXX                            XXXXXXXXXXXXXX       XXXXXXX     XX
XXXXXXXXXXXXXX               XXXXXXXXX                            XXXXXXXXXXXXX        XXXXXXX    XX
XXXXXXXXXXXXXX               XXXXXXXXXX                            XXXXXXXXXXX         XXXXXXX    XX
XXXXXXXXXXXXX               XXXXXXXXXXXX                            XXXXXXXXX          XXXXXXX    XX
XXXXXXXXXXXX                XXXXXXXXXXXX                              XXXXX             XXXXX     XX
XXXXXXXX                    XXXXXXXXXXXX                               XXX                        XX
XXXXXXX                    XXXXXXXXXXXXX                                                          XX
XXXXXXX                    XXXXXXXXXXXXX                                                          XX
XXXXXXX                    XXXXXXXXXXXXX                                                          XX
XXXXXXX                     XXXXXXXXXXXX                                                          XX
XXXXXX                      XXXXXXXXXXXX                                                          XX
XXXXX                       XXXXXXXXXXXXX                                         XX     XXXX    XXX
XXXXX                        XXXXXXXXXXXX                                        XXXX   XXXXXXXXXXXX
XXXXX                         XXXXXXXXXX                                XX       XXXXXXXXXXXXXXXXXXX
XXXXX                         XXXXXXXXXX                               XXXX      XXXXXXXXXXXXXXXXXXX
XXXXX                          XXXXXXXXX                               XXXX      XXXXXXXXXXXXXXXXXXX
XXXXX                            XXXXXX                                 XX        XXXXXXXXXXXXXXXXXX
XXXXX                                                                              XXXXX   XXXXXXXXX
XXXXX                                                                               XXX          XXX
XXXXXX                                                                              XXX           XX
XXXXXX                                              XX                              XXX           XX
XXXXXX                                             XXXXXX                 XXX        XX           XX
XXXXX                     XX                       XXXXXXX               XXXXX       XXX           X
XXXX                     XXXXX                     XXXXXXXX              XXXXX       XXX           X
XXXX                    XXXXXXX                    XXXXXXXXX  XXXX       XXXXX        XX          XX
XXXX                   XXXXXXXX                   XXXXXXXXXXXXXXXXX       XXXX        XXX         XX
XXXX                  XXXXXXXXX                   XXXXXXXXXXXXXXXXXX       XXXX       XXX         XX
XXX                   XXXXXXXXX                    XXXXXXXXXXXXXXXXX        XXXXX    XXXX         XX
XX                     XXXXXXXX                        XXXXXXXXXXXXXX       XXXXXX  XXXX          XX
XX                     XXXXXXX                          XXXXXXXXXXXXX       XXXXXX  XXXX           X
XX                      XXXXX                            XXXXXXXXXXX         XXXXX  XXXX           X
XX                       XX              XXXX            XXXXXXXXXX           XXX    XX            X
XX                                     XXXXXXX            XXXXXXXX                                 X
XX                                    XXXXXXXXX            XXXXXX                                  X
XX                                    XXXXXXXXXX            XXXXX                   XXX           XX
XX                                     XXXXXXXXXX           XXXXX       XX         XXXXX          XX
XX                                      XXXXXXXXXX         XXXXXX      XXXXXX      XXXXX          XX
XX                                      XXXXXXXXXXX    XXXXXXXXXX      XXXXXXX    XXXXX           XX
XX       XX                             XXXXXXXXXXX   XXXXXXXXXXXX      XXXXXX    XXXXX           XX
XX      XXXX                             XXXXXXXXXX   XXXXXXXXXXXXX     XXXXX      XXXXX          XX
XX      XXXX                               XXXXXXXX    XXXXXXXXXXXXX     XXX        XXXX          XX
X        XXX                                XXXXXXX     XXXXXXXXXXXX     XXX         XXXX         XX
X        XX                                  XXXXXX      XXXXXXXXXX      XXXX        XXXX         XX
XX      XXX                                   XXXXXX     XXXXXXXXX       XXXXX        XX          XX
XX      XXX                                   XXXXXXX   XXXXXXXXXX       XXXXXX                    X
XX     XXXXX                                   XXXXXXXXXXXXXXXXXXX      XXXXXXX                    X
XX     XXXXX                                   XXXXXXXXXX  XXXXXXX     XXXXXXXX                    X
XXX    XXXXX                                   XXXXXXXXX    XXXXXXX   XXXXXXXXXX                   X
XXX   XXXXXX                                   XXXXXXXX      XXXXXXXXXXXXXXXXXXX                  XX
XX   XXXXXXXX                                   XXXXXXX      XXXXXXXXXXXXXXXXXXX                  XX
XX   XXXXXXXXX                                  XXXXXXX      XXXXXXXXXXXXXXXXXXXX                 XX
XX   XXXXXXXXX                                  XXXXXXX     XXXXXXXXXXXXXXXXXXXXX                 XX
XX   XXXXXXXXX                                  XXXXXXXX    XXXXXXXXXXXXXXXXXXXXXX                XX
XX    XXXXXXXX                       XXX        XXXXXXXXX    XXXXXXXXXXXXX  XXXXXXXXX             XX
XX         XXX            XX        XXXXX        XXXXXXXXX   XXXXXXXXXXXX    XXXXXXXXX             X
XX          XXX     XXX  XXXX       XXXXX         XXXXXXXX   XXXXXXXXXX      XXXXXXXXXX            X
XX          XXX    XXXXXXXXXXX      XXXXX         XXXXXXXX    XXXXXXXX       XXXXXXXXXXX           X
XXX        XXXXX   XXXXXXXXXXX     XXXXXX         XXXXXXXXX   XXXXXXXX       XXXXXXXXXXXX         XX
XXX       XXXXXX    XXXXXXXXXX    XXXXXXXX       XXXXXXXXXXX  XXXXXXXX        XXXXXXXXXXXX        XX
XXX       XXXXXX      XXXXXXXX    XXXXXXXX       XXXXXXXXXXX   XXXXXX         XXXXXXXXXXXXXXXXX   XX
XXXX      XXXXX        XXXXXXX    XXXXXXXX        XXXXXXXXXX    XX            XXXXXXXXXXXXXXXXXXXXXX
XXXXX      XXXX         XXXXXX    XXXXXXXXX       XXXXXXXXXX                  XXXXXXXXXXXXXXXXXXXXXX
XXXXXX      XX           XXXXXX  XXXXXXXXXX      XXXXXXXXXXX                  XXXXXXXXXXXXXXXXXXXXXX
XXXXXX                   XXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXX                  XXXXXXXXXXXXXXXXXXXXXXX
XXXXXX                  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX      XX         XXXXXXXXXXXXXXXXXXXXXXXX
XXXXXX                 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXX        XXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXX  XXXXXX   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX      XXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```