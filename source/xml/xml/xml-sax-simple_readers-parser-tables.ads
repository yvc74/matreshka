------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--                              XML Processor                               --
--                                                                          --
--                        Runtime Library Component                         --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Copyright © 2010, Vadim Godunko <vgodunko@gmail.com>                     --
-- All rights reserved.                                                     --
--                                                                          --
-- Redistribution and use in source and binary forms, with or without       --
-- modification, are permitted provided that the following conditions       --
-- are met:                                                                 --
--                                                                          --
--  * Redistributions of source code must retain the above copyright        --
--    notice, this list of conditions and the following disclaimer.         --
--                                                                          --
--  * Redistributions in binary form must reproduce the above copyright     --
--    notice, this list of conditions and the following disclaimer in the   --
--    documentation and/or other materials provided with the distribution.  --
--                                                                          --
--  * Neither the name of the Vadim Godunko, IE nor the names of its        --
--    contributors may be used to endorse or promote products derived from  --
--    this software without specific prior written permission.              --
--                                                                          --
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS      --
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT        --
-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    --
-- A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT     --
-- HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   --
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED --
-- TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR   --
-- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF   --
-- LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     --
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS       --
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.             --
--                                                                          --
------------------------------------------------------------------------------
--  $Revision$ $Date$
------------------------------------------------------------------------------

