%let pgm=utl-find-all-the-primary-keys-given-a-list-of-candidate-keys;

Find all the primary keys give a list of candidate keys

You need to add macros utl_mimnek and utl_combos to your autocall library

macros
https://tinyurl.com/58pp9nz6
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

github
https://tinyurl.com/ms45cw9b
https://github.com/rogerjdeangelis/utl-find-all-the-primary-keys-given-a-list-of-candidate-keys

 /*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

proc sql;
  Create table vs (NAME char(7), SEX char(7),AGE char(7),HEIGHT char(7),WEIGHT char(7),VSSEQ num);
  insert into vs  values ("Alfred","F","11","69","88",1);
  insert into vs  values ("Alfred","M","21","69","88",2);
  insert into vs  values ("Alfred","M","11","70","88",3);
;quit;

Up to 40 obs from VS total obs=3 07MAY2022:16:54:12

Obs     NAME     SEX    AGE    HEIGHT    WEIGHT    VSSEQ

 1     Alfred     F     11       69        88        1
 2     Alfred     M     21       69        88        2
 3     Alfred     M     11       70        88        3

and I list of cadidate keys

%let keys=name sex age height weight ;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

inimum length primary keys - Supplied Key NAME SEX AGE HEIGHT WEIGHT

                                             DUPS_               TOTAL_
bs    TABLE    KEY                           GROUPS    LENGTH      OBS     KEY_TYPE

 1     VS      AGE HEIGHT                      0          2         3      Primary Key
 2     VS      SEX AGE                         0          2         3      Primary Key
 3     VS      SEX HEIGHT                      0          2         3      Primary Key
 4     VS      NAME AGE HEIGHT                 0          3         3      Primary Key
 5     VS      NAME SEX AGE                    0          3         3      Primary Key
 6     VS      NAME SEX HEIGHT                 0          3         3      Primary Key
 7     VS      SEX AGE HEIGHT                  0          3         3      Primary Key
 8     VS      SEX AGE WEIGHT                  0          3         3      Primary Key
 9     VS      SEX HEIGHT WEIGHT               0          3         3      Primary Key
10     VS      AGE HEIGHT WEIGHT               0          3         3      Primary Key
11     VS      NAME AGE HEIGHT WEIGHT          0          4         3      Primary Key
12     VS      NAME SEX AGE HEIGHT             0          4         3      Primary Key
13     VS      NAME SEX AGE WEIGHT             0          4         3      Primary Key
14     VS      NAME SEX HEIGHT WEIGHT          0          4         3      Primary Key
15     VS      SEX AGE HEIGHT WEIGHT           0          4         3      Primary Key
16     VS      NAME SEX AGE HEIGHT WEIGHT      0          5         3      Primary Key
17     VS      AGE                             2          1         3      Dup Obs
18     VS      HEIGHT                          2          1         3      Dup Obs
19     VS      SEX                             2          1         3      Dup Obs
20     VS      AGE WEIGHT                      2          2         3      Dup Obs
21     VS      NAME AGE                        2          2         3      Dup Obs
22     VS      NAME HEIGHT                     2          2         3      Dup Obs
23     VS      NAME SEX                        2          2         3      Dup Obs
24     VS      SEX WEIGHT                      2          2         3      Dup Obs
25     VS      HEIGHT WEIGHT                   2          2         3      Dup Obs
26     VS      NAME AGE WEIGHT                 2          3         3      Dup Obs
27     VS      NAME HEIGHT WEIGHT              2          3         3      Dup Obs
28     VS      NAME SEX WEIGHT                 2          3         3      Dup Obs
29     VS      NAME                            3          1         3      Dup Obs
30     VS      WEIGHT                          3          1         3      Dup Obs
31     VS      NAME WEIGHT                     3          2         3      Dup Obs

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utl_minkey(vs,keys=name sex age height weight);

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