private package XML.SAX.Simple_Readers.Parser.Tables is

   pragma Preelaborate;

   type Goto_Entry is record
      Nonterm  : Integer;
      Newstate : Integer;
   end record;

   type Shift_Reduce_Entry is record
      T   : Integer;
      Act : Integer;
   end record;

   YY_Default           : constant :=    -1;
   YY_First_Shift_Entry : constant :=     0;
   YY_Accept_Code       : constant := -3001;
   YY_Error_Code        : constant := -3000;

   YY_Goto_Matrix : constant array (-1 .. 137) of Goto_Entry :=
    ((   -1,    -1), (   -3,     1), (   -2,     2), (  -10,     3),
     (   -4,     5), (  -16,    12), (  -15,    10), (   -6,     8),
     (   -5,    14), (  -16,    12), (  -15,    18), (   -7,    17),
     (  -19,    25), (  -17,    24), (   -8,    27), (  -11,    28),
     (  -29,    36), (  -28,    35), (  -27,    34), (  -26,    33),
     (  -25,    32), (  -24,    31), (  -16,    38), (  -14,    39),
     (  -18,    45), (  -55,    47), (  -16,    12), (  -15,    10),
     (   -6,    48), (  -12,    50), (  -29,    36), (  -28,    35),
     (  -27,    34), (  -26,    33), (  -25,    53), (  -16,    38),
     (  -14,    39), (  -32,    56), (  -42,    57), (  -19,    62),
     (  -23,    63), (  -57,    64), (  -56,    66), (  -16,    12),
     (  -15,    18), (   -9,    71), (  -13,    74), (  -30,    76),
     (  -17,    77), (  -37,    85), (  -36,    84), (  -35,    82),
     (  -34,    81), (  -33,    86), (  -44,    88), (  -43,    87),
     (  -20,    94), (  -16,    12), (  -15,    10), (   -6,    95),
     (  -62,    99), (  -31,   103), (  -30,   108), (  -17,   109),
     (  -40,   113), (  -38,   114), (  -37,   112), (  -36,   111),
     (  -44,   125), (  -29,    36), (  -28,    35), (  -27,    34),
     (  -26,    33), (  -25,    32), (  -24,   141), (  -21,   142),
     (  -16,    38), (  -14,    39), (  -16,    12), (  -15,    18),
     (  -58,   143), (  -61,   144), (  -39,   163), (  -40,   113),
     (  -38,   114), (  -37,   112), (  -36,   111), (  -41,   165),
     (  -45,   168), (  -47,   169), (  -48,   170), (  -49,   171),
     (  -50,   172), (  -51,   173), (  -52,   174), (  -53,   175),
     (  -29,    36), (  -28,    35), (  -27,    34), (  -26,    33),
     (  -25,    53), (  -16,    38), (  -14,    39), (  -60,   183),
     (  -59,   182), (  -16,   187), (  -14,   188), (   -8,   184),
     (  -38,   192), (  -37,   112), (  -36,   111), (  -38,   195),
     (  -37,   112), (  -36,   111), (  -46,   203), (  -46,   204),
     (  -46,   205), (  -46,   206), (  -46,   207), (  -46,   208),
     (  -46,   209), (  -46,   210), (  -54,   212), (  -22,   215),
     (  -60,   217), (  -16,   187), (  -14,   188), (   -8,   184),
     (  -38,   219), (  -37,   112), (  -36,   111), (  -54,   223),
     (  -16,    12), (  -15,    10), (   -6,   228), (  -46,   231),
     (  -16,    12), (  -15,    18), (  -46,   234));

   YY_Goto_Offset : constant array (0 .. 234) of Integer :=
    (    0,    2,    4,    4,    4,    4,    8,    8,
         8,   11,   11,   11,   11,   11,   11,   11,
        11,   13,   14,   14,   14,   15,   15,   15,
        23,   24,   24,   25,   28,   29,   29,   29,
        36,   36,   36,   36,   36,   36,   36,   36,
        36,   36,   37,   38,   38,   38,   39,   40,
        42,   45,   45,   46,   46,   46,   46,   48,
        48,   53,   55,   55,   55,   55,   55,   56,
        59,   59,   60,   60,   60,   60,   60,   60,
        60,   60,   60,   60,   61,   61,   61,   63,
        63,   63,   63,   63,   67,   67,   67,   67,
        68,   68,   68,   68,   68,   68,   68,   77,
        79,   80,   80,   81,   81,   81,   81,   81,
        81,   81,   81,   81,   81,   81,   81,   81,
        81,   81,   81,   82,   86,   87,   87,   87,
        87,   87,   87,   87,   87,   87,   87,   88,
        89,   90,   91,   92,   93,   94,   95,   95,
        95,   95,   95,   95,   95,   95,  102,  102,
       107,  107,  107,  107,  107,  107,  107,  107,
       107,  107,  107,  107,  107,  107,  107,  107,
       107,  107,  107,  110,  110,  113,  113,  113,
       113,  114,  115,  116,  117,  118,  119,  120,
       121,  121,  122,  122,  122,  122,  123,  127,
       127,  127,  127,  127,  127,  127,  127,  127,
       127,  127,  127,  130,  130,  130,  130,  130,
       130,  130,  130,  130,  130,  130,  130,  130,
       130,  130,  130,  130,  131,  131,  131,  131,
       134,  134,  134,  134,  134,  134,  134,  134,
       134,  135,  135,  135,  135,  137,  137,  138,
       138,  138,  138);

   YY_Rule_Length : constant array (0 .. 144) of Integer :=
    (    2,    0,    3,    4,    5,    5,    1,    1,
         1,    1,    1,    0,    0,    8,    8,    5,
         3,    0,    3,    0,    2,    1,    0,    1,
         1,    2,    0,    0,    0,    9,    0,    5,
         0,    2,    3,    1,    3,    0,    2,    1,
         0,    1,    1,    1,    1,    1,    1,    1,
         4,    4,    5,    4,    4,    6,    5,    5,
         3,    2,    1,    0,    0,    4,    1,    1,
         1,    1,    2,    2,    2,    1,    2,    2,
         2,    1,    4,    3,    3,    2,    3,    1,
         2,    2,    2,    1,    2,    2,    2,    1,
         2,    2,    2,    1,    5,    3,    3,    2,
         0,    0,    4,    2,    1,    0,    0,    4,
         0,    4,    0,    4,    0,    4,    0,    4,
         0,    4,    0,    4,    0,    4,    7,    6,
         3,    2,    0,    1,    1,    2,    1,    0,
         3,    0,    6,    2,    2,    1,    0,    1,
         1,    1,    1,    1,    0,    5,    0,    4,
         0);

   YY_Get_LHS_Rule : constant array (0 .. 144) of Integer :=
    (   -1,   -3,   -2,   -5,   -5,   -5,   -5,   -9,
        -9,   -9,   -4,   -4,  -11,  -10,  -14,  -14,
       -12,  -12,  -13,  -13,   -6,   -6,   -6,  -15,
       -15,  -16,  -18,  -20,  -22,   -7,  -23,   -7,
        -7,  -17,  -17,  -21,  -19,  -19,  -24,  -24,
       -24,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
       -29,  -29,  -29,  -26,  -26,  -26,  -26,  -26,
       -30,  -31,  -31,  -31,  -32,  -27,  -33,  -33,
       -33,  -33,  -35,  -35,  -35,  -35,  -35,  -35,
       -35,  -35,  -36,  -37,  -39,  -39,  -40,  -40,
       -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
       -38,  -38,  -38,  -38,  -34,  -34,  -41,  -41,
       -41,  -42,  -28,  -43,  -43,  -43,  -45,  -44,
       -47,  -44,  -48,  -44,  -49,  -44,  -50,  -44,
       -51,  -44,  -52,  -44,  -53,  -44,  -44,  -44,
       -54,  -54,  -54,  -46,  -46,  -46,  -46,  -55,
        -8,  -58,  -56,  -56,  -59,  -59,  -59,  -60,
       -60,  -60,  -60,  -60,  -61,  -57,  -62,  -57,
       -57);

   YY_Shift_Reduce_Matrix : constant array (-1 .. 473) of Shift_Reduce_Entry :=
    ((   -1,    -1), (   -1,    -1), (    2,     4), (   -1,   -11),
     (    0, -3001), (   -1, -3000), (   -1,   -10), (   28,     7),
     (   -1, -3000), (    1,     9), (    3,    13), (   23,    11),
     (   -1,   -22), (   -1, -3000), (   25,    15), (   -1, -3000),
     (    3,    13), (    6,    16), (   23,    11), (   -1,   -32),
     (   -1,    -6), (   -1,   -21), (   -1,   -23), (   -1,   -24),
     (    4,    19), (   -1, -3000), (   -1,    -2), (   21,    20),
     (   -1, -3000), (   12,    21), (   13,    22), (   16,    23),
     (   -1,   -37), (   24,    26), (   -1, -3000), (   -1,   -20),
     (   -1,   -25), (   -1,   -12), (   14,    29), (   -1, -3000),
     (   15,    30), (   -1, -3000), (    2,    44), (    3,    13),
     (    7,    40), (    8,    41), (    9,    43), (   23,    37),
     (   41,    42), (   -1,   -40), (   -1,   -26), (   10,    46),
     (   -1, -3000), (   -1,  -127), (    3,    13), (   23,    11),
     (   -1,   -22), (   29,    49), (   -1,   -17), (   -1,   -33),
     (   14,    51), (   -1, -3000), (    2,    44), (    3,    13),
     (    7,    40), (    8,    41), (    9,    43), (   17,    52),
     (   23,    37), (   41,    42), (   -1, -3000), (   -1,   -39),
     (   -1,   -41), (   -1,   -42), (   -1,   -43), (   -1,   -44),
     (   -1,   -45), (   -1,   -46), (   -1,   -47), (   11,    54),
     (   18,    55), (   -1, -3000), (   -1,   -60), (   -1,   -97),
     (   12,    58), (   13,    59), (   -1, -3000), (   28,    60),
     (   29,    61), (   -1, -3000), (   16,    23), (   -1,   -37),
     (   -1,   -30), (   11,    65), (   -1,  -144), (    1,    70),
     (    3,    13), (   21,    67), (   23,    11), (   24,    69),
     (   26,    68), (   -1,    -3), (   25,    72), (   -1, -3000),
     (   30,    73), (   -1,   -19), (   -1,   -34), (   -1,   -36),
     (   -1,   -38), (   12,    21), (   13,    22), (   19,    75),
     (   -1, -3000), (   11,    78), (   -1, -3000), (   31,    79),
     (   32,    80), (   33,    83), (   -1, -3000), (   11,    89),
     (   -1,  -101), (   14,    90), (   -1, -3000), (   15,    91),
     (   -1, -3000), (   25,    92), (   -1, -3000), (   25,    93),
     (   -1, -3000), (   -1,   -27), (    3,    13), (   23,    11),
     (   -1,   -22), (   10,    96), (   11,    98), (   27,    97),
     (   -1, -3000), (   -1,  -142), (   -1,  -128), (   -1,    -7),
     (   -1,    -8), (   -1,    -9), (   -1,    -4), (   -1,    -5),
     (   21,   100), (   -1, -3000), (   25,   101), (   -1, -3000),
     (    4,   102), (   -1, -3000), (   21,   104), (   -1,   -59),
     (   10,   105), (   -1, -3000), (   10,   106), (   22,   107),
     (   -1, -3000), (   12,    21), (   13,    22), (   19,    75),
     (   -1, -3000), (   -1,   -62), (   -1,   -63), (   -1,   -64),
     (   -1,   -65), (   11,   110), (   33,   115), (   40,   116),
     (   -1, -3000), (   37,   117), (   38,   118), (   39,   119),
     (   -1,   -69), (   37,   120), (   38,   121), (   39,   122),
     (   -1,   -73), (   10,   123), (   -1, -3000), (   10,   124),
     (   11,    89), (   -1, -3000), (   -1,  -100), (   33,   135),
     (   42,   126), (   43,   127), (   44,   128), (   45,   129),
     (   46,   130), (   47,   131), (   48,   132), (   49,   133),
     (   50,   134), (   -1, -3000), (   10,   136), (   -1, -3000),
     (   10,   137), (   14,   138), (   -1, -3000), (   21,   139),
     (   -1, -3000), (   21,   140), (   -1, -3000), (    2,    44),
     (    3,    13), (    7,    40), (    8,    41), (    9,    43),
     (   23,    37), (   41,    42), (   -1,   -40), (    3,    13),
     (   23,    11), (   -1,   -31), (   -1,  -129), (   -1,  -131),
     (   -1,  -140), (   25,   145), (   -1, -3000), (   -1,   -16),
     (   21,   146), (   -1, -3000), (   -1,   -13), (   20,   147),
     (   21,   148), (   -1, -3000), (   -1,   -58), (   -1,   -51),
     (   -1,   -52), (   11,   149), (   -1, -3000), (   10,   150),
     (   -1, -3000), (   10,   151), (   -1, -3000), (   37,   152),
     (   38,   153), (   39,   154), (   -1,   -83), (   37,   155),
     (   38,   156), (   39,   157), (   -1,   -87), (   37,   158),
     (   38,   159), (   39,   160), (   -1,   -91), (   34,   161),
     (   36,   162), (   -1, -3000), (   35,   164), (   -1,   -79),
     (   11,   110), (   33,   115), (   -1, -3000), (   34,   167),
     (   35,   166), (   -1, -3000), (   -1,   -66), (   -1,   -67),
     (   -1,   -68), (   -1,   -70), (   -1,   -71), (   -1,   -72),
     (   -1,   -61), (   -1,   -98), (   -1,   -99), (   -1,  -102),
     (   -1,  -104), (   -1,  -106), (   -1,  -108), (   -1,  -110),
     (   -1,  -112), (   -1,  -114), (   -1,  -116), (   33,   176),
     (   -1, -3000), (   11,   177), (   -1, -3000), (   -1,   -48),
     (   -1,   -49), (   10,   178), (   -1, -3000), (   29,   179),
     (   -1, -3000), (    4,   180), (   -1, -3000), (    2,    44),
     (    3,    13), (    7,    40), (    8,    41), (    9,    43),
     (   23,    37), (   41,    42), (   -1,   -35), (   10,   181),
     (   -1, -3000), (    2,    44), (    3,    13), (   21,   185),
     (   23,   186), (   24,    26), (   -1,  -134), (   25,   189),
     (   -1, -3000), (   21,   190), (   -1, -3000), (   -1,   -18),
     (   -1,   -56), (   -1,   -57), (   10,   191), (   -1, -3000),
     (   -1,   -54), (   -1,   -55), (   -1,   -80), (   -1,   -81),
     (   -1,   -82), (   -1,   -84), (   -1,   -85), (   -1,   -86),
     (   -1,   -88), (   -1,   -89), (   -1,   -90), (   -1,   -75),
     (   11,   110), (   33,   115), (   -1, -3000), (   34,   193),
     (   35,   194), (   -1, -3000), (   11,   110), (   33,   115),
     (   -1, -3000), (   34,   196), (   35,   197), (   -1, -3000),
     (   11,   198), (   -1, -3000), (   -1,   -93), (   21,   202),
     (   51,   199), (   52,   200), (   53,   201), (   -1, -3000),
     (   21,   202), (   51,   199), (   52,   200), (   53,   201),
     (   -1, -3000), (   21,   202), (   51,   199), (   52,   200),
     (   53,   201), (   -1, -3000), (   21,   202), (   51,   199),
     (   52,   200), (   53,   201), (   -1, -3000), (   21,   202),
     (   51,   199), (   52,   200), (   53,   201), (   -1, -3000),
     (   21,   202), (   51,   199), (   52,   200), (   53,   201),
     (   -1, -3000), (   21,   202), (   51,   199), (   52,   200),
     (   53,   201), (   -1, -3000), (   21,   202), (   51,   199),
     (   52,   200), (   53,   201), (   -1, -3000), (   11,   211),
     (   -1, -3000), (   35,   213), (   -1,  -122), (   -1,   -50),
     (   25,   214), (   -1, -3000), (   -1,   -15), (   -1,   -28),
     (    2,    44), (    3,    13), (   21,   185), (   23,   186),
     (   24,    26), (   26,   216), (   -1, -3000), (   -1,  -133),
     (   -1,  -135), (   -1,  -136), (   -1,  -137), (   -1,  -138),
     (   -1,  -139), (   21,   218), (   -1, -3000), (   -1,  -143),
     (   -1,   -53), (   -1,   -78), (   -1,   -74), (   11,   110),
     (   33,   115), (   -1, -3000), (   -1,   -77), (   38,   220),
     (   -1, -3000), (   11,   221), (   -1, -3000), (   -1,   -95),
     (   -1,  -123), (   -1,  -124), (   21,   222), (   -1, -3000),
     (   -1,  -126), (   -1,  -103), (   -1,  -105), (   -1,  -107),
     (   -1,  -109), (   -1,  -111), (   -1,  -113), (   -1,  -115),
     (   -1,  -117), (   35,   213), (   -1,  -122), (   34,   224),
     (   35,   225), (   -1, -3000), (   11,   226), (   -1, -3000),
     (   21,   227), (   -1, -3000), (    3,    13), (   23,    11),
     (   -1,   -22), (   10,   229), (   -1, -3000), (   -1,  -132),
     (   -1,  -141), (   -1,   -76), (   -1,   -92), (   -1,   -94),
     (   -1,  -125), (   34,   230), (   35,   225), (   -1, -3000),
     (   21,   202), (   51,   199), (   52,   200), (   53,   201),
     (   -1, -3000), (   11,   232), (   -1, -3000), (   -1,  -121),
     (    4,   233), (   -1, -3000), (    3,    13), (   23,    11),
     (   -1,   -29), (   -1,  -130), (   21,   202), (   51,   199),
     (   52,   200), (   53,   201), (   -1, -3000), (   -1,  -119),
     (   -1,  -120), (   -1,   -14), (   -1,  -118));

   YY_Shift_Reduce_Offset : constant array (0 .. 234) of Integer :=
    (    0,    1,    3,    5,    6,    8,   12,   13,
        15,   19,   20,   21,   22,   23,   25,   26,
        28,   32,   34,   35,   36,   37,   39,   41,
        49,   50,   52,   53,   56,   58,   59,   61,
        70,   71,   72,   73,   74,   75,   76,   77,
        78,   81,   82,   83,   86,   89,   91,   92,
        94,  101,  103,  105,  106,  107,  108,  112,
       114,  118,  120,  122,  124,  126,  128,  129,
       132,  136,  137,  138,  139,  140,  141,  142,
       143,  145,  147,  149,  151,  153,  156,  160,
       161,  162,  163,  164,  168,  172,  176,  178,
       181,  182,  193,  195,  198,  200,  202,  210,
       213,  214,  215,  216,  218,  219,  221,  222,
       225,  226,  227,  228,  230,  232,  234,  238,
       242,  246,  249,  251,  254,  257,  258,  259,
       260,  261,  262,  263,  264,  265,  266,  267,
       268,  269,  270,  271,  272,  273,  274,  276,
       278,  279,  280,  282,  284,  286,  294,  296,
       302,  304,  306,  307,  308,  309,  311,  312,
       313,  314,  315,  316,  317,  318,  319,  320,
       321,  322,  323,  326,  329,  332,  335,  337,
       338,  343,  348,  353,  358,  363,  368,  373,
       378,  380,  382,  383,  385,  386,  387,  394,
       395,  396,  397,  398,  399,  400,  402,  403,
       404,  405,  406,  409,  410,  412,  414,  415,
       416,  417,  419,  420,  421,  422,  423,  424,
       425,  426,  427,  428,  430,  433,  435,  437,
       440,  442,  443,  444,  445,  446,  447,  448,
       451,  456,  458,  459,  461,  464,  465,  470,
       471,  472,  473);

end XML.SAX.Simple_Readers.Parser.Tables;
